package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("reservationMapper.searchReservationList", search, rowBounds);
	}
	
	public int searchReservationListCount(Map<String, String> search) {
		return sqlSessionTemplate.selectOne("reservationMapper.searchReservationListCount", search);
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
		return sqlSessionTemplate.selectList("reservationMapper.searchFacilityList", search);
	}

	public List<ResourceDto> searchEquipmentList(String keyword) {
		return sqlSessionTemplate.selectList("reservationMapper.searchEquipmentList", keyword);
	}

	public ResourceDto selectResource(int resNo) {
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 김영주 ------------------------------------------------------------------------------

}
