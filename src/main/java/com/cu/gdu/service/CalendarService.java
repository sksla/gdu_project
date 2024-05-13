package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.CalCtgDto;

public interface CalendarService {

	// 캘린더(일정 카테고리) 조회
	List<CalCtgDto> selectCalCtgList(int memNo);
	
	// 캘린더(일정 카테고리) 추가
	int insertCalCtg(CalCtgDto ctg);
	
	
}
