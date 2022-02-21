package net.koreate.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.user.dao.UserDAO;
import net.koreate.user.vo.UserDTO;
import net.koreate.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO ud;
	
	// ȸ������
	@Override
	public void signUp(UserVO vo) throws Exception {
		ud.signUp(vo);
	}
	
	// �α���
	@Override
	public UserVO signIn(UserDTO dto) throws Exception {
		return ud.signIn(dto);
	}
	

	@Override
	public UserVO updateSign(int uno) throws Exception {
		return ud.update(uno);
	}

	@Override
	public void signOut() throws Exception {
		
	}

	@Override
	public UserVO getUserById(String u_id) throws Exception {
		return ud.getUserById(u_id);
	}

	@Override
	public UserVO updateSign(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

}
