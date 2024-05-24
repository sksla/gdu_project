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
public class ApprovalHistoryDto {
	
	private String appYN;
	private String appDate;
	private int appHistoryNo;
	private MemberDto approver;
	private String comment;

}
