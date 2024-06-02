package com.cu.gdu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReservationDto;
import com.cu.gdu.dto.ResourceDto;
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
		log.debug("예약 요청 페이지 : {}", currentPage);
		log.debug("예약내역 : {}", list);
		searchMap.put("list", list);
		searchMap.put("pi", pi);
		
		return searchMap;
	}
	
	//미반납 비품 조회
	
	@ResponseBody
	@PostMapping(value="/unreturedList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> selectUnreturnedList(@RequestParam(value="page", defaultValue="1") int currentPage
												  , HttpSession session){
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		List<ReservationDto> list = new ArrayList<>(); 
		int listCount = reservationService.selectUnreturnedListCount(memNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 3);
		list = reservationService.selectUnreturnedList(memNo, pi);
		
		Map<String, Object> map = new HashMap<>();
		log.debug("미반납 요청 페이지 : {}", currentPage);
		log.debug("미반납 내역 : {}", list);
		map.put("list", list);
		map.put("pi", pi);
		
		return map;
		
	}
	
	
	
	// ===================================예약 목록==========================================
	
	// 자원 예약 관련 =========================================================================
	@GetMapping("/resourceList.page")
	public String resourceListPage() {
		return "reservation/resourceList";
	}
	
	// 시설 목록 조회
	@ResponseBody
	@PostMapping(value="/searchFacilityList.do", produces="application/json; charset=utf-8")
	public Map<String,Object> searchFacilityList(@RequestParam(value="page", defaultValue="1") int currentPage
											  ,@RequestParam Map<String, String> search){
		int listCount = reservationService.searchFacilityListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 8);
		
		List<ResourceDto> list = new ArrayList<>();
		list = reservationService.searchFacilityList(search, pi);
		
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		return map;
	}
	
	// 비품 목록 조회
	@ResponseBody
	@PostMapping(value="/searchEquipmentList.do", produces="application/json; charset=utf-8")
	public Map<String,Object> searchEquipmentList(@RequestParam String keyword
												,@RequestParam(value="page", defaultValue="1") int currentPage){
		
		int listCount = reservationService.searchEquipmentListCount(keyword);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 8);
		List<ResourceDto> list = new ArrayList<>();
		list = reservationService.searchEquipmentList(keyword, pi);
		
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		return map;
	}
	
	@GetMapping("/reserveForm.do")
	public ModelAndView reserveForm(@RequestParam(value="no")int no, ModelAndView mv) {
		
		ResourceDto res = reservationService.selectResource(no);
		mv.addObject("res", res)
		  .setViewName("reservation/reserveForm");
		
		log.debug("mv : {}", mv);
		return mv;
		
	}
	
	// 시설에 대한 예약내역 조회
	@ResponseBody
	@PostMapping(value="/reservationList.do", produces="application/json; charset=utf-8")
	public List<ReservationDto> reservationList(@RequestParam(value="resNo") int resNo){
		return reservationService.selectReservaionListByResNo(resNo);
	}
	
	// 예약 삭제
	@ResponseBody
	@PostMapping("/deleteReservation.do")
	public int deleteReservation(@RequestParam(value="no") int no) {
		return reservationService.deleteReservation(no);
	}
	
	// 예약 등록
	@ResponseBody
	@PostMapping("/insertReservation.do")
	public String insertReservation(ReservationDto rev, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		rev.setMemNo(String.valueOf(memNo));
		
		int result = reservationService.insertReservation(rev);
		
		if(result == 1) {
			return "SUCCESS";
		}else {
			return "FAIL";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ===================================자원 예약==========================================
	
	// 김영주 ------------------------------------------------------------------------------
	
	

	
	

	
	
	
	
	
	
	
	
	
	
	

}
