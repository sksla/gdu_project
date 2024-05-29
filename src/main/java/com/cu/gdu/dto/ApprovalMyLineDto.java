package com.cu.gdu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class ApprovalMyLineDto {
	
	private int lineNo;
	private int lineMemNo;
	private String memNo;
	private String lineTitle;
	private String enrollDate;

}
