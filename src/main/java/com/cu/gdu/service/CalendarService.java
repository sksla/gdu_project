package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.CalendarDto;

public interface CalendarService {

	// 캘린더(일정 카테고리) 조회
	List<CalCtgDto> selectCalCtgList(int memNo);
	
	// 캘린더(일정 카테고리) 추가
	int insertCalCtg(CalCtgDto ctg);
	
	// 캘린더(일정 카테고리) 수정
	int updateCalCtg(CalCtgDto ctg);
	
	// 캘린더(카테고리) 삭제
	int deleteCalCtg(int ctgNo, int delType, Map<String, Object> delInfo);
	
	// 일정 개수 조회
	int selectCalListCount(int ctgNo);
	
	// 일정 등록
	int insertCalendar(CalendarDto cal);
	
	// 일정 조회
	List<CalendarDto> selectCalendarList(String[] showList);
	
	// 일정 수정
	int updateCalendar(CalendarDto cal);
	
	// 일정 삭제
	int deleteCalendar(Map<String, Integer> delInfo);
	
	// 공유멤버 수 조회
	int selectShareMemListCount(int ctgNo);
	
	// 공유멤버 삭제
	int deleteShareMem(String shareMemNo);
	
	// 학사 일정 조회
	List<CalendarDto> selectUnivCalList();
	
}
