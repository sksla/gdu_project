package com.cu.gdu.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cu.gdu.service.LectureService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class StuAttendScheduler {
	
	private final LectureService lectureService;
	/*
	@Scheduled(cron="0 0 0 * * *")	
	public void execute1() {
		
		String str =new SimpleDateFormat("E").format(new Date());
		int result = lectureService.insertStuList(str);
		log.debug(str);

	   }*/
}
