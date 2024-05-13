package com.cu.gdu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.AffiliatedOrganDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.service.AffiliatedOrganService;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/aff")
@RequiredArgsConstructor
@Controller
public class AffiliatedOrganController {
	
	private final AffiliatedOrganService affiliatedOrganService;
	private final PagingUtil pagingUtil;
	
	// 부속기관 리스트 페이지
	@GetMapping("/affiliatedOrgan.page")
	public String affiliatedOrgan() {
		return "/affiliatedOrgan/affiliatedOrganList";
	}
	
	// 부속기관리스트 조회 
	@GetMapping("/affiliatedOrganList.do")
	public ModelAndView list(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = affiliatedOrganService.selectAffiliatedOrganListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<AffiliatedOrganDto> list = affiliatedOrganService.selectAffiliatedOrganList(pi);
		System.out.println(list);
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("/affiliatedOrgan/affiliatedOrganList");
		
		return mv;
	}
	
	// 부속기관 예약페이지
	@GetMapping("/affiliatedOrganRes.do")
	public String affiliatedOrganRes(int no, Model model) {
		model.addAttribute("affiliatedOrgan", affiliatedOrganService.selectAffiliatedOrganRes(no));
		System.out.println(model);
		return "affiliatedOrgan/affiliatedOrganRes";
	}

	// 검색
	@GetMapping("/affiliatedOrganSearch.do")
	public ModelAndView search(@RequestParam(value="page", defaultValue="1") int currentPage,
							   @RequestParam Map<String, String> search,
							   ModelAndView mv) {
		
		log.debug("search :{}", search);
		
		int listCount = affiliatedOrganService.selectAffiliatedOrganSearchListCount(search);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<AffiliatedOrganDto> list = affiliatedOrganService.selectAffiliatedOrganSearchList(search, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("search", search)
		  .setViewName("aff/list");
		
		return mv;
	}
	

}
