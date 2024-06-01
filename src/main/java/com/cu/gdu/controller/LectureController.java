package com.cu.gdu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.OpenLecDto;
import com.cu.gdu.dto.ResourceDto;
import com.cu.gdu.dto.StuAttendDto;
import com.cu.gdu.service.LectureService;
import com.cu.gdu.util.FileUtil;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/lec")
@RequiredArgsConstructor
@Controller
public class LectureController {
	
	private final LectureService lectureService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;

	// * ------------------- 출석 시작 -------------------
	/* 출석 리스트 페이지
	@GetMapping("/stuAttend.page")
	public String stuAttend() {
		return "/lecture/stuAttend";
	}
	*/
	// 출석 리스트 조회
	@GetMapping("/stuAttendList.do")
	public ModelAndView stuAttendList(ModelAndView mv, HttpSession session) {

	MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	int memNo = loginUser.getMemNo();
		
	// 해당교수 강의목록
	List<LectureDto> leclist = lectureService.selectLectureList(memNo);
		
	// 학생 출석목록
	List<LecStuDto> stulist = lectureService.selectStuAttendList();
		
	log.debug("교수들: {}", leclist);
	log.debug("학생들: {}", stulist);
	   
	mv.addObject("leclist", leclist)
	  .addObject("stulist", stulist)	  
	  .setViewName("/lecture/stuAttend");
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping(value="/stuListForLec.do", produces="application/json; charset=UTF-8")
	public List<LecStuDto> ajaxstuListForLec(@RequestParam Map<String, Object> map){
		List<LecStuDto> lecList = lectureService.selectStuListForLec(map);
		log.debug("목록들: {}", lecList);
		return lecList;
	}
	
	// 출석등록
	@PostMapping("/updateStuAttned.do")
	public String updateStuAttend(StuAttendDto sa, RedirectAttributes redirectAttributes) {
	
		int result = lectureService.updateStuAttend(sa.getStuAttendList());
		
		log.debug("result: {}", result);
		
		if(!(sa.getStuAttendList().isEmpty()) && (result == sa.getStuAttendList().size())) { // 성공
			redirectAttributes.addFlashAttribute("alertMsg", "성공적으로 저장었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "저장에 실패했습니다.");
		}
		
		log.debug("출석목록들: {}", sa.getStuAttendList());
		
		return "redirect:/lec/stuAttendList.do";

	}
	// * ------------------- 출석 끝-------------------
	
	
	// * ------------------- 강의 시작-------------------
	// 강의 리스트 조회
	@GetMapping("/lecList.do")
	public ModelAndView lecList(ModelAndView mv, HttpSession session) {
		
		// 과목 리스트 
		List<LectureDto> lecList = lectureService.selectLecList();
		// 학과 리스트
		List<MajorDto> majorList = lectureService.selectMajorList();
		// 강의 리스트
		List<OpenLecDto> openLecList = lectureService.selectAllLecList();
		// 강의실 리스트
		List<ResourceDto> resList = lectureService.selectResList();		
		
		List<MemberDto> memList = lectureService.selectMemList();
		log.debug("강의목록: {}", openLecList);
		log.debug("교수목록:{}",memList);  
		mv.addObject("openLecList", openLecList)
		  .addObject("majorList", majorList )
		  .addObject("resList", resList )
		  .addObject("lecList", lecList )
		  .addObject("memList", memList )
		  .setViewName("/lecture/lectureList");
		
		return mv;
	}
	
	// 강의등록
	@PostMapping("/enrollLec.do")
	public String enrollLec(OpenLecDto ol, HttpSession session
						  , Model model, RedirectAttributes redirectAttributes) {
		
		int result = lectureService.insertLecture(ol);
		
		if(result == 1) {
			// 성공메세지
			redirectAttributes.addFlashAttribute("alertMsg", "성공");
		}else{
			// 실패메세지
			redirectAttributes.addFlashAttribute("alertMsg", "실패");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		return "redirect:/lec/lecList.do";
	}
	
	// 강의정보 조회
	@ResponseBody
	@GetMapping(value="/lecDetail.do", produces="application/json; charset=UTF-8")
	public OpenLecDto ajaxLecDatail(String openLecNo) {
		OpenLecDto openLec = lectureService.selectLecDetail(openLecNo);
		//model.addAttribute("openLec", lectureService.selectLecDetail(lecNo));
		return openLec;
	}
	
	// 강의수정
	@PostMapping("/modifyLec.do")
	public String modifyLec(OpenLecDto ol, RedirectAttributes redirectAttributes) {
		
		log.debug("ol:{}",ol);
		
		int result = lectureService.modifyLec(ol);
		
		if(result == 1) {
			// 성공메세지
			redirectAttributes.addFlashAttribute("alertMsg", "성공");
		}else{
			// 실패메세지
			redirectAttributes.addFlashAttribute("alertMsg", "실패");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		return "redirect:/lec/lecList.do";
	}
	// 강의삭제
	@PostMapping("/deleteLec.do")
	public String deleteLec(String openLecNo,RedirectAttributes redirectAttributes) {
		
		int result = lectureService.deleteLec(openLecNo);
		
		if(result == 1) {
			// 성공메세지
			redirectAttributes.addFlashAttribute("alertMsg", "성공");
		}else{
			// 실패메세지
			redirectAttributes.addFlashAttribute("alertMsg", "실패");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}

		return "redirect:/lec/lecList.do";
	}
	
	// * ------------------- 강의목록 끝 ------------------
}
