package net.koreate.user.security;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserVO;

public class signInSuccessHandler implements AuthenticationSuccessHandler {

	@Inject
	UserService us;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		CustomUser user = (CustomUser)authentication.getPrincipal();
		System.out.println("user : "+user);
		UserVO vo = user.getUser();
		System.out.println("vo"+vo);
		
		try {
			 us.updateVisitDate(vo.getU_id()); 
		} catch (Exception e) {
			 e.printStackTrace(); 
		}
		/*
		String result = "";
		if(vo.getU_id().equals(user.getUsername())) {
			System.out.println("vo.getU_id()"+vo.getU_id());
			System.out.println("user.getUsername()"+user.getUsername());
			result = "로그인 성공";
			String context = File.separator+"result="+result;
		}else {
			result = "로그인 실패";
			String context = File.separator+"result="+result;
		}
		*/
		String context = File.separator;
		System.out.println("context " +context);
		response.sendRedirect(context);
	}

}
