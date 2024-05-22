package com.cu.gdu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.LectureDao;
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
	public List<StuAttendDto> selectStuAttendList(PageInfoDto pi) {
		return lectureDao.selectStuAttendList(pi);
	}

}
