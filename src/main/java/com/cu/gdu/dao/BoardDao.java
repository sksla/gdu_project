package com.cu.gdu.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.BoardDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class BoardDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;

	public  int insertBoard(BoardDto b) {
		return sqlSessionTemplate.insert("boardMapper.insertBoard", b);
	}
}
