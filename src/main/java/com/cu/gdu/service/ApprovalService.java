package com.cu.gdu.service;

import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;

public interface ApprovalService {

	// 결재양식 등록
	int insertAppForm(ApprovalFormDto appForm);

	// 결재문서 등록
	int insertApp(ApprovalDocDto appDoc);
	
	// 결재문서 목록 조회
}
