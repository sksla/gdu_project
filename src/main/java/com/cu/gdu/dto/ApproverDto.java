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
public class ApproverDto {
	
	private int approverNo;
	private int docNo;
	private String appType;
	private String appYn;
	private String isApproved;
	private String appDate;
	
	private MemberDto approver;
	
}
