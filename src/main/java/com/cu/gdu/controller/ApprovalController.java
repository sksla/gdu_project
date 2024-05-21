package com.cu.gdu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.ApprovalDocDto;
import com.cu.gdu.dto.ApprovalFormDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.service.ApprovalService;
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
	public String enrollAppForm(ApprovalFormDto appForm, Model model) {
		int result = approvalService.insertAppForm(appForm);
		if(result > 0) {
			
			model.addAttribute("alertMsg", appForm.getTmp().equals("N") ? "결재양식이 등록되었습니다."
																 : "임시저장 문서로 저장되었습니다.");
		} else {
			model.addAttribute("alertMsg", "결재양식 등록에 실패했습니다.");
		}
		return "approval/appMain";
	}
	
	// **************************** 결재 문서 ****************************
	// 결재문서 작성 페이지
	@GetMapping("/enrollAppDoc.page")
	public String enrollAppDocPage(Model model) {
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		return "approval/enrollAppDoc";
	}
	
	@GetMapping("/majorTreeList.do")
	@ResponseBody
	public List<CollegeDto> ajaxSelectmajorList() {
		return approvalService.selectCollegeMajorList();
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
	public List<MemberDto> ajaxMemberList(int majorNo){
		return approvalService.selectMemberByMajor(majorNo);
	}
	
	// 결재문서 등록
	@PostMapping("/enroll.do")
	public String enrollApproval(ApprovalDocDto appDoc,
								 int approverNo, 
								 int receiverNo,
								 String[] collaboratorNo,
								 RedirectAttributes redirectAttributes) {
		int result = approvalService.insertApp(appDoc, approverNo, receiverNo, collaboratorNo);
		int success = (collaboratorNo != null ? collaboratorNo.length : 0) + 2;
		if(result == success) {
			redirectAttributes.addFlashAttribute("alertMsg", "결재문서를 기안했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "기안 실패.");
			redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		return "redirect:/approval/main.do";
	}
	
	// **************************** 결재 보관함 ****************************
	// 진행중인 결재문서 조회
	@GetMapping("/ongoingBoard.page")
	public String ongoinBoardPage(@RequestParam(value="page", defaultValue="1")int currenrPage, Model model) {
		model.addAttribute("appCategories", approvalService.selectAppCategory());
		int listCount = approvalService.selectCountOngoingBoardList();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currenrPage, 5, 8);
		log.debug("{}", approvalService.selectOngoingDocList(pi));
		model.addAttribute("appDocList", approvalService.selectOngoingDocList(pi));
		model.addAttribute("pi", pi);
		return "approval/ongoingBoard";
	}
	
}
