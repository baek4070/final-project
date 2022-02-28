package net.koreate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.dao.HomeDAO;
import net.koreate.qnaboard.vo.QnABoardVO;

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
		/* List<BoardVO> blist = dao.BoardListSearch(bvo); */
		return null;
	}

	@Override
	public List<QnABoardVO> qlistSearch(QnABoardVO qvo) {
		List<QnABoardVO> qlist = dao.QnAListSearch(qvo);
		return qlist;
	}


	/*
	 * @Override public List<BoardVO> blist() throws Exception { List<BoardVO> blist
	 * = dao.BoardList(); return blist; }
	 */

}
