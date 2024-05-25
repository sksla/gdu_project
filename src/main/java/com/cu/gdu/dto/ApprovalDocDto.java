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
	private String prePeriod;
	private String appNo;
	private String appCategory;
	private int docNo;
	private String docTitle;
	private int historyCount;
	private ApprovalHistoryDto nowApprover;
	
	private MemberDto drafter;
	private List<AttachDto> attachList;
	
	private List<ApproverDto> collaborators;
	private ApproverDto approver;
	private ApproverDto receiver;
	
}
