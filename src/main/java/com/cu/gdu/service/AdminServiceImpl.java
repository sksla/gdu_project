package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.AdminDao;
import com.cu.gdu.dto.CollegeDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao adminDao;
	
	@Override
	public List<CollegeDto> selectCollegeList() {
		return adminDao.selectCollegeList();
	}

}
