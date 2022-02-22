package net.koreate.user.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.user.vo.UserDTO;
import net.koreate.user.vo.UserVO;

public interface UserDAO {

	// 회원가입
//	@Insert("INSERT INTO trade_user(u_id,u_pw,u_name,u_birth,u_post,u_addr,u_addr_detail,u_phone) "
//			+ " VALUES(#{u_id},#{u_pw},#{u_name},#{u_birth},#{u_post},#{u_addr},#{u_addr_detail},#{u_phone})")
	void signUp(UserVO vo) throws Exception;

	// 로그인
	@Select("SELECT * FROM trade_user "
			+ " WHERE u_id = #{u_id} AND u_pw = #{u_pw}")
	UserVO signIn(UserDTO dto) throws Exception;

	@Select("SELECT * FROM trade_user "
		  +" WHERE u_id = #{u_id}")
	UserVO getUserById(String u_id) throws Exception;

	// 사용자 정보 수정
	@Update("UPDATE * FROM trade_user SET "
			+ " WHERE u_id = #{u_id} AND u_pw = #{u_pw}")
	UserVO update(UserVO vo) throws Exception;

	// 아이디 이메일 형식인지 체크용
	@Select("SELECT user.*, u_auth FROM"
			+ " trade_user AS user"
			+ " LEFT OUTER JOIN"
			+ " trade_user_auth AS ua"
			+ " on user.u_id = ua.u_id"
			+ " WHERE user.u_id - #{u_id}")
	UserVO getUsersById(String u_id) throws Exception;

}
