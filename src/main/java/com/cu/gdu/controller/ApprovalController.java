package com.cu.gdu.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.ApprovalCommentDto;
import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;
import com.cu.gdu.dto.ApprovalMyLineDto;
import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.service.ApprovalService;
import com.cu.gdu.util.FileUtil;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/approval")
@RequiredArgsConstructor
@Controller
public class ApprovalController {
	
	private final ApprovalService approvalService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	// 전자결재 메인페이지
	@GetMapping("/main.do")
	public String appMainPage() {
		return "approval/appMain";
	}

	// **************************** 결재양식 ****************************
	// 결재양식 등록 페이지
	@GetMapping("/enrollCategory.page")
	public String enrollCategoryPage(Model model){
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		return "approval/enrollCategory";
	}
	
	// 결재양식 이름 중복 검사
	@GetMapping("/validateFormName.do")
	@ResponseBody
	public String validateFormName(String appFormName) {
		int result = approvalService.selectCountAppFormName(appFormName);
		if(result > 0) {
			return "YYYYY";
		} else {
			return "NNNNN";
		}
	}
	
	// 결재양식 등록
	@PostMapping("/enrollAppForm.do")
	public String enrollAppForm(ApprovalFormDto appForm, 
								Model model,
								RedirectAttributes redirectAttributes) {
		
		int result = approvalService.insertAppForm(appForm);
		
		if(result > 0) {
			if(appForm.getTmp().equals("N")) {
				redirectAttributes.addFlashAttribute("alertMsg", "결재양식이 등록되었습니다.");
			} else if(appForm.getTmp().equals("Y")) {
				redirectAttributes.addFlashAttribute("alertMsg", "임시 저장되었습니다.");				
			}
		} else {
			model.addAttribute("alertMsg", "결재양식 등록 실패");
			model.addAttribute("historyBackYN", "Y");
		}
		return "redirect:/approval/categoryList.do?tmp=" + appForm.getTmp();
	}
	
	// 결재 양식 목록
	@GetMapping("/categoryList.do")
	public String categoryList(@RequestParam(value="page", defaultValue="1")int currenrPage
							, @RequestParam(value="category", defaultValue="all")String category
							, String docStatus
							, String search
							, String tmp
							, HttpSession session
							, Model model) {
		model.addAttribute("appCategories", approvalService.selectAppCategory());

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("tmp", tmp);
		map.put("search", search == null ? "" : search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(approvalService.selectCountAppFormList(map), currenrPage, 5, 8);

		String keywordString = "category=" + map.get("category") 
							 + "&search=" + map.get("search")
							 + "&tmp=" + map.get("tmp")
							 + "&docStstus=" + map.get("socStatus");

		model.addAttribute("formList", approvalService.selectAppFormList(pi, map));
		model.addAttribute("pi", pi);
		model.addAttribute("optionMap", map);
		model.addAttribute("keywordString", keywordString);
		return "approval/categoryList";
	}
	
	// 결재양식 삭제(임시저장 처리)
	@PostMapping("/delForm.do")
	public String deleteAppForm(ApprovalFormDto appForm, RedirectAttributes redirectAttributes) {
		appForm.setTmp("Y");
		if(approvalService.updateAppFormTmp(appForm) > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "임시저장 문서로 변경되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "결재양식 삭제 실패");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");			
		}
		return "redirect:/approval/categoryList.do?tmp=Y";
	}
	
	// 결재양식 수정 페이지
	@PostMapping("/modifyForm.page")
	public String modifyAppForm(int no, Model model) {
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		model.addAttribute("appForm", approvalService.selectAppFormByNo(no));
		return "approval/modifyCategory";
	}
	
	// 결재양식 수정
	@PostMapping("/modifyForm.do")
	public String modifyAppForm(ApprovalFormDto appForm, 
								Model model,
								RedirectAttributes redirectAttributes) {
		int result = approvalService.updateAppForm(appForm);
		
		if(result > 0) {
			if(appForm.getTmp().equals("N")) {
				redirectAttributes.addFlashAttribute("alertMsg", "결재양식이 등록되었습니다.");
			} else if(appForm.getTmp().equals("Y")) {
				redirectAttributes.addFlashAttribute("alertMsg", "임시 저장되었습니다.");				
			}
		} else {
			model.addAttribute("alertMsg", "결재양식 등록 실패");
			model.addAttribute("historyBackYN", "Y");
		}
		return "redirect:/approval/categoryList.do?tmp=" + appForm.getTmp();
	}
	
	// **************************** 결재 문서 ****************************
	// 결재문서 작성 페이지
	@GetMapping("/enrollAppDoc.page")
	public String enrollAppDocPage(Model model, HttpSession session) {
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		model.addAttribute("myLineList", approvalService.selectMyAppLine( ((MemberDto)session.getAttribute("loginUser")).getMemNo() ));
		return "approval/enrollAppDoc";
	}
	
