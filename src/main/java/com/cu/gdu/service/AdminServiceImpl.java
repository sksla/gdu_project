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

	@Override
	public List<MemberDto> ajaxFilterMemberList(MemberDto m) {
		return adminDao.ajaxFilterMemberList(m);
	}

	@Override
	public int ajaxFilterMemberListCount(MemberDto m) {
		return adminDao.ajaxFilterMemberListCount(m);
	}

	@Override
	public int insertOneMember(MemberDto m) {
		return adminDao.insertOneMember(m);
	}




}
