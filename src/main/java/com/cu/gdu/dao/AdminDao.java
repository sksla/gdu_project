package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;
import com.cu.gdu.dto.VacationTypeDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AdminDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<CollegeDto> selectCollegeList(){
		return sqlSessionTemplate.selectList("adminMapper.selectCollegeList");
	}
	
	public List<MajorDto> selectMajorList(){
		return sqlSessionTemplate.selectList("adminMapper.selectMajorList");
	}
	
	public int selectMemberListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.selectMemberListCount");
	}
	
	public List<MemberDto> selectMemberList(PageInfoDto pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.selectMemberList", pi, rowBounds);
	}
	
	public List<JobDto> selectJobList(){
		return sqlSessionTemplate.selectList("adminMapper.selectJobList");
	}
	
	public int updateOutMember(String[] memNo) {
		return sqlSessionTemplate.update("adminMapper.updateOutMember", memNo);
	}
	
	public int updateMajorMember(Map<String, Object> map) {
		return sqlSessionTemplate.update("adminMapper.updateMajorMember", map);
	}
	
	public int updateJobMember(Map<String, Object> map) {
		return sqlSessionTemplate.update("adminMapper.updateJobMember", map);
	}

	// 학과및직급 필터링으로 ajax통신해 직원수조회 (페이징)
	public int ajaxFilterMemberListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxFilterMemberListCount", m);
	}
	
	// 학과및직급 필터링으로 ajax통신해 직원조회 및 페이징
	public List<MemberDto> ajaxFilterMemberList(Map<String, Object> map){
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxFilterMemberList", map, rowBounds);
	}
	
	// 이름검색으로 ajax통신해 직원수조회 (페이징, 학과직급포함)
	public int ajaxNameFilterMemberListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxNameFilterMemberListCount", m);
	}
	
	// 이름검색으로 ajax통신해 직원조회(학과직급포함)
	public List<MemberDto> ajaxNameFilterMemberList(Map<String, Object> map){
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxNameFilterMemberList", map, rowBounds);
	}
	
	// 직원개별등록
	public int insertOneMember(MemberDto m) {
		return sqlSessionTemplate.insert("adminMapper.insertOneMember", m);
	}
	
	// 직원상세조회 페이지
	public MemberDto selectMemberDetail(int memNo) {
		return sqlSessionTemplate.selectOne("adminMapper.selectMemberDetail", memNo);
	}
	
	// 직원상세조회 페이지
	public int updateMember(MemberDto m) {
		return sqlSessionTemplate.update("adminMapper.updateMember", m);                                                                 
	}
	
	// 관리자 대시보드 그래프에 띄울 직원수
	public List<MemberDto> selectDashboardMemberList(){
		return sqlSessionTemplate.selectList("adminMapper.selectDashboardMemberList");
	}
	
	// 관리자 대시보드 연차신정온것 조회
	public List<VacationDto> selectDashboardVacation(){
		return sqlSessionTemplate.selectList("adminMapper.selectDashboardVacation");
	}
	
	// 관리자 설정페이지 학과전체조회
	public List<MajorDto> selectAdminSetMajorList(){
		return sqlSessionTemplate.selectList("adminMapper.selectAdminSetMajorList");
	}
	
	// 관리자 설정페이지 직급전체조회
	public List<JobDto> selectAdminSetJobList(){
		return sqlSessionTemplate.selectList("adminMapper.selectAdminSetJobList");
	}
	
	// 관리자 설정페이지 학과생성
	public int insertMajor(MajorDto major) {
		return sqlSessionTemplate.insert("adminMapper.insertMajor", major);
	}
	
	// 관리사 설정페이지 학과수정
	public int updateMajor(MajorDto major) {
		return sqlSessionTemplate.update("adminMapper.updateMajor", major);
	}
	
	// 관리자 설정페이지 직급생성
	public int insertJob(JobDto job) {
		return sqlSessionTemplate.insert("adminMapper.insertJob", job);
	}
	
	// 관리자 설정페이지 직급수정
	public int updateJob(JobDto job) {
		return sqlSessionTemplate.update("adminMapper.updateJob", job);
	}
	
	// 근무/연차페이지 직원수 조회
	public int selectRequestMemberListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.selectRequestMemberListCount");
	}
	
	// 근무/연차페이지 연차신청한 직원조회
	public List<VacationDto> selectRequestMemberList(PageInfoDto pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.selectRequestMemberList", pi, rowBounds);
	}
	
	// 필터를 통해 근무/연차신청한 직원 페이지 직원수 조회
	public int ajaxFilterSelectRequestLeaveMemberListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxFilterSelectRequestLeaveMemberListCount", m);
	}
	
	// 필터를 통해 근무/연차신청한 직원 페이지 직원조회 및 페이징
	public List<VacationDto> ajaxFilterSelectRequestLeaveMemberList(Map<String, Object> map){
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxFilterSelectRequestLeaveMemberList", map, rowBounds);
	}
	
	// 직원 휴가승인 기능
	public int requestLeaveYesMember(String[] vacNo) {
		return sqlSessionTemplate.update("adminMapper.requestLeaveYesMember", vacNo);
	}
	
	// 직원 휴가거절 기능
	public int requestLeaveNoMember(String[] vacNo) {
		return sqlSessionTemplate.update("adminMapper.requestLeaveNoMember", vacNo);
	}
	
	// 직원 사용한 연차관리 페이지의 사용연차 현황 리스트카운트 조회
	public int memberLeaveListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.memberLeaveListCount");
	}
	
	// 직원 사용한 연차관리 페이지 직원리스트
	public List<VacationDto> memberLeaveList(PageInfoDto pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.memberLeaveList", pi, rowBounds);
	}
	
	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원수 조회
	public int ajaxFilterMemberLeaveListCount(MemberDto m) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxFilterMemberLeaveListCount", m);
	}
	
	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원리스트 조회
	public List<VacationDto> ajaxFilterMemberLeaveList(Map<String, Object> map){
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxFilterMemberLeaveList", map, rowBounds);
	}
	
	// 직원 연차 상세페이지에 띄울 직원정보 조회
	public VacationDto memberLeaveDetail(String memNo) {
		return sqlSessionTemplate.selectOne("adminMapper.memberLeaveDetail", memNo);
	}
	
	// 직원 연차 상세페이지에 해당직원의 연차정보들 조회
	public List<VacationDto> memberLeaveDetailList(String memNo){
		return sqlSessionTemplate.selectList("adminMapper.memberLeaveDetailList", memNo);
	}
	
	// 직원 연차 상세페이지에서 연차 추가시 타입 조회
	public List<VacationTypeDto> selectMemberLeaveType() {
		return sqlSessionTemplate.selectList("adminMapper.selectMemberLeaveType");
	}
	
	// 직원 지급 및 보상연차 조회
	public int selectPlusVacCount(int memNo) {
		return sqlSessionTemplate.selectOne("adminMapper.selectPlusVacCount", memNo);
	}

	// 직원 지급 및 보상연차 조회
	public int selectUsedPlusVacCount(int memNo) {
		return sqlSessionTemplate.selectOne("adminMapper.selectUsedPlusVacCount", memNo);
	}

}
