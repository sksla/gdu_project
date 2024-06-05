package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.AdminDao;
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

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao adminDao;
	
	// 조직도페이지에서 단과조회
	@Override
	public List<CollegeDto> selectCollegeList() {
		return adminDao.selectCollegeList();
	}

	// 조직도페이지에서 학과조회
	@Override
	public List<MajorDto> selectMajorList() {
		return adminDao.selectMajorList();
	}

	// 직원관리페이지에서 직원수 조회 (페이징)
	@Override
	public int selectMemberListCount() {
		return adminDao.selectMemberListCount();
	}

	// 직원관리페이지에서 직원조회
	@Override
	public List<MemberDto> selectMemberList(PageInfoDto pi) {
		return adminDao.selectMemberList(pi);
	}

	// 직원관리페이지에서 직급조회
	@Override
	public List<JobDto> selectJobList() {
		return adminDao.selectJobList();
	}

	// 직원관리페이지에서 직원퇴직처리
	@Override
	public int updateOutMember(String[] memNo) {
		return adminDao.updateOutMember(memNo);
	}

	// 직원관리페이지에서 직원학과수정
	@Override
	public int updateMajorMember(Map<String, Object> map) {
		return adminDao.updateMajorMember(map);
	}
	
	// 직원관리페이지에서 직원직급수정
	@Override
	public int updateJobMember(Map<String, Object> map) {
		return adminDao.updateJobMember(map);
	}
	
	// 학과직급 둘다 검사 후 ajax통신해 직원수조회(페이징)
	@Override
	public int ajaxFilterMemberListCount(MemberDto m) {
		return adminDao.ajaxFilterMemberListCount(m);
	}
	
	// 학과직급 둘다 검사 후 ajax통신해 직원조회
	@Override
	public List<MemberDto> ajaxFilterMemberList(Map<String, Object> map) {
		return adminDao.ajaxFilterMemberList(map);
	}

	// 이름으로 검사 후 ajax통신해 직원수조회(페이징, 학과직급 포함)
	@Override
	public int ajaxNameFilterMemberListCount(MemberDto m) {
		return adminDao.ajaxNameFilterMemberListCount(m);
	}

	// 이름으로 검사 후 ajax통신해 직원조회(학과직급 포함)
	@Override
	public List<MemberDto> ajaxNameFilterMemberList(Map<String, Object> map) {
		return adminDao.ajaxNameFilterMemberList(map);
	}

	// 직원 개별등록
	@Override
	public int insertOneMember(MemberDto m) {
		return adminDao.insertOneMember(m);
	}

	// 직원상세조회 페이지
	@Override
	public MemberDto selectMemberDetail(int memNo) {
		return adminDao.selectMemberDetail(memNo);
	}

	// 직원상세조회 페이지
	@Override
	public int updateMember(MemberDto m) {
		return adminDao.updateMember(m);
	}

	// 관리자 대시보드 그래프에 띄울 직원수
	@Override
	public List<MemberDto> selectDashboardMemberList() {
		return adminDao.selectDashboardMemberList();
	}

	// 관리자 대시보드 휴가신청현황 조회
	@Override
	public List<VacationDto> selectDashboardVacation() {
		return adminDao.selectDashboardVacation();
	}

	// 관리자 설정페이지 학과전체조회
	@Override
	public List<MajorDto> selectAdminSetMajorList() {
		return adminDao.selectAdminSetMajorList();
	}

	// 관리자 설정페이지 직급전체조회
	@Override
	public List<JobDto> selectAdminSetJobList() {
		return adminDao.selectAdminSetJobList();
	}

	// 관리자 설정페이지 학과생성
	@Override
	public int insertMajor(MajorDto major) {
		return adminDao.insertMajor(major);
	}

	// 관리자 설정페이지에서 학과수정
	@Override
	public int updateMajor(MajorDto major) {
		return adminDao.updateMajor(major);
	}

	// 관리자 설정페이지에서 직급생성
	@Override
	public int insertJob(JobDto job) {
		return adminDao.insertJob(job);
	}

	// 관리자 설정페이지에서 직급수정
	@Override
	public int updateJob(JobDto job) {
		return adminDao.updateJob(job);
	}

	// 근무/연차페이지 직원수 조회
	@Override
	public int selectRequestMemberListCount() {
		return adminDao.selectRequestMemberListCount();
	}

	// 근무/연차페이지 연차신청한 직원조회 및 페이징바
	@Override
	public List<VacationDto> selectRequestMemberList(PageInfoDto pi) {
		return adminDao.selectRequestMemberList(pi);
	}

	// 필터를 통해 근무/연차신청한 직원 페이지 직원수 조회
	@Override
	public int ajaxFilterSelectRequestLeaveMemberListCount(MemberDto m) {
		return adminDao.ajaxFilterSelectRequestLeaveMemberListCount(m);
	}

	// 필터를 통해 근무/연차신청한 직원 페이지 직원조회 및 페이징바
	@Override
	public List<VacationDto> ajaxFilterSelectRequestLeaveMemberList(Map<String, Object> map) {
		return adminDao.ajaxFilterSelectRequestLeaveMemberList(map);
	}

	// 직원 휴가승인 기능
	@Override
	public int requestLeaveYesMember(String[] vacNo) {
		return adminDao.requestLeaveYesMember(vacNo);
	}

	// 직원 휴가거절 기능
	@Override
	public int requestLeaveNoMember(String[] vacNo) {
		return adminDao.requestLeaveNoMember(vacNo);
	}

	// 직원 사용한 연차관리 페이지의 사용연차 현황
	@Override
	public int memberLeaveListCount() {
		return adminDao.memberLeaveListCount();
	}

	// 직원 사용한 연차관리 페이지 직원리스트
	@Override
	public List<VacationDto> memberLeaveList(PageInfoDto pi) {
		return adminDao.memberLeaveList(pi);
	}

	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원수 조회
	@Override
	public int ajaxFilterMemberLeaveListCount(MemberDto m) {
		return adminDao.ajaxFilterMemberLeaveListCount(m);
	}

	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원리스트 조회
	@Override
	public List<VacationDto> ajaxFilterMemberLeaveList(Map<String, Object> map) {
		return adminDao.ajaxFilterMemberLeaveList(map);
	}

	// 직원 연차 상세페이지에 띄울 직원정보 조회
	@Override
	public VacationDto memberLeaveDetail(String memNo) {
		return adminDao.memberLeaveDetail(memNo);
	}

	// 직원 연차 상세페이지에 해당직원의 연차정보들 조회
	@Override
	public List<VacationDto> memberLeaveDetailList(String memNo) {
		return adminDao.memberLeaveDetailList(memNo);
	}

	// 직원 연차 상세페이지에서 연차 추가시 타입 조회
	@Override
	public List<VacationTypeDto> selectMemberLeaveType() {
		return adminDao.selectMemberLeaveType();
	}

	// 직원 지급 및 보상연차 조회
	@Override
	public int selectPlusVacCount(int memNo) {
		return adminDao.selectPlusVacCount(memNo);
	}

	// 직원 지급 및 보상연차 조회
	@Override
	public int selectUsedPlusVacCount(int memNo) {
		return adminDao.selectUsedPlusVacCount(memNo);
	}

	// 직원 연차 상세페이지에서 연차추가(보상연차)
	@Override
	public int insertMemberPlusLeave(VacationDto vac) {
		return adminDao.insertMemberPlusLeave(vac);
	}

	// 직원 근태페이지 직원수 조회
	@Override
	public int memberAttendListCount() {
		return adminDao.memberAttendListCount();
	}

	// 직원 근테페이지 직원들 조회
	@Override
	public List<AttendDto> memberAttendList(PageInfoDto pi) {
		return adminDao.memberAttendList(pi);
	}

	// 직원 근태 페이지 필터별 직원수조회
	@Override
	public int ajaxFilterMemberAttendListCount(Map<String, Object> map) {
		return adminDao.ajaxFilterMemberAttendListCount(map);
	}

	// 직원 근태 페이지 필터별 직원조회
	@Override
	public List<AttendDto> ajaxFilterMemberAttendList(Map<String, Object> map) {
		return adminDao.ajaxFilterMemberAttendList(map);
	}

	// 직원 근태페이지 오늘날짜만 조회시 직원수
	@Override
	public int ajaxTodayMemberAttendListCount(Map<String, Object> map) {
		return adminDao.ajaxTodayMemberAttendListCount(map);
	}

	// 직원 근태페이지 오늘날짜만 조회시 직원리스트
	@Override
	public List<AttendDto> ajaxTodayMemberAttendList(Map<String, Object> map) {
		return adminDao.ajaxTodayMemberAttendList(map);
	}

	// 강의등록기간 조회
	@Override
	public InsertDateDto selectLecInsertDate() {
		return adminDao.selectLecInsertDate();
	}

	// 학생등록기간 조회
	@Override
	public InsertDateDto selectStuInsertDate() {
		return adminDao.selectStuInsertDate();
	}

	// 강의등록기간 수정
	@Override
	public int updateLecDate(InsertDateDto inDate) {
		return adminDao.updateLecDate(inDate);
	}

	// 학생등록기간 수정
	@Override
	public int updateStuDate(InsertDateDto inDate) {
		return adminDao.updateStuDate(inDate);
	}

	// 직원일괄등록 기능
	@Override
	public int insertManyMember(List<MemberDto> m) {
		return adminDao.insertManyMember(m);
	}

	// 학사일정 개별등록
	@Override
	public int univCalendarInsertOne(CalendarDto cal) {
		return adminDao.univCalendarInsertOne(cal);
	}

	// 학사일정 수정기능
	@Override
	public int updateUnivCal(CalendarDto cal) {
		return adminDao.updateUnivCal(cal);
	}

	// 학사일정 삭제기능
	@Override
	public int deleteUnivCal(String calNo) {
		return adminDao.deleteUnivCal(calNo);
	}

	// 학사일정 일괄등록
	@Override
	public int univCalendarInsertMany(List<CalendarDto> calList) {
		return adminDao.univCalendarInsertMany(calList);
	}

	// 자원관리 페이지 자원갯수 조회
	@Override
	public int adminResourceListCount() {
		return adminDao.adminResourceListCount();
	}

	// 자원관리 페이지 자원 조회
	@Override
	public List<ResourceDto> adminResourceList(PageInfoDto pi) {
		return adminDao.adminResourceList(pi);
	}

	// 자원관리 페이지 자원별 갯수 조회
	@Override
	public List<ResourceDto> resourceTypeCount() {
		return adminDao.resourceTypeCount();
	}

	// ajax 통신으로 필터별 자원관리 페이지 자원갯수 조회
	@Override
	public int ajaxFilterResourceListCount(ResourceDto r) {
		return adminDao.ajaxFilterResourceListCount(r);
	}

	// ajax 통신으로 필터별 자원관리 페이지 자원 조회
	@Override
	public List<ResourceDto> ajaxFilterResourceList(Map<String, Object> map) {
		return adminDao.ajaxFilterResourceList(map);
	}

	// 자원관리 페이지 자원삭제기능
	@Override
	public int deleteResource(Map<String, Object> map) {
		return adminDao.deleteResource(map);
	}

	// 자원관리 페이지 자원수정기능
	@Override
	public int updateResource(Map<String, Object> map) {
		return adminDao.updateResource(map);
	}

	// 자원관리 페이지 자원등록기능
	@Override
	public int insertResource(ResourceDto r) {
		return adminDao.insertResource(r);
	}

	// 자원관리 상세페이지로 이동
	@Override
	public ResourceDto resourceDetail(String resNo) {
		return adminDao.resourceDetail(resNo);
	}

	// 자원관리 상세페이지 자원사용내역 조회
	@Override
	public List<ReservationDto> selectReservationList(String resNo) {
		return adminDao.selectReservationList(resNo);
	}

	// 일정/예약페이지 자원예약 리스트 카운트 조회
	@Override
	public int resourceReservationListCount() {
		return adminDao.resourceReservationListCount();
	}

	// 일정/예약페이지 자원예약 리스트 조회
	@Override
	public List<ReservationDto> resourceReservationList(PageInfoDto pi) {
		return adminDao.resourceReservationList(pi);
	}

	// 일정/예약페이지 ajax로 필터별 자원예약리스트 갯수 조회
	@Override
	public int ajaxFilterResourceReservationListCount(ResourceDto r) {
		return adminDao.ajaxFilterResourceReservationListCount(r);
	}

	// 일정/예약페이지 ajax로 필터별 자원예약 리스트 조회
	@Override
	public List<ReservationDto> ajaxFilterResourceReservationList(Map<String, Object> map) {
		return adminDao.ajaxFilterResourceReservationList(map);
	}

	// 일정/예약페이지 비품사용기록 등록시 비품조회 ajax
	@Override
	public List<ResourceDto> searchResourceList() {
		return adminDao.searchResourceList();
	}

	// 일정/예약페이지 비품사용기록 등록시 사용자조회 ajax
	@Override
	public List<MemberDto> searchReservationMemberList() {
		return adminDao.searchReservationMemberList();
	}

	// 일정/예약페이지 비품사용기록 등록기능
	@Override
	public int inserResourceReservation(ReservationDto r) {
		return adminDao.inserResourceReservation(r);
	}

	// 일정/예약페이지 비품사용기록 등록시 해당비품 갯수 업데이트
	@Override
	public int updateResourceStock(Map<String, Object> map) {
		return adminDao.updateResourceStock(map);
	}

	// 일정/예약 상세페이지에 띄울 값 조회
	@Override
	public ReservationDto selectReservationDetail(String revNo) {
		return adminDao.selectReservationDetail(revNo);
	}

	// 일정/예약 상세페이지에 미반납비품 반납처리
	@Override
	public int updateResourceReturn(String revNo) {
		return adminDao.updateResourceReturn(revNo);
	}

	// 일정/예약 상세페이지에 미반납비품 반납처리후 자원테이블 수량 수정
	@Override
	public int updateReturnResourceStock(Map<String, Object> map) {
		return adminDao.updateReturnResourceStock(map);
	}

	// 관리자 대시보드 미반납비품 조회기능
	@Override
	public List<ReservationDto> selectDashboardReservation() {
		return adminDao.selectDashboardReservation();
	}

	// 관리자 대시보드 오늘의 예약건 조회
	@Override
	public List<ReservationDto> selectTodayReserList() {
		return adminDao.selectTodayReserList();
	}

	// 조직도 ajax로 페이지 학과 직원수 조회
	@Override
	public int ajaxChartMemberListCount(String majorNo) {
		return adminDao.ajaxChartMemberListCount(majorNo);
	}

	// 조직도 ajax로 페이지 학과 직원 조회
	@Override
	public List<MemberDto> ajaxChartMemberList(Map<String, Object> map) {
		return adminDao.ajaxChartMemberList(map);
	}

	// 직원개별등록시 아이디 유효성검사
	@Override
	public int ajaxMemId(String memId) {
		return adminDao.ajaxMemId(memId);
	}
	
}
