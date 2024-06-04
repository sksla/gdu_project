package com.cu.gdu.controller;

import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dao.MemberDao;
import com.cu.gdu.dto.AttendDto;
import com.cu.gdu.dto.CalendarDto;
import com.cu.gdu.dto.CollegeDto;
import com.cu.gdu.dto.InsertDateDto;
import com.cu.gdu.dto.JobDto;
import com.cu.gdu.dto.MajorDto;
import com.cu.gdu.dto.MemberDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.dto.ReservationDto;
import com.cu.gdu.dto.ResourceDto;
import com.cu.gdu.dto.VacationDto;
import com.cu.gdu.dto.VacationTypeDto;
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
	private final MemberDao memberDao;
	private final PagingUtil pagingUtil;
	private final BCryptPasswordEncoder bcryptPwdEncoder;

	// 조직도페이지 조회
	@GetMapping("/chart.do")
	public String chart(Model model) {
		List<CollegeDto> colList = adminService.selectCollegeList();
		List<MajorDto> majorList = adminService.selectMajorList();
		model.addAttribute("colList", colList);
		model.addAttribute("majorList", majorList);

		return "admin/chart";
	}

	// 직원관리 페이지
	@GetMapping("/memberList.do")
	public ModelAndView memberList(@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {
		int listCount = adminService.selectMemberListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<MemberDto> list = adminService.selectMemberList(pi);
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();

		for (MemberDto m : list) {
			m.setBirth(m.getBirth() + "-" + m.getGender() + "******");
		}

		mv.addObject("pi", pi).addObject("list", list).addObject("jobList", jobList).addObject("majorList", majorList)
				.setViewName("admin/memberList");
		return mv;
	}

	// 직원관리페이지에서 직원 퇴직처리
	@GetMapping("/outMember.do")
	public String updateOutMember(String[] memNo, RedirectAttributes redirectAttributes) {
		int result = adminService.updateOutMember(memNo);
		if (result == memNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 회원을 퇴직처리 했습니다.");
		} else {
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
		// log.debug("맵 {}", map); // {memNo=[1,2, 3,4], majorNo=2}

		int result = adminService.updateMajorMember(map);
		if (result == memNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 회원의 학과를 수정했습니다..");
		} else {
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
		if (result == memNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 회원의 직급을 수정했습니다..");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "직급수정에 실패했습니다.");
		}
		return "redirect:/admin/memberList.do";
	}

	// 학과 및 직급 검사 후 직원조회
	@ResponseBody
	@GetMapping(value = "/filterMemberList.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterMemberList(MemberDto m,
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
		int listCount = adminService.ajaxFilterMemberListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		Map<String, Object> map = new HashMap<>();
		map.put("m", m);
		map.put("pi", pi);
		// log.debug("멤버자체를 셀렉하기 전의 m: {}", m);

		List<MemberDto> member = adminService.ajaxFilterMemberList(map);

		for (MemberDto mem : member) {
			mem.setBirth(mem.getBirth() + "-" + mem.getGender() + "******");
		}
		map.put("member", member);
		// log.debug("맵객체: {}", map);
		return map;
	}

	// 이름으로 직원조회 (학과 및 직금검사 포함)
	@ResponseBody
	@GetMapping(value = "/nameFilterMemberList.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> ajaxNameFilterMemberList(MemberDto m,
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
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
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직원을 등록했습니다.");
		} else {
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
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직원정보를 수정했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "직원정보 수정에 실패했습니다.");
		}
		return "redirect:/admin/memberDetail.do?memNo=" + m.getMemNo();
	}

	// 관리자 메인페이지(대시보드)로 이동
	@GetMapping("/adminDashboard.do")
	public String adminDashboard(Model model) {
		List<VacationDto> vacList = adminService.selectDashboardVacation();
		InsertDateDto lecDate = adminService.selectLecInsertDate();
		InsertDateDto stuDate = adminService.selectStuInsertDate();
		List<ReservationDto> reserList = adminService.selectDashboardReservation();
		List<ReservationDto> todayReserList = adminService.selectTodayReserList();
		for(ReservationDto r : todayReserList) {
			r.setRevDate(r.getRevDate() + " (" + r.getStartTime() + "-" + r.getEndTime() + ")");
		}
		model.addAttribute("todayReserList", todayReserList);
		model.addAttribute("reserList", reserList);
		model.addAttribute("lecDate", lecDate);
		model.addAttribute("stuDate", stuDate);
		model.addAttribute("vacList", vacList);
		for (VacationDto v : vacList) {
			v.setStatus(v.getStatus().equals("1") ? "대기" : v.getStatus().equals("2") ? "승인" : "반려");
		}
		return "admin/adminDashboard";
	}

	// 관리자 대시보드에서 단과학과직급 그래프표시
	@ResponseBody
	@GetMapping(value = "/adminChart.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> adminChart() {
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
		InsertDateDto lecDate = adminService.selectLecInsertDate();
		InsertDateDto stuDate = adminService.selectStuInsertDate();
		model.addAttribute("lecDate", lecDate);
		model.addAttribute("stuDate", stuDate);
		model.addAttribute("jobListAll", jobListAll);
		model.addAttribute("jobList", jobList);
		model.addAttribute("colList", colList);
		model.addAttribute("majorList", majorList);
		return "admin/updateAdmin";
	}

	// 관리자 설정페이지 학과생성
	@GetMapping("/insertMajor.do")
	public String insertMajor(MajorDto major, RedirectAttributes redirectAttributes) {
		// log.debug("학과: {}", major);
		int result = adminService.insertMajor(major);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "학과가 생성됐습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "학과생성에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}

	// 관리자 설정페이지 학과수정
	@GetMapping("/updateMajor.do")
	public String updateMajor(MajorDto major, RedirectAttributes redirectAttributes) {
		int result = adminService.updateMajor(major);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "학과를 수정했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "학과수정에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}

	// 관리자 설정페이지 직급생성
	@GetMapping("/insertJob.do")
	public String insertJob(JobDto job, RedirectAttributes redirectAttributes) {
		job.setJobLevel(job.getJobLevel() - 1);
		// log.debug("job: {}", job);
		int result = adminService.insertJob(job);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직급을 생성하셨습니다..");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "직급생성에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}

	// 관리자 설정페이지 직급수정
	@GetMapping("/updateJob.do")
	public String updateJob(JobDto job, RedirectAttributes redirectAttributes) {
		int result = adminService.updateJob(job);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "직급을 수정했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "직급수정에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}

	// 강의등록기간 수정
	@GetMapping("/updateLecDate.do")
	public String updateLecDate(InsertDateDto inDate, RedirectAttributes redirectAttributes) {
		int result = adminService.updateLecDate(inDate);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "강의등록기간을 수정했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "강의등록기간수정에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}

	// 학생등록기간 수정
	@GetMapping("/updateStuDate.do")
	public String updateStuDate(InsertDateDto inDate, RedirectAttributes redirectAttributes) {
		int result = adminService.updateStuDate(inDate);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "학생등록기간을 수정했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "학생등록기간수정에 실패했습니다.");
		}
		return "redirect:/admin/setting.do";
	}

	// 근무/연차페이지
	@GetMapping("/requestMemberLeave.page")
	public String requestMemberLeave(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int listCount = adminService.selectRequestMemberListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<VacationDto> vacList = adminService.selectRequestMemberList(pi);
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		for (VacationDto v : vacList) {
			v.setStatus(v.getStatus().equals("1") ? "대기" : v.getStatus().equals("2") ? "승인" : "반려");
		}
		//log.debug("vacList값: {}", vacList);
		model.addAttribute("pi", pi);
		model.addAttribute("vacList", vacList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("jobList", jobList);
		return "admin/requestMemberLeave";
	}

	// 근무/연차신청현황 페이지 ajax로 학과 직급 필터링
	@ResponseBody
	@GetMapping(value = "/filterRequestMemberLeaveList.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterRequestLeaveMemberList(MemberDto m,
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
		int listCount = adminService.ajaxFilterSelectRequestLeaveMemberListCount(m);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		Map<String, Object> map = new HashMap<>();
		map.put("m", m);
		map.put("pi", pi);
		List<VacationDto> vacList = adminService.ajaxFilterSelectRequestLeaveMemberList(map);
		for (VacationDto v : vacList) {
			v.setStatus(v.getStatus().equals("1") ? "대기" : v.getStatus().equals("2") ? "승인" : "반려");
		}
		map.put("vacList", vacList);
		return map;
	}

	// 연차 승인기능
	@GetMapping("/requestLeaveYesMember.do")
	public String requestLeaveYesMember(String[] vacNo, RedirectAttributes redirectAttributes) {
		int result = adminService.requestLeaveYesMember(vacNo);
		if (result == vacNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 직원의 연차신청을 승인하셨습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "연차신청 승인에 실패했습니다.");
		}
		return "redirect:/admin/requestMemberLeave.page";
	}

	// 연차 거절기능
	@GetMapping("/requestLeaveNoMember.do")
	public String requestLeaveNoMember(String[] vacNo, RedirectAttributes redirectAttributes) {
		int result = adminService.requestLeaveNoMember(vacNo);
		if (result == vacNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 직원의 연차신청을 거절하셨습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "연차신청 거절에 실패했습니다.");
		}
		return "redirect:/admin/requestMemberLeave.page";
	}

	// 직원 사용한 연차리스트 페이지
	@GetMapping("/memberLeaveList.page")
	public String memberLeaveList(Model model, @RequestParam(value = "page", defaultValue = "1") int currentPage) {
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		int listCount = adminService.memberLeaveListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<VacationDto> vacList = adminService.memberLeaveList(pi);

		model.addAttribute("vacList", vacList);
		model.addAttribute("pi", pi);
		model.addAttribute("majorList", majorList);
		model.addAttribute("jobList", jobList);
		return "admin/memberLeaveList";
	}

	// 직원 사용한 연차리스트 필터 및 검색시 ajax로 직원조회
	@ResponseBody
	@GetMapping(value = "/filterMemberLeaveList.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterMemberLeaveList(MemberDto m,
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
		Map<String, Object> map = new HashMap<>(); // 맵 생성
		int listCount = adminService.ajaxFilterMemberLeaveListCount(m); // 조건에 맞는 직원수 조회
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10); // 받아온 리스트카운트 통해 pi 생성
		map.put("m", m); // map에 담고
		map.put("pi", pi); // map에 담고
		List<VacationDto> vacList = adminService.ajaxFilterMemberLeaveList(map);
		map.put("vacList", vacList);
		//log.debug("걸러져서 담겨있는 map: {}", map);
		return map;
	}

	// 직원 연차관리페이지에서 클릭시 직원연차 상세페이지로 이동
	@GetMapping("/memberLeaveDetail.page")
	public String memberLeaveDetail(String memNo, Model model) {
		VacationDto memberVac = adminService.memberLeaveDetail(memNo);
		List<VacationDto> vacList = adminService.memberLeaveDetailList(memNo);
		List<VacationTypeDto> vacTypeList = adminService.selectMemberLeaveType();
		int plusVacCount = adminService.selectPlusVacCount(Integer.parseInt(memNo));
		int usedPlusCount = adminService.selectUsedPlusVacCount(Integer.parseInt(memNo));
		// log.debug("vacList: {}", vacList);
		model.addAttribute("plusVacCount", plusVacCount);
		model.addAttribute("usedPlusCount", usedPlusCount);
		model.addAttribute("vacType", vacTypeList);
		model.addAttribute("vacList", vacList);
		model.addAttribute("memberVac", memberVac);
		return "admin/memberLeaveDetail";
	}

	// 직원 연차관리 상세페이지에서 보상연차 추가
	@GetMapping("/memberLeavePlus.do")
	public String memberLeavePlus(VacationDto vac, RedirectAttributes redirectAttributes) {
		if (vac.getVacUsed() == 0) {
			// 사유에 따라 일수 및 타입지정
			vac.setVacUsed(vac.getVacReason().equals("포상") ? 3
					: vac.getVacReason().equals("결혼") ? 5
							: vac.getVacReason().equals("출산") ? 30 : vac.getVacReason().equals("경조사") ? 5 : 3);
			vac.setVacTypeNo(vac.getVacReason().equals("포상") ? 1
					: vac.getVacReason().equals("결혼") ? 2
							: vac.getVacReason().equals("출산") ? 3 : vac.getVacReason().equals("경조사") ? 4 : 5);
		} else {
			// 체크박스 체크 후 직접입력
			vac.setVacReason("기타(" + vac.getVacReason() + ")");
			vac.setVacTypeNo(6);
		}
		int result = adminService.insertMemberPlusLeave(vac);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "연차를 추가했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "연차추가에 실패했습니다.");
		}
		return "redirect:/admin/memberLeaveDetail.page?memNo=" + vac.getMemNo();
	}
	
	// 직원 근태관리 전체 조회
	@ResponseBody
	@GetMapping(value = "/allMemberAttend.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> ajaxAllMemberAttendList(
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
		
		Map<String, Object> map = new HashMap<>();
		int listCount = adminService.memberAttendListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10); // 받아온 리스트카운트 통해 pi 생성
		map.put("pi", pi);
		List<AttendDto> attendList = adminService.memberAttendList(pi);
		map.put("attendList", attendList);
		return map;
		
	}

	// 직원 근태조회
	@GetMapping("/memberAttend.do")
	public String memberAttendList(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		List<MajorDto> majorList = adminService.selectMajorList();
		List<JobDto> jobList = adminService.selectJobList();
		int listCount = adminService.memberAttendListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<AttendDto> attendList = adminService.memberAttendList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("attendList", attendList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("jobList", jobList);
		return "admin/memberAttendList";
	}

	// 직원 근태정보 필터별 ajax 조회
	@ResponseBody
	@GetMapping(value = "/filterMemberAttend.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterMemberAttendList(MemberDto m, String startDate, String endDate,
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
		String newEndDate = "";
		if (!endDate.equals("")) {
			LocalDate nextDay = LocalDate.parse(endDate).plusDays(1);
			newEndDate = String.valueOf(nextDay);
		}
		Map<String, Object> map = new HashMap<>(); // 맵 생성
		map.put("startDate", startDate);
		map.put("newEndDate", newEndDate);
		map.put("m", m);
		int listCount = adminService.ajaxFilterMemberAttendListCount(map);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10); // 받아온 리스트카운트 통해 pi 생성
		map.put("pi", pi);
		List<AttendDto> attendList = adminService.ajaxFilterMemberAttendList(map);
		map.put("attendList", attendList);
		return map;
	}

	// 직원 근태관리 오늘날짜 ajax 조회
	@ResponseBody
	@GetMapping(value = "/todayMemberAttend.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> ajaxTodayMemberAttendList(
			@RequestParam(value = "page", defaultValue = "1") int currentPage) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String startDate = sdf.format(today);
		//log.debug("오늘날짜는: {}", startDate);
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		int listCount = adminService.ajaxTodayMemberAttendListCount(map);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10); // 받아온 리스트카운트 통해 pi 생성
		map.put("pi", pi);
		List<AttendDto> attendList = adminService.ajaxTodayMemberAttendList(map);
		map.put("attendList", attendList);
		return map;
	}
	
	
	// 직원일괄등록 페이지
	@GetMapping("/insertManyMember.page")
	public String insertManyMemberPage() {
		return "admin/insertManyMember";
	}
	
	// 직원일괄등록 기능
	@PostMapping("/insertManyMember.do")
	public String insertManyMember(RedirectAttributes redirectAttributes
								 , @RequestParam("file") MultipartFile file) throws Exception {
		InputStream inputStream = file.getInputStream();
		Workbook workbook = WorkbookFactory.create(inputStream);
		// 첫 번째 시트를 가져옴
		Sheet sheet = workbook.getSheetAt(0);
		// 첫번째 행은 헤더니까 건너뛰기
	    Iterator<Row> rowIterator = sheet.iterator();
	    if (rowIterator.hasNext()) {
	        rowIterator.next();
	    }
	    List<MemberDto> m = new ArrayList<>();

	    // 나머지 행들을 처리
	    while (rowIterator.hasNext()) {
	        Row row = rowIterator.next();
	        // 첫 번째 셀이 비어있는지 확인하여 데이터가 있는 행만 처리
	        if (row.getCell(0) == null || row.getCell(0).getCellType() == CellType.BLANK) {
	            continue; // 데이터가 없으면 다음 행으로 건너뜀
	        }
	        // 각 열에서 데이터 추출
	        String name = String.valueOf(row.getCell(0)).trim(); // 이름
	        String id = String.valueOf(row.getCell(1)).trim(); // ID
	        String major = String.valueOf(row.getCell(2)).trim(); // 학과
	        String job = String.valueOf(row.getCell(3)).trim(); // 직급
	        String resident = String.valueOf(row.getCell(4)).trim(); // 주민등록번호
	        String email = String.valueOf(row.getCell(5)).trim(); // 이메일
	        String phone = String.valueOf(row.getCell(6)).trim(); // 휴대전화      
	        
	        // hireDate(입사일) 날짜 형식 변환
	        Cell hireDateCell = row.getCell(7);
	        Date hiretDate = null;
	        String formattedHireDate = ""; // 초기화 - 입사일 담을 필드
	        if (hireDateCell != null) {
	            if (hireDateCell.getCellType() == CellType.NUMERIC) {
	            	hiretDate = hireDateCell.getDateCellValue();
	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                formattedHireDate = dateFormat.format(hiretDate);
	            } else if (hireDateCell.getCellType() == CellType.STRING) {
	                // 문자열 형식의 날짜인 경우에 대한 처리
	                String dateString = hireDateCell.getStringCellValue();
	                // 예시: "2024-05-26"
	                SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                try {
	                	hiretDate = inputDateFormat.parse(dateString);
	                    SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                    formattedHireDate = outputDateFormat.format(hiretDate);
	                } catch (ParseException e) {
	                    // 날짜 형식이 올바르지 않은 경우 예외 처리
	                    e.printStackTrace();
	                    // 혹은 로그를 남기고 다음 행으로 넘어가도록 처리할 수 있습니다.
	                    continue;
	                }
	            }
	        }

	        String address = String.valueOf(row.getCell(8)); // 주소
	        // Salary(급여) 숫자 형식 변환
	        Cell salaryCell = row.getCell(9);
	        String salary = "";
	        if (salaryCell.getCellType() == CellType.NUMERIC) {
	            double salaryValue = salaryCell.getNumericCellValue();
	            salary = String.valueOf((int) salaryValue);
	        } else {
	            salary = salaryCell.getStringCellValue();
	        }
	        int majorCode = convertMajorCode(major);
	        int jobCode = convertJobCode(job);
	        MemberDto member = new MemberDto();
	        member.setMemName(name); // ok
	        member.setMemId(id); // ok
	        member.setMemPwd("1111"); // ok
	        member.setLeaveCount(12); // ok
	        member.setResident(resident); // ok
	        String[] residentArr = resident.split("-");
	        String gender = String.valueOf(residentArr[1].charAt(0));
	        member.setBirth(residentArr[0]); // ok
	        member.setGender(gender); // ok
	        member.setMajorNo(String.valueOf(majorCode)); // ok
	        member.setJobNo(String.valueOf(jobCode)); // ok
	        member.setAddress(address); // ok
	        member.setPhone(phone); // ok
	        member.setEmail(email); // ok
	        member.setHireDate(formattedHireDate); // ok
	        member.setSalary(salary); // ok
	        member.setResident(bcryptPwdEncoder.encode(member.getResident())); // 암호화
	        member.setMemPwd(bcryptPwdEncoder.encode(member.getMemPwd())); // 암호화
	        m.add(member);
	    }

	    workbook.close();
	    inputStream.close();

	    int result = adminService.insertManyMember(m);
	    
	    if(result == m.size()) {
	    	redirectAttributes.addFlashAttribute("alertMsg", "직원들을 등록했습니다.");
	    }else {
	    	redirectAttributes.addFlashAttribute("alertMsg", "직원등록에 실패했습니다.");
	    }  
		return "redirect:/admin/memberList.do";
	}
	
	// 학과 코드 변환 메서드
	private int convertMajorCode(String major) {
	    switch (major) {
	        case "국어국문학과": return 1;
	        case "중어중문학과": return 2;
	        case "영어영문학과": return 3;
	        case "역사학과": return 4;
	        case "철학과": return 5;
	        case "기계공학과": return 6;
	        case "재료공학과": return 7;
	        case "건축학과": return 8;
	        case "전기전자공학과": return 9;
	        case "컴퓨터공학과": return 10;
	        case "교육학과": return 11;
	        case "영어교육과": return 12;
	        case "지리교육과": return 13;
	        case "윤리교육과": return 14;
	        case "수학교육과": return 15;
	        case "법학과": return 16;
	        case "반도체공학과": return 17;
	        default: return 0; // 기본값 설정
	    }
	}
	
	// 직급 코드 변환 메서드
	private int convertJobCode(String job) {
	    switch (job) {
	        case "행정관리": return 1;
	        case "사원": return 2;
	        case "대리": return 3;
	        case "과장": return 4;
	        case "부장": return 5;
	        case "학과장": return 6;
	        case "정교수": return 7;
	        case "차장": return 12;
	        case "부교수": return 13;
	        default: return 0; // 기본값 설정
	    }
	}
	
	// 학사일정 개별등록 페이지
	@GetMapping("/univCalendarInsertOne.page")
	public String univCalendarInsertOnePage() {
		return "admin/univCalendarOneInsert";
	}
	
	// 학사일정 일괄등록 페이지
	@GetMapping("/univCalendarInsertMany.page")
	public String univCalendarInsertManyPage() {
		return "admin/univCalendarManyInsert";
	}
	
	// 학사일정 개별등록 기능
	@PostMapping("/univCalendarInsertOne.do")
	public String univCalendarInsertOne(CalendarDto cal, RedirectAttributes redirectAttributes) {
		int result = adminService.univCalendarInsertOne(cal);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "학사일정을 등록했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "학사일정 등록에 실패했습니다.");
		}
		return "redirect:/calendar/univCalendar.page";
	}
	
	// 학사일정 수정기능
	@ResponseBody
	@PostMapping(value = "/updateUnivCal.do", produces = "application/json; charset=utf-8")
	public int updateUnivCal(CalendarDto cal) {
		return adminService.updateUnivCal(cal);
	}
	
	// 학사일정 삭제기능
	@ResponseBody
	@PostMapping(value = "/deleteUnivCal.do", produces = "application/json; charset=utf-8")
	public int deleteUnivCal(String calNo) {
		return adminService.deleteUnivCal(calNo);
	}
	
	// 학사일정 일괄등록 기능
	@PostMapping("/univCalendarInsertMany.do")
	public String univCalendarInsertMany(RedirectAttributes redirectAttributes
									   , @RequestParam("file") MultipartFile file) throws Exception {
		InputStream inputStream = file.getInputStream();
		Workbook workbook = WorkbookFactory.create(inputStream);
		// 첫 번째 시트를 가져옴
		Sheet sheet = workbook.getSheetAt(0);
		// 첫번째 행은 헤더니까 건너뛰기
	    Iterator<Row> rowIterator = sheet.iterator();
	    if (rowIterator.hasNext()) {
	        rowIterator.next();
	    }
	    List<CalendarDto> calList = new ArrayList<>();
		
	    // 나머지 행들을 처리
	    while (rowIterator.hasNext()) {
	        Row row = rowIterator.next();
	        // 첫 번째 셀이 비어있는지 확인하여 데이터가 있는 행만 처리
	        if (row.getCell(0) == null || row.getCell(0).getCellType() == CellType.BLANK) {
	            continue; // 데이터가 없으면 다음 행으로 건너뜀
	        }
	        // 각 열에서 데이터 추출
	        String calTitle = String.valueOf(row.getCell(0)); // 일정 제목
	        String calContent = String.valueOf(row.getCell(1)); // 일정 내용      
	        
	        // startDate(시작일) 날짜 형식 변환
	        Cell startDateCell = row.getCell(2);
	        Date startDate = null;
	        String formattedStartDate = ""; // 초기화 - 시작일을 담을 필드
	        if (startDateCell != null) {
	            if (startDateCell.getCellType() == CellType.NUMERIC) {
	                startDate = startDateCell.getDateCellValue();
	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                formattedStartDate = dateFormat.format(startDate);
	            } else if (startDateCell.getCellType() == CellType.STRING) {
	                // 문자열 형식의 날짜인 경우에 대한 처리
	                String dateString = startDateCell.getStringCellValue();
	                // 예시: "2024-05-26"
	                SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                try {
	                    startDate = inputDateFormat.parse(dateString);
	                    SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                    formattedStartDate = outputDateFormat.format(startDate);
	                } catch (ParseException e) {
	                    // 날짜 형식이 올바르지 않은 경우 예외 처리
	                    e.printStackTrace();
	                    // 혹은 로그를 남기고 다음 행으로 넘어가도록 처리할 수 있습니다.
	                    continue;
	                }
	            }
	        }
	        
	        // endDate(종료일) 날짜 형식 변환
	        Cell endDateCell = row.getCell(3);
	        Date endDate = null;
	        String formattedEndDate = ""; // 초기화 - 종료일을 담을 필드
	        if (endDateCell != null) {
	            if (endDateCell.getCellType() == CellType.NUMERIC) {
	                endDate = endDateCell.getDateCellValue();
	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                formattedEndDate = dateFormat.format(endDate);
	            } else if (endDateCell.getCellType() == CellType.STRING) {
	                // 문자열 형식의 날짜인 경우에 대한 처리
	                String dateString = endDateCell.getStringCellValue();
	                // 예시: "2024-05-26"
	                SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                try {
	                    endDate = inputDateFormat.parse(dateString);
	                    SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                    formattedEndDate = outputDateFormat.format(endDate);
	                } catch (ParseException e) {
	                    // 날짜 형식이 올바르지 않은 경우 예외 처리
	                    e.printStackTrace();
	                    // 혹은 로그를 남기고 다음 행으로 넘어가도록 처리할 수 있습니다.
	                    continue;
	                }
	            }
	        }
	        
	        CalendarDto cal = new CalendarDto();
	        
	        cal.setCalTitle(calTitle);
	        cal.setCalContent(calContent);
	        cal.setStartDate(formattedStartDate);
	        cal.setEndDate(formattedEndDate);
	        cal.setCtgNo(7);
	        cal.setIsAllday("Y");
	        cal.setCalWriter("1");
	        calList.add(cal);
	    }
	    
	    workbook.close();
	    inputStream.close();

	    int result = adminService.univCalendarInsertMany(calList);
	    if(result == calList.size()) {
	    	redirectAttributes.addFlashAttribute("alertMsg", "학사일정들을 등록했습니다.");
	    }else {
	    	redirectAttributes.addFlashAttribute("alertMsg", "학사일정 등록에 실패했습니다.");
	    }  
		return "redirect:/calendar/univCalendar.page";

	}
	

	// 자원관리 페이지 조회
	@GetMapping("/adminResourceList.page")
	public String adminResourceList(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int listCount = adminService.adminResourceListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<ResourceDto> resourceList = adminService.adminResourceList(pi);
		for(ResourceDto r : resourceList) {
			r.setResType(r.getResType().equals("1") ? "회의실" : r.getResType().equals("2") ? "강의실" : r.getResType().equals("3") ? "기타" : "비품");
		}
		List<ResourceDto> resourceType = adminService.resourceTypeCount();
		int allCount = 0;
		int meetingCount = 0;
		int recCount = 0;
		int thatCount = 0;
		int objectCount = 0;
		allCount = resourceType.size();
		for(ResourceDto r : resourceType) {
			if(r.getResType().equals("1")) {
				meetingCount++;
			}else if(r.getResType().equals("2")) {
				recCount++;
			}else if(r.getResType().equals("3")) {
				thatCount++;
			}else {
				objectCount++;
			}
		}
		model.addAttribute("allCount", allCount);
		model.addAttribute("meetingCount", meetingCount);
		model.addAttribute("recCount", recCount);
		model.addAttribute("thatCount", thatCount);
		model.addAttribute("objectCount", objectCount);
		model.addAttribute("pi", pi);
		model.addAttribute("resourceList", resourceList);
		return "admin/resourceList";
	}
	
	// 자원관리 페이지에서 필터 및 검색으로 조회
	@ResponseBody
	@GetMapping(value="/ajaxFilterResourceList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterResourceList(ResourceDto r, @RequestParam(value = "page", defaultValue = "1") int currentPage){
		Map<String, Object> map = new HashMap<>();
		int listCount = adminService.ajaxFilterResourceListCount(r);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		map.put("r", r);
		map.put("pi", pi);
		List<ResourceDto> resourceList = adminService.ajaxFilterResourceList(map);
		for(ResourceDto rList : resourceList) {
			rList.setResType(rList.getResType().equals("1") ? "회의실" : rList.getResType().equals("2") ? "강의실" : rList.getResType().equals("3") ? "기타" : "비품");
		}
		map.put("resourceList", resourceList);
		return map;
	}
	
	// 자원관리 페이지에서 자원 삭제기능
	@PostMapping("/deleteResource.do")
	public String deleteResource(String[] resNo, String delContent, RedirectAttributes redirectAttributes) {
		Map<String, Object> map = new HashMap<>();
		map.put("resNo", resNo);
		map.put("delContent", delContent);
		int result = adminService.deleteResource(map);
		if (result == resNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 자원을 삭제 했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "자원삭제에 실패했습니다.");
		}
		return "redirect:/admin/adminResourceList.page";
	}
	
	// 자원관리 페이지에서 자원 수정기능
	@PostMapping("/updateResource.do")
	public String updateResource(String[] resNo, ResourceDto r, RedirectAttributes redirectAttributes) {
		Map<String, Object> map = new HashMap<>();
		map.put("resNo", resNo);
		map.put("r", r);
		int result = adminService.updateResource(map);
		if (result == resNo.length) {
			redirectAttributes.addFlashAttribute("alertMsg", "선택하신 자원을 수정 했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "자원수정에 실패했습니다.");
		}
		return "redirect:/admin/adminResourceList.page";
	}
	
	// 자원관리 페이지에서 자원 등록
	@PostMapping("/insertResource.do")
	public String insertResource(ResourceDto r, RedirectAttributes redirectAttributes) {
		int result = adminService.insertResource(r);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "자원을 등록 했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "자원등록에 실패했습니다.");
		}
		return "redirect:/admin/adminResourceList.page";
	}
	
	// 자원관리 자원 상세페이지
	@GetMapping("/resourceDetail.do")
	public String resourceDetail(String resNo, Model model) {
		ResourceDto r = adminService.resourceDetail(resNo);
		List<ReservationDto> reserList = adminService.selectReservationList(resNo);
		r.setResType(r.getResType().equals("1") ? "회의실" : r.getResType().equals("2") ? "강의실" : r.getResType().equals("3") ? "기타" : "비품");
		model.addAttribute("reserList", reserList);
		model.addAttribute("r", r);
		return "admin/resourceDetail";
	}
	
	// 일정/예약리스트 페이지
	@GetMapping("/resourceReservation.page")
	public String resourceReservationList(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {
		int listCount = adminService.resourceReservationListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<ReservationDto> reserList = adminService.resourceReservationList(pi);
		List<MemberDto> memList = adminService.searchReservationMemberList();
		for(ReservationDto r : reserList) {
			r.setResType(r.getResType().equals("1") ? "회의실" : r.getResType().equals("2") ? "강의실" : r.getResType().equals("3") ? "기타" : "비품");
			if(r.getStatus().equals("1") && r.getResType().equals("비품")) {
				r.setStatus("미반납");
			}else if(r.getStatus().equals("1") && !r.getResType().equals("비품")) {
				r.setStatus("승인");
			}else {
				r.setStatus("반납");
			}
			if(r.getStartTime() != null && !r.getStartTime().isEmpty()) {
				r.setRevDate(r.getRevDate() + "  (" + r.getStartTime() + "-" + r.getEndTime() + ")");
			}
		}
		List<ResourceDto> resourceList = adminService.searchResourceList();
		model.addAttribute("memList", memList);
		model.addAttribute("resourceList", resourceList);
		model.addAttribute("pi", pi);
		model.addAttribute("reserList", reserList);
		return "admin/resourceReservationList";
	}
	
	// 일정/예약리스트 검색 및 필터로 ajax 호출
	@ResponseBody
	@PostMapping(value="/ajaxFilterResourceReservationList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> ajaxFilterResourceReservationList(ResourceDto r, @RequestParam(value = "page", defaultValue = "1") int currentPage){
		Map<String, Object> map = new HashMap<>();
		int listCount = adminService.ajaxFilterResourceReservationListCount(r);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		map.put("r", r);
		map.put("pi", pi);
		List<ReservationDto> reserList = adminService.ajaxFilterResourceReservationList(map);
		for(ReservationDto re : reserList) {
			re.setResType(re.getResType().equals("1") ? "회의실" : re.getResType().equals("2") ? "강의실" : re.getResType().equals("3") ? "기타" : "비품");
			if(re.getStatus().equals("1") && re.getResType().equals("비품")) {
				re.setStatus("미반납");
			}else if(re.getStatus().equals("1") && !re.getResType().equals("비품")) {
				re.setStatus("승인");
			}else {
				re.setStatus("반납");
			}
			if(re.getStartTime() != null && !re.getStartTime().isEmpty()) {
				re.setRevDate(re.getRevDate() + "  (" + re.getStartTime() + "-" + re.getEndTime() + ")");
			}
		}
		map.put("reserList", reserList);
		return map;
	}
	
	// 일정/예약 비품사용기록 등록
	@PostMapping("/insertResourceReservation.do")
	public String inserResourceReservation(RedirectAttributes redirectAttributes, ReservationDto r){
		Map<String, Object> map = new HashMap<>();
		map.put("stock", r.getRevCount());
		map.put("resNo", r.getResNo());
		int result1 = adminService.inserResourceReservation(r);
		int result2 = adminService.updateResourceStock(map);
		if (result1 == 1 && result2 == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "비품사용기록을 등록 했습니다.");
		} else {
			redirectAttributes.addFlashAttribute("alertMsg", "비품사용기록 등록에 실패했습니다.");
		}
		return "redirect:/admin/resourceReservation.page";
	}
	
	// 일정/예약 자원예약내역 상세페이지
	@GetMapping("/resourceReservationDetail.do")
	public String resourceReservationDetail(String revNo, Model model) {
		ReservationDto r = adminService.selectReservationDetail(revNo);

	    r.getResourceList().get(0).setResType(
	        r.getResourceList().get(0).getResType().equals("1") ? "회의실" : 
	        r.getResourceList().get(0).getResType().equals("2") ? "강의실" : 
	        r.getResourceList().get(0).getResType().equals("3") ? "기타" : 
	        "비품"
	    );

	    if (r.getStatus().equals("1") && r.getResourceList().get(0).getResType().equals("비품")) {
	        r.setStatus("미반납");
	    } else if (r.getStatus().equals("1") && !r.getResourceList().get(0).getResType().equals("비품")) {
	        r.setStatus("승인");
	    } else {
	        r.setStatus("반납");
	    }

	    if (r.getStartTime() != null && !r.getStartTime().isEmpty()) {
	        r.setRevDate(r.getRevDate() + " (" + r.getStartTime() + "-" + r.getEndTime() + ")");
	    }
	    //log.debug("r에 담겨있는값: {}", r);
		model.addAttribute("r", r);
		return "admin/resourceReservationDetail";
	}
	
	// 일정/예약 상세페이지에서 미반납 비품 반납처리
	@GetMapping("/resourceReturn.do")
	public String resourceReturn(RedirectAttributes redirectAttributes, String revNo, String stock, String resNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("stock", stock);
		map.put("resNo", resNo);
		int result1 = adminService.updateResourceReturn(revNo);
		int result2 = adminService.updateReturnResourceStock(map);
		if(result1 == 1 && result2 == 1) {
			redirectAttributes.addFlashAttribute("alertMsg", "해당 비품을 반납처리 했습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "비품 반납처리에 실패 했습니다.");
		}
		return "redirect:/admin/resourceReservation.page";
	}
	
	// 조직도 페이지 학과 클릭으로 ajax 학과직원 호출
	@ResponseBody
	@GetMapping(value="/chartMemberList.do", produces="application/json; charset=utf-8")
	public Map<String, Object> ajaxChartMemberList(@RequestParam(value = "page", defaultValue = "1") int currentPage, String majorNo){
		Map<String, Object> map = new HashMap<>();
		int listCount = adminService.ajaxChartMemberListCount(majorNo);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		map.put("pi", pi);
		map.put("majorNo", majorNo);
		List<MemberDto> memList = adminService.ajaxChartMemberList(map);
		map.put("memList", memList);
		return map;
	}

}
