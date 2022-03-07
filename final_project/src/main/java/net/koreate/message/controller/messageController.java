package net.koreate.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("message")
public class messageController {

	
	@RequestMapping("/msgWrite")
	public String msgWrite() {
		
		return"message/msgWrite";
	}
}
