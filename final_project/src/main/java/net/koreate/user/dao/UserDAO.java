package net.koreate.user.dao;

import net.koreate.user.vo.UserVO;

public interface UserDAO {

	// 회원가입
	void signUp(UserVO vo) throws Exception;

	// 로그인
	// 아이디 이메일 형식인지 체크용
	UserVO getUserById(String u_id) throws Exception;

	// 사용자 정보 수정
	int updateUser(UserVO vo) throws Exception;

	// 마지막 방문일
	void getUpdateVisitDate(String u_id) throws Exception;
	
	// 권한 넣기
//	@Insert("INSERT INTO user_auth(u_id,u_auth) VALUES(#{u_id},'ROLE_USER')")
	void insertAuth(String u_id) throws Exception;
	
	// 회원 탈퇴(삭제 x u_withdraw 'y'로 변경)
	void withdraw(UserVO vo) throws Exception;

}
