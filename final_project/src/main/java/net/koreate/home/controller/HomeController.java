package net.koreate.home.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.service.HomeService;
import net.koreate.home.vo.WishVO;
import net.koreate.qnaboard.vo.QnABoardVO;
import net.koreate.user.vo.UserVO;

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
	public String totalSearch(BoardVO bvo, QnABoardVO qvo, @RequestParam("searchValue") String search, Model model) {
			System.out.println(search);
			bvo.setTitle(search);
			bvo.setContent(search);
			
			qvo.setTitle(search);
			qvo.setContent(search);
			qvo.setUserNickname(search);
			
			model.addAttribute("bBoard",hs.boardListSearch(bvo));
			model.addAttribute("qBoard",hs.qlistSearch(qvo));
			model.addAttribute("value",search);
		return "home/list";
	}
	
	@RequestMapping(value = "/home/myList", method = RequestMethod.POST)
	public String wishList(Model model, UserVO uno) {
		WishVO wish = new WishVO();
		int number = uno.getUno();
		System.out.println(number);
		wish.setUno(number);
		model.addAttribute("wishList",hs.wish(wish));
		System.out.println(model);
		return "home/myList";
	}
	
	
	
}
