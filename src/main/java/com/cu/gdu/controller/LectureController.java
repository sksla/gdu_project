package com.cu.gdu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	// * ------------------- 출석 관련 끝-------------------
}
