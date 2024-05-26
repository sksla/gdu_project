package com.cu.gdu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cu.gdu.service.ReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/reservation")
@RequiredArgsConstructor
@Slf4j
@Controller
public class ReservationController {

	private final ReservationService reservationService;
	
	
	// 김영주 ----------------------------------------------------------------------------
	// 예약 목록 관련 ===================================================================
	@GetMapping("/reservationList.page")
	public String reservationListPage() {
		return "reservation/reservationList";
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
