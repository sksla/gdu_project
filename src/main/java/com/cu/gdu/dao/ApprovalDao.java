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
import com.cu.gdu.dto.ApprovalMyLineDto;
import com.cu.gdu.dto.ApprovalMyLineMemberDto;
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

	public List<CollegeDto> selectCollegeMajorList(String search) {
		return sqlSessionTemplate.selectList("approvalMapper.selectCollegeMajorList", search);
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
		map.put("docNo", 0);
		return sqlSessionTemplate.insert("approvalMapper.insertApprover", map);
	}
	
	public int insertApprover(int memNo, int appType, int docNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("appType", appType);
		map.put("docNo", docNo);
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

	public String selectNowAppLine(String docNo) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectNowAppLine", docNo);
	}

	public int selectCountAppFormList(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectCountAppFormList", map);
	}

	public List<ApprovalFormDto> selectAppFormList(Map<String, String> map, PageInfoDto pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() - 1) * pi.getBoardLimit(), pi.getBoardLimit());
		return sqlSessionTemplate.selectList("approvalMapper.selectAppFormList", map, rowBounds);
	}

	public int updateAppFormTmp(ApprovalFormDto appForm) {
		return sqlSessionTemplate.update("approvalMapper.updateAppFormTmp", appForm);
	}

	public ApprovalFormDto selectAppFormByNo(int no) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectAppFormByNo", no);
	}

	public int updateAppForm(ApprovalFormDto appForm) {
		return sqlSessionTemplate.update("approvalMapper.updateAppForm", appForm);
	}

	public List<MemberDto> selectMemberBySearch(Map<String, String> map) {
		return sqlSessionTemplate.selectList("approvalMapper.selectMemberBySearch", map);
	}

	public List<AttachDto> selectAppAttachList(int no) {
		return sqlSessionTemplate.selectList("approvalMapper.selectAppAttachList", no);
	}

	public List<ApprovalCommentDto> selectAppCommentList(int no) {
		return sqlSessionTemplate.selectList("approvalMapper.selectAppCommentList", no);
	}

	public List<ApprovalMyLineDto> selectAppLineList(Map<String, String> map) {
		return sqlSessionTemplate.selectList("approvalMapper.selectAppLineList", map);
	}

	public int selectCountAppLineList(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectCountAppLineList", map);
	}

	public int insertAppLine(ApprovalMyLineDto myLine) {
		return sqlSessionTemplate.insert("approvalMapper.insertAppLine", myLine);
	}

	public int insertAppLineMem(int approver, int appType) {
		Map<String, Integer> map = new HashMap<>();
		map.put("approver", approver);
		map.put("appType", appType);
		return sqlSessionTemplate.insert("approvalMapper.insertAppLineMem", map);
	}

	public int deleteAppLine(int no) {
		return sqlSessionTemplate.delete("approvalMapper.deleteAppLine", no);
	}

	public MemberDto selectAppLineMem(Map<String, Integer> map) {
		return sqlSessionTemplate.selectOne("approvalMapper.selectAppLineMem", map);
	}

	public List<MemberDto> selectAppLineCollaboratorList(Map<String, Integer> map) {
		return sqlSessionTemplate.selectList("approvalMapper.selectAppLineMem", map);
	}

	public int updateAppDoc(ApprovalDocDto appDoc) {
		return sqlSessionTemplate.update("approvalMapper.updateAppDoc", appDoc);
	}

	public int deleteApprover(int docNo) {
		return sqlSessionTemplate.delete("approvalMapper.deleteApprover", docNo);
	}

	public int deleteAttach(String[] delFileNo) {
		return sqlSessionTemplate.delete("approvalMapper.deleteAttach", delFileNo);
	}

	public List<AttachDto> selectDeleteAppAttachList(String[] delFileNo) {
		return sqlSessionTemplate.selectList("approvalMapper.selectDeleteAppAttachList", delFileNo);
	}

	public int updateAppDocContent(ApprovalDocDto appDoc) {
		return sqlSessionTemplate.update("approvalMapper.updateAppDocContent", appDoc);
	}
	
}
