package net.koreate.home.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.koreate.home.service.HomeService;

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
	
}
