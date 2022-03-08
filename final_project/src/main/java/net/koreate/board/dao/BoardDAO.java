package net.koreate.board.dao;

import java.util.List;
import net.koreate.board.util.Criteria;
import net.koreate.board.vo.BoardVO;

public interface BoardDAO {
	
	// 검색
	public List<BoardVO> list(Criteria cri) throws Exception;

	// 전체 게시물 수
	public int listCount() throws Exception;
	
	// 삽입
	public int insert(BoardVO board) throws Exception;
	
	// 선택
	public BoardVO read(int bno) throws Exception;
	
	// 수정
	public int update(BoardVO board) throws Exception;
	
	// 삭제
	public int delete(int bno) throws Exception;
	
	// 찜목록 추가
	public int addWishlist(BoardVO board) throws Exception;
	
	// 찜목록 삭제
	public int deleteWishlist(BoardVO board) throws Exception;
	
	// 조회수 증가
	public int updateViewCount(int bno) throws Exception;
}
