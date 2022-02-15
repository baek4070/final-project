package net.koreate.qnaboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("qnaboard")
public class QnABoardController {

	@RequestMapping("/list")
	public String list() {
		return "qnaboard/list";
	}
}
