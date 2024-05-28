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
	
	//나의 예약내역 조회
	public List<ReservationDto> searchReservationList(Map<String, String> search, PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("reservationMapper.searchReservationList", search, rowBounds);
	}
	
	// 나의 예약내역 개수 조회
	public int searchReservationListCount(Map<String, String> search) {
		return sqlSessionTemplate.selectOne("reservationMapper.searchReservationListCount", search);
	}
	
	// 미반납 목록 조회
	public List<ReservationDto> selectUnreturnedList(int memNo, PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("reservationMapper.selectUnreturnedList", memNo, rowBounds);
	}
	
	public int selectUnreturnedListCount(int memNo) {
		return sqlSessionTemplate.selectOne("reservationMapper.selectUnreturnedListCount", memNo);
	}
	
	// 시설 예약 등록 
	public int insertReservation(ReservationDto rev) {
		return 0;
	}

	public int updateReservation(ReservationDto rev) {
		return 0;
	}

	// 예약 삭제
	public int deleteReservation(int revNo) {
		return sqlSessionTemplate.update("reservationMapper.deleteReservation", revNo);
	}

	public List<ResourceDto> searchFacilityList(Map<String, String> search) {
		return sqlSessionTemplate.selectList("reservationMapper.searchFacilityList", search);
	}

	public List<ResourceDto> searchEquipmentList(String keyword) {
		return sqlSessionTemplate.selectList("reservationMapper.searchEquipmentList", keyword);
	}
	
	// 시설 조회(상세)
	public ResourceDto selectResource(int resNo) {
		return sqlSessionTemplate.selectOne("reservationMapper.selectResource",	resNo);
	}
	
	// 시설에 대한 예약 내역 조회
	public List<ReservationDto> selectReservaionListByResNo(int resNo){
		return sqlSessionTemplate.selectList("reservationMapper.selectReservaionListByResNo", resNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 김영주 ------------------------------------------------------------------------------

}
