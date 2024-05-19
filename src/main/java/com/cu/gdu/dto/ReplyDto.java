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
public class ReplyDto {

	 private int replyNo;
	 private int boardNo;
	 private String writerMem;
	 private String replyContent;
	 private String registDate;
	 private String modifyDate;
	 private String status;
}
