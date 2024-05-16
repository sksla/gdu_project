package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.CalendarDao;
import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.CalendarDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService {
	
	private final CalendarDao calendarDao;


	/**
	 * 캘린더(카테고리) 조회
	 * @author 김영주
	 */
	@Override
	public List<CalCtgDto> selectCalCtgList(int memNo) {
		return calendarDao.selectCalCtgList(memNo);
	}
	
	/**
	 * 캘린더(카테고리) 등록
	 * @author 김영주
	 */
	@Override
	public int insertCalCtg(CalCtgDto ctg) {
		return calendarDao.insertCalCtg(ctg);
	}

	/**
	 * 일정 등록
	 * @author 김영주
	 */
	@Override
	public int insertCalendar(CalendarDto cal) {
		return calendarDao.insertCalendar(cal);
	}

	/**
	 * 일정 조회
	 * @author 김영주
	 */
	@Override
	public List<CalendarDto> selectCalendarList(String[] showList) {
		return calendarDao.selectCalendarList(showList);
	}

}
