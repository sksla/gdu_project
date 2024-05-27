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
public class ChatDto {

	
	 private int chatNo;
	 private int chroNo;
	 private int memNo;
	 private String chContent;
	 private String chDate;
	 private String chRead;
	 private String memName; // 조인으로 추가된 변수
	 private String profileUrl; // 조인으로 추가된 변수
}
