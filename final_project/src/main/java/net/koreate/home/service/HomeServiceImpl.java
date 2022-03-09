package net.koreate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardVO;
import net.koreate.home.dao.HomeDAO;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.qnaboard.vo.QnABoardVO;
import net.koreate.user.vo.UserVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Inject
	HomeDAO dao;

	@Override
	public List<QnABoardVO> qlist() throws Exception {
		List<QnABoardVO> qlist = dao.QnaList();
		return qlist;
	}

	@Override
	public List<BoardVO> boardListSearch(BoardVO bvo) throws Exception{
		List<BoardVO> blist = dao.BoardListSearch(bvo);
		return blist;
	}

	@Override
	public List<QnABoardVO> qlistSearch(QnABoardVO qvo) throws Exception{
		List<QnABoardVO> qlist = dao.QnAListSearch(qvo);
		return qlist;
	}

	@Override
	public List<BoardVO> wish(WishVO wish) throws Exception {
		List<BoardVO> wishGet = dao.wish(wish);
		return wishGet;
	}

	@Override
	public List<BellVO> bellList(int uno) throws Exception {
		List<BellVO> bellList = dao.bellList(uno);
		return bellList;
	}

	@Override
	public void updateCheckBoard(BellVO bell) throws Exception {
		dao.updateCheckBoard(bell);
	}

	@Override
	public void updateCheckMessage(BellVO bell) throws Exception {
		dao.updateCheckMessage(bell);
	}

	@Override
	public MessageVO getMessage(MessageVO message) throws Exception {
		MessageVO mg = dao.getMessage(message);
		return mg;
	}

	@Override
	public List<MessageVO> messageList(int uno) throws Exception {
		List<MessageVO> msgList = dao.messageList(uno);
		return msgList;
	}

	@Override
	public MessageVO messageDetail(int mno) throws Exception {
		MessageVO msg = dao.messageDetail(mno);
		return msg;
	}

	@Override
	public void updateMessageCheck(int mno) throws Exception {
		dao.updateMessageCheck(mno);
	}

	@Override
	public boolean insertMessage(MessageVO vo) throws Exception {
		boolean tf = dao.insertMessage(vo);
		return tf;
	}

	@Override
	public MessageVO getMessageRecent() throws Exception {
		MessageVO recent = dao.getMessageRecent();
		return recent;
	}

	@Override
	public void insertBell(BellVO bell) throws Exception {
		dao.insertBell(bell);
	}


	/*
	 * @Override public List<BoardVO> blist() throws Exception { List<BoardVO> blist
	 * = dao.BoardList(); return blist; }
	 */

}
