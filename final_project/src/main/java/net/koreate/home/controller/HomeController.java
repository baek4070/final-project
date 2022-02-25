package net.koreate.home.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.service.HomeService;
import net.koreate.qnaboard.vo.QnABoardVO;

@Controller
public class HomeController {
	
	@Inject
	HomeService hs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		model.addAttribute("qlist",hs.qlist());
		/* model.addAttribute("blist",hs.blist()); */
		return "home/home";
	}
	
	@Transactional
	@RequestMapping("total")
	public String totalSearch(BoardVO bvo, QnABoardVO qvo, HttpServletRequest request, Model model) {
			String total = request.getParameter("searchValue");
			bvo.setContent(total);
			qvo.setContent(total);
			model.addAttribute("bBoard",hs.boardListSearch(bvo));
			model.addAttribute("qBoard",hs.qlistSearch(qvo));
		return "redirect:home/list";
	}
	
}
