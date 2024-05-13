package com.cu.gdu.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class CalendarDao {
	private final SqlSessionTemplate sqlSessionTemplate;
	
}
