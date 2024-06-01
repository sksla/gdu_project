package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.ChatDao;
import com.cu.gdu.dto.ChatDto;
import com.cu.gdu.dto.ChatRoomDto;
import com.cu.gdu.dto.MemberDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChatServiceImpl implements ChatService {

	private final ChatDao chatDao;

	@Override
	public int createChatRoom() {
		return chatDao.createChatRoom();
	}

	@Override
	public int insertChatMem(int memNo) {
		return chatDao.insertChatMem(memNo);
	}

	@Override
	public List<ChatRoomDto> selectChatRoomList(int memNo) {
		return chatDao.selectChatRoomList(memNo);
	}

	@Override
	public int getLastChatRoomNo() {
		return chatDao.getLastChatRoomNo();
	}

	@Override
	public int insertMessage(ChatDto ch) {
		return chatDao.insertMessage(ch);
	}

	@Override
	public List<ChatDto> selectChatList(int chroNo) {
		return chatDao.selectChatList(chroNo);
	}

	@Override
	public int updateMessage(ChatDto ch) {
		return chatDao.updateMessage(ch);
	}

	@Override
	public int addMemChatRoom(ChatDto ch) {
		return chatDao.addMemChatRoom(ch);
	}

	@Override
	public List<MemberDto> selectChatRoomMem(int chroNo) {
		return chatDao.selectChatRoomMem(chroNo);
	}
}
