package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.StuAttendDto;

public interface LectureService {

	// 출석리스트 조회 서비스
	int selectStuAttendListCount();
	List<LectureDto> selectLectureList(int memNo);
	List<LecStuDto> selectStuAttendList();
	List<LecStuDto> selectStuListForLec(String lecNo);
	
	// 학생 출석 목록 스케줄러 이용해서 등록
	int insertStuList();

	

	

}
