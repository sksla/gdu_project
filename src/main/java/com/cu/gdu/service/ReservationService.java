package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReservationDto;
import com.cu.gdu.dto.ResourceDto;

public interface ReservationService {

	// 김영주 ----------------------------------------------------------------------------
	
	// 예약 목록 조회(전체, 검색 포함)
	List<ReservationDto> searchReservationList(Map<String, String> search, PageInfoDto pi);
	int searchReservationListCount(Map<String, String> search);
	// 미반납 목록 조회
	List<ReservationDto> selectUnreturnedList(int memNo);
	
	// 시설 예약
	int insertReservation(ReservationDto rev);
	
	// 예약 수정
	int updateReservation(ReservationDto rev);
	
	// 예약 취소
	int deleteReservation(int revNo);
	
	// 시설 목록 조회(전체, 검색)
	List<ResourceDto> searchFacilityList(Map<String, String> search);
	
	// 비품 목록 조회(전체, 검색)
	List<ResourceDto> searchEquipmentList(String keyword);
	
	// 시설 조회
	ResourceDto selectResource(int resNo);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 김영주 ------------------------------------------------------------------------------
}
