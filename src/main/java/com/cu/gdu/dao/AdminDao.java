package com.cu.gdu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.CalendarDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.InsertDateDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReservationDto;
import com.cu.gdu.dto.ResourceDto;
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
	
	// 직원 연차 상세페이지에서 연차추가(보상연차)
	public int insertMemberPlusLeave(VacationDto vac) {
		return sqlSessionTemplate.insert("adminMapper.insertMemberPlusLeave", vac);
	}
	
	// 직원 근태페이지 직원수 조회
	public int memberAttendListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.memberAttendListCount");
	}

	// 직원 근테페이지 직원들 조회
	public List<AttendDto> memberAttendList(PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.memberAttendList", pi, rowBounds);
	}
	
	// 직원 근태 페이지 필터별 직원수조회
	public int ajaxFilterMemberAttendListCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxFilterMemberAttendListCount", map);
	}
	
	// 직원 근태 페이지 필터별 직원조회
	public List<AttendDto> ajaxFilterMemberAttendList(Map<String, Object> map){
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxFilterMemberAttendList", map, rowBounds);
	}
	
	// 직원 근태페이지 오늘날짜만 조회시 직원수
	public int ajaxTodayMemberAttendListCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxTodayMemberAttendListCount", map);
	}
	
	// 직원 근태페이지 오늘날짜만 조회시 직원리스트
	public List<AttendDto> ajaxTodayMemberAttendList(Map<String, Object> map){
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxTodayMemberAttendList", map, rowBounds);
	}
	
	// 강의등록기간 조회
	public InsertDateDto selectLecInsertDate() {
		return sqlSessionTemplate.selectOne("adminMapper.selectLecInsertDate");
	}
	
	// 학생등록기간 조회
	public InsertDateDto selectStuInsertDate() {
		return sqlSessionTemplate.selectOne("adminMapper.selectStuInsertDate");
	}
	
	// 강의등록기간 수정
	public int updateLecDate(InsertDateDto inDate) {
		return sqlSessionTemplate.update("adminMapper.updateLecDate", inDate);
	}
	
	// 학생등록기간 수정
	public int updateStuDate(InsertDateDto inDate) {
		return sqlSessionTemplate.update("adminMapper.updateStuDate", inDate);
	}
	
	// 직원일괄등록 기능
	public int insertManyMember(List<MemberDto> m) {
		Map<String, Object> map = new HashMap<>();
		map.put("m", m);
		return sqlSessionTemplate.insert("adminMapper.insertManyMember", map);
	}
	
	// 학사일정 개별등록
	public int univCalendarInsertOne(CalendarDto cal) {
		return sqlSessionTemplate.insert("adminMapper.univCalendarInsertOne", cal);
	}
	
	// 학사일정 수정기능
	public int updateUnivCal(CalendarDto cal) {
		return sqlSessionTemplate.update("adminMapper.updateUnivCal", cal);
	}
	
	// 학사일정 삭제기능
	public int deleteUnivCal(String calNo) {
		return sqlSessionTemplate.update("adminMapper.deleteUnivCal", calNo);
	}
	
	// 학사일정 일괄등록
	public int univCalendarInsertMany(List<CalendarDto> calList) {
		Map<String, Object> map = new HashMap<>();
		map.put("calList", calList);
		return sqlSessionTemplate.insert("adminMapper.univCalendarInsertMany", map);
	}
	
	// 자원관리 페이지 자원갯수 조회
	public int adminResourceListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.adminResourceListCount");
	}

	// 자원관리 페이지 자원 조회
	public List<ResourceDto> adminResourceList(PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.adminResourceList", pi, rowBounds);
	}
	
	// 자원관리 페이지 자원별 갯수 조회
	public List<ResourceDto> resourceTypeCount() {
		return sqlSessionTemplate.selectList("adminMapper.resourceTypeCount");
	}

	// ajax 통신으로 필터별 자원관리 페이지 자원갯수 조회
	public int ajaxFilterResourceListCount(ResourceDto r) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxFilterResourceListCount", r);
	}
	
	// ajax 통신으로 필터별 자원관리 페이지 자원 조회
	public List<ResourceDto> ajaxFilterResourceList(Map<String, Object> map) {
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxFilterResourceList", map, rowBounds);
	}
	
	// 자원관리 페이지 자원삭제기능
	public int deleteResource(Map<String, Object> map) {
		return sqlSessionTemplate.update("adminMapper.deleteResource", map);
	}
	
	// 자원관리 페이지 자원수정기능
	public int updateResource(Map<String, Object> map) {
		return sqlSessionTemplate.update("adminMapper.updateResource", map);
	}
	
	// 자원관리 페이지 자원등록기능
	public int insertResource(ResourceDto r) {
		return sqlSessionTemplate.insert("adminMapper.insertResource", r);
	}
	
	// 자원관리 상세페이지로 이동
	public ResourceDto resourceDetail(String resNo) {
		return sqlSessionTemplate.selectOne("adminMapper.resourceDetail", resNo);
	}
	
	// 자원관리 상세페이지 자원사용내역 조회
	public List<ReservationDto> selectReservationList(String resNo){
		return sqlSessionTemplate.selectList("adminMapper.selectReservationList", resNo);
	}
	
	// 일정/예약페이지 자원예약 리스트 카운트 조회
	public int resourceReservationListCount() {
		return sqlSessionTemplate.selectOne("adminMapper.resourceReservationListCount");
	}

	// 일정/예약페이지 자원예약 리스트 조회
	public List<ReservationDto> resourceReservationList(PageInfoDto pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.resourceReservationList", pi, rowBounds);
	}
	
	// 일정/예약페이지 ajax로 필터별 자원예약리스트 갯수 조회
	public int ajaxFilterResourceReservationListCount(ResourceDto r) {
		return sqlSessionTemplate.selectOne("adminMapper.ajaxFilterResourceReservationListCount", r);
	}
	
	// 일정/예약페이지 ajax로 필터별 자원예약 리스트 조회
	public List<ReservationDto> ajaxFilterResourceReservationList(Map<String, Object> map) {
		PageInfoDto pi = (PageInfoDto)map.get("pi");
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSessionTemplate.selectList("adminMapper.ajaxFilterResourceReservationList", map, rowBounds);
	}

	// 일정/예약페이지 비품사용기록 등록시 비품조회 ajax
	public List<ResourceDto> searchResourceList(String resName) {
		return sqlSessionTemplate.selectList("adminMapper.searchResourceList", resName);
	}
	
	// 일정/예약페이지 비품사용기록 등록시 사용자조회 ajax
	public List<MemberDto> searchReservationMemberList(String memName) {
		return sqlSessionTemplate.selectList("adminMapper.searchReservationMemberList", memName);
	}
	
	// 일정/예약페이지 비품사용기록 등록기능
	public int inserResourceReservation(ReservationDto r) {
		return sqlSessionTemplate.insert("adminMapper.inserResourceReservation", r);
	}
	
	// 일정/예약페이지 비품사용기록 등록시 해당비품 갯수 업데이트
	public int updateResourceStock(Map<String, Object> map) {
		return sqlSessionTemplate.update("adminMapper.updateResourceStock", map);
	}
	
	// 일정/예약 상세페이지에 띄울 값 조회
	public ReservationDto selectReservationDetail(String revNo) {
		return sqlSessionTemplate.selectOne("adminMapper.selectReservationDetail", revNo);
	}
	
	// 일정/예약 상세페이지에 미반납비품 반납처리
	public int updateResourceReturn(String revNo) {
		return sqlSessionTemplate.update("adminMapper.updateResourceReturn", revNo);
	}

	// 일정/예약 상세페이지에 미반납비품 반납처리후 자원테이블 수량 수정
	public int updateReturnResourceStock(Map<String, Object> map) {
		return sqlSessionTemplate.update("adminMapper.updateReturnResourceStock", map);
	}
	
	// 관리자 대시보드 미반납비품 조회기능
	public List<ReservationDto> selectDashboardReservation() {
		return sqlSessionTemplate.selectList("adminMapper.selectDashboardReservation");
	}
	
	// 관리자 대시보드 오늘의 예약건 조회
	public List<ReservationDto> selectTodayReserList() {
		return sqlSessionTemplate.selectList("adminMapper.selectTodayReserList");
	}
	
}
