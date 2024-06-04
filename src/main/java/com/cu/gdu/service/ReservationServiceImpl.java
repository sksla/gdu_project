package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.ReservationDao;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReservationDto;
import com.cu.gdu.dto.ResourceDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReservationServiceImpl implements ReservationService {

	private final ReservationDao reservationDao;

	// 김영주 ----------------------------------------------------------------------------
	
	@Override
	public List<ReservationDto> searchReservationList(Map<String, String> search, PageInfoDto pi) {
		return reservationDao.searchReservationList(search, pi);
	}

	@Override
	public int searchReservationListCount(Map<String, String> search) {
		return reservationDao.searchReservationListCount(search);
	}
	
	// 미반납 목록 조회
	@Override
	public List<ReservationDto> selectUnreturnedList(int memNo, PageInfoDto pi) {
		return reservationDao.selectUnreturnedList(memNo, pi);
	}

	@Override
	public int selectUnreturnedListCount(int memNo) {
		return reservationDao.selectUnreturnedListCount(memNo);
	}

	// 예약하기
	@Override
	public int insertReservation(ReservationDto rev) {
		return reservationDao.insertReservation(rev);
	}

	@Override
	public int updateReservation(ReservationDto rev) {
		return 0;
	}
	
	// 예약 삭제
	@Override
	public int deleteReservation(int revNo) {
		return reservationDao.deleteReservation(revNo);
	}

	// 시설 목록 조회
	@Override
	public List<ResourceDto> searchFacilityList(Map<String, String> search, PageInfoDto pi) {
		return reservationDao.searchFacilityList(search, pi);
	}
	@Override
	public int searchFacilityListCount(Map<String, String> search) {
		return reservationDao.searchFacilityListCount(search);
	}

	// 비품 목록 조회
	@Override
	public List<ResourceDto> searchEquipmentList(String keyword, PageInfoDto pi) {
		return reservationDao.searchEquipmentList(keyword, pi);
	}
	@Override
	public int searchEquipmentListCount(String keyword) {
		return reservationDao.searchEquipmentListCount(keyword);
	}
	
	// 시설 상세조회
	@Override
	public ResourceDto selectResource(int resNo) {
		return reservationDao.selectResource(resNo);
	}

	// 시설번호에 해당하는 예약내역 조회
	@Override
	public List<ReservationDto> selectReservaionListByResNo(int resNo) {
		return reservationDao.selectReservaionListByResNo(resNo);
	}

	// 오늘의 시설 예약 내역 조회
	@Override
	public List<ReservationDto> selectTodayFacilityReservationList(ReservationDto rev) {
		return reservationDao.selectTodayFacilityReservationList(rev);
	}

	


	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 김영주 ------------------------------------------------------------------------------
}
