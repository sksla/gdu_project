package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.CalendarDto;
import com.cu.gdu.dto.ShareMemDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CalendarDao {
	private final SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 캘린더(일정카테고리) 조회
	 * @author 김영주
	 * 
	 * @param memNo 로그인한 회원번호
	 * @return List<CalCtgDto> 
	 */
	public List<CalCtgDto> selectCalCtgList(int memNo){
		return sqlSessionTemplate.selectList("calendarMapper.selectCalCtgList", memNo);
	}
	
	/**
	 * 캘린더(일정카테고리) 등록
	 * @author 김영주
	 * 
	 * @param ctg
	 * @return insert문 처리 행 수
	 */
	public int insertCalCtg(CalCtgDto ctg) {
		return sqlSessionTemplate.insert("calendarMapper.insertCalCtg", ctg);
	}
	
	/**
	 * 캘린더(일정카테고리) 수정
	 * @param ctg
	 * @return update문 처리 행수 (int)
	 */
	public int updateCalCtg(CalCtgDto ctg) {
		return sqlSessionTemplate.update("calendarMapper.updateCalCtg", ctg);
	}
	
	/**
	 * 캘린더(카테고리) 삭제
	 * @param ctgNo
	 * @return delete문 처리 행수 (int)
	 */
	public int deleteCalCtg(int ctgNo) {
		return sqlSessionTemplate.delete("calendarMapper.deleteCalCtg", ctgNo);
	}
	
	
	/**
	 * 일정 개수 조회
	 * @param ctgNo 일정 카테고리 번호
	 * @return 일정 개수(int)
	 */
	public int selectCalListCount(int ctgNo) {
		return sqlSessionTemplate.selectOne("calendarMapper.selectCalListCount", ctgNo);
	}
	
	/**
	 * 일정 등록
	 * @author 김영주
	 * 
	 * @param cal => 등록할 일정정보 담긴 CalendarDto객체
	 * @return  insert문 처리 행 수 (int)
	 */
	public int insertCalendar(CalendarDto cal) {
		return sqlSessionTemplate.insert("calendarMapper.insertCalendar", cal);
	}
	
	/**
	 * 일정 조회
	 * @author 김영주
	 * @param showList (조회할 카테고리 고유번호 String배열)
	 * @return 일정들 담긴 List<CalendarDto> 리스트
	 */
	public List<CalendarDto> selectCalendarList(String[] showList){
		return sqlSessionTemplate.selectList("calendarMapper.selectCalendarList", showList);
	}
	
	/**
	 * 일정 수정
	 * @author 김영주
	 * @param cal => 수정할 일정정보 담긴 CalendarDto객체
	 * @return update문 처리 행 수 (int)
	 */
	public int updateCalendar(CalendarDto cal) {
		return sqlSessionTemplate.update("calendarMapper.updateCalendar", cal);
	}
	
	/**
	 * 일정 삭제
	 * 
	 * @author 김영주
	 * @param delInfo
	 * @return delete문 처리 행 수 (int)
	 */
	public int deleteCalendar(Map<String, Integer> delInfo) {
		return sqlSessionTemplate.delete("calendarMapper.deleteCalendar", delInfo);
	}
	
	/**
	 * 학사 일정 조회
	 * @author 김영주
	 * @return 학사일정 리스트 => List<CalendarDto>
	 */
	public List<CalendarDto> selectUnivCalList(){
		return sqlSessionTemplate.selectList("calendarMapper.selectUnivCalList");
	}
	
	/**
	 * 공유 멤버 등록
	 * @param sm
	 * @return insert문 처리한 행 수 (int)
	 */
	public int insertShareMem(ShareMemDto sh) {
		return sqlSessionTemplate.insert("calendarMapper.insertShareMem", sh);
	}
	
	
}
