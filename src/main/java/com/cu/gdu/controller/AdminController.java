package com.cu.gdu.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.VacationDto;
import com.cu.gdu.service.AdminService;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

	private final AdminService adminService;
	private final PagingUtil pagingUtil;
	private final BCryptPasswordEncoder bcryptPwdEncoder;
	
	// 조직도페이지 조회
	@GetMapping("/chart.do")
	public String chart(Model model) {
		List<CollegeDto> colList = adminService.selectCollegeList();
		List<MajorDto> majorList = adminService.selectMajorList();
		//log.debug("colList객체: {}", colList);
		//log.debug("majorList객체: {}", majorList);
		model.addAttribute("colList", colList);
		model.addAttribute("majorList", majorList);
		
		return "admin/chart";
	}
	
	// 직원관리 페이지
	@GetMapping("/memberList.do")
	public ModelAndView memberList(@RequestParam(value="page", defaultValue="1") int currentPage
								 , ModelAndView mv) {
		int listCount = adminService.selectMemberListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<MemberDto> list = adminService.selectMemberList(pi);
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		
	    for (MemberDto m : list) {
	        m.setBirth(m.getBirth() + "-" + m.getGender() + "******");
	    }
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("jobList", jobList)
		  .addObject("majorList", majorList)
		  .setViewName("admin/memberList");
		return mv;
	}

	// 직원관리페이지에서 직원 퇴직처리
	@GetMapping("/outMember.do")
	public String updateOutMember(String[] memNo, RedirectAttributes redirectAttributes) {
		int result = adminService.updateOutMember(memNo);
		if(result == memNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 회원을 퇴직처리 했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "퇴직처리에 실패했습니다.");
		}
		return "redirect:/admin/memberList.do";
	}
	
	// 직원관리페이지에서 직원 학과수정
	@GetMapping("/updateMajorMember.do")
	public String updateMajorMember(int[] memNo, String majorNo, RedirectAttributes redirectAttributes) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memNo", memNo); // 1, 5, 4 ,9
		map.put("majorNo", majorNo); // 5
		//log.debug("맵 {}", map); // {memNo=[1,2, 3,4], majorNo=2}

		int result = adminService.updateMajorMember(map);
		if(result == memNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 회원의 학과를 수정했습니다..");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "학과수정에 실패했습니다.");
		}
		return "redirect:/admin/memberList.do";
	}
	
	// 직원관리페이지에서 직원 직급수정
	@GetMapping("/updateJobMember.do")
	public String updateJobMember(int[] memNo, String jobNo, RedirectAttributes redirectAttributes) {
		Map<String, Object> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("jobNo", jobNo);
		
		int result = adminService.updateJobMember(map);	
		if(result == memNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 회원의 직급을 수정했습니다..");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "직급수정에 실패했습니다.");
		}
		return "redirect:/admin/memberList.do";
	}

	// 학과 및 직급 검사 후 직원조회
	@ResponseBody
	@GetMapping(value="/filterMemberList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterMemberList(MemberDto m, @RequestParam(value="page", defaultValue="1") int currentPage){
		int listCount = adminService.ajaxFilterMemberListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		Map<String, Object> map = new HashMap<>();
		map.put("m", m);
		map.put("pi", pi);
		//log.debug("멤버자체를 셀렉하기 전의 m: {}", m);
		
		List<MemberDto> member = adminService.ajaxFilterMemberList(map); 
		
		for (MemberDto mem : member) {
			mem.setBirth(mem.getBirth() + "-" + mem.getGender() + "******");
		}
		map.put("member", member);
		//log.debug("맵객체: {}", map);
		return map;
	}
	
	// 이름으로 직원조회 (학과 및 직금검사 포함)
	@ResponseBody
	@GetMapping(value="/nameFilterMemberList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> ajaxNameFilterMemberList(MemberDto m, @RequestParam(value="page", defaultValue="1") int currentPage){
		int listCount = adminService.ajaxNameFilterMemberListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		Map<String, Object> map = new HashMap<>();
		map.put("m", m);
		map.put("pi", pi);
		
		List<MemberDto> member = adminService.ajaxNameFilterMemberList(map);
		
		for (MemberDto mem : member) {
			mem.setBirth(mem.getBirth() + "-" + mem.getGender() + "******");
		}
		map.put("member", member);
		
		return map;
		
	}
	
	// 직원개별등록 페이지 조회
	@GetMapping("/insertOneMemberEnrollForm.do")
	public String insertOneMemberEnrollForm(Model model) {
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		model.addAttribute("majorList", majorList);
		model.addAttribute("jobList", jobList);
		return "admin/insertOneMember";
	}
	
	// 직원개별등록
	@PostMapping("/insertOneMember.do")
	public String insertOneMember(MemberDto m, RedirectAttributes redirectAttributes, String addressDetail) {
		m.setMemPwd("1111");
		m.setLeaveCount(12);
		String[] resident = m.getResident().split("-");
		String gender = String.valueOf(resident[1].charAt(0));
		m.setBirth(resident[0]);
		m.setGender(gender);
		m.setMemPwd(bcryptPwdEncoder.encode(m.getMemPwd()));
		m.setResident(bcryptPwdEncoder.encode(m.getResident()));
		m.setAddress(m.getAddress() + " " + addressDetail);
		int result = adminService.insertOneMember(m);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직원을 등록했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "직원등록에 실패했습니다.");
		}
		return "redirect:/admin/memberList.do";
	}
	
	// 직원상세페이지
	@GetMapping("/memberDetail.do")
	public String selectMemberDetail(int memNo, Model model) {
		MemberDto m = adminService.selectMemberDetail(memNo);
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		model.addAttribute("m", m);
		model.addAttribute("majorList", majorList);
		model.addAttribute("jobList", jobList);
		return "admin/memberDetail";
	}
	
	// 직원상세페이지에서 직원정보수정
	@PostMapping("/updateMember.do")
	public String updateMember(MemberDto m, String addressDetail, RedirectAttributes redirectAttributes) {
		m.setAddress(m.getAddress() + " " + addressDetail);
		int result = adminService.updateMember(m);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직원정보를 수정했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "직원정보 수정에 실패했습니다.");
		}
		return "redirect:/admin/memberDetail.do?memNo=" + m.getMemNo();
	}
	
	// 관리자 메인페이지(대시보드)로 이동
	@GetMapping("/adminDashboard.do")
	public String adminDashboard(Model model) {
		List<VacationDto> vacList = adminService.selectDashboardVacation();
		model.addAttribute("vacList", vacList);
		//log.debug("vacList: {}", vacList);
		for(VacationDto v : vacList) {
			v.setStatus(v.getStatus().equals("1") ? "대기" : v.getStatus().equals("2") ? "승인" : "반려");
		}
		return "admin/adminDashboard";
	}
	
	// 관리자 대시보드에서 단과학과직급 그래프표시
	@ResponseBody
	@GetMapping(value="/adminChart.do", produces="application/json; charset=utf-8")
	public Map<String, Object> adminChart(){
		Map<String, Object> map = new HashMap<>();
		List<CollegeDto> colList = adminService.selectCollegeList();
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		List<MemberDto> memList = adminService.selectDashboardMemberList();
		map.put("colList", colList);
		map.put("majorList", majorList);
		map.put("jobList", jobList);
		map.put("memList", memList);
		return map;
	}
	
	// 관리자 설정페이지에 띄울 값들
	@GetMapping("/setting.do")
	public String adminSettings(Model model) {
		List<CollegeDto> colList = adminService.selectCollegeList();
		List<MajorDto> majorList = adminService.selectAdminSetMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		List<JobDto> jobListAll = adminService.selectAdminSetJobList();
		model.addAttribute("jobListAll", jobListAll);
		model.addAttribute("jobList", jobList);
		model.addAttribute("colList", colList);
		model.addAttribute("majorList", majorList);
		return "admin/updateAdmin";
	}
	
	// 관리자 설정페이지 학과생성
	@GetMapping("/insertMajor.do")
	public String insertMajor(MajorDto major, RedirectAttributes redirectAttributes) {
		//log.debug("학과: {}", major);
		int result = adminService.insertMajor(major);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "학과가 생성됐습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "학과생성에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}
	
	// 관리자 설정페이지 학과수정
	@GetMapping("/updateMajor.do")
	public String updateMajor(MajorDto major, RedirectAttributes redirectAttributes) {
		int result = adminService.updateMajor(major);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "학과를 수정했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "학과수정에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}
	
	// 관리자 설정페이지 직급생성
	@GetMapping("/insertJob.do")
	public String insertJob(JobDto job, RedirectAttributes redirectAttributes) {
		job.setJobLevel(job.getJobLevel() - 1);
		//log.debug("job: {}", job);
		int result = adminService.insertJob(job);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직급을 생성하셨습니다..");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "직급생성에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}
	
	// 관리자 설정페이지 직급수정
	@GetMapping("/updateJob.do")
	public String updateJob(JobDto job, RedirectAttributes redirectAttributes) {
		int result = adminService.updateJob(job);
		if(result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직급을 수정했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "직급수정에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}
	
	// 근무/연차페이지
	@GetMapping("/requestMemberLeave.page")
	public String requestMemberLeave(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		int listCount = adminService.selectRequestMemberListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<VacationDto> vacList = adminService.selectRequestMemberList(pi);
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		for(VacationDto v : vacList) {
			v.setStatus(v.getStatus().equals("1") ? "대기" : v.getStatus().equals("2") ? "승인" : "반려");
		}
		log.debug("vacList값: {}", vacList);
		model.addAttribute("pi", pi);
		model.addAttribute("vacList", vacList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("jobList", jobList);
		return "admin/requestMemberLeave";
	}
	
	// 근무/연차신청현황 페이지 ajax로 학과 직급 필터링
	@ResponseBody
	@GetMapping(value="/filterRequestMemberLeaveList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterRequestLeaveMemberList(MemberDto m, @RequestParam(value="page", defaultValue="1") int currentPage){
		int listCount = adminService.ajaxFilterSelectRequestLeaveMemberListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		Map<String, Object> map = new HashMap<>();
		map.put("m", m);
		map.put("pi", pi);
		List<VacationDto> vacList = adminService.ajaxFilterSelectRequestLeaveMemberList(map);
		map.put("vacList", vacList);
		return map;
	}

}
