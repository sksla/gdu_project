package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.AdminDao;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;
import com.cu.gdu.dto.VacationTypeDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao adminDao;
	
	// 조직도페이지에서 단과조회
	@Override
	public List<CollegeDto> selectCollegeList() {
		return adminDao.selectCollegeList();
	}

	// 조직도페이지에서 학과조회
	@Override
	public List<MajorDto> selectMajorList() {
		return adminDao.selectMajorList();
	}

	// 직원관리페이지에서 직원수 조회 (페이징)
	@Override
	public int selectMemberListCount() {
		return adminDao.selectMemberListCount();
	}

	// 직원관리페이지에서 직원조회
	@Override
	public List<MemberDto> selectMemberList(PageInfoDto pi) {
		return adminDao.selectMemberList(pi);
	}

	// 직원관리페이지에서 직급조회
	@Override
	public List<JobDto> selectJobList() {
		return adminDao.selectJobList();
	}

	// 직원관리페이지에서 직원퇴직처리
	@Override
	public int updateOutMember(String[] memNo) {
		return adminDao.updateOutMember(memNo);
	}

	// 직원관리페이지에서 직원학과수정
	@Override
	public int updateMajorMember(Map<String, Object> map) {
		return adminDao.updateMajorMember(map);
	}
	
	// 직원관리페이지에서 직원직급수정
	@Override
	public int updateJobMember(Map<String, Object> map) {
		return adminDao.updateJobMember(map);
	}
	
	// 학과직급 둘다 검사 후 ajax통신해 직원수조회(페이징)
	@Override
	public int ajaxFilterMemberListCount(MemberDto m) {
		return adminDao.ajaxFilterMemberListCount(m);
	}
	
	// 학과직급 둘다 검사 후 ajax통신해 직원조회
	@Override
	public List<MemberDto> ajaxFilterMemberList(Map<String, Object> map) {
		return adminDao.ajaxFilterMemberList(map);
	}

	// 이름으로 검사 후 ajax통신해 직원수조회(페이징, 학과직급 포함)
	@Override
	public int ajaxNameFilterMemberListCount(MemberDto m) {
		return adminDao.ajaxNameFilterMemberListCount(m);
	}

	// 이름으로 검사 후 ajax통신해 직원조회(학과직급 포함)
	@Override
	public List<MemberDto> ajaxNameFilterMemberList(Map<String, Object> map) {
		return adminDao.ajaxNameFilterMemberList(map);
	}

	// 직원 개별등록
	@Override
	public int insertOneMember(MemberDto m) {
		return adminDao.insertOneMember(m);
	}

	// 직원상세조회 페이지
	@Override
	public MemberDto selectMemberDetail(int memNo) {
		return adminDao.selectMemberDetail(memNo);
	}

	// 직원상세조회 페이지
	@Override
	public int updateMember(MemberDto m) {
		return adminDao.updateMember(m);
	}

	// 관리자 대시보드 그래프에 띄울 직원수
	@Override
	public List<MemberDto> selectDashboardMemberList() {
		return adminDao.selectDashboardMemberList();
	}

	// 관리자 대시보드 휴가신청현황 조회
	@Override
	public List<VacationDto> selectDashboardVacation() {
		return adminDao.selectDashboardVacation();
	}

	// 관리자 설정페이지 학과전체조회
	@Override
	public List<MajorDto> selectAdminSetMajorList() {
		return adminDao.selectAdminSetMajorList();
	}

	// 관리자 설정페이지 직급전체조회
	@Override
	public List<JobDto> selectAdminSetJobList() {
		return adminDao.selectAdminSetJobList();
	}

	// 관리자 설정페이지 학과생성
	@Override
	public int insertMajor(MajorDto major) {
		return adminDao.insertMajor(major);
	}

	// 관리자 설정페이지에서 학과수정
	@Override
	public int updateMajor(MajorDto major) {
		return adminDao.updateMajor(major);
	}

	// 관리자 설정페이지에서 직급생성
	@Override
	public int insertJob(JobDto job) {
		return adminDao.insertJob(job);
	}

	// 관리자 설정페이지에서 직급수정
	@Override
	public int updateJob(JobDto job) {
		return adminDao.updateJob(job);
	}

	// 근무/연차페이지 직원수 조회
	@Override
	public int selectRequestMemberListCount() {
		return adminDao.selectRequestMemberListCount();
	}

	// 근무/연차페이지 연차신청한 직원조회 및 페이징바
	@Override
	public List<VacationDto> selectRequestMemberList(PageInfoDto pi) {
		return adminDao.selectRequestMemberList(pi);
	}

	// 필터를 통해 근무/연차신청한 직원 페이지 직원수 조회
	@Override
	public int ajaxFilterSelectRequestLeaveMemberListCount(MemberDto m) {
		return adminDao.ajaxFilterSelectRequestLeaveMemberListCount(m);
	}

	// 필터를 통해 근무/연차신청한 직원 페이지 직원조회 및 페이징바
	@Override
	public List<VacationDto> ajaxFilterSelectRequestLeaveMemberList(Map<String, Object> map) {
		return adminDao.ajaxFilterSelectRequestLeaveMemberList(map);
	}

	// 직원 휴가승인 기능
	@Override
	public int requestLeaveYesMember(String[] vacNo) {
		return adminDao.requestLeaveYesMember(vacNo);
	}

	// 직원 휴가거절 기능
	@Override
	public int requestLeaveNoMember(String[] vacNo) {
		return adminDao.requestLeaveNoMember(vacNo);
	}

	// 직원 사용한 연차관리 페이지의 사용연차 현황
	@Override
	public int memberLeaveListCount() {
		return adminDao.memberLeaveListCount();
	}

	// 직원 사용한 연차관리 페이지 직원리스트
	@Override
	public List<VacationDto> memberLeaveList(PageInfoDto pi) {
		return adminDao.memberLeaveList(pi);
	}

	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원수 조회
	@Override
	public int ajaxFilterMemberLeaveListCount(MemberDto m) {
		return adminDao.ajaxFilterMemberLeaveListCount(m);
	}

	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원리스트 조회
	@Override
	public List<VacationDto> ajaxFilterMemberLeaveList(Map<String, Object> map) {
		return adminDao.ajaxFilterMemberLeaveList(map);
	}

	// 직원 연차 상세페이지에 띄울 직원정보 조회
	@Override
	public VacationDto memberLeaveDetail(String memNo) {
		return adminDao.memberLeaveDetail(memNo);
	}

	// 직원 연차 상세페이지에 해당직원의 연차정보들 조회
	@Override
	public List<VacationDto> memberLeaveDetailList(String memNo) {
		return adminDao.memberLeaveDetailList(memNo);
	}

	// 직원 연차 상세페이지에서 연차 추가시 타입 조회
	@Override
	public List<VacationTypeDto> selectMemberLeaveType() {
		return adminDao.selectMemberLeaveType();
	}

	// 직원 지급 및 보상연차 조회
	@Override
	public int selectPlusVacCount(int memNo) {
		return adminDao.selectPlusVacCount(memNo);
	}

	// 직원 지급 및 보상연차 조회
	@Override
	public int selectUsedPlusVacCount(int memNo) {
		return adminDao.selectUsedPlusVacCount(memNo);
	}

	// 직원 연차 상세페이지에서 연차추가(보상연차)
	@Override
	public int insertMemberPlusLeave(VacationDto vac) {
		return adminDao.insertMemberPlusLeave(vac);
	}



}
