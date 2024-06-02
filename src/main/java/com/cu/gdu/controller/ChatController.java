package com.cu.gdu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.ChatDto;
import com.cu.gdu.dto.ChatRoomDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.service.ChatService;
import com.cu.gdu.util.FileUtil;

import lombok.RequiredArgsConstructor;

@RequestMapping("/chat")
@RequiredArgsConstructor
@Controller
public class ChatController {
	
	private final ChatService chatService;
	private final FileUtil fileUtil;

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
	
	@ResponseBody
	@PostMapping("/addChatMem.do")
	public String ajaxAddChatMem (ChatDto ch, String receiverNo) {
		System.out.println(ch);
		ch.setMemNo(Integer.parseInt(receiverNo));
		return chatService.addMemChatRoom(ch) > 0 ? "SUCCESS" : "FAIL";
	}
	
	@ResponseBody
	@GetMapping(value="/chatRoomMem.do", produces="application/json; charset=utf-8")
	public List<MemberDto> ajaxSelectChatRoomMem (int chroNo){
		return chatService.selectChatRoomMem(chroNo);
	}
	
	@ResponseBody
	@PostMapping(value="uploadChatFile.do", produces="application/json; charset=utf-8")
	public List<AttachDto> ajaxUploadFile(BoardDto board, List<MultipartFile> uploadFiles, HttpSession session) {
		
		List<AttachDto> attachList = new ArrayList<>();
		for(MultipartFile uploadFile: uploadFiles) {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				 //파일 업로드
				Map<String, String> map = fileUtil.fileUpload(uploadFile, session, "chat");
				
				// insert할 데이터 => AttachDto객체만들기 => attachList쌓기
				attachList.add( AttachDto.builder()
										 .filePath(map.get("filePath"))
										 .filesystemName(map.get("filesystemName"))
										 .originalName(map.get("originalName"))
										 .refType("C")
										 .refNo(board.getBoardNo())
										 .build());
			
			}
		}
		board.setAttachList(attachList); 
		chatService.insertChatFile(board); 
		// List<AttachDto> savedFiles = chatService.selectChatFiles(board.getBoardNo());
		    
		 return attachList;
	}
	
	@ResponseBody
	@GetMapping(value="selectChatFile.do", produces="application/json; charset=utf-8")
	public List<AttachDto> ajaxSelectFiles(String refNo) {
		
		
		List<AttachDto> list = chatService.selectChatFiles(Integer.parseInt(refNo));
		
		return list ;
	}
	
}
