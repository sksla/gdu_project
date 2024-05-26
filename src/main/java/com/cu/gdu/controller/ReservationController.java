package com.cu.gdu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReservationDto;
import com.cu.gdu.service.ReservationService;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/reservation")
@RequiredArgsConstructor
@Slf4j
@Controller
public class ReservationController {

	private final ReservationService reservationService;
	private final PagingUtil pagingUtil;
	
	
	// 김영주 ----------------------------------------------------------------------------
	// 예약 목록 관련 ===================================================================
	@GetMapping("/reservationList.page")
	public String reservationListPage() {
		return "reservation/reservationList";
	}
	
	@ResponseBody
	@PostMapping(value="/searchReservation.do", produces="application/json; charset=utf-8")
	public Map<String, Object> searchReservationList(@RequestParam(value="page", defaultValue="1") int currentPage
												   , @RequestParam Map<String, String> search
												   , HttpSession session){
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		
		search.put("memNo", String.valueOf(loginUser.getMemNo()));
		
		List<ReservationDto> list = new ArrayList<>();
		int listCount = reservationService.searchReservationListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 8);
		list = reservationService.searchReservationList(search, pi);
		
		Map<String, Object> searchMap = new HashMap<>();
		
		searchMap.put("list", list);
		searchMap.put("pi", pi);
		
		return searchMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ===================================예약 목록==========================================
	
	// 자원 예약 관련 =========================================================================
	@GetMapping("/resourceList.page")
	public String resourceListPage() {
		return "reservation/resourceList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ===================================자원 예약==========================================
	
	
	
	// 김영주 ------------------------------------------------------------------------------
}
