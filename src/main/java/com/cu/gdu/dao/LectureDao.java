package com.cu.gdu.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.LecStuDto;
import com.cu.gdu.dto.LectureDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.StuAttendDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class LectureDao {

	private final SqlSessionTemplate sqlSessionTemplate;

	// * ------------------- 출석 관련 -------------------
	
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
	public List<LecStuDto> selectStuListForLec(int lecNo) {
		return sqlSessionTemplate.selectList("lectureMapper.selectStuListForLec");
	}


}
