package com.cu.gdu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.gdu.dto.AffiliatedOrganDto;
import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
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
	public List<LecStuDto> ajaxstuListForLec(int lecNo){
		List<LecStuDto> lecList = lectureService.selectStuListForLec(lecNo);
		log.debug("목록들: {}", lecList);
		return lecList;
	}
	
	// * ------------------- 출석 끝-------------------
}
