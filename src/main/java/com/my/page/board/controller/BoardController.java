package com.my.page.board.controller;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.page.board.BoardDAO;
import com.my.page.board.BoardVO;
import com.my.page.board.Criteria;
import com.my.page.board.PageMaker;
import com.my.page.board.SearchCriteria;
import com.my.page.board.service.BoardServiceImpl;
import com.my.page.reply.ReplyVO;
import com.my.page.reply.service.ReplyService;

import ch.qos.logback.classic.Logger;

import com.my.page.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController{
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@Inject
	BoardService boardService;
	@Inject
	ReplyService replyService;

	
	//게시판 목록
	@RequestMapping(value="/boardList", method = RequestMethod.GET)
	public String boardList( Model model,SearchCriteria scri) throws Exception{
		
		model.addAttribute("list", boardService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);



		return "/board/boardList";
	}

    // 게시글 쓰기	
	@RequestMapping("/boardWrite")
	public String boardWrite(Model model)throws Exception {
		return "/board/boardWrite";
	}

    @RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public String boardWriter(BoardVO bdto) throws Exception{
		boardService.writerBoard(bdto);
		return "redirect:/board/boardList";
	}
    
    // 게시글 읽기
    @RequestMapping(value="boardRead", method=RequestMethod.GET)
    public String boardRead(@RequestParam int bno, Model model,BoardVO boardVO) throws Exception{
    	BoardVO data = boardService.boardRead(bno);
    	model.addAttribute("data",data);
    	
    	List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
    	model.addAttribute("replyList",replyList);
    	return"/board/boardRead";	
    }
    
    //게시글 수정
    @RequestMapping(value="updatepage", method=RequestMethod.GET)
    public String boardUpdate(@RequestParam int bno, Model model) throws Exception{
    	BoardVO data = boardService.boardRead(bno);
    	model.addAttribute("data",data);
    	return "/board/boardUpdate";
    	
    }
    
    @RequestMapping(value="boardUpdate", method=RequestMethod.POST)
    public String boardUpdatedo(BoardVO bdto) throws Exception {
    	boardService.updateBoard(bdto);
    	return "redirect:/board/boardList"; 
    }
    
    //게시판 삭제
    @RequestMapping(value="delete",method=RequestMethod.GET)
    public String boardDelete(@RequestParam int bno) throws Exception{
    	boardService.deleteBoard(bno);
    	return "redirect:/board/boardList"; 
    }
    
    //댓글 쓰기
	@RequestMapping(value="replyWrite", method = RequestMethod.POST)
	public String replyWrite(@ModelAttribute("ReplyVO") ReplyVO vo,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		replyService.writeReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
    	return "redirect:/board/boardRead";
				
	}
	
	//댓글 수정 GET
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(@ModelAttribute("ReplyVO") ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "/board/replyUpdateView";
	}
	
	//댓글 수정 POST
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(@ModelAttribute("ReplyVO") ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		replyService.updateReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
    	return "redirect:/board/boardRead";
	}
	
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(@ModelAttribute("ReplyVO") ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			

			return "/board/replyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(@ModelAttribute("ReplyVO") ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/boardRead";
		}

}