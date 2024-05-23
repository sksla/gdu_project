package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.LectureDao;
import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.StuAttendDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LectureServiceImpl implements LectureService {
	
	private final LectureDao lectureDao;
	
	// * ------------------- 출석관련 -------------------
	@Override
	public int selectStuAttendListCount() {
		return lectureDao.selectStuAttendListCount();
	}
	@Override
	public List<LectureDto> selectLectureList(int memNo) {
		return lectureDao.selectLectureList(memNo);
	}
	@Override
	public List<LecStuDto> selectStuAttendList() {
		return lectureDao.selectStuAttendList();
	}
	@Override
	public List<LecStuDto> selectStuListForLec(int lecNo) {
		return lectureDao.selectStuListForLec(lecNo);
	}
	
	

}
