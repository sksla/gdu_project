package com.cu.gdu.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cu.gdu.dto.AffReservationDto;
import com.cu.gdu.dto.StuAttendDto;
import com.cu.gdu.service.LectureService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class StuAttendScheduler {
	
	private final LectureService lectureService;
	
	@Scheduled(cron="0 00 0 * * *")	
	public void execute1() {
		int result = lectureService.insertStuList();
		log.debug("오전 12시 학생 등록 실행 확인용 : {}", result);
	}

}
