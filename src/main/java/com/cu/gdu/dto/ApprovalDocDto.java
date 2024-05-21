package com.cu.gdu.dto;

import java.util.List;

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
public class ApprovalDocDto {

	private String status;
	private String draftDate;
	private String modifyDate;
	private String docContent;
	private String drafter;
	private String prePeriod;
	private int appNo;
	private int docNo;
	private String docTitle;
	
	private List<ApproverDto> collaborators;
	private ApproverDto approver;
	private ApproverDto receiver;
	
}
