package net.koreate.qnaboard.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.qnaboard.service.QnABoardService;
import net.koreate.qnaboard.vo.QnABoardVO;

@Controller
@RequestMapping("qnaboard")
public class QnABoardController {
	
	@Inject
	QnABoardService qs;
	

	@RequestMapping("/list")
	public String list(Model model) throws Exception{
		model.addAttribute("list",qs.list());
		return "qnaboard/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "qnaboard/write";
	}
	
	@PostMapping("/resister")
	public String resister(QnABoardVO vo) throws Exception {
		qs.regist(vo);
		return "redirect:/qnaboard/list";
	}
}
