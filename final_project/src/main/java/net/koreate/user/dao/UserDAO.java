package net.koreate.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.user.vo.UserDTO;
import net.koreate.user.vo.UserVO;

public interface UserDAO {

	// 회원가입
	@Insert("INSERT INTO trade_user(u_id,u_pw,u_name) "
			+ " VALUES(#{u_id},#{u_pw},#{u_name})")
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
			+ " WHERE u")
	UserVO update(int uno) throws Exception;
	
}
