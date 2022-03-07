package net.koreate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public List<BoardVO> boardListSearch(BoardVO bvo) {
		List<BoardVO> blist = dao.BoardListSearch(bvo);
		return blist;
	}

	@Override
	public List<QnABoardVO> qlistSearch(QnABoardVO qvo) {
		List<QnABoardVO> qlist = dao.QnAListSearch(qvo);
		return qlist;
	}

	@Override
	public List<BoardVO> wish(WishVO wish) {
		List<BoardVO> wishGet = dao.wish(wish);
		return wishGet;
	}

	@Override
	public List<BellVO> bellList(int uno) {
		List<BellVO> bellList = dao.bellList(uno);
		return bellList;
	}

	@Override
	public void updateCheckBoard(BellVO bell) {
		dao.updateCheckBoard(bell);
	}

	@Override
	public boolean updateCheckMessage(BellVO bell) {
		BellVO belled = dao.updateCheckMessage(bell);
		return belled == null ? false : true;
	}

	@Override
	public MessageVO getMessage(MessageVO message) {
		MessageVO mg = dao.getMessage(message);
		return mg;
	}


	/*
	 * @Override public List<BoardVO> blist() throws Exception { List<BoardVO> blist
	 * = dao.BoardList(); return blist; }
	 */

}
