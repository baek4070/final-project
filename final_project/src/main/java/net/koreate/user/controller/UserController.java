package net.koreate.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user")
public class UserController {

	@RequestMapping("/signIn")
	public String signIn() {
		return "user/signIn";
	}

	@RequestMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	@RequestMapping("/info")
	public String info() {
		return "user/info";
	}
	
}
