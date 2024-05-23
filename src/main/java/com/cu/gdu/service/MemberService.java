package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;

public interface MemberService {

	// 로그인용 서비스
		MemberDto selectMember(MemberDto m);
	
	// 마이페이지에서 정보수정용 서비스 (프로필이미지,사인이미지 별도로 수정)
		int updateMember (MemberDto m);
		int updateProfileImg(MemberDto m);
		int updateSignImg(MemberDto m);
	
	// 비밀번호 변경 서비스
		int updatePassword (MemberDto m);
		
	// 출근 등록 
		int insertAttend(AttendDto atd);
		
	// 퇴근 등록
		int updateAttend(AttendDto atd);
		
	// 출퇴근 이력 조회 서비스
		AttendDto selectAttend(AttendDto atd);
	  
	// 휴가 목록 조회
	   int selectVacationListCount(int memNo);
	   List<VacationDto> selectVacationList(PageInfoDto pi, int memNo);
	   int selectPlusVacCount(int memNo); // 보상휴가일수 조회
	   int selectUsedPlusVacCount(int memNo); // 보상휴가 사용일수 조회
	  
	// 휴가 신청 서비스, 멤버 연차 차감
	   int insertVacation(VacationDto v);
	   int updateMemVac(VacationDto v);
	   
	
}