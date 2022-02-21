package net.koreate.user.session;

import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

@Component
public class SessionListner implements HttpSessionListener, HttpSessionAttributeListener {

	public static Hashtable<String,Object> sessionRepository;
	
	public SessionListner() {
		System.out.println("sessionEventListner 생성");
		if(sessionRepository == null) {
			sessionRepository = new Hashtable<>();
		}
	}
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		System.out.println("attributeAdded 호출");
		System.out.println("sessionID : "+event.getSession().getId());
		System.out.println("session에 추가된 attribute name : "+event.getName()+event.getValue());
		if(event.getName().equals("userInfo")) {
			HttpSession session = event.getSession();
			System.out.println("userInfo regist : "+session.getId());
			sessionRepository.put(event.getName(), event.getValue());
		}
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
//		System.out.println("remove session : "+event.getSession().getId());
	//	sessionRepository.remove(event.getSession().getId());
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {

	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.printf("session 생성 id %s %n ",se.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
//		System.out.printf("Session 삭제 session id %s %n,",se.getSession().getId());
	//	sessionRepository.remove(se.getSession().getId());
	}

}
