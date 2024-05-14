package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.ApprovalDao;
import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor	
public class ApprovalServiceImpl implements ApprovalService {

	private final ApprovalDao approvalDao;
	
	@Override
	public List<String> selectAppCategory() {
		return approvalDao.selectAppCategory();
	}

	@Override
	public int selectCountAppFormName(String appFormName) {
		return approvalDao.selectCountAppFormName(appFormName);
	}
	
	@Override
	public int insertAppForm(ApprovalFormDto appForm) {
		return approvalDao.insertAppForm(appForm);
	}

	@Override
	public int insertApp(ApprovalDocDto appDoc) {
		return 0;
	}
	
}
