package com.cu.gdu.service;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.ApprovalDao;
import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor	
public class ApprovalServiceImpl implements ApprovalService {

	private final ApprovalDao ApprovalDao;
	
	@Override
	public int insertAppForm(ApprovalFormDto appForm) {
		return 0;
	}

	@Override
	public int insertApp(ApprovalDocDto appDoc) {
		return 0;
	}	
	
}
