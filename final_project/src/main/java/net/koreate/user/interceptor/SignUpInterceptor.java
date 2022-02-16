package net.koreate.user.interceptor;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.user.service.UserService;
import net.koreate.user.vo.UserVO;

public class SignUpInterceptor extends HandlerInterceptorAdapter {

	@Inject 
	UserService us;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("signUpPost preHandle");
		String u_pw = request.getParameter("u_pw");
		String u_repw = request.getParameter("u_repw");
		
		RequestDispatcher rd = request.getRequestDispatcher("signUp");
		String message = "";
		if(!u_pw.equals(u_repw)) {
			message = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			request.setAttribute("message", message);
			rd.forward(request, response);
			return false;
		}
		
		String u_id = request.getParameter("u_id");
		UserVO userInfo = us.getUserById(u_id);
		if(userInfo != null) {
			message = u_id+"�� �̹� ������� ���̵��Դϴ�.";
			request.setAttribute("message", message);
			rd.forward(request, response);
			return false;
		}
		return true;
	}

	
	
}
