package com.cu.gdu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.CalCtgDto;
import com.cu.gdu.dto.CalendarDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.ShareMemDto;
import com.cu.gdu.service.CalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/calendar")
@RequiredArgsConstructor
@Slf4j
@Controller
public class CalendarController {
	private final CalendarService calendarService;
	
	
	// -------김영주 시작 -------------------------------------------------------------
	/**
	 * 일정 페이지 요청
	 * 
	 * @author 김영주
	 * @return
	 */
	@GetMapping("/calendar.page")
	public String calendarPage() {
		return "calendar/calendar";
	}
	
	// 캘린더(카테고리) --------------------------------------------------------------
	
	/**
	 * ajax 캘린더 카테고리 조회
	 * 
	 * @author 김영주
	 * @param session
	 * @return
	 */
	@ResponseBody
	@PostMapping(value="/ctgList.do", produces="application/json; charset=UTF-8")
	public List<CalCtgDto> ctgList(HttpSession session){
		
		int memNo = ( (MemberDto)session.getAttribute("loginUser") ).getMemNo();
		
		List<CalCtgDto> ctgList = new ArrayList<>();
		
		ctgList = calendarService.selectCalCtgList(memNo);
		
		return ctgList;
		
	}
	
	/**
	 * 캘린더(카테고리) 등록
	 * 
	 * @author 김영주
	 * @param ctg
	 * @param session
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("/insertCtg.do")
	public String insertCtg(CalCtgDto ctg
						   , HttpSession session
						   , RedirectAttributes redirectAttributes) {
		
		// ctgType:1=> shList = null | ctgType:2 => shList  = 공유멤버 리스트 담겨있음
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		ctg.setCtgWriter(String.valueOf(loginUser.getMemNo()));
		
		log.debug("ctg: {}", ctg);
		
		List<ShareMemDto> shList = ctg.getShList();
		
		if(shList != null && !shList.isEmpty()) {
			for(ShareMemDto s : shList) {
				s.setInsertType("N");
			}
			
		}
		log.debug("shList : {}", ctg.getShList());
		
		int result = calendarService.insertCalCtg(ctg);
		
		String ctgType = ctg.getCtgType(); 
		String ctgTypeStr = ctgType.equals("1") ? "개인" : "공유";
		if(ctgType.equals("1") && result == 1 || ctgType.equals("2") && result == shList.size()) {
			redirectAttributes.addFlashAttribute("alertMsg", ctgTypeStr + "캘린더를 성공적으로 등록하였습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", ctgTypeStr + "캘린더 등록에 실패하였습니다.");
		}
				
		return "redirect:/calendar/calendar.page";
	}
	
	/**
	 * 캘린더(카테고리) 수정
	 * 
	 * @param ctg
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateCtg.do")
	public String updateCtg(CalCtgDto ctg) {
		// type == 1 => 개인캘린더 수정(ctg update만...)
		// type == 2 => 공유캘린더 수정
		
		String ctgType = ctg.getCtgType();
		List<ShareMemDto> newShareList = ctg.getShList();
		List<ShareMemDto> originMemList = ctg.getOriginList();
		List<ShareMemDto> updateList = new ArrayList<>();
		List<ShareMemDto> addList = new ArrayList<>();
		List<ShareMemDto> deleteList = new ArrayList<>();
		
		boolean isAddSuccess = false;
		boolean isDelSuccess = false;
		boolean isUpdateSuccess = false;
		
		if(ctgType.equals("2")) {
			
			//newMap, originMap =>  memNo=rightLevel
			Map<String, String> originMap = new HashMap<>();
			Map<String, String> newMap = new HashMap<>(); 

			for(ShareMemDto s : newShareList) {
				newMap.put(s.getShareMemNo(), s.getRightLevel());
			}
		
			for(ShareMemDto s : originMemList) {
				originMap.put(s.getShareMemNo(), s.getRightLevel());
			}
		
			// 기존리스트에 o, 수정리스트 x => delete 
			// 기존리스트에 o, 수정리스트 o , 권한 변경 o => update 
			for(ShareMemDto s : originMemList) {
				
				if(!newMap.containsKey(s.getShareMemNo())) {
					deleteList.add(s);
				}else {
					String newRight = newMap.get(s.getShareMemNo());
					
					if( !newRight.equals(originMap.get(s.getShareMemNo())) ){
						s.setShareCtgNo(String.valueOf(ctg.getCtgNo()));
						s.setRightLevel(newRight);
						updateList.add(s);
					}
				}
			}
			
			// 수정리스트 o, 기존리스트x => insert(add)
			for(ShareMemDto s : newShareList) {
				
				if(!originMap.containsKey(s.getShareMemNo())) {
					s.setShareCtgNo(String.valueOf(ctg.getCtgNo()));
					s.setInsertType("U");
					addList.add(s);
				}
			}
		
			int delResult = deleteList.isEmpty() ? 1 : 0; 
			if(!deleteList.isEmpty()) {
				String delMemStr = "";
				
				for(int i=0; i<deleteList.size(); i++) {
					String delMemNo = deleteList.get(i).getShareMemNo(); 
					delMemStr += ( i == deleteList.size() -1 ? delMemNo : delMemNo + ",");
				}
				
				Map<String, Object> delInfo = new HashMap<>();
				delInfo.put("type", 2);
				delInfo.put("ctgNo", ctg.getCtgNo());
				delInfo.put("memNoArr", delMemStr.split(","));
				
				delResult = calendarService.deleteShareMem(delInfo);
				
			}
			
			isDelSuccess = deleteList.isEmpty() && delResult == 1 || !deleteList.isEmpty() && delResult == deleteList.size();
			
			int addResult = addList.isEmpty() ? 1 : calendarService.insertShareMem(addList);
			
			isAddSuccess = addList.isEmpty() && addResult == 1 || !addList.isEmpty() && addResult ==  addList.size(); 
			
			int updateResult = updateList.isEmpty() ? 1 : calendarService.updateShareMem(updateList);
			
			isUpdateSuccess = updateList.isEmpty() && updateResult == 1 || !updateList.isEmpty() && updateResult == updateList.size();
		}
		log.debug("ctg : {}", ctg);
		log.debug("shList : {}", ctg.getShList());
		log.debug("originMem : {}" , ctg.getOriginList());
		log.debug("addList : {}", addList.toString());
		log.debug("updateList : {}", updateList.toString());
		log.debug("deleteList : {}", deleteList.toString());
		
		
	
		int result = calendarService.updateCalCtg(ctg);
		
		if(ctgType.equals("1") && result == 1 
				|| ctgType.equals("2") && result == 1 && isAddSuccess && isUpdateSuccess && isDelSuccess) {
			return  "SUCCESS";
		}else {
			return "FAIL";
		}

	}
	
	
	/*
	 * 캘린더 삭제
	 * 
	 */
	@ResponseBody
	@PostMapping("/deleteCtg.do")
	public String deleteCtg(int ctgNo, int delType, HttpSession session) {
		
		// delType == 1 개인  
		// delType == 2 공유캘 소유자가 삭제 => 해당 일정 지우고, 공유멤버도 싹 지우고 카테고리도 지움 (결과 
		// delType == 3 공유캘 공유받은 사람이 삭제 => 공유멤버만 지우기 (결과 1)
		
		int memNo = ( (MemberDto)session.getAttribute("loginUser") ).getMemNo();
		int calCount = calendarService.selectCalListCount(ctgNo);
		int comparisonResult = calCount > 0 ? calCount : 1;
		
		int shareMemCount = delType == 2 ?  calendarService.selectShareMemListCount(ctgNo) : 0;
		
		int delCalCount =  1;
		
		if(delType != 3 && calCount > 0) {
			// 공유받은 캘린더 X,  소속된 일정이 있다 => 일정 삭제
			Map<String, Integer> delInfo = new HashMap<>();
			delInfo.put("type", 2);
			delInfo.put("delNo", ctgNo);
			
			delCalCount = calendarService.deleteCalendar(delInfo);
		}
		
		Map<String, Object> delInfo = new HashMap<>();
		
		if(delType == 2) {
			
			delInfo.put("type", 1);
			delInfo.put("ctgNo", ctgNo );
			
		}else if(delType == 3) {
			String[] shareMemNoArr = { String.valueOf(memNo) };
			delInfo.put("type", 2);
			delInfo.put("ctgNo", ctgNo );
			delInfo.put("memNoArr", shareMemNoArr );
		}
		
		// 예상 결과값 type=1 => result = 1 | type=2 => result=shareCount | type=3 => result=1
		int result = calendarService.deleteCalCtg(ctgNo, delType, delInfo);
		
		if( (delType == 1 && result * delCalCount == comparisonResult) 
				|| (delType == 2 && result == shareMemCount && comparisonResult == delCalCount)
				|| (delType == 3 && result == 1) ) {
			log.debug("result: {}", result);
			return "SUCCESS";
		}else {
			log.debug("result: {}", result);
			return "FAIL";
		}
		
	}
	
