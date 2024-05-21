package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.AdminDao;
import com.cu.gdu.dao.AffiliatedOrganDao;
import com.cu.gdu.dto.AffReservationDto;
import com.cu.gdu.dto.AffiliatedOrganDto;
import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AffiliatedOrganServiceImpl implements AffiliatedOrganService {

	private final AffiliatedOrganDao affiliatedOrganDao;
	
	// * ------------------- 부속기관 목록관련 -------------------
	@Override
	public int selectAffiliatedOrganListCount() {
		return affiliatedOrganDao.selectAffiliatedOrganListCount();
	}

	@Override
	public List<AffiliatedOrganDto> selectAffiliatedOrganList(PageInfoDto pi) {
		return affiliatedOrganDao.selectAffiliatedOrganList(pi);
	}
	
	@Override
	public AffiliatedOrganDto selectAffiliatedOrgan(int affNo) {
		return affiliatedOrganDao.selectAffiliatedOrgan(affNo);
	}
	
	// * ------------------- 부속기관 예약관련 -------------------
	@Override
	public int insertAffiliatedOrganRes(AffReservationDto affres) {
		return affiliatedOrganDao.insertAffiliatedOrganRes(affres);
	}

	@Override
	public int selectAffiliatedOrganResListCount() {
		return affiliatedOrganDao.selectAffiliatedOrganResListCount();
	}

	@Override
	public List<AffReservationDto> selectAffiliatedOrganResList(PageInfoDto pi) {
		return affiliatedOrganDao.selectAffiliatedOrganResList(pi);
	}
	
	// * ------------------- 부속기관 등록관련 -------------------
	@Override
	public int insertAffiliatedOrgan(AffiliatedOrganDto aff) {
		
		// 부속기관 insert
		int result1 = affiliatedOrganDao.insertAffiliatedOrgan(aff);
		
		int result2 = 1;
		// attachment insert
		List<AttachDto> attachList = aff.getAttachList();
		if(!attachList.isEmpty()) {
			result2 = 0;
			for(AttachDto at : attachList) {
				result2 += affiliatedOrganDao.insertAttach(at);
			}
		}	
		return result1 * result2;
	}
	
	// * ------------------- 부속기관 검색관련 -------------------
	@Override
	public int selectAffiliatedOrganSearchListCount(Map<String, String> search) {
		return 0;
	}

	@Override
	public List<AffiliatedOrganDto> selectAffiliatedOrganSearchList(Map<String, String> search, PageInfoDto pi) {
		return null;
	}

	

	

	


}
