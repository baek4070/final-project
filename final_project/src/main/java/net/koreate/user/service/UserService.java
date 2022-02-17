package net.koreate.user.service;

import net.koreate.user.vo.UserDTO;
import net.koreate.user.vo.UserVO;

public interface UserService {

	// ȸ������
	void signUp(UserVO vo) throws Exception;

	// �α���
	UserVO signIn(UserDTO dto) throws Exception;
	
	// ���� ����
	UserVO updateSign(UserVO vo) throws Exception;
	
	// �α׾ƿ�
	void signOut() throws Exception;
	
	// ���̵� ���
	UserVO getUserById(String u_id) throws Exception;

	
}
