package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.ChatDto;
import com.cu.gdu.dto.ChatRoomDto;

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
	
	
}
