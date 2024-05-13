package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.AdminDao;
import com.cu.gdu.dao.AffiliatedOrganDao;
import com.cu.gdu.dto.AffiliatedOrganDto;
import com.cu.gdu.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AffiliatedOrganServiceImpl implements AffiliatedOrganService {

	private final AffiliatedOrganDao affiliatedOrganDao;
	
	@Override
	public int selectAffiliatedOrganListCount() {
		return affiliatedOrganDao.selectAffiliatedOrganListCount();
	}

	@Override
	public List<AffiliatedOrganDto> selectAffiliatedOrganList(PageInfoDto pi) {
		return affiliatedOrganDao.selectAffiliatedOrganList(pi);
	}

	@Override
	public AffiliatedOrganDto selectAffiliatedOrganRes(int affNo) {
		return affiliatedOrganDao.selectAffiliatedOrganRes(affNo);
	}

	@Override
	public int selectAffiliatedOrganSearchListCount(Map<String, String> search) {
		return 0;
	}

	@Override
	public List<AffiliatedOrganDto> selectAffiliatedOrganSearchList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}

	

	

	
	

	



}
