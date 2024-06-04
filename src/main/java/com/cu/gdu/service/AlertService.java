package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import com.cu.gdu.dto.AlertDto;

public interface AlertService {

	// 알림 리스트 조회
	public List<AlertDto> selectAlertListByTargetNo(int targetNo);
	
	// 알림 등록
	public int insertAlert(List<AlertDto> alt);
	
	// 알림 읽음 표시(읽음여부 수정)
	public int updateAlertReadStatus(int alertNo);
	
	// 알림 삭제
	public int deleteAlert(Map<String, String> delInfo);
	
	// 알림 개수
	public int selectAlertCount(int targetNo);
	
	// 알림 번호 알아오기
	public int selectAlertNo(AlertDto alt);
}
