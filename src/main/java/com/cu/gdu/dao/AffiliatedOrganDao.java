package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.AffiliatedOrganDto;
import com.cu.gdu.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AffiliatedOrganDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int selectAffiliatedOrganListCount() {
		return sqlSessionTemplate.selectOne("AffiliatedOrganMapper.selectAffiliatedOrganListCount");
	}
	
	public List<AffiliatedOrganDto> selectAffiliatedOrganList(PageInfoDto pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		// RowBounds rowBounds = new RowBounds(몇개의게시글건너뛰고, 몇개조회할건지);
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSessionTemplate.selectList("affiliatedOrganMapper.selectAffiliatedOrganList", null, rowBounds);
	}
	
	public int selectAffiliatedOrganSearchListCount(Map<String, String> search) {
		return sqlSessionTemplate.selectOne("affiliatedOrganMapper.selectAffiliatedOrganSearchListCount", search);
	}
	
	public List<AffiliatedOrganDto> selectSearchList(Map<String, String> search, PageInfoDto pi){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("affiliatedOrganMapper.selectSearchList", search, rowBounds);
	}
	
}
