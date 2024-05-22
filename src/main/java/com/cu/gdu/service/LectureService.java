package com.cu.gdu.service;

import java.util.List;

import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.StuAttendDto;

public interface LectureService {

	// 출석리스트 조회 서비스
	int selectStuAttendListCount();
	List<StuAttendDto> selectStuAttendList(PageInfoDto pi);

}
