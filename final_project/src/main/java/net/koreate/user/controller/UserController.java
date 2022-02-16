package net.koreate.user.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserDTO;
import net.koreate.user.vo.UserVO;

@Controller
@RequestMapping("user")
public class UserController {

	@Inject
	UserService us;
	
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
	
	// ȸ������ ��ư ��������
	@PostMapping("signUpPost")
	public String signUp(UserVO vo,ModelAndView mav,RedirectAttributes rttr) throws Exception{
		us.signUp(vo);
		rttr.addFlashAttribute("message","ȸ������ ����");
		return "redirect:/signIn";
	}
	// �α��� ��ư Ŭ��
	@PostMapping("signInPost")
	public ModelAndView signIn(UserDTO dto,ModelAndView mav) throws Exception{
		mav.addObject("logDTO",dto);
		mav.setViewName("redirect:/");
		return mav;
	}
	
}
