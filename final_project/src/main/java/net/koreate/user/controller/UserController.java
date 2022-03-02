package net.koreate.user.controller;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	JavaMailSender mailSender;
	
	@Inject
	UserService us;
	
	@Inject 
	PasswordEncoder encoder;
	
	@GetMapping("/signIn")
	public String signIn(String message,Model model) {
		model.addAttribute("message",message);
		return "user/signIn";	
	}

	@GetMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	@GetMapping("/update")
	public String signUpdate() {
		return "user/update";
	}

	@GetMapping("/signOut")
	public void signOut() {
		
	}
	
	// 회원정보 수정
	@GetMapping("/info")
	public String info(UserVO vo) {
		return "/user/info";
	}
	
	@PostMapping("/signUp")
	public String postSignUp() {
		return "user/signUp";
	}
	
	// 아이디 중복체크
	@PostMapping("/uidCheck")
	@ResponseBody
	public boolean uidCheck(String u_id) throws Exception{
		boolean isCheck = us.getUsersById(u_id);
		System.out.println(isCheck);
		return isCheck;
	}
	
	// 이메일 발송
	@GetMapping("/checkEmail")
	@ResponseBody
	public String sendMail(@RequestParam("u_id") String email) throws Exception{
		System.out.println(email);
		String code = "";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message,"UTF-8");
		messageHelper.setFrom("rlaghlwlsx@daum.net");
		messageHelper.setTo(email);
		messageHelper.setSubject("이메일 인증코드 확인");
		for(int i=0; i<5; i++) {
			code += (int)(Math.random()*10);
		}
		System.out.println("code : "+code);
		String msg = "다음 인증 코드르 입력해주세요.<h2>"+code+"</h2>";
		messageHelper.setText(msg,true);
		mailSender.send(message);
		System.out.println("발송완료");
		
		return code;
	}
	
	//회원 정보 수정
	@PostMapping("/signUpPost")
	public String signUp(UserVO vo) throws Exception{
		System.out.println(vo);
		us.signUp(vo);
		return "redirect:/user/signIn";
	}

	// 회원 정보 수정
	@PostMapping("signUpdatePost")
	public String signUpdatePost(@RequestParam("uno") int uno,UserVO vo, Model model) throws Exception {
		vo.setUno(uno);
		boolean check = us.updateSign(vo);
		model.addAttribute("check",check);
		System.out.println("mav : "+model);
		return "redirect:/user/info";
	}
	
	// 회원 탈퇴
	@GetMapping("withdraw")
	public void signWithdraw(UserVO vo) throws Exception{
		us.withdraw(vo);
	}
	
}
