package com.cu.gdu.handler;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.cu.gdu.dto.ChatDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.service.ChatService;

import lombok.extern.slf4j.Slf4j;
//@RequiredArgsConstructor
@Slf4j
public class ChatEchoHandler extends TextWebSocketHandler {

	private  List<WebSocketSession> sessionList = new ArrayList<>();
	
	@Autowired
	private ChatService chatService;
	
	
	/**
	 * 	1) afterConnectionEstablished : 클라이언트와 연결되었을 때 처리할 내용을 정의
	 * 
	 * @param session - 현재 웹소켓과 연결된 클라이언트 정보를 가지고 있는 객체
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		
		log.debug("========== websocket 연결됨 ===============");
		log.debug("WebSocketSession객체: {}", session);
		log.debug("session Id: {}", session.getId());
		log.debug("session Attributes: {}", session.getAttributes());
		log.debug("현재 채팅방에 참가한 로그인한 회원: {}", session.getAttributes().get("loginUser"));
		
		sessionList.add(session);
		
		// 모든 클라이언트들에게 입장메세지 전달
				for(WebSocketSession client : sessionList) {
					// 전달하고자 하는 메세지의 형식 : 메세지유형(chat/entry/exit)|메세지내용
					String msg = "entry|" + ((MemberDto)session.getAttributes().get("loginUser")).getMemName() + "님이 입장하였습니다." ; 
								
					client.sendMessage(new TextMessage(msg)); // * 채팅방jsp의 onMessage function실행됨
				}
	
	}
	
	/**
	 *	2) handleMessage : 데이터(텍스트, 파일 등)가 웹소켓으로 전송되었을 때 처리할 내용을 정의
	 *
	 *	@param message - 현재 웹소켓으로 전달된 데이터에 대한 정보를 가지고 있는 객체
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		log.debug("========== 메세지 들어옴 =================");
		log.debug("현재 웹소켓으로 메세지를 보낸 회원의 정보: {}", session.getAttributes().get("loginUser"));
		log.debug("현재 웹소켓으로 전달된 메세지 내용: {}", message.getPayload());
		
		 
		    
			
		     // 받은 메시지를 문자열로 변환
			    String receivedMessage = message.getPayload().toString();
			    
			    // 채팅방 번호와 메시지 분리
			    String[] messageParts = receivedMessage.split("\\|");
			    String messageType = messageParts[0]; // 메시지 유형 (file 또는 chat)
			    String chatRoomNumber = messageParts[1]; // 채팅방 번호
			    String chatMessage = messageParts[2]; // 채팅 메시지 또는 파일 URL
			    String originalName = messageParts.length > 3 ? messageParts[3] : ""; // 파일 원본 이름 (파일 전송인 경우)
		        
			    
				// 현재 시간을 가져와서 포맷팅합니다.
			    String currentTime = new SimpleDateFormat("HH:mm").format(new Date());
				
				// 현재 해당 웹소켓에 연결되어있는 모든 클라이언트들에게 현재 들어온 메세지를 재발송함 (작성자 본인포함)
				for(WebSocketSession client : sessionList) {
					// 전달하고자 하는 메세지의 형식 : 메세지유형(chat/entry/exit)|메세지내용|발신자아이디|...
					String msg = messageType  + "|" + chatMessage + "|" 
								+ ((MemberDto)session.getAttributes().get("loginUser")).getMemName()+ ((MemberDto)session.getAttributes().get("loginUser")).getJobNo()+ "|"
				                + currentTime + "|"
						        + ((MemberDto)session.getAttributes().get("loginUser")).getProfileUrl();
					 if (messageType.equals("file")) {
			                msg += "|" + originalName; // 파일 전송인 경우 원본 이름 추가
			         }
					
					client.sendMessage(new TextMessage(msg)); // * 채팅방jsp의 onMessage function실행됨
					
				}
				
				 if (messageType.equals("file")) {
					 chatMessage += ";" + originalName; // 파일 전송인 경우 원본 이름 추가
		         }
				
				// db에 채팅메시지 내역을 남기고자할 경우
				// EchoHandler에서 Service 연결해서
				// insert요청하기
				 ChatDto ch = new ChatDto();
				 ch.setChroNo(Integer.parseInt(chatRoomNumber));
				 ch.setMemNo(((MemberDto)session.getAttributes().get("loginUser")).getMemNo());
				 ch.setChContent(chatMessage);
				 
				 chatService.insertMessage(ch);
				 chatService.updateMessage(ch);
		        
		     
	
	
	}
	
	
	/**
	 *	3)afterConnectionClosed : 클라이언트와의 연결이 끊겼을 때 처리할 내용을 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	
		log.debug("========== websocket 연결끊김 ===============");
		log.debug("WebSocketSession객체: {}", session);
		log.debug("session Id: {}", session.getId());
		log.debug("현재 채팅방에서 나간 회원: {}", session.getAttributes().get("loginUser"));
	
		sessionList.remove(session);
		
		// 모든 클라이언트들에게 퇴장메세지 전달
		for(WebSocketSession client : sessionList) {
			// 전달하고자 하는 메세지의 형식 : 메세지유형(chat/entry/exit)|메세지내용
			String msg = "exit|" + ((MemberDto)session.getAttributes().get("loginUser")).getMemName() + "님이 퇴장하였습니다." ; 
						
			client.sendMessage(new TextMessage(msg)); // * 채팅방jsp의 onMessage function실행됨
		}
	}
	
	
}
