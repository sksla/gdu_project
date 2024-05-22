package com.cu.gdu.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	public List<StuAttendDto> selectStuAttendList(PageInfoDto pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		// RowBounds rowBounds = new RowBounds(몇개의게시글건너뛰고, 몇개조회할건지);
		RowBounds rowBounds = new RowBounds(offset, limit);

		
		return sqlSessionTemplate.selectList("lectureMapper.selectStuAttendList");
	}
}
