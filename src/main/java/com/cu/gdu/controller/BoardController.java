package com.cu.gdu.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.PageInfoDto;
import com.cu.gdu.service.BoardService;
import com.cu.gdu.util.FileUtil;
import com.cu.gdu.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@RequiredArgsConstructor
@Controller
public class BoardController {

	private final BoardService boardService;
	private final PagingUtil pagingUtil;
	private final FileUtil fileUtil;
	
	// * 건의게시판 리스트 (페이징 조회 관련)-------------------------------------
	@GetMapping("/proposalList.do")
	public ModelAndView proposalList (@RequestParam(value="page" ,defaultValue="1") int currentPage
									, ModelAndView mv ) {
		String boardType = "Q";
		int listCount = boardService.selectBoardListCount(boardType);
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 5);
		List<BoardDto> list = boardService.selectBoardList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/proposalList");
		
		return mv;
	}
	
	// * 건의게시판 작성 관련 ------------------------------------------
	@GetMapping("/proposalForm.page")
	public String proregistForm() {
		return "board/proposalForm";
	}
	
	
}
