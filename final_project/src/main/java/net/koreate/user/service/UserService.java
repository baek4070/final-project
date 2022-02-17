package net.koreate.user.service;

import net.koreate.user.vo.UserDTO;
import net.koreate.user.vo.UserVO;

public interface UserService {

	// 회원가입
	void signUp(UserVO vo) throws Exception;

	// 로그인
	UserVO signIn(UserDTO dto) throws Exception;
	
	// 정보 수정
	UserVO updateSign(UserVO vo) throws Exception;
	
	// 로그아웃
	void signOut() throws Exception;
	
	// 아이디 사용
	UserVO getUserById(String u_id) throws Exception;

	
}
