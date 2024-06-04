package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.ApprovalCommentDto;
import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;
import com.cu.gdu.dto.ApprovalMyLineDto;
import com.cu.gdu.dto.ApprovalMyLineMemberDto;
import com.cu.gdu.dto.ApproverDto;
import com.cu.gdu.dto.AttachDto;
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
	
	// 결재양식 목록 가져오기
	int selectCountAppFormList(Map<String, String> map);
	List<ApprovalFormDto> selectAppFormList(PageInfoDto pi, Map<String, String> map);

	// 자주쓰는 결재선 목록 가져오기
	Object selectMyAppLine(int memNo);

	// 결재양식 임시보관 상태 변경
	int updateAppFormTmp(ApprovalFormDto appForm);
	
	// 양식번호로 결재양식 조회
	ApprovalFormDto selectAppFormByNo(int no);
	
	// 결재양식 수정
	int updateAppForm(ApprovalFormDto appForm);
	
	
	// 결재선 단과대학, 학과 목록 조회
	List<CollegeDto> selectCollegeMajorList(String search);
	
	// 학과/이름으로 직원 검색
	List<MemberDto> selectMemberByKeword(String Keyword);
	
	// 학과별 직원 목록 조회
	List<MemberDto> selectMemberByMajor(MemberDto member);
	
	// 직원 검색
	List<MemberDto> selectMemberBySearch(Map<String, String> map);
	
	// 결재문서 등록
	int insertApp(ApprovalDocDto appDoc, int approverNo, int receiverNo, String[] collaboratorNo);
	
	// 결재문서 수정
	int updateApp(ApprovalDocDto appDoc, int approverNo, int receiverNo, String[] collaboratorNo, String[] delFileNo, int nowStatus);
	List<AttachDto> selectDeleteAppAttachList(String[] delFileNo);
	
	// 문서구분으로 양식 목록 조회
	List<ApprovalFormDto> selectFormListByCategory(String appCategory);
	
	// 양식 내용 불러오기
	String selectAppFormContent(int appNo);
	
	// 결재문서 리스트 조회
	// 진행중인 결재문서 목록 개수 조회
	int selectCountOngoingBoardList(Map<String, String> map);
	// 진행중인 결재문서 목록 조회
	List<ApprovalDocDto> selectOngoingDocList(PageInfoDto pi, Map<String, String> map);
	// 결재할 문서 리스트 개수 조회
	int selectCountReceiveBoardList(Map<String, String> map);
	// 결재할 문서 리스트 조회
	List<ApprovalDocDto> selectReceiveBoardList(PageInfoDto pi, Map<String, String> map);
	
	// 전자결재 상세 조회
	// 문서정보 조회
	ApprovalDocDto selectAppDoc(int no);
	// 문서 관련 결재자 조회
	List<ApproverDto> selectCollaboratorsByDocNo(Map<String, Integer> map);
	ApproverDto selectApproverByDocNo(Map<String, Integer> map);
	// 결재문서 첨부파일 조회
	List<AttachDto> selectAppAttachList(int no);
	// 결재 코멘트 조회
	List<ApprovalCommentDto> selectAppCommentList(int no);
	
	// 결재문서 상태 변경
	int updateAppDocStatus(ApprovalDocDto appDoc);
	
	// 결재 코멘트 삽입
	int insertAppComment(ApprovalCommentDto appComment);
	
	// 결재 승인시 결재문서 상태 변경
	int updateAppLine(Map<String, String> map);
	
	// 자주 쓰는 결재선
	// 결재선 목록
	int selectCountAppLineList(Map<String, String> map);
	List<ApprovalMyLineDto> selectAppLineList(PageInfoDto pi, Map<String, String> map);
	// 결재선 등록
	int insertAppLine(ApprovalMyLineDto myLine, int approverNo, int receiverNo, String[] collaboratorNo, String modifyYN);
	// 결재선 수정
	List<MemberDto> selectAppLineCollaboratorList(Map<String, Integer> map);
	MemberDto selectAppLineApprover(Map<String, Integer> map);
	
	// 결재선 삭제
	int deleteAppLine(int no);

	String selectNowAppLine(String docNo);

	
}
