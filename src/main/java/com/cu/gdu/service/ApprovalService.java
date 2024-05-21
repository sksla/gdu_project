package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;

public interface ApprovalService {

	// 결재양식 카테고리 조회
	List<String> selectAppCategory();
	
	// 결재양식 이름 중복 체크
	int selectCountAppFormName(String appFormName);
	
	// 결재양식 등록
	int insertAppForm(ApprovalFormDto appForm);

	
	// 결재선 단과대학, 학과 목록 조회
	List<CollegeDto> selectCollegeMajorList();
	
	// 학과/이름으로 직원 검색
	List<MemberDto> selectMemberByKeword(String Keyword);
	
	// 학과별 직원 목록 조회
	List<MemberDto> selectMemberByMajor(int majorNo);
	
	// 결재문서 등록
	int insertApp(ApprovalDocDto appDoc, int approverNo, int receiverNo, String[] collaboratorNo);
	
	// 문서구분으로 양식 목록 조회
	List<ApprovalFormDto> selectFormListByCategory(String appCategory);
	
	// 양식 내용 불러오기
	String selectAppFormContent(int appNo);
	
	// 진행중인 결재문서 목록 개수 조회
	int selectCountOngoingBoardList();
	
	// 진행중인 결재문서 목록 조회
	List<ApprovalDocDto> selectOngoingDocList(PageInfoDto pi);
	
}
