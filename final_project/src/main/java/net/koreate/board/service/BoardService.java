package net.koreate.board.service;

import java.util.List;
import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> list(Criteria cri) throws Exception;
	
	public PageMaker getPageMaker(Criteria cri) throws Exception;
	
	public String register(BoardVO board) throws Exception;
	
	public BoardVO get(int bno) throws Exception;
	
	public String modify(BoardVO board) throws Exception;
	
	public String delete(int bno) throws Exception;
	
	// 찜목록 추가
	public String addWishlist(BoardVO board) throws Exception;
	
	// 찜목록 삭제
	public String removeWishlist(BoardVO board) throws Exception;
}
