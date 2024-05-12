package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.AdminDao;
import com.cu.gdu.dto.CollegeDto;
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

}
