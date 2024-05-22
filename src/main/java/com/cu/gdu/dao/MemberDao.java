package com.cu.gdu.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MemberDao {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDto selectMember(MemberDto m) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMember", m);
	}
	
	public int updatePassword(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updatePwd", m);
	}
	
	public int updateMember(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updateMember", m);
	}
	
	public int updateSignImg(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updateSignImg", m);
	}
	
	public int updateProfileImg(MemberDto m) {
		return sqlSessionTemplate.update("memberMapper.updateProfileImg", m);
	}
	
	public AttendDto selectAttend(AttendDto a) {
		return sqlSessionTemplate.selectOne("memberMapper.selectAttend", a);
	}
	
	public int insertAttend(AttendDto a) {
		return sqlSessionTemplate.insert("memberMapper.insertAttend", a);
	}
	
	public int updateAttend(AttendDto a) {
		return sqlSessionTemplate.update("memberMapper.updateAttend", a);
	}
	
	public int selectVacationListCount(int memNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectVacationListCount", memNo);
	}
	
	public List<VacationDto> selectVacationList(PageInfoDto pi, int memNo){
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage()-1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("memberMapper.selectVacationList", memNo, rowBounds );
	}
	
	public int insertVacation(VacationDto v) {
		return sqlSessionTemplate.insert("memberMapper.insertVacation", v);
	}
	
	public int updateMemVac(VacationDto v) {
		return sqlSessionTemplate.update("memberMapper.updateMemVac", v);
	}
	
	public int selectPlusVacCount() {
		return sqlSessionTemplate.selectOne("memberMapper.selectPlusVacCount");
	}
	
	public int selectUsedPlusVacCount(int memNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectUsedPlusVacCount", memNo);
	}
}
