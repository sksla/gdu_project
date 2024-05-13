package com.cu.gdu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.service.AdminService;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

	private final AdminService adminService;
	private final PagingUtil pagingUtil;
	
	@GetMapping("/chart.do")
	public String chart(Model model) {
		List<CollegeDto> colList = adminService.selectCollegeList();
		List<MajorDto> majorList = adminService.selectMajorList();
		//log.debug("colList객체: {}", colList);
		//log.debug("majorList객체: {}", majorList);
		model.addAttribute("colList", colList);
		model.addAttribute("majorList", majorList);
		
		return "admin/chart";
	}
	
	@GetMapping("/memberList.do")
	public ModelAndView memberList(@RequestParam(value="page", defaultValue="1") int currentPage
								 , ModelAndView mv) {
		int listCount = adminService.selectMemberListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<MemberDto> list = adminService.selectMemberList(pi);
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		
	    for (MemberDto m : list) {
	        m.setResident(maskResidentNumber(m.getResident()));
	    }
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("jobList", jobList)
		  .addObject("majorList", majorList)
		  .setViewName("admin/memberList");
		return mv;
	}
	
	private String maskResidentNumber(String residentNumber) {
	    // 주민등록번호의 뒷자리 시작 인덱스
	    int startIndex = 8;
	    // 주민등록번호의 뒷자리 마지막 인덱스
	    int endIndex = 14;

	    // 주민등록번호 뒷자리 추출
	    String lastDigits = residentNumber.substring(startIndex, endIndex);

	    // 주민등록번호 뒷자리를 *로 대체
	    String maskedDigits = lastDigits.replaceAll(".", "*");

	    // *로 대체된 뒷자리와 앞자리를 합쳐서 반환
	    return residentNumber.substring(0, startIndex) + maskedDigits;
	}
	
	@PostMapping("/outMember.do")
	public String updateOutMember(String[] memNo, RedirectAttributes redirectAttributes) {
		int result = adminService.updateOutMember(memNo);
		if(result == memNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 회원을 퇴직처리 했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "퇴직처리에 실패했습니다..");
		}
		return "redirect:/admin/memberList.do";
	}
	
}
