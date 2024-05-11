package com.cu.gdu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cu.gdu.dto.CollegeDto;
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
		model.addAttribute("colList", colList);
		return "admin/chart";
	}
	
}
