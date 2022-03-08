package net.koreate.board.service;

import java.util.List;
import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardCommentVO;
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
	
	// 조회수 증가
	public int updateViewCnt(int bno) throws Exception;
	
	// 댓글 리스트 조회
	public List<BoardCommentVO> getCommentList(int bno) throws Exception;
	
	// 댓글 작성
	public String registerComment(BoardVO board) throws Exception;
	
	// 댓글 수정
	public String modifyComment(BoardCommentVO board) throws Exception;
		
	// 댓글 삭제
	public String removeComment(BoardCommentVO board) throws Exception;
}
