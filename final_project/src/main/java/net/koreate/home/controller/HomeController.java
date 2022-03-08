package net.koreate.home.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.board.util.Criteria;
import net.koreate.board.vo.BoardVO;
import net.koreate.home.service.HomeService;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.qnaboard.vo.QnABoardVO;
import net.koreate.user.vo.UserVO;

@Controller
public class HomeController {
	
	@Inject
	HomeService hs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, UserVO uno) throws Exception{
		model.addAttribute("qlist",hs.qlist());
		/* model.addAttribute("blist",hs.blist()); */
		/*
		 * if(hs.bellList(uno) != null) { System.out.println(uno);
		 * model.addAttribute("bellList",hs.bellList(uno)); }
		 */
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
	
	@GetMapping("bell/{uno}")
	@ResponseBody
	public ResponseEntity<List<BellVO>> ring(@PathVariable("uno") int uno){
		ResponseEntity<List<BellVO>> entity = null;
		try {
			List<BellVO> result = hs.bellList(uno);
			entity = new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/selected")
	public String selectBell(@RequestParam("uno") int uno, @RequestParam("bno") int bno, RedirectAttributes rttr) {
		BellVO bell = new BellVO();
		bell.setBno(bno);
		bell.setUno(uno);
		hs.updateCheckBoard(bell);
		return "redirect:/board/detail?bno="+bno;
	}
	
	@Transactional
	@GetMapping("called")
	public String callBell(@RequestParam("uno") int uno, @RequestParam("mno") int mno, HttpServletRequest request, RedirectAttributes rttr) {
		BellVO bell = new BellVO();
		bell.setUno(uno);
		bell.setMno(mno);
		MessageVO message = new MessageVO();
		message.setUno(uno);
		message.setMno(mno);
		hs.updateCheckMessage(bell);
		String referer = request.getHeader("REFERER");
		rttr.addFlashAttribute("mslist",hs.getMessage(message));
		return "redirect:"+referer;
	}
	
	@GetMapping("message/msgList")
	public void msgList(@RequestParam("uno") int uno, Model model) {
		System.out.println(uno);
		model.addAttribute("mList",hs.messageList(uno));
	}
	
	@Transactional
	@GetMapping("message/msgDetail")
	public void msgDetail(@RequestParam("mno") int mno, Model model) {
		model.addAttribute("msgList",hs.messageDetail(mno));
		hs.updateMessageCheck(mno);
	}
	
	/*
	 * @PostMapping("message/resend") public String msgResend(@RequestParam("uno")
	 * int uno, @RequestParam("receiver") String receiver , Model model) { MessageVO
	 * resend = new MessageVO(); resend.setUno(uno); resend.setReceiver(receiver);
	 * model.addAttribute("wList",resend); return "message/msgWrite"; }
	 */
	
	@PostMapping("message/resister")
	public String insertMessage(MessageVO vo, HttpServletRequest request, RedirectAttributes rttr) {
		boolean result = hs.insertMessage(vo);
		String referer = request.getHeader("REFERER");
		rttr.addFlashAttribute("results",result);
		return "redirect:"+referer;
	}
	
}
