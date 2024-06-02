package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.ChatDto;
import com.cu.gdu.dto.ChatRoomDto;
import com.cu.gdu.dto.MemberDto;

public interface ChatService {

	
	// 채팅방 만들기
	int createChatRoom();
	int insertChatMem(int memNo);
	int getLastChatRoomNo();
	
	// 채팅방 목록 조회
	List<ChatRoomDto> selectChatRoomList(int memNo);
	
	// 채팅 메세지 등록
	int insertMessage(ChatDto ch);
	int updateMessage(ChatDto ch);
	
	// 채팅방별 메세지 조회하기
	List<ChatDto> selectChatList(int chroNo);
	
	// 채팅방에 멤버 추가하기
	int addMemChatRoom(ChatDto ch);
	
	// 채팅방별 멤버 조회하기
	List<MemberDto> selectChatRoomMem(int chroNo);
	
	// 첨부파일 등록
	int insertChatFile(BoardDto b);
	
	// 첨부파일 조회
	List<AttachDto> selectChatFiles(int refNo);
	
	
	
	
}
