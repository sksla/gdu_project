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

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao adminDao;
	
	@Override
	public List<CollegeDto> selectCollegeList() {
		return adminDao.selectCollegeList();
	}

	@Override
	public List<MajorDto> selectMajorList() {
		return adminDao.selectMajorList();
	}

	@Override
	public int selectMemberListCount() {
		return adminDao.selectMemberListCount();
	}

	@Override
	public List<MemberDto> selectMemberList(PageInfoDto pi) {
		return adminDao.selectMemberList(pi);
	}

	@Override
	public List<JobDto> selectJobList() {
		return adminDao.selectJobList();
	}

	@Override
	public int updateOutMember(String[] memNo) {
		return adminDao.updateOutMember(memNo);
	}

	@Override
	public int updateMajorMember(Map<String, Object> map) {
		return adminDao.updateMajorMember(map);
	}

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

	@Override
	public int insertOneMember(MemberDto m) {
		return adminDao.insertOneMember(m);
	}



}
