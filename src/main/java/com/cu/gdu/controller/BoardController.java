package com.cu.gdu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.gdu.dto.AttachDto;
import com.cu.gdu.dto.BoardDto;
import com.cu.gdu.dto.MemberDto;
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
		List<BoardDto> list = boardService.selectBoardList(pi, boardType);
		System.out.println(list);
		
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
	
	@PostMapping("proposalRegist.do")
	public String regist(BoardDto board
					, List<MultipartFile> uploadFiles
					, HttpSession session
					, RedirectAttributes redirectAttributes	) {
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		board.setMemNo((loginUser.getMemNo()));
		board.setBoardType("Q");
		
		System.out.println(board);
		
		//List<AttachDto> attachList = new ArrayList<>();	
		
		//for(MultipartFile uploadFile: uploadFiles) {
		//if(uploadFile != null && !uploadFile.isEmpty()) {
			// 파일 업로드
			//Map<String, String> map = fileUtil.fileUpload(uploadFile, "board");
			
			// insert할 데이터 => AttachDto객체만들기 => attachList쌓기
			//attachList.add( AttachDto.builder()
			//						 .filePath(map.get("filePath"))
			//						 .filesystemName(map.get("filesystemName"))
			//						 .originalName(map.get("originalName"))
			//						 .refType("N")
			//						 .build());
		
		//}
		//}
		//board.setAttachList(attachList); // 첨부파일이 없었을 경우 텅빈리스트
		
		int result = boardService.insertBoard(board);
		
		// 성공시 => alert메세지와 함께 목록페이지로 이동
		// 실패시 => alert메세지와 함께 작성페이지에 그대로
		

		if(result == 1 ) {
		redirectAttributes.addFlashAttribute("alertMsg", "게시판 작성에 성공하였습니다.");
		}else {
		redirectAttributes.addFlashAttribute("alertMsg", "게시판 작성에 실패하였습니다.");
		redirectAttributes.addFlashAttribute("historyBackYN", "Y");
		}
		
		
		return "redirect:/board/proposalList.do";
		}
			
	
	
}
