package com.cu.gdu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.ApprovalFormDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ApprovalDao {

	private final SqlSessionTemplate sqlSessionTemplate;

	public List<String> selectAppCategory() {
		return sqlSessionTemplate.selectList("approvalMapper.selectAppCategory");
	}

	public int selectCountAppFormName(String appFormName) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectCountAppFormName", appFormName);
	}

	public int insertAppForm(ApprovalFormDto appForm) {
		return sqlSessionTemplate.insert("approvalMapper.insertAppForm", appForm);
	}
	
}
