package com.cu.gdu.service;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.MemberDao;
import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.MemberDto;

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

	

}
