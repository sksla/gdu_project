package com.cu.gdu.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.LectureDao;
import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.OpenLecDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ResourceDto;
import com.cu.gdu.dto.StuAttendDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LectureServiceImpl implements LectureService {
	
	private final LectureDao lectureDao;
	
	// * ------------------- 출석 -------------------
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
	public List<LecStuDto> selectStuListForLec(Map<String, Object> map) {
		return lectureDao.selectStuListForLec(map);
	}
	// 출석등록
	@Override
	public int updateStuAttend(ArrayList<StuAttendDto> stuAttendList) {
				
		int result= 0;
		if(!stuAttendList.isEmpty()) {
			for(StuAttendDto sa : stuAttendList) {
			result += lectureDao.updateStuAttend(sa);
			}
		}
		
		return result;
	}
	

	// * ------------------- 강의 -------------------
	// 강의리스트
	@Override
	public List<LectureDto> selectLecList() {
		return lectureDao.selectLecList();
	}
	@Override
	public List<OpenLecDto> selectAllLecList() {
		return lectureDao.selectAllLecList();
	}
	@Override
	public List<MajorDto> selectMajorList() {
		return lectureDao.selectMajorList();
	}
	@Override
	public List<ResourceDto> selectResList() {
		return lectureDao.selectResList();
	}
	@Override
	public List<MemberDto> selectProfList() {
		return lectureDao.selectProfList();
	}
	// 강의등록
	@Override
	public int insertLecture(OpenLecDto ol) {
		return lectureDao.insertLecture(ol);
	}
	// 학생등록
	@Override
	public int insertStuList(StuAttendDto sa) {
		return lectureDao.insertStuList(sa);
	}
	// 강의 상세조회
	@Override
	public OpenLecDto selectLecDetail(String openLecNo) {
		return lectureDao.selectLecDetail(openLecNo);
	}
	// 강의 수정
	@Override
	public int modifyLec(OpenLecDto ol) {
		return lectureDao.modifyLec(ol);
	}
	// 강의 삭제
	@Override
	public int deleteLec(String openLecNo) {
		return lectureDao.deleteLec(openLecNo);
	}
	
	

}
