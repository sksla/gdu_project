package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.AffReservationDto;
import com.cu.gdu.dto.AffiliatedOrganDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.PageInfoDto;

public interface AffiliatedOrganService {

	// 부속기관리스트 조회 서비스 (페이징)
	int selectAffiliatedOrganListCount();
	List<AffiliatedOrganDto> selectAffiliatedOrganList(PageInfoDto pi);
		
	// 부속기관검색리스트 조회 서비스(페이징)
	int selectAffiliatedOrganSearchListCount(Map<String, String> search);
	List<AffiliatedOrganDto> selectAffiliatedOrganSearchList(Map<String, String> search, PageInfoDto pi);
	
	// 부속기관 예약서비스
	AffiliatedOrganDto selectAffiliatedOrgan(int affNo);
	int insertAffiliatedOrganRes(AffReservationDto affres);
	
	// 부속기관 예약목록
	int selectAffiliatedOrganResListCount();
	List<AffReservationDto> selectAffiliatedOrganResList(PageInfoDto pi);
	
	// 부속기관 등록
	int insertAffiliatedOrgan(AffiliatedOrganDto aff);
	
	
	
}
