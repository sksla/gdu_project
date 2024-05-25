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
public class ApprovalCommentDto {
	
	private int commentNo;
	private String appType;
	private String appYn;
	private String commentDate;
	private String commentContent;
	private String docNo;
	private String commenterNo;

	private MemberDto commenter;
	
}