	@GetMapping("/majorTreeList.do")
	@ResponseBody
	public List<CollegeDto> ajaxSelectmajorList(String search) {
		return approvalService.selectCollegeMajorList(search);
	}
	
	// 양식 목록 가져오기
	@GetMapping("/formList.do")
	@ResponseBody
	public List<ApprovalFormDto> ajaxFormList(String appCategory) {
		return approvalService.selectFormListByCategory(appCategory);
	}
	
	// 양식 내용 조회
	@GetMapping(value="/formContent.do", produces="text/html; charset=utf-8;")
	@ResponseBody
	public String ajaxFormContent(int appNo) {
		return approvalService.selectAppFormContent(appNo);
	}
	
	// 학과별 직원 조회
	@GetMapping(value="/memberList.do", produces="application/json; charset=utf-8;")
	@ResponseBody
	public List<MemberDto> ajaxMemberList(MemberDto member, HttpSession session){
		member.setMemNo( ( (MemberDto)session.getAttribute("loginUser") ).getMemNo() );
		return approvalService.selectMemberByMajor(member);
	}
	
	// 결재선 직원 검색
	@GetMapping(value="/searchMember.do", produces="application/json; charset=utf-8;")
	@ResponseBody
	public List<MemberDto> ajaxSearchMemberList(String search, HttpSession session){
		Map<String, String> map = new HashMap<>();
		map.put("memNo", String.valueOf(((MemberDto)session.getAttribute("loginUser")).getMemNo()) );
		map.put("search", search);
		return approvalService.selectMemberBySearch(map);
	}
	
	// 결재문서 등록
	@PostMapping("/enroll.do")
	public String enrollApproval(ApprovalDocDto appDoc,
								 @RequestParam(value="approverNo", defaultValue="0")int approverNo, 
								 @RequestParam(value="receiverNo", defaultValue="0")int receiverNo,
								 String[] collaboratorNo,
								 List<MultipartFile> uploadFiles,
								 HttpSession session,
								 RedirectAttributes redirectAttributes) {
		
		List<AttachDto> attachList = new ArrayList<>();
		if(!uploadFiles.isEmpty()) {
			for(MultipartFile uploadFile : uploadFiles) {
				if(uploadFile != null && !uploadFile.isEmpty()) {
					Map<String, String> map = fileUtil.fileUpload(uploadFile, session, "approval");	
					attachList.add(AttachDto.builder().filePath(map.get("filePath"))
							  .filesystemName(map.get("filesystemName"))
							  .originalName(map.get("originalName"))
							  .build()
							  );
				}
			}
		}
		appDoc.setAttachList(attachList);
		int result = approvalService.insertApp(appDoc, approverNo, receiverNo, collaboratorNo);
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg"
											   , Integer.parseInt(appDoc.getStatus()) != 0 ? "결재문서를 기안했습니다."
																					 	   : "임시저장 되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "기안 실패.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		return "redirect:/approval/ongoingBoard.do?docStatus" + appDoc.getStatus();
	}
	
