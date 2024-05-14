package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;

public interface ApprovalService {

	// 결재양식 카테고리 조회
	List<String> selectAppCategory();
	
	// 결재양식 이름 중복 체크
	int selectCountAppFormName(String appFormName);
	
	// 결재양식 등록
	int insertAppForm(ApprovalFormDto appForm);

	// 결재문서 등록
	int insertApp(ApprovalDocDto appDoc);
	
	// 결재문서 목록 조회
}
