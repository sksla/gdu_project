package com.cu.gdu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.OpenLecDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ResourceDto;
import com.cu.gdu.dto.StuAttendDto;

public interface LectureService {
	
	// * ------------------- 출석 -------------------
	// 출석리스트 조회 서비스
	int selectStuAttendListCount();
	List<LectureDto> selectLectureList(int memNo);
	List<LecStuDto> selectStuAttendList();
	List<LecStuDto> selectStuListForLec(Map<String, Object> map);
	
	// 학생 출석 목록 스케줄러 이용해서 등록
	int insertStuList(String str);
	
	// 출석 등록
	int updateStuAttend(ArrayList<StuAttendDto> stuAttendList);

	
	// * ------------------- 강의 -------------------
	// 강의 목록
	List<LectureDto> selectLecList();
	List<OpenLecDto> selectAllLecList();
	List<MajorDto> selectMajorList();
	List<ResourceDto> selectResList();
	List<MemberDto> selectMemList();
	// 강의 등록
	int insertLecture(OpenLecDto ol);
	// 강의 상세조회
	OpenLecDto selectLecDetail(String openLecNo);
	// 강의수정
	int modifyLec(OpenLecDto ol);
	// 강의 삭제
	int deleteLec(String openLecNo);
	
	
	
	
	
	
	


}