	@ResponseBody
	@PostMapping("/deleteSharedCtg.do")
	public String deleSharedCtg(HttpSession session) {
		// 캘린더 공유받은 직원이 해당 캘린더(카테고리) 삭제 => 공유멤버 테이블에서 삭제
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		return "SUCCESS";
	}
	
	
	
	// 캘린더(카테고리) 끝 --------------------------------------------------------------
	
	// 일정 관련 ----------------------------------------------------------------------
	/**
	 * 일정 등록 
	 * 
	 * @author 김영주
	 * @param cal
	 * @param session
	 * @param redirectAttributes
	 * @return result : insert문 처리 행 수
	 */
	@ResponseBody
	@PostMapping("/insertEvt.do")
	public int insertEvent(CalendarDto cal
						 , HttpSession session){
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		cal.setCalWriter(String.valueOf(loginUser.getMemNo()));
		
		return calendarService.insertCalendar(cal);
	}
	
	
	/**
	 * 일정 조회 ajax
	 * @author 김영주
	 * @param showList
	 * @return cList => 일정정보담긴 리스트 List<CalendarDto>
	 */
	@ResponseBody
	@PostMapping(value="/calList.do", produces="application/json; charset=UTF-8")
	public List<CalendarDto> selectCalList(String[] showList){
		
		List<CalendarDto> cList = new ArrayList<>();
		
		cList = calendarService.selectCalendarList(showList);
		
		return cList;
	}
	
