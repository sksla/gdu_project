package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.MemberDao;
import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDao memberDao;
	
	@Override
	public MemberDto selectMember(MemberDto m) {
		return memberDao.selectMember(m);
	}

	@Override
	public int updateMember(MemberDto m) {
		return memberDao.updateMember(m);
	}

	@Override
	public int updateProfileImg(MemberDto m) {
		return memberDao.updateProfileImg(m);
	}
	
	@Override
	public int updateSignImg(MemberDto m) {
		return memberDao.updateSignImg(m);
	}
	
	@Override
	public int updatePassword(MemberDto m) {
		return memberDao.updatePassword(m);
	}

	@Override
	public int insertAttend(AttendDto atd) {
		return memberDao.insertAttend(atd);
	}

	@Override
	public AttendDto selectAttend(AttendDto atd) {
		return memberDao.selectAttend(atd);
	}

	@Override
	public int updateAttend(AttendDto atd) {
		return memberDao.updateAttend(atd);
	}

	@Override
	public int selectVacationListCount(int memNo) {
		return memberDao.selectVacationListCount(memNo);
	}

	@Override
	public List<VacationDto> selectVacationList(PageInfoDto pi, int memNo) {
		return memberDao.selectVacationList(pi, memNo);
	}

	@Override
	public int insertVacation(VacationDto v) {
		return memberDao.insertVacation(v);
	}

	@Override
	public int updateMemVac(VacationDto v) {
		return memberDao.updateMemVac(v);
	}

	

}
