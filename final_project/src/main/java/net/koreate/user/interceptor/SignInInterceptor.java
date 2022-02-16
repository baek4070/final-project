package net.koreate.user.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.service.UserService;
import net.koreate.user.session.SessionListner;
import net.koreate.user.vo.UserDTO;
import net.koreate.user.vo.UserVO;

public class SignInInterceptor extends HandlerInterceptorAdapter {

	@Inject 
	UserService us;
	
	@Inject 
	UserDAO ud;
	
	@Inject
	SessionListner listner;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("LoginInterceptor preHandle");
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("LoginInterceptor postHandle");
		ModelMap map = modelAndView.getModelMap();
		UserDTO dto = (UserDTO)map.get("userDTO");
		
		// 아이디와 비밀번호 일치하는 사용자 검색
		UserVO vo = us.signIn(dto);
		HttpSession session = request.getSession();
		if(vo != null) {
			session.setAttribute("userInfo", vo);
			
			if(dto.isUseCookie()) {
				Cookie cookie = new Cookie("singInCookie",dto.getU_id());
				cookie.setMaxAge(60*60*24*15);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
	}

	
	
}
