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
	
	// 파일 삭제 시 가장 최근에 등록된 게시물의 파일 이름과 파이 ㄹ경로와 
}
