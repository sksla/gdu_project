package com.cu.gdu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.CollegeDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AdminDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<CollegeDto> selectCollegeList(){
		return sqlSessionTemplate.selectList("adminMapper.selectCollegeList");
	}
	
}
