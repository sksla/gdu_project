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
	
	@Override
	public List<ReservationDto> selectUnreturnedList(int memNo) {
		return null;
	}

	@Override
	public int insertReservation(ReservationDto rev) {
		return 0;
	}

	@Override
	public int updateReservation(ReservationDto rev) {
		return 0;
	}

	@Override
	public int deleteReservation(int revNo) {
		return 0;
	}

	@Override
	public List<ResourceDto> searchFacilityList(Map<String, String> search) {
		return null;
	}

	@Override
	public List<ResourceDto> searchEquipmentList(String keyword) {
		return null;
	}

	@Override
	public ResourceDto selectResource(int resNo) {
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 김영주 ------------------------------------------------------------------------------
}
