package com.cu.gdu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.CalendarDao;
import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.CalendarDto;
import com.cu.gdu.dto.ShareMemDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService {
	
	private final CalendarDao calendarDao;

	// 김영주 -------------------------------------------------------

	/**
	 * 캘린더(카테고리) 조회
	 * @author 김영주
	 */
	@Override
	public List<CalCtgDto> selectCalCtgList(int memNo) {
		return calendarDao.selectCalCtgList(memNo);
	}
	
	/**
	 * 캘린더(카테고리) 등록
	 * @author 김영주
	 */
	@Override
	public int insertCalCtg(CalCtgDto ctg) {
		
		// 캘린더(카테고리) insert
		int result1 = calendarDao.insertCalCtg(ctg);
		
		int result2 = 1;
		
		if(ctg.getCtgType().equals("2")) {
			// 공유직원 insert
			List<ShareMemDto> shList = ctg.getShList();
			if(!shList.isEmpty()) {
				result2 = 0;
				for(ShareMemDto sh : shList) {
					result2 += calendarDao.insertShareMem(sh);
				}
			}
		}
		
		
		return result1 * result2;
	}

	/**
	 * 캘린더(카테고리) 수정
	 * @author 김영주
	 */
	@Override
	public int updateCalCtg(CalCtgDto ctg) {
		return calendarDao.updateCalCtg(ctg);
	}
	
	/**
	 * 캘린더(카테고리) 삭제
	 * @author 김영주
	 * 
	 * delType == 1 개인 => 카테고리 지움
	 * delType == 2 공유캘 소유자가 삭제 => 공유멤버 싹 지우고 카테고리도 지움
	 * delType == 3 공유캘 공유받은 사람이 삭제 => 공유멤버만 지우기
	 * 
	 */
	@Override
	public int deleteCalCtg(int ctgNo, int delType, Map<String, Object> delInfo) {
		// delType == 1 개인 => 카테고리 지움
		// delType == 2 공유캘 소유자가 삭제 => 공유멤버 싹 지우고 카테고리도 지움 (결과 
		// delType == 3 공유캘 공유받은 사람이 삭제 => 공유멤버만 지우기 (결과 1)
		
		int result1 = 0;
		int result2 = 1;
		
		if(delType == 3) {
			
			result1 = calendarDao.deleteShareMem(delInfo);
			
		}else {
			
			if(delType == 2) {
				
				//log.debug("ctgNoArr의 길이 : {}", ctgNoArr.length);
				result2 = calendarDao.deleteShareMem(delInfo);
			}
			
			result1 = calendarDao.deleteCalCtg(ctgNo);
		}
		
		return result1 * result2;
	}
	
	
	/**
	 * 일정 등록
	 * @author 김영주
	 */
	@Override
	public int insertCalendar(CalendarDto cal) {
		return calendarDao.insertCalendar(cal);
	}

	/**
	 * 일정 조회
	 * @author 김영주
	 */
	@Override
	public List<CalendarDto> selectCalendarList(String[] showList) {
		return calendarDao.selectCalendarList(showList);
	}

	/**
	 * 일정 수정
	 * @author 김영주
	 */
	@Override
	public int updateCalendar(CalendarDto cal) {
		return calendarDao.updateCalendar(cal);
	}

	/**
	 * 일정 삭제
	 * @author 김영주
	 * @param delInfo
	 */
	@Override
	public int deleteCalendar(Map<String, Integer> delInfo) {
		
		return calendarDao.deleteCalendar(delInfo);
	}

	
	/**
	 * 일정 개수 조회
	 * @author 김영주
	 */
	@Override
	public int selectCalListCount(int ctgNo) {
		return calendarDao.selectCalListCount(ctgNo);
	}

	/**
	 * 공유멤버 삭제
	 * @author 김영주
	 */
	@Override
	public int deleteShareMem(String shareMemNo) {
		return 0;
	}
	
	/**
	 * 공유멤버 수 조회
	 * @author 김영주
	 */
	@Override
	public int selectShareMemListCount(int ctgNo) {
		return calendarDao.selectShareMemListCount(ctgNo);
	}

	/**
	 * 학사 일정 조회
	 * author 김영주
	 */
	@Override
	public List<CalendarDto> selectUnivCalList() {
		return calendarDao.selectUnivCalList();
	}



	
	// 김영주 부분 끝-------------------------------------------------------

}
