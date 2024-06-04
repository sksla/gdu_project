package com.cu.gdu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.cu.gdu.dto.MemberDto;

@Controller
public class HomeController {

	// 메인페이지
	@GetMapping(value= {"/", "/main.page"})
	public String mainPage(HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "main";
			
		}else{
			return "member/mainpage";
		}
	}
	
	// 페이지 작성 예시 페이지
	@GetMapping("/example")
	public String example() {
		return "common/example";
	}

	
}
