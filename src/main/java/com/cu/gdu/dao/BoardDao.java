package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReplyDto;

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
	
	public int selectSearchListCount(Map<String, String> search) {
		return sqlSessionTemplate.selectOne("boardMapper.selectSearchListCount", search);
	}
	
	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("boardMapper.selectSearchList", search ,rowBounds);
	}
	
	public  int insertBoard(BoardDto b) {
		return sqlSessionTemplate.insert("boardMapper.insertBoard", b);
	}
	
	public  int insertAttach(AttachDto at) {
		return sqlSessionTemplate.insert("boardMapper.insertAttach", at);
	}
	
	
	public int updateIncreaseCount(int boardNo) {
		return sqlSessionTemplate.update("boardMapper.updateIncreaseCount", boardNo);
	}
	
	public BoardDto selectBoard(int boardNo) {
		return sqlSessionTemplate.selectOne("boardMapper.selectBoard", boardNo);
	}
	
	public List<AttachDto> selectDelFileList(String[] delFileNo){
		return sqlSessionTemplate.selectList("boardMapper.selectDelFileList", delFileNo);
	}
	
	public int updateBoard(BoardDto board) {
		return sqlSessionTemplate.update("boardMapper.updateBoard", board);
	}
	
	public int deleteAttach(String[] delFileNo) {
		return sqlSessionTemplate.delete("boardMapper.deleteAttach", delFileNo);
	}
	
	public int deleteBoard(int boardNo) {
		return sqlSessionTemplate.update("boardMapper.deleteBoard", boardNo);
	}
	
	public List<ReplyDto> selectReplyList(int boardNo){
		return sqlSessionTemplate.selectList("boardMapper.selectReplyList", boardNo);
	}
	
	public int insertReply(ReplyDto reply) {
		return sqlSessionTemplate.insert("boardMapper.insertReply", reply);
	}
	
	public int deleteReply(int replyNo) {
		return sqlSessionTemplate.update("boardMapper.deleteReply", replyNo);	
	}
	
	public int modifyReply(ReplyDto reply) {
		return sqlSessionTemplate.update("boardMapper.modifyReply", reply);
	}
	
}
