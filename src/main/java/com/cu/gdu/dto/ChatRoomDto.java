package com.cu.gdu.dto;

import java.util.List;

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
	
	
	 // has Many 관계
	 private List<MemberDto> memberList;
	
}
