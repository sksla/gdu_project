package com.cu.gdu.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cu.gdu.dao.ApprovalDao;
import com.cu.gdu.dto.ApprovalCommentDto;
import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;
import com.cu.gdu.dto.ApproverDto;
import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor	
public class ApprovalServiceImpl implements ApprovalService {

	private final ApprovalDao approvalDao;
	
	@Override
	public List<String> selectAppCategory() {
		return approvalDao.selectAppCategory();
	}

	@Override
	public int selectCountAppFormName(String appFormName) {
		return approvalDao.selectCountAppFormName(appFormName);
	}
	
	@Override
	public int insertAppForm(ApprovalFormDto appForm) {
		return approvalDao.insertAppForm(appForm);
	}

	@Override
	public List<CollegeDto> selectCollegeMajorList() {
		return approvalDao.selectCollegeMajorList();
	}

	@Override
	public List<MemberDto> selectMemberByKeword(String Keyword) {
		return null;
	}

	@Override
	public List<MemberDto> selectMemberByMajor(MemberDto member) {
		return approvalDao.selectMemberByMajor(member);
	}

	@Override
	public int insertApp(ApprovalDocDto appDoc, int approverNo, int receiverNo, String[] collaboratorNo) {
		
		int result1 = approvalDao.insertAppDoc(appDoc);
		
		int result2 = 1;
		if(Integer.parseInt(appDoc.getStatus()) != 0) {
			result2 = 0;
			if(collaboratorNo != null) {
				for(String collaborator : collaboratorNo) {
					result2 += approvalDao.insertApprover(Integer.parseInt(collaborator), 10);
				}
			}
			result2 += approvalDao.insertApprover(approverNo, 20);
			result2 += approvalDao.insertApprover(receiverNo, 30);
		}
		
		int result3 = 0;
		if(!appDoc.getAttachList().isEmpty()) {
			for(AttachDto att : appDoc.getAttachList()) {
				result3 += approvalDao.insertAppAttach(att);
			}
		}
		
		return result1 * (result2 + result3);
	}

	@Override
	public List<ApprovalFormDto> selectFormListByCategory(String appCategory) {
		return approvalDao.selectFormListByCategory(appCategory);
	}

	@Override
	public String selectAppFormContent(int appNo) {
		return approvalDao.selectAppFormContent(appNo);
	}
	
	@Override
	public int selectCountOngoingBoardList(Map<String, String> map) {
		return approvalDao.selectCountOngoingBoardList(map);
	}

	@Override
	public List<ApprovalDocDto> selectOngoingDocList(PageInfoDto pi, Map<String, String> map) {
		return approvalDao.selectOngoingDocList(pi, map);
	}

	@Override
	public int selectCountReceiveBoardList(Map<String, String> map) {
		return approvalDao.selectCountReceiveBoardList(map);
	}

	@Override
	public List<ApprovalDocDto> selectReceiveBoardList(PageInfoDto pi, Map<String, String> map) {
		return approvalDao.selectReceiveBoardList(pi, map);
	}

	@Override
	public ApprovalDocDto selectAppDoc(int no) {
		return approvalDao.selectAppDoc(no);
	}
	
	@Override
	public List<ApproverDto> selectCollaboratorsByDocNo(Map<String, Integer> map) {
		return approvalDao.selectCollaboratorsByDocNo(map);
	}
	
	@Override
	public ApproverDto selectApproverByDocNo(Map<String, Integer> map) {
		return approvalDao.selectApproverByDocNo(map);
	}
	
	@Override
	public int updateAppDocStatus(ApprovalDocDto appDoc) {
		return approvalDao.updateAppDocStatus(appDoc);
	}

	@Override
	public int insertAppComment(ApprovalCommentDto appComment) {
		return approvalDao.insertAppComment(appComment);
	}

	@Override
	public int updateAppLine(Map<String, String> map) {
		int result1 = 1;
		int result2 = 0;
		if(map.get("appYn").equals("A")) {
			result1 = 0;
			// 다음 결재 단계 조회
			String nextAppLine = approvalDao.selectNextAppLine(map.get("docNo"));
			map.put("status", nextAppLine == null ? "40" : nextAppLine);
			// 결재유무 A로 변경
			result1 = approvalDao.updateApproverY(map);
			result2 = approvalDao.updateAppDocStatus(map);
		} else if(map.get("appYn").equals("R")) {
			map.put("status", "2");
			result2 = approvalDao.updateAppDocStatus(map);
		}
		
		return result1 * result2;
	}


	
	
}
