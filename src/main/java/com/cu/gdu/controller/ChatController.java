package com.cu.gdu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cu.gdu.dto.ChatDto;
import com.cu.gdu.dto.ChatRoomDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.service.ChatService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/chat")
@RequiredArgsConstructor
@Controller
public class ChatController {
	
	private final ChatService chatService;

	@GetMapping("/room.page")
	public void chatRoomPage() {
		//return "chat/room";
	}
	
	@ResponseBody
	@PostMapping("/createChatRoom.do")
	public int createChatRoom(HttpSession session, String receiverNo) {
		
		System.out.println(receiverNo);
		int result = 0;
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		 result = chatService.createChatRoom();
		int result2 = chatService.insertChatMem(loginUser.getMemNo());
		int result3 = chatService.insertChatMem(Integer.parseInt(receiverNo));
		
		
			return chatService.getLastChatRoomNo();
		
		
	}
	
	@ResponseBody
	@GetMapping(value="/chatRoomList.do", produces="application/json; charset=utf-8")
	public List<ChatRoomDto> ajaxChatRoomList (int memNo){
		return chatService.selectChatRoomList(memNo);
	}
	
	@ResponseBody
	@GetMapping(value="/selectChat.do", produces="application/json; charset=utf-8")
	public List<ChatDto> ajaxSelectChat (int chroNo){
		System.out.println(chroNo);
		return chatService.selectChatList(chroNo);
	}
	
	
}
