package com.cu.gdu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.gdu.dto.ApprovalCommentDto;
import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;
import com.cu.gdu.dto.ApproverDto;
import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@RequiredArgsConstructor
public class ApprovalDao {

	private final SqlSessionTemplate sqlSessionTemplate;

	public List<String> selectAppCategory() {
		return sqlSessionTemplate.selectList("approvalMapper.selectAppCategory");
	}

	public int selectCountAppFormName(String appFormName) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectCountAppFormName", appFormName);
	}

	public int insertAppForm(ApprovalFormDto appForm) {
		return sqlSessionTemplate.insert("approvalMapper.insertAppForm", appForm);
	}

	public List<CollegeDto> selectCollegeMajorList() {
		return sqlSessionTemplate.selectList("approvalMapper.selectCollegeMajorList");
	}

	public List<ApprovalFormDto> selectFormListByCategory(String appCategory) {
		return sqlSessionTemplate.selectList("approvalMapper.selectFormListByCategory", appCategory);
	}

	public String selectAppFormContent(int appNo) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectAppFormContent", appNo);
	}

	public List<MemberDto> selectMemberByMajor(MemberDto member) {
		return sqlSessionTemplate.selectList("approvalMapper.selectMemberByMajor", member);
	}

	public int insertAppDoc(ApprovalDocDto appDoc) {
		return sqlSessionTemplate.insert("approvalMapper.insertAppDoc", appDoc);
	}

	public int insertApprover(int memNo, int appType) {
		Map<String, Integer> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("appType", appType);
		return sqlSessionTemplate.insert("approvalMapper.insertApprover", map);
	}

	public int insertAppAttach(AttachDto att) {
		return sqlSessionTemplate.insert("approvalMapper.insertAppAttach", att);
	}

	public int selectCountOngoingBoardList(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectCountOngoingBoardList", map);
	}

	public List<ApprovalDocDto> selectOngoingDocList(PageInfoDto pi, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("approvalMapper.selectOngoingDocList", map, rowBounds);
	}

	public ApprovalDocDto selectAppDoc(int no) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectAppDoc", no);
	}

	public int selectCountReceiveBoardList(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectCountReceiveBoardList", map);
	}

	public List<ApprovalDocDto> selectReceiveBoardList(PageInfoDto pi, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("approvalMapper.selectReceiveBoardList", map, rowBounds);
	}

	public int updateAppDocStatus(ApprovalDocDto appDoc) {
		return sqlSessionTemplate.update("approvalMapper.updateAppDocStatus", appDoc);
	}

	public List<ApproverDto> selectCollaboratorsByDocNo(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("approvalMapper.selectApproverByDocNo", map);
	}

	public ApproverDto selectApproverByDocNo(Map<String, Integer> map) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectApproverByDocNo", map);
	}

	public int updateAppDocStatus(Map<String, String> map) {
		return sqlSessionTemplate.update("approvalMapper.updateAppDocStatus", map);
	}

	public int updateApproverY(Map<String, String> map) {
		return sqlSessionTemplate.update("approvalMapper.updateApproverY", map);
	}

	public int insertAppComment(ApprovalCommentDto appComment) {
		return sqlSessionTemplate.update("approvalMapper.insertAppComment", appComment);
	}

	public String selectNextAppLine(String docNo) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectNextAppLine", docNo);
	}
	
}
