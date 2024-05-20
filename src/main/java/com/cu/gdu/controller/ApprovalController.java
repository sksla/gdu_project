package com.cu.gdu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cu.gdu.dto.ApprovalFormDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.service.ApprovalService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/approval")
@RequiredArgsConstructor
@Controller
public class ApprovalController {
	
	private final ApprovalService approvalService;
	
	// 전자결재 메인페이지
	@GetMapping("/main.do")
	public String appMainPage() {
		return "approval/appMain";
	}

	// 결재양식
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
	
	// 결재문서
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
		log.debug(approvalService.selectAppFormContent(appNo));
		return approvalService.selectAppFormContent(appNo);
	}
	
	// 학과별 직원 조회
	@GetMapping(value="/memberList.do", produces="application/json; charset=utf-8;")
	@ResponseBody
	public List<MemberDto> ajaxMemberList(int majorNo){
		return approvalService.selectMemberByMajor(majorNo);
	}
	
	// 결재문서 등록
	
	
}
