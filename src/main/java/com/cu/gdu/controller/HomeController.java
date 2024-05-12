package com.cu.gdu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	// 메인페이지
	@GetMapping(value= {"/", "/main.page"})
	public String mainPage() {
		return "main";
	}
	
	// 페이지 작성 예시 페이지
	@GetMapping("/example")
	public String example() {
		return "common/example";
	}

	
}
