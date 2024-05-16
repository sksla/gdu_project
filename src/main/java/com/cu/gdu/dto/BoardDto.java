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
public class BoardDto {

	 private int boardNo;
	 private int memNo;
	 private String boardType;
	 private String boardTitle;
	 private String boardContent;
	 private String registDate;
	 private String modifyDate;
	 private int count;
	 private String openStatus;
	 private String password;
	 private String status;
	 private int attachCount; 
	 
	// has Many 관계
	private List<AttachDto> attachList;
}