	// 결재문서 수정
	@PostMapping("/modify.do")
	public String modifyApproval(ApprovalDocDto appDoc,
								 @RequestParam(value="approverNo", defaultValue="0")int approverNo, 
								 @RequestParam(value="receiverNo", defaultValue="0")int receiverNo,
								 String[] collaboratorNo,
								 String[] delFileNo,
								 int nowStatus,
								 List<MultipartFile> uploadFiles,
								 HttpSession session,
								 RedirectAttributes redirectAttributes) {
		
		List<AttachDto> delFileList = new ArrayList<>();
		if(delFileNo !=  null) {
			delFileList = approvalService.selectDeleteAppAttachList(delFileNo);			
		}
		if(nowStatus == 2) {
			// 반려문서인 경우(결재선 수정 불가) 결재상태 최신화
			String nowAppLine = approvalService.selectNowAppLine(String.valueOf(appDoc.getDocNo()));
			appDoc.setStatus(nowAppLine);
		}
		List<AttachDto> addAttachList = new ArrayList<>();
		if(!uploadFiles.isEmpty()) {
			for(MultipartFile uploadFile : uploadFiles) {
				if(uploadFile != null && !uploadFile.isEmpty()) {
					Map<String, String> map = fileUtil.fileUpload(uploadFile, session, "approval");	
					addAttachList.add(AttachDto.builder().filePath(map.get("filePath"))
							  .filesystemName(map.get("filesystemName"))
							  .originalName(map.get("originalName"))
							  .refNo(appDoc.getDocNo())
							  .build()
							  );
				}
			}
		}
		appDoc.setAttachList(addAttachList);
		
		int result = approvalService.updateApp(appDoc, approverNo, receiverNo, collaboratorNo, delFileNo, nowStatus);
		if(result > 0) {
			// 성공한 경우 선택된 파일들 삭제
			for(AttachDto delFile : delFileList) {
				new File(session.getServletContext().getRealPath(delFile.getFilePath() + "/" + delFile.getFilesystemName())).delete();
			}
			redirectAttributes.addFlashAttribute("alertMsg"
											   , Integer.parseInt(appDoc.getStatus()) != 0 ? "결재문서를 기안했습니다."
																					 	   : "임시저장 되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "기안 실패.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		return "redirect:/approval/ongoingBoard.do?docStatus=" + nowStatus;
	}
	
	// **************************** 결재 보관함 ****************************
	// 검색 조건별 진행중인 결재문서 조회
	@GetMapping("/ongoingBoard.do")
	public String ongoinBoardPage(@RequestParam(value="page", defaultValue="1")int currenrPage
								, @RequestParam(value="category", defaultValue="all")String category
								, @RequestParam(value="status", defaultValue="all")String status
								, String docStatus
								, String search
								, String startDate
								, String endDate
								, HttpSession session
								, Model model) {
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		
		Map<String, String> map = new HashMap<>();
		map.put("loginUserNo", String.valueOf(((MemberDto)session.getAttribute("loginUser")).getMemNo()) );
		map.put("category", category);
		map.put("docStatus", docStatus == null ? "" : docStatus);
		map.put("status", status);
		map.put("search", search == null ? "" : search);
		map.put("startDate", startDate == null ? "2024-01-01" : startDate);
		map.put("endDate", endDate == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : endDate);
		PageInfoDto pi = pagingUtil.getPageInfoDto(approvalService.selectCountOngoingBoardList(map)
												 , currenrPage
												 , 5
												 , 8);
		
		String keywordString = "category=" + map.get("category") + 
							   "&status=" + map.get("status") + 
							   "&search=" + map.get("search") + 
							   "&startDate=" + map.get("startDate") + 
							   "&docStatus=" + map.get("docStatus") + 
							   "&endDate=" + map.get("endDate");
		
		model.addAttribute("appDocList", approvalService.selectOngoingDocList(pi, map));
		model.addAttribute("pi", pi);
		model.addAttribute("optionMap", map);
		model.addAttribute("keywordString", keywordString);
		
		return "approval/ongoingBoard";
	}
	
	// 검색 조건별 결재할 문서 조회
	@GetMapping("/receiveBoard.do")
	public String receiveBoardPage(@RequestParam(value="page", defaultValue="1")int currenrPage
								, @RequestParam(value="category", defaultValue="all")String category
								, @RequestParam(value="status", defaultValue="all")String status
								, String search
								, String searchType
								, String startDate
								, String endDate
								, HttpSession session
								, Model model) {
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		
		Map<String, String> map = new HashMap<>();
		map.put("loginUserNo", String.valueOf(((MemberDto)session.getAttribute("loginUser")).getMemNo()) );
		map.put("category", category);
		map.put("status", status);
		map.put("search", search == null ? "" : search);
		map.put("searchType", searchType == null ? "" : searchType);
		map.put("startDate", startDate == null ? "2024-01-01" : startDate);
		map.put("endDate", endDate == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : endDate);
		PageInfoDto pi = pagingUtil.getPageInfoDto(approvalService.selectCountReceiveBoardList(map)
												 , currenrPage
												 , 5
												 , 8);
		
		String keywordString = "category=" + map.get("category") + 
							   "&status=" + map.get("status") + 
							   "&search=" + map.get("search") + 
							   "&searchType=" + map.get("searchType") + 
							   "&startDate=" + map.get("startDate") + 
							   "&endDate=" + map.get("endDate");
		
		model.addAttribute("appDocList", approvalService.selectReceiveBoardList(pi, map));
		model.addAttribute("pi", pi);
		model.addAttribute("optionMap", map);
		model.addAttribute("keywordString", keywordString);
		
		return "approval/receiveBoard";
	}
	
	// 전자결재 상세페이지
	@PostMapping("/detail.do")
	public String appDetail(int no, Model model) {
		
		model.addAttribute("docInfo", approvalService.selectAppDoc(no));
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("no", no);
		map.put("appType", 10);
		model.addAttribute("collaboratorList", approvalService.selectCollaboratorsByDocNo(map));
		
		map.put("appType", 20);
		model.addAttribute("approver", approvalService.selectApproverByDocNo(map));
		
		map.put("appType", 30);
		model.addAttribute("receiver", approvalService.selectApproverByDocNo(map));
		
		model.addAttribute("attachList", approvalService.selectAppAttachList(no));
		model.addAttribute("commentList", approvalService.selectAppCommentList(no));
		
		return "approval/appDetail";
	}
	
	@PostMapping("/recall.do")
	public String recall(ApprovalDocDto appDoc, RedirectAttributes redirectAttributes) {
		appDoc.setStatus("1");
		if(approvalService.updateAppDocStatus(appDoc) > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "문서를 회수했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "회수 실패");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		return "redirect:/approval/ongoingBoard.do?docStatus=1";
	}
	
	@PostMapping("/approve.do")
	public String approve(ApprovalCommentDto appComment
						, RedirectAttributes redirectAttributes) {
		
		if(!appComment.getCommentContent().trim().equals("")) {
			approvalService.insertAppComment(appComment);		
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("docNo", appComment.getDocNo());
		map.put("memNo", appComment.getCommenterNo());
		map.put("appYn", appComment.getAppYn());
		
		int result = approvalService.updateAppLine(map);
		
		String appTypeStr =  appComment.getAppYn().equals("A") ? "승인" : "반려";
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", appTypeStr + " 되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", appTypeStr + " 요청 실패.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		return "redirect:/approval/receiveBoard.do";
	}
	
	@GetMapping("/modifyPage.do")
	public String appModifyPage(int no, Model model, HttpSession session) {
		
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		model.addAttribute("docInfo", approvalService.selectAppDoc(no));
		model.addAttribute("myLineList", approvalService.selectMyAppLine( ((MemberDto)session.getAttribute("loginUser")).getMemNo() ));
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("no", no);
		map.put("appType", 10);
		model.addAttribute("collaboratorList", approvalService.selectCollaboratorsByDocNo(map));
		
		map.put("appType", 20);
		model.addAttribute("approver", approvalService.selectApproverByDocNo(map));
		
		map.put("appType", 30);
		model.addAttribute("receiver", approvalService.selectApproverByDocNo(map));
		
		model.addAttribute("attachList", approvalService.selectAppAttachList(no));
		model.addAttribute("commentList", approvalService.selectAppCommentList(no));
		
		return "approval/modifyDoc";
	}
	
	// 자주 쓰는 결재선
	// 결재선 목록
	@GetMapping("/myLineList.do")
	public String myLineList(@RequestParam(value="page", defaultValue="1")int currenrPage
						   , String search
						   , HttpSession session
						   , Model model) {
	
		Map<String, String> map = new HashMap<>();
		map.put("loginUserNo", String.valueOf(((MemberDto)session.getAttribute("loginUser")).getMemNo()) );
		map.put("search", search == null ? "" : search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(approvalService.selectCountAppLineList(map), currenrPage, 5, 8);
	
		model.addAttribute("lineList", approvalService.selectAppLineList(pi, map));
		model.addAttribute("pi", pi);
		model.addAttribute("optionMap", map);
		return "approval/myLineList";
	}
	
	// 결재선 등록/수정
	@PostMapping("/enrollLine.do")
	public String enrollMyLine(ApprovalMyLineDto myLine,
							   int approverNo,
							   int receiverNo,
							   String[] collaboratorNo,
							   @RequestParam(value="modifyYN", defaultValue="N") String modifyYN,
							   RedirectAttributes redirectAttributes) {		
		int result = approvalService.insertAppLine(myLine, approverNo, receiverNo, collaboratorNo, modifyYN);
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", modifyYN.equals("Y") ? "결재선이 수정되었습니다."
																				  : "자주 쓰는 결재선에 등록되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "결재선 등록 실패");
		}
		return "redirect:/approval/myLineList.do";
	}
	
	// 결재선 삭제
	@PostMapping("/delLine.do")
	public String deleteMyAppLine(int no, RedirectAttributes redirectAttributes) {
		if(approvalService.deleteAppLine(no) > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "결재선이 삭제되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "결재선 삭제 실패");
		}
		return "redirect:/approval/myLineList.do";
	}
	
	// 결재선 수정 정보
	@PostMapping(value="/modifyPage.do", produces="application/json; charset=utf-8;")
	@ResponseBody
	public Map<String, Object> ajaxModifyDataAppLine(int no, Model model) {
		Map<String, Integer> map = new HashedMap<>();
		map.put("no", no);
		
		Map<String, Object> resultMap = new HashedMap<>();
		map.put("appType", 10);
		List<MemberDto> list = approvalService.selectAppLineCollaboratorList(map);
		resultMap.put("collaboratorList", list);
		
		map.put("appType", 20);
		resultMap.put("approver", approvalService.selectAppLineApprover(map));
		
		map.put("appType", 30);
		resultMap.put("receiver", approvalService.selectAppLineApprover(map));
		return resultMap;
	}
	
}
