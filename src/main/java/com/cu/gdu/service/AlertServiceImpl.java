package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.AlertDao;
import com.cu.gdu.dto.AlertDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AlertServiceImpl implements AlertService {

	private final AlertDao alertDao;
	
	/**
	 * 알림 조회
	 * @author 김영주
	 */
	@Override
	public List<AlertDto> selectAlertListByTargetNo(int targetNo) {
		return alertDao.selectAlertListByTargetNo(targetNo);
	}

	/**
	 * 알림 등록
	 * @author 김영주
	 */
	@Override
	public int insertAlert(List<AlertDto> altList) {
		
		int result = 0;
		
		for(AlertDto alt :  altList) {
			result += alertDao.insertAlert(alt);
		}
		
		return result;
	}

	/**
	 * 알림 읽음 처리(수정)
	 * @author 김영주
	 */
	@Override
	public int updateAlertReadStatus(int alertNo) {
		return alertDao.updateAlertReadStatus(alertNo);
	}
	
	/**
	 * 알림 삭제
	 * @author 김영주
	 */
	@Override
	public int deleteAlert(Map<String, String> delInfo) {
		return alertDao.deleteAlert(delInfo);
	}

	/**
	 * 읽은 알림 개수
	 */
	@Override
	public int selectAlertCount(int targetNo) {
		return alertDao.selectAlertCount(targetNo);
	}

	/**
	 * 알림 번호 알아오기
	 */
	@Override
	public int selectAlertNo(AlertDto alt) {
		return alertDao.selectAlertNo(alt);
	}

}
