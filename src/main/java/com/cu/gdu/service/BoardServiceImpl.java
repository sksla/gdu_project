package com.cu.gdu.service;

import java.util.ArrayList;
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
		return boardDao.selectBoardListCount(boardType);
	}

	@Override
	public List<BoardDto> selectBoardList(PageInfoDto pi, String boardType) {
		return boardDao.selectBoardList(pi, boardType);
	}

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return boardDao.selectSearchListCount(search);
	}

	@Override
	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return boardDao.selectSearchList(search, pi);
	}

	@Override
	public int insertBoard(BoardDto board) {
				// board insert
				int result1 = boardDao.insertBoard(board);
				
				int result2 = 1;
				// attachment insert
				List<AttachDto> attachList = board.getAttachList();
				if(!attachList.isEmpty()) {
					result2 = 0;
					for(AttachDto at : attachList) {
						result2 += boardDao.insertAttach(at);
					}
				}		
				return result1 * result2;
	}

	@Override
	public int updateIncreaseCount(int boardNo) {
		return boardDao.updateIncreaseCount(boardNo);
	}

	@Override
	public BoardDto selectBoard(int boardNo) {
		return boardDao.selectBoard(boardNo);
	}

	@Override
	public List<ReplyDto> selectReplyList(int boardNo) {
		return boardDao.selectReplyList(boardNo);
	}

	@Override
	public int insertReply(ReplyDto reply) {
		return boardDao.insertReply(reply);
	}

	@Override
	public int deleteReply(int replyNo) {
		return boardDao.deleteReply(replyNo);
	}

	@Override
	public int modifyReply(ReplyDto reply) {
		return boardDao.modifyReply(reply);
	}
	
	@Override
	public List<AttachDto> selectDelFileList(String[] delFileNo) {
		return delFileNo != null ? boardDao.selectDelFileList(delFileNo)
				 : new ArrayList<AttachDto>();
	}

	@Override
	public int updateBoard(BoardDto board, String[] delFileNo) {
				
				// 게시글 정보 update
				int result1 = boardDao.updateBoard(board);
				
				// 삭제할 첨부파일 정보 delete
				int result2 = delFileNo == null ? 1
												: boardDao.deleteAttach(delFileNo);
				// 새로운 첨부파일 정보 insert
				List<AttachDto> list = board.getAttachList();
				int result3 = 0;
				for(AttachDto at : list) {
					result3 += boardDao.insertAttach(at);
				}
				
				return result1 == 1
						&& result2 > 0
						&& result3 == list.size()
									? 1 : -1;
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(boardNo);
	}

	

}
