package com.cu.gdu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cu.gdu.dto.AlertDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.service.AlertService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/alert")
public class AlertController {
	
	private final AlertService alertService;
	
	// 알림 목록 조회
	@ResponseBody
	@PostMapping(value="/alertList.do", produces="application/json; charset=utf-8")
	public List<AlertDto> selectAlertListByTargetNo(HttpSession session){
		int memNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		return alertService.selectAlertListByTargetNo(memNo);
	}
	
	// 알림 등록
	
	// 알림 읽음 처리
	@ResponseBody
	@PostMapping("/readAlert.do")
	public String updateAlertReadStatus(int alertNo) {
		return alertService.updateAlertReadStatus(alertNo) == 1 ? "SUCCESS" : "FAIL";
	}
	
	// 알림 삭제
	@ResponseBody
	@PostMapping("/deleteAlert.do")
	public String deleteAlert(@RequestParam Map<String, String> delInfo, HttpSession session) {
		int memNo = ((MemberDto)session.getAttribute("loginUser")).getMemNo();
		
		int delCount = 0;
		int delType = Integer.parseInt(delInfo.get("delType"));
		if(delType != 1) {
			delCount = alertService.selectAlertCount(memNo);
			delInfo.put("targetNo", String.valueOf(memNo));
		}
		
		int result = alertService.deleteAlert(delInfo);
		log.debug("delCount : {}", delCount);
		log.debug("result : {}", result);
		if(delType == 1 && result == 1 || delType == 2 && result == delCount) {
			return "SUCCESS";
		}else {
			return "FAIL";
		}
		
	}

}
