package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.OpenLecDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ResourceDto;
import com.cu.gdu.dto.StuAttendDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class LectureDao {

	private final SqlSessionTemplate sqlSessionTemplate;

	// * ------------------- 출석 -------------------
	
	public int selectStuAttendListCount() {
		return sqlSessionTemplate.selectOne("lectureMapper.selectStuAttendListCount");
	}
	// 교수 강의목록
	public List<LectureDto> selectLectureList(int memNo) {
		return sqlSessionTemplate.selectList("lectureMapper.selectLectureList", memNo);
	}
	// 학생 출석목록
	public List<LecStuDto> selectStuAttendList() {
		return sqlSessionTemplate.selectList("lectureMapper.selectStuAttendList");
	}
	public List<LecStuDto> selectStuListForLec(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("lectureMapper.selectStuListForLec", map);
	}
	// 학생 출석 목록 스케줄러 이용해서 등록
	public int insertStuList(String str) {
		return sqlSessionTemplate.insert("lectureMapper.insertStuList");
	}
	// 출석 등록	
	public int updateStuAttend(StuAttendDto sa) {
		return sqlSessionTemplate.update("lectureMapper.updateStuAttend", sa);
	}
	
	
	// * ------------------- 강의 -------------------
	// 강의리스트
	public List<LectureDto> selectLecList() {
		return sqlSessionTemplate.selectList("lectureMapper.selectLecList");
	}
	
	public List<OpenLecDto> selectAllLecList() {
		return sqlSessionTemplate.selectList("lectureMapper.selectAllLecList");
	}
	
	public List<MajorDto> selectMajorList() {
		return sqlSessionTemplate.selectList("lectureMapper.selectMajorList");
	}
	public List<ResourceDto> selectResList() {
		return sqlSessionTemplate.selectList("lectureMapper.selectResList");
	}
	public List<MemberDto> selectMemList() {
		return sqlSessionTemplate.selectList("lectureMapper.selectMemList");
	}
	
	// 강의등록
	public int insertLecture(OpenLecDto ol) {
		return sqlSessionTemplate.insert("lectureMapper.insertLecture", ol);
	}
	
	// 강의 상세조회
	public OpenLecDto selectLecDetail(String openLecNo) {
		return sqlSessionTemplate.selectOne("lectureMapper.selectLecDetail", openLecNo);
	}
	
	// 강의수정
	public int modifyLec(OpenLecDto ol) {
		return sqlSessionTemplate.update("lectureMapper.modifyLecture", ol);
	}
	
	// 강의삭제
	public int deleteLec(String openLecNo) {
		return sqlSessionTemplate.delete("lectureMapper.deleteLecture", openLecNo);
	}
	

	
	
	
	
}
