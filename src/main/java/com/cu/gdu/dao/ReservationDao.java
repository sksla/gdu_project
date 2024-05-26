package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReservationDto;
import com.cu.gdu.dto.ResourceDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ReservationDao {
	private final SqlSessionTemplate sqlSessionTemplate;
	
	// 김영주 ----------------------------------------------------------------------------
	
	public List<ReservationDto> searchReservationList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}
	
	public List<ReservationDto> selectUnreturnedList(int memNo) {
		return null;
	}

	public int insertReservation(ReservationDto rev) {
		return 0;
	}

	public int updateReservation(ReservationDto rev) {
		return 0;
	}

	public int deleteReservation(int revNo) {
		return 0;
	}

	public List<ResourceDto> searchFacilityList(Map<String, String> search) {
		return null;
	}

	public List<ResourceDto> searchEquipmentList(String keyword) {
		return null;
	}

	public ResourceDto selectResource(int resNo) {
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 김영주 ------------------------------------------------------------------------------

}
