package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

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
	public int selectVacationListCount(Map<String, String> search) {
		return memberDao.selectVacationListCount(search);
	}

	@Override
	public List<VacationDto> selectVacationList(PageInfoDto pi, Map<String, String> search) {
		return memberDao.selectVacationList(pi, search);
	}

	@Override
	public int insertVacation(VacationDto v) {
		return memberDao.insertVacation(v);
	}

	@Override
	public int updateMemVac(VacationDto v) {
		return memberDao.updateMemVac(v);
	}

	@Override
	public int selectPlusVacCount(int memNo) {
		return memberDao.selectPlusVacCount(memNo);
	}

	@Override
	public int selectUsedPlusVacCount(int memNo) {
		return memberDao.selectUsedPlusVacCount(memNo);
	}

	@Override
	public int selectVacationListCountSet(Map<String, String> search) {
		return memberDao.selectVacationListCountSet(search);
	}

	@Override
	public List<VacationDto> selectVacationListSet(PageInfoDto pi, Map<String, String> search) {
		return memberDao.selectVacationListSet(pi,  search);
	}

	@Override
	public int selectAttendListCount(Map<String, String> search) {
		return memberDao.selectAttendListCount(search);
	}

	@Override
	public List<AttendDto> selectAttendList(PageInfoDto pi, Map<String, String> search) {
		return memberDao.selectAttendList(pi, search);
	}

	@Override
	public int selectSearchAttendListCount(Map<String, String> search) {
		return memberDao.selectSearchAttendListCount(search);
	}

	@Override
	public List<AttendDto> selectSearchAttendList(PageInfoDto pi, Map<String, String> search) {
		return memberDao.selectSearchAttendList(search, pi);
	}

	

}
