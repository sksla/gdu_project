package com.cu.gdu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.service.CalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/calendar")
@RequiredArgsConstructor
@Slf4j
@Controller
public class CalendarController {
	private final CalendarService calendarService;
	
	/**
	 * 일정 페이지 요청
	 * @return
	 */
	@GetMapping("/calendar.page")
	public String calendarPage() {
		return "calendar/calendar";
	}
	
	/**
	 * ajax 캘린더 카테고리 조회
	 * @author 김영주
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/ctgList.do", produces="application/json; charset=UTF-8")
	public List<CalCtgDto> ctgList(HttpSession session){
		
		int memNo = ( (MemberDto)session.getAttribute("loginUser") ).getMemNo();
		
		List<CalCtgDto> ctgList = new ArrayList<>();
		
		ctgList = calendarService.selectCalCtgList(memNo);
		
		return ctgList;
		
	}
	
	@PostMapping("/insertCtg.do")
	public String insertCtg(CalCtgDto ctg
						   , HttpSession session
						   , RedirectAttributes redirectAttributes) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		ctg.setCtgWriter(String.valueOf(loginUser.getMemNo()));
		
		int result = calendarService.insertCalCtg(ctg);
		
		String type = ctg.getCtgType().equals("1") ? "개인" : "공유";
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", type + "캘린더를 성공적으로 등록하였습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", type + "캘린더 등록에 실패하였습니다.");
		}
		
		return "redirect:/calendar/calendar.page";
				
	}

}
