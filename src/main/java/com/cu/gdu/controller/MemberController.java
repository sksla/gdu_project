package com.cu.gdu.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;
import com.cu.gdu.service.MemberService;
import com.cu.gdu.util.FileUtil;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@RequiredArgsConstructor
@Controller
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	private final FileUtil fileUtil;
	private final PagingUtil pagingUtil;
	
	// * 로그인 관련 ----------------------------------------
	@PostMapping("/login.do")
	public String login(MemberDto m, HttpServletRequest request
					 , RedirectAttributes redirectAttributes
					 ) throws IOException {
		
		MemberDto loginUser = memberService.selectMember(m);
		
		
		//if(loginUser != null && m.getMemPwd().equals(loginUser.getMemPwd()) ) 	{  // 암호화 전
		if(loginUser != null && bcryptPwdEncoder.matches(m.getMemPwd(), loginUser.getMemPwd()) ) 	{ 
			request.getSession().setAttribute("loginUser", loginUser);
			//redirectAttributes.addFlashAttribute("alertMsg", loginUser.getMemName() + "님 환영합니다~");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "로그인 실패하였습니다. 아이디 및 비밀번호를 다시 확인해주세요.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		return "redirect:/main.page";
	}
	
	@RequestMapping("/signout.do")
	public String signout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// * 마이페이지 관련 -------------------------
	@GetMapping("/mypage.page")
	public String mypage() {
		return "/member/mypage";
	}
	
	// * 비밀번호 변경 관련 -------------------------
	@PostMapping("modifyPwd.do")
	public String updatePassword(String memPwd, String updatePwd
								, HttpSession session
								, RedirectAttributes redirectAttributes) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		//if(memPwd.equals(loginUser.getMemPwd())) { // 암호화 전 
		if(bcryptPwdEncoder.matches(memPwd, loginUser.getMemPwd())) {
			loginUser.setMemPwd( bcryptPwdEncoder.encode(updatePwd) );
			memberService.updatePassword(loginUser);
			session.setAttribute("loginUser", memberService.selectMember(loginUser));
			redirectAttributes.addFlashAttribute("alertMsg", "비밀번호 변경 성공했습니다.");
			
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "비밀번호가 틀렸습니다. 다시 입력해주세요");
			
		}
		
		return "redirect:/member/mypage.page";
		
	}
	
	// * 마이페이지 정보 수정 관련 ----------------------------
	@PostMapping("/modify.do")
	public String modify(MemberDto member
						, RedirectAttributes redirectAttributes
						, HttpSession session) {
		
		int result = memberService.updateMember(member);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "성공적으로 정보 수정 되었습니다.");
			session.setAttribute("loginUser", memberService.selectMember(member));
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "정보 수정에 실패했습니다.");
		}
		
		return "redirect:/member/mypage.page";
		
	}
	
	// * 서명 변경 관련 ---------------------------
	@ResponseBody
	@PostMapping("/modifySign.do")
	public String ajaxModifySign(MultipartFile uploadFile, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String originalSignURL = loginUser.getSignUrl();
		
		// 파일업로드
		Map<String, String> map = fileUtil.fileUpload(uploadFile,  session, "sign" );
		loginUser.setSignUrl(map.get("filePath") + "/" + map.get("filesystemName"));
	
		int result = memberService.updateSignImg(loginUser);
	
		if(result > 0) {
			if(originalSignURL != null) {
				new File(session.getServletContext().getRealPath(originalSignURL)).delete();
			}
			return "SUCCESS";
		}else {
			new File(map.get("filePath") + "/" + map.get("filesystemName")).delete();
			return "FAIL";
		}
	}
	
	// * 프로필 이미지 변경 관련 ------------------------
	@ResponseBody
	@PostMapping("/modifyProfile.do")
	public String ajaxModifyProfile(MultipartFile uploadFile, HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		String originalProfileURL = loginUser.getProfileUrl();
		
		// 파일업로드
		Map<String, String> map = fileUtil.fileUpload(uploadFile,session, "profile");
		loginUser.setProfileUrl(map.get("filePath") + "/" + map.get("filesystemName"));
	
		int result = memberService.updateProfileImg(loginUser);
	
		if(result > 0) {
			if(originalProfileURL != null) {
				new File(session.getServletContext().getRealPath(originalProfileURL)).delete();
			}
			return "SUCCESS";
		}else {
			new File(map.get("filePath") + "/" + map.get("filesystemName")).delete();
			return "FAIL";
		}
	}
	
	
	// * 출퇴근 관련 ----------------------------------------------
	@ResponseBody
	@GetMapping(value="/selectAttend.do", produces="application/json; charset=utf-8")
	public AttendDto ajaxSelectAttend(AttendDto atd ) {
		return memberService.selectAttend(atd); 
	}
	
	@ResponseBody
	@PostMapping("/checkin.do")
	public String ajaxCheckin(AttendDto atd) {
		return memberService.insertAttend(atd) > 0 ? "SUCCESS" : "FAIL";
	}
	
	@ResponseBody
	@PostMapping("/checkout.do")
	public String ajaxCheckout(AttendDto atd) {
		return memberService.updateAttend(atd) > 0 ? "SUCCESS" : "FAIL";
	}
	
	
	
	
	// * 휴가 신청 관련 --------------------------------------
	@GetMapping("/vacationForm.page")
	public String vacregistForm() {
		return "member/vacationForm";
	}
	
	@PostMapping("vacationRegist.do")
	public String vacationRegist(VacationDto vac, RedirectAttributes redirectAttributes, HttpSession session) {
	
		System.out.println(vac);
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		int result = memberService.insertVacation(vac);
		int result2 = memberService.updateMemVac(vac);
		if( result * result2 > 0 ) {
			session.setAttribute("loginUser", memberService.selectMember(loginUser));
			redirectAttributes.addFlashAttribute("alertMsg", "휴가신청 성공하였습니다.");
		}else {
		redirectAttributes.addFlashAttribute("alertMsg", "휴가신청 실패하였습니다.");
		}
		
		return "redirect:/member/vacationList.do";
	}
	
	
	

	// * 휴가 목록 조회 관련 --------------------------
	@GetMapping("vacationList.page")
	public ModelAndView vacationPage(ModelAndView mv
										, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		
		int plusVacCount = memberService.selectPlusVacCount(memNo);
		int usedPlusCount = memberService.selectUsedPlusVacCount(memNo);
		
		
		mv.addObject("plusVacCount", plusVacCount)
		  .addObject("usedPlusCount", usedPlusCount)
		  .setViewName("member/vacationList");
		
		return mv;
	}
	
	
	@ResponseBody
	@GetMapping(value="vacationList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> vacationList (@RequestParam(value="page" ,defaultValue="1") int currentPage
									, @RequestParam Map<String, String> search
									, HttpSession session) {
		System.out.println(search);
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		int listCount = 0;
		PageInfoDto pi = null;
		List<VacationDto> list = new ArrayList<>();
		search.put("memNo", String.valueOf(memNo));
		
		

		
		if (search.get("keyword") == null || search.get("keyword").equals("")) {
		    
			if(search.get("searchStartDate") != null && !search.get("searchStartDate").equals("") && !search.get("searchEndDate").equals("")) {
				// keyword가 없는데 검색 시작일과 종료일이 모두 있는 경우
				listCount = memberService.selectVacationListCountSet(search);
		        pi = pagingUtil.getPageInfoDto(listCount, currentPage , 5, 8);
		        list = memberService.selectVacationListSet(pi, search);
			}else {
				// keyword가 없는 경우 전체 목록 조회
				listCount = memberService.selectVacationListCount(search);
				pi = pagingUtil.getPageInfoDto(listCount, currentPage , 5, 8);
				list = memberService.selectVacationList(pi, search);
				
			}
		} else {
		    // keyword가 있는 경우
		    if (search.get("searchStartDate") == null || search.get("searchStartDate").equals("") || search.get("searchEndDate").equals("")) {
		        // 검색 시작일 또는 종료일이 없는 경우
		        // 전체 조회하도록 날짜 검색 조건을 추가하지 않고 keyword만을 사용하여 전체 목록 조회
		        listCount = memberService.selectVacationListCount(search);
		        pi = pagingUtil.getPageInfoDto(listCount, currentPage , 5, 8);
		        list = memberService.selectVacationList(pi, search);
		    } else {
		        // 검색 시작일과 종료일이 모두 있는 경우
		        // 날짜 검색 조건을 포함하여 검색 목록 조회
		        listCount = memberService.selectVacationListCountSet(search);
		        pi = pagingUtil.getPageInfoDto(listCount, currentPage , 5, 8);
		        list = memberService.selectVacationListSet(pi, search);
		    }
		}
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("list", list);
		searchMap.put("pi", pi);
		
		  
		return searchMap;
		
	}
	
	
	
	
	// * 근태 조회 관련 ------------------------------------------
	@GetMapping("attendList.page")
	public String attendPage() {
		return "/member/attendList";
	}
	
	@ResponseBody
	@GetMapping(value="attendList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> searchAttendList (@RequestParam(value="page" ,defaultValue="1") int currentPage
									, @RequestParam Map<String, String> search
									, HttpSession session) {
		System.out.println(search);
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		int listCount = 0;
		PageInfoDto pi = null;
		List<AttendDto> list = new ArrayList<>();
		search.put("memNo", String.valueOf(memNo));
		
		if(search.get("keyword") == null || search.get("keyword").equals("")) {
			// keyword="" ==> 전체목록 조회
			listCount = memberService.selectAttendListCount(search);
			pi = pagingUtil.getPageInfoDto(listCount, currentPage , 5, 8);
			list = memberService.selectAttendList(pi, search);
			
		}else {
			// keyword가 빈값이 아닌경우 => 검색목록 조회
			listCount = memberService.selectSearchAttendListCount(search);
			pi = pagingUtil.getPageInfoDto(listCount, currentPage , 5, 8);
			list = memberService.selectSearchAttendList(pi, search);
		}
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("list", list);
		searchMap.put("pi", pi);
		
		  
		return searchMap;
		
	}
	
	
	
	
	
}
