package net.koreate.qnaboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("qnaboard")
public class QnABoardController {

	@RequestMapping("/list")
	public String list() {
		return "qnaboard/list";
	}
	
	@GetMapping("/write")
	public String write() {
		return "qnaboard/write";
	}
	
	@PostMapping("/resister")
	public String resister() {
		return "redirect:/qnaboard/list";
	}
}
