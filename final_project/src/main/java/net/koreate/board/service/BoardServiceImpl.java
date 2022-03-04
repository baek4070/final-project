package net.koreate.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.dao.BoardDAO;
import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject 
	BoardDAO dao;
	
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		List<BoardVO> list = dao.list(cri);
		return list;
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		int totalCount = dao.listCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);
		return pageMaker;
	}

	@Override
	public String register(BoardVO board) throws Exception {
		int result = dao.insert(board);
		return getMessage(result, "등록");
	}

	@Override
	public BoardVO get(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public String modify(BoardVO board) throws Exception {
		int result = dao.update(board);
		return getMessage(result, "수정");
	}

	@Override
	public String delete(int bno) throws Exception {
		int result = dao.delete(bno);
		return getMessage(result, "삭제");
	}
	
	private String getMessage(int result, String type) {
		return (result > 0) ? type + " 성공" : type + " 실패";
	}

	@Override
	public String addWishlist(BoardVO board) throws Exception {
		int result = dao.addWishlist(board);
		return getMessage(result, "찜 추가");
	}

	@Override
	public String removeWishlist(BoardVO board) throws Exception {
		int result = dao.deleteWishlist(board);
		return getMessage(result, "찜 취소");
	}

}
