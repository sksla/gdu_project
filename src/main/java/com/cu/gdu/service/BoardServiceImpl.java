package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.BoardDao;
import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReplyDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardDao boardDao;
	
	@Override
	public int selectBoardListCount(String boardType) {
		return 0;
	}

	@Override
	public List<BoardDto> selectBoardList(PageInfoDto pi) {
		return null;
	}

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return 0;
	}

	@Override
	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}

	@Override
	public int insertBoard(BoardDto board) {
		return 0;
	}

	@Override
	public int updateIncreaseCount(int boardNo) {
		return 0;
	}

	@Override
	public BoardDto selectBoard(int boardNo) {
		return null;
	}

	@Override
	public List<ReplyDto> selectReplyList(int boardNo) {
		return null;
	}

	@Override
	public int insertReply(ReplyDto reply) {
		return 0;
	}

	@Override
	public int deleteReply(int replyNo) {
		return 0;
	}

	@Override
	public List<AttachDto> selectDelFileList(String[] delFileNo) {
		return null;
	}

	@Override
	public int updateBoard(BoardDto board, String[] delFileNo) {
		return 0;
	}

	@Override
	public int deleteBoard(int boardNo) {
		return 0;
	}

}