	/**
	 * 일정 수정 ajax
	 * @author 김영주
	 * @param cal
	 * @param session
	 * @return 처리행수(int)
	 */
	@ResponseBody
	@PostMapping("/updateEvt.do")
	public int updateEvent(CalendarDto cal, HttpSession session) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		cal.setCalWriter(String.valueOf(loginUser.getMemNo()));
		
		return calendarService.updateCalendar(cal);
	}
	
	
	/**
	 * 일정 삭제 ajax
	 * @param delType : 1(그냥 일정 삭제) | 2(카테고리에 포함된 일정들 삭제)
	 * @param delNo : delType = 1 => 일정번호 | delType =2 => 카테고리번호 
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteEvt.do")
	public int deleteEvt(@RequestParam(value="type", defaultValue="1") int delType
			           , int delNo) {
		//delType=1 => 일정 삭제 | delType=2 => 카테고리안 일정 삭제
		
		Map<String, Integer> delInfo = new HashMap<>();
		delInfo.put("type", delType);
		delInfo.put("delNo", delNo);
		
		return calendarService.deleteCalendar(delInfo);
	}
	
	// 일정 관련 끝----------------------------------------------------------------------
	
	// 학사일정 ----------------------------------------------------------------
	/**
	 * 학사일정 페이지 요청
	 * 
	 * @author 김영주
	 * @return
	 */
	@GetMapping("/univCalendar.page")
	public String univCalendarPage() {
		return "calendar/univCalendar";
	}
	
	/**
	 * 학사일정 조회 
	 * @author 김영주
	 * @return univCalList => 학사일정 담긴 리스트 (List<CalendarDto>)
	 */
	@ResponseBody
	@PostMapping("/univCalList.do")
	public List<CalendarDto> selectUnivCalList(){
		
		List<CalendarDto> univCalList = new ArrayList<>();
		univCalList = calendarService.selectUnivCalList();
		return univCalList;
	}
	
	
	// 학사 일정 끝 ---------------------------------------------------------------
	
	// -------김영주 부분 끝 -------------------------------------------------------------
				   
		
}
