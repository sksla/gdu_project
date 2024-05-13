package com.cu.gdu.service;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.CalendarDao;
import com.cu.gdu.dto.CalCtgDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService {
	
	private final CalendarDao calendarDao;

	@Override
	public int insertCalCtg(CalCtgDto calCtg) {
		return 0;
	}

}
