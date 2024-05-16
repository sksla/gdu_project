package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReplyDto;

public interface BoardService {

		// 게시판리스트 조회 서비스 (페이징)
		int selectBoardListCount(String boardType);
		List<BoardDto> selectBoardList(PageInfoDto pi);
		
		// 게시판검색리스트 조회 서비스 (페이징)
		int selectSearchListCount(Map<String, String> search);
		List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi);
		
		// 게시판작성하기 서비스
		int insertBoard(BoardDto board);
		
		// 게시판상세조회 서비스
		int updateIncreaseCount(int boardNo);
		BoardDto selectBoard(int boardNo);
		
		// 댓글리스트 조회 서비스
		List<ReplyDto> selectReplyList(int boardNo);
		
		// 댓글작성 서비스
		int insertReply(ReplyDto reply);
		
		// 댓글삭제 서비스
		int deleteReply(int replyNo);
		
		// 게시판수정 서비스
		List<AttachDto> selectDelFileList(String[] delFileNo); // 삭제시킬 첨부파일들에 대한 정보 조회용
		int updateBoard(BoardDto board, String[] delFileNo);
		
		// 게시판삭제 서비스
		int deleteBoard(int boardNo);
}
