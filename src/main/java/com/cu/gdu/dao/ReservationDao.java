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
		return sqlSessionTemplate.insert("reservationMapper.insertReservation", rev);
	}

	public int updateReservation(ReservationDto rev) {
		return 0;
	}

	// 예약 삭제
	public int deleteReservation(int revNo) {
		return sqlSessionTemplate.update("reservationMapper.deleteReservation", revNo);
	}
	
	// 시설목록 전체, 검색 조회
	public List<ResourceDto> searchFacilityList(Map<String, String> search, PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("reservationMapper.searchFacilityList", search, rowBounds);
	}
	public int searchFacilityListCount(Map<String, String> search) {
		return sqlSessionTemplate.selectOne("reservationMapper.searchFacilityListCount", search);
	}
	
	// 비품목록 전체, 검색조회 
	public List<ResourceDto> searchEquipmentList(String keyword, PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("reservationMapper.searchEquipmentList", keyword, rowBounds);
	}
	public int searchEquipmentListCount(String keyword) {
		return sqlSessionTemplate.selectOne("reservationMapper.searchEquipmentListCount", keyword);
	}
	
	// 시설 조회(상세)
	public ResourceDto selectResource(int resNo) {
		return sqlSessionTemplate.selectOne("reservationMapper.selectResource",	resNo);
	}
	
	// 시설에 대한 예약 내역 조회
	public List<ReservationDto> selectReservaionListByResNo(int resNo){
		return sqlSessionTemplate.selectList("reservationMapper.selectReservaionListByResNo", resNo);
	}
	
	
	// 마이페이지 오늘의 시설예약 조회
	public List<ReservationDto> selectTodayFacilityReservationList(ReservationDto rev){
		return sqlSessionTemplate.selectList("reservationMapper.selectTodayFacilityReservationList", rev);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 김영주 ------------------------------------------------------------------------------

}
