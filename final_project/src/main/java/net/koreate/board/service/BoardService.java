package net.koreate.board.service;

import java.util.List;

import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardVO;
public interface BoardService {

	public List<BoardVO> list(Criteria cri) throws Exception;
	
	public void register(BoardVO board) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public boolean modify(BoardVO board) throws Exception;
	
	public boolean remove(int bno) throws Exception;

	public int listCount(Criteria cri);
	
	// PageMaker 정보
	PageMaker getPageMaker(Criteria cri) throws Exception;
}
