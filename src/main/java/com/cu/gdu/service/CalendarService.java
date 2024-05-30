package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.CalendarDto;
import com.cu.gdu.dto.ShareMemDto;
import com.cu.gdu.dto.TodoListDto;

public interface CalendarService {

	// 캘린더(일정 카테고리) 조회
	List<CalCtgDto> selectCalCtgList(int memNo);
	
	// 캘린더(일정 카테고리) 추가
	int insertCalCtg(CalCtgDto ctg);
	
	// 캘린더(일정 카테고리) 수정
	int updateCalCtg(CalCtgDto ctg);
	
	// 캘린더(카테고리) 삭제
	int deleteCalCtg(int ctgNo, int delType, Map<String, Object> delInfo);
	
	// 일정 개수 조회
	int selectCalListCount(int ctgNo);
	
	// 일정 등록
	int insertCalendar(CalendarDto cal);
	
	// 일정 조회
	List<CalendarDto> selectCalendarList(String[] showList);
	
	// 일정 수정
	int updateCalendar(CalendarDto cal);
	
	// 일정 삭제
	int deleteCalendar(Map<String, Integer> delInfo);
	
	// 공유멤버 수 조회
	int selectShareMemListCount(int ctgNo);
	
	// 공유멤버 삭제
	int deleteShareMem(Map<String, Object> delInfo);
	
	// 공유멤버 등록
	int insertShareMem(List<ShareMemDto> shList);
	
	// 공유멤버 수정
	int updateShareMem(List<ShareMemDto> shList);
	
	// 학사 일정 조회
	List<CalendarDto> selectUnivCalList();
	
	
	// 투두리스트 관련 --------------------------
	
	// 투두리스트 조회
	List<TodoListDto> selectTodoList(TodoListDto todo);
	
	// 투두리스트 등록
	int insertTodo(TodoListDto todo);
	
	// 투두리스트 완료여부 변경
	int updateTodoIsCompleted(TodoListDto todo);
	
	// 투두리스트 삭제
	int deleteTodoList(Map<String, Object> delInfo);
	
	// 해당 날짜의 투두리스트 개수 조회(상태값 Y인 것만)
	int selectTodoListCountByDate(TodoListDto todo);
}
