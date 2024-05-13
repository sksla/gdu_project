package com.cu.gdu.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MemberDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDto selectMember(MemberDto m) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMember", m);
	}
	
	public int updatePassword(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updatePwd", m);
	}
	
	public int updateMember(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updateMember", m);
	}

}
