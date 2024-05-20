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



}
