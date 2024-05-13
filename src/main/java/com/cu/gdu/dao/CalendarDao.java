package com.cu.gdu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.CalCtgDto;

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
	
	public int insertCalCtg(CalCtgDto ctg) {
		return sqlSessionTemplate.insert("calendarMapper.insertCalCtg", ctg);
	}
	
}
