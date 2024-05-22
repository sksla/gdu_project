package com.cu.gdu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cu.gdu.dto.AffiliatedOrganDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.StuAttendDto;
import com.cu.gdu.service.LectureService;
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

	// * ------------------- 출석 관련 시작 -------------------
	// 출석 리스트 페이지
	@GetMapping("/stuAttend.page")
	public String stuAttend() {
		return "/lecture/stuAttend";
	}
	// 출석 리스트 조회
	@GetMapping("/stuAttendList.do")
	public ModelAndView stuAttendList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = lectureService.selectStuAttendListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<StuAttendDto> list = lectureService.selectStuAttendList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("/lecture/stuAttendList");
		
		return mv;
	}
	// * ------------------- 출석 관련 끝-------------------
}
