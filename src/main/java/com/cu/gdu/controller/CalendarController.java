package com.cu.gdu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.CalendarDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.ShareMemDto;
import com.cu.gdu.service.CalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/calendar")
@RequiredArgsConstructor
@Slf4j
@Controller
public class CalendarController {
	private final CalendarService calendarService;
	
	
	// -------김영주 시작 -------------------------------------------------------------
	/**
	 * 일정 페이지 요청
	 * 
	 * @author 김영주
	 * @return
	 */
	@GetMapping("/calendar.page")
	public String calendarPage() {
		return "calendar/calendar";
	}
	
	// 캘린더(카테고리) --------------------------------------------------------------
	
	/**
	 * ajax 캘린더 카테고리 조회
	 * 
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
	
	/**
	 * 캘린더(카테고리) 등록
	 * 
	 * @author 김영주
	 * @param ctg
	 * @param session
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/insertCtg.do")
	public String insertCtg(CalCtgDto ctg
						   , String[] levelOne, String[] levelTwo
						   , HttpSession session
						   , RedirectAttributes redirectAttributes) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		ctg.setCtgWriter(String.valueOf(loginUser.getMemNo()));
		
		List<ShareMemDto> sList = new ArrayList<>();
		
		// 조회, 등록 권한
		if(levelOne != null) {
			for(int i=0; i<levelOne.length; i++) {
				sList.add( ShareMemDto.builder()
									   .shareMemNo(levelOne[i])
									   .rightLevel("1")
									   .insertType("N")
									   .build()
						   );
			}
		}
		// 조회 권한
		if(levelTwo != null) {
			for(int i=0; i<levelTwo.length; i++) {
				sList.add( ShareMemDto.builder()
									   .shareMemNo(levelTwo[i])
									   .rightLevel("2")
									   .insertType("N")
									   .build()
						   );
			}
		}
		
		ctg.setShList(sList);
		
		int result = calendarService.insertCalCtg(ctg);
		
		String type = ctg.getCtgType().equals("1") ? "개인" : "공유";
		if(sList.isEmpty() && result == 1 || !sList.isEmpty() && result == sList.size()) {
			redirectAttributes.addFlashAttribute("alertMsg", type + "캘린더를 성공적으로 등록하였습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", type + "캘린더 등록에 실패하였습니다.");
		}
		
		return "redirect:/calendar/calendar.page";
				
	}
	
	/**
	 * 캘린더(카테고리) 수정
	 * 
	 * @param ctg
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateCtg.do")
	public int updateCtg(CalCtgDto ctg) {
		
		return calendarService.updateCalCtg(ctg);
	}
	
	
	@ResponseBody
	@PostMapping("/deleteCtg.do")
	public int deleteCtg(int ctgNo) {
		int count = calendarService.selectCalListCount(ctgNo);
		
		int totalResult = 0;
		
		if(count > 0) {
			int result1 = calendarService.deleteCalendar(2, ctgNo);
			if(result1 == count) {
				totalResult = calendarService.deleteCalCtg(ctgNo);
			}
		}else {
			totalResult = calendarService.deleteCalCtg(ctgNo);
		}
		
		return totalResult;
	}
	
	
	// 캘린더(카테고리) 끝 --------------------------------------------------------------
	
	// 일정 관련 ----------------------------------------------------------------------
	/**
	 * 일정 등록 
	 * 
	 * @author 김영주
	 * @param cal
	 * @param session
	 * @param redirectAttributes
	 * @return result : insert문 처리 행 수
	 */
	@ResponseBody
	@PostMapping("/insertEvt.do")
	public int insertEvent(CalendarDto cal
						 , HttpSession session){
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		cal.setCalWriter(String.valueOf(loginUser.getMemNo()));
		
		return calendarService.insertCalendar(cal);
	}
	
	
	/**
	 * 일정 조회 ajax
	 * @author 김영주
	 * @param showList
	 * @return cList => 일정정보담긴 리스트 List<CalendarDto>
	 */
	@ResponseBody
	@PostMapping(value="/calList.do", produces="application/json; charset=UTF-8")
	public List<CalendarDto> selectCalList(String[] showList){
		
		List<CalendarDto> cList = new ArrayList<>();
		
		cList = calendarService.selectCalendarList(showList);
		
		return cList;
	}
	
	/**
	 * 일정 수정 ajax
	 * @author 김영주
	 * @param cal
	 * @param session
	 * @return 처리행수(int)
	 */
	@ResponseBody
	@PostMapping("/updateEvt.do")
	public int updateEvent(CalendarDto cal, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		cal.setCalWriter(String.valueOf(loginUser.getMemNo()));
		
		return calendarService.updateCalendar(cal);
	}
	
	
	/**
	 * 일정 삭제 ajax
	 * @param delType
	 * @param delNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteEvt.do")
	public int deleteEvt(@RequestParam(value="type", defaultValue="1") int delType
			           , int delNo) {
		
		return calendarService.deleteCalendar(delType, delNo);
	}
	
	// 일정 관련 끝----------------------------------------------------------------------
	
	// 학사일정 ----------------------------------------------------------------
	/**
	 * 학사일정 페이지 요청
	 * 
	 * @author 김영주
	 * @return
	 */
	@GetMapping("/univCalendar.page")
	public String univCalendarPage() {
		return "calendar/univCalendar";
	}
	
	/**
	 * 학사일정 조회 
	 * @author 김영주
	 * @return univCalList => 학사일정 담긴 리스트 (List<CalendarDto>)
	 */
	@ResponseBody
	@PostMapping("/univCalList.do")
	public List<CalendarDto> selectUnivCalList(){
		
		List<CalendarDto> univCalList = new ArrayList<>();
		univCalList = calendarService.selectUnivCalList();
		return univCalList;
	}
	
	
	// 학사 일정 끝 ---------------------------------------------------------------
	
	// -------김영주 부분 끝 -------------------------------------------------------------
				   
		
}
