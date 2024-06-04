package com.cu.gdu.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.AlertDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AlertDao {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 알림 목록 조회
	 * @author 김영주
	 * @param targetNo => 로그인한 회원번호
	 * @return
	 */
	public List<AlertDto> selectAlertListByTargetNo(int targetNo) {
		return sqlSessionTemplate.selectList("alertMapper.selectAlertListByTargetNo", targetNo);
	}
	
	/**
	 * 알림 등록
	 * @author 김영주
	 * @param alt
	 * @return
	 */
	public int insertAlert(AlertDto alt) {
		return sqlSessionTemplate.insert("alertMapper.insertAlert", alt);
	}
	
	/**
	 * 알림 읽음 처리(수정)
	 * @author 김영주
	 * @param alertNo
	 * @return
	 */
	public int updateAlertReadStatus(int alertNo) {
		return sqlSessionTemplate.update("alertMapper.updateAlertReadStatus", alertNo);
	}
	
	/**
	 * 알림 삭제 
	 * @author 김영주
	 * @param delInfo  => {delType :1(개별삭제) | 2(읽음 일괄 삭제)}
	 * @return
	 */
	
	public int deleteAlert(Map<String, String> delInfo) {
		return sqlSessionTemplate.delete("alertMapper.deleteAlert", delInfo);
	}
	
	/**
	 * 알림 개수 
	 * @author 김영주
	 * @param targetNo
	 * @return
	 */
	public int selectAlertCount(int targetNo) {
		return sqlSessionTemplate.selectOne("alertMapper.selectAlertCount", targetNo);
	}
	
	/**
	 * 알림번호 알아오기
	 * @param alt
	 * @return
	 */
	public int selectAlertNo(AlertDto alt) {
		return sqlSessionTemplate.selectOne("alertMapper.selectAlertNo", alt);
	}
	
	
}
