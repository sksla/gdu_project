package com.cu.gdu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cu.gdu.service.LectureService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/lec")
@RequiredArgsConstructor
@Controller
public class LectureController {
	
	private final LectureService lectureService;
	
}
