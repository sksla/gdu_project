package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;
import com.cu.gdu.dto.VacationTypeDto;

public interface AdminService {
	
	// 조직도페이지에서 단과조회
	List<CollegeDto> selectCollegeList();
	
	// 조직도페이지에서 학과조회
	List<MajorDto> selectMajorList();
	
	// 직원관리페이지에서 직원수 조회 (페이징)
	int selectMemberListCount();
	List<MemberDto> selectMemberList(PageInfoDto pi);
	
	// 직원관리페이지에서 직급조회
	List<JobDto> selectJobList();
	
	// 직원관리페이지에서 직원퇴직처리
	int updateOutMember(String[] memNo);
	
	// 직원관리페이지에서 직원학과수정
	int updateMajorMember(Map<String, Object> map);
	
	// 직원관리페이지에서 직원직급수정
	int updateJobMember(Map<String, Object> map);
	
	// 학과 및 직급필터링으로 ajax통신해 직원조회 및 페이징
	int ajaxFilterMemberListCount(MemberDto m);
	List<MemberDto> ajaxFilterMemberList(Map<String, Object> map);
	
	// 이름 검색으로 ajax 통신해 직원조회 및 페이징 (학과직급 검사 포함)
	int ajaxNameFilterMemberListCount(MemberDto m);
	List<MemberDto> ajaxNameFilterMemberList(Map<String, Object> map);
	
	// 직원개별등록
	int insertOneMember(MemberDto m);
	
	// 직원상세조회 페이지
	MemberDto selectMemberDetail(int memNo);
	
	// 직원상세조회 페이지
	int updateMember(MemberDto m);
	
	// 관리자 대시보드 그래프에 띄울 직원수
	List<MemberDto> selectDashboardMemberList();
	
	// 관리자 대시보드에 띄울 신청받은 연차신청 7개 조회
	List<VacationDto> selectDashboardVacation();
	
	// 관리자 설정페이지 학과전체조회
	List<MajorDto> selectAdminSetMajorList();
	
	// 관리자 설정페이지 직급전체조회
	List<JobDto> selectAdminSetJobList();
	
	// 관리자 설정페이지 학과생성
	int insertMajor(MajorDto major);
	
	// 관리자 설정페이지에서 학과수정
	int updateMajor(MajorDto major);
	
	// 관리자 설정페이지 직급생성
	int insertJob(JobDto job);
	
	// 관리자 설정페이지 직급수정
	int updateJob(JobDto job);
	
	// 근무/연차신청한 직원 페이지 직원수 조회 및 페이징바
	int selectRequestMemberListCount();
	List<VacationDto> selectRequestMemberList(PageInfoDto pi);
	
	// 필터를 통해 근무/연차신청한 직원 페이지 직원수 조회 및 페이징바
	int ajaxFilterSelectRequestLeaveMemberListCount(MemberDto m);
	List<VacationDto> ajaxFilterSelectRequestLeaveMemberList(Map<String, Object> map);
	
	// 직원 휴가승인 기능
	int requestLeaveYesMember(String[] vacNo);
	
	// 직원 휴가거절 기능
	int requestLeaveNoMember(String[] vacNo);
	
	// 직원 사용한 연차관리 페이지의 사용연차 현황
	int memberLeaveListCount();
	
	// 직원 사용한 연차관리 페이지 직원리스트
	List<VacationDto> memberLeaveList(PageInfoDto pi);
	
	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원수 조회
	int ajaxFilterMemberLeaveListCount(MemberDto m);
	
	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원리스트 조회
	List<VacationDto> ajaxFilterMemberLeaveList(Map<String, Object> map);
	
	// 직원 연차 상세페이지에 띄울 직원정보 조회
	VacationDto memberLeaveDetail(String memNo);
	
	// 직원 연차 상세페이지에 해당직원의 연차정보들 조회
	List<VacationDto> memberLeaveDetailList(String memNo);
	
	// 직원 연차 상세페이지에서 연차 추가시 타입 조회
	List<VacationTypeDto> selectMemberLeaveType();
	
	// 직원 보상연차 조회
	int selectPlusVacCount(int memNo);
	int selectUsedPlusVacCount(int memNo);
	
	// 직원 연차 상세페이지에서 연차추가(보상연차)
	int insertMemberPlusLeave(VacationDto vac);
	
	// 직원 근태페이지 직원수 조회
	int memberAttendListCount();
	
	// 직원 근테페이지 직원들 조회
	List<AttendDto> memberAttendList(PageInfoDto pi);
	
	// 직원 근태 페이지 필터별 직원수조회
	int ajaxFilterMemberAttendListCount(Map<String, Object> map);
	
	// 직원 근태 페이지 필터별 직원조회
	List<AttendDto> ajaxFilterMemberAttendList(Map<String, Object> map);
	
	// 직원 근태페이지 오늘날짜만 조회시 직원수
	int ajaxTodayMemberAttendListCount(Map<String, Object> map);
	
	//
	List<AttendDto> ajaxTodayMemberAttendList(Map<String, Object> map);
}
