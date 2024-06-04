package com.cu.gdu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.service.ApprovalService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final ApprovalService approvalService;

	// 메인페이지
	@GetMapping(value= {"/", "/main.page"})
	public String mainPage(HttpSession session, Model model) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "main";
		}else{
			model.addAttribute("appDocList", approvalService.selectSampleOngoingDocList(5, loginUser.getMemNo()));
			
			return "member/mainpage";
		}
	}
	
	// 페이지 작성 예시 페이지
	@GetMapping("/example")
	public String example() {
		return "common/example";
	}

	
}
