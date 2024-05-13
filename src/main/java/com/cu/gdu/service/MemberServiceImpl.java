package com.cu.gdu.service;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.MemberDao;
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
		return 0;
	}

	@Override
	public int updatePassword(MemberDto m) {
		return memberDao.updatePassword(m);
	}

}
