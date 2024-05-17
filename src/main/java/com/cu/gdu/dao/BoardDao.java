package com.cu.gdu.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class BoardDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public int selectBoardListCount(String boardType) {
		return sqlSessionTemplate.selectOne("boardMapper.selectBoardListCount", boardType);
	}

	public List<BoardDto> selectBoardList (PageInfoDto pi, String boardType) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit ; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);
	
		return sqlSessionTemplate.selectList("boardMapper.selectBoardList", boardType, rowBounds);
	
	}
	
	public  int insertBoard(BoardDto b) {
		return sqlSessionTemplate.insert("boardMapper.insertBoard", b);
	}
}
