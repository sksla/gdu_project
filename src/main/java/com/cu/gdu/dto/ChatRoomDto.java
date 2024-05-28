package com.cu.gdu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class ChatRoomDto {
 
	 private int chroNo;
	 private String chroName;
	 private String lastMsg;
	 private String msgDate;
	 private String chatMem; // 조인으로 추가된 변수
	 private String profileUrl; // 조인으로 추가된 변수
	 private String jobName; // 조인으로 추가된 변수
	
	
	
}
