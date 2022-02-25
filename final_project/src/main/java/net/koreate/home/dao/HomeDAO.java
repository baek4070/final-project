package net.koreate.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import net.koreate.board.vo.BoardVO;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface HomeDAO {

	@Select("SELECT * FROM qna_tbl ORDER BY qno DESC limit 1,5")
	List<QnABoardVO> QnaList();

	@Select("SELECT * FROM board ORDER BY bno DESC limit 1,5")
	List<BoardVO> BoardListSearch(BoardVO bvo);

	@Select("SELECT * FROM qna_tbl ORDER BY qno DESC limit 1,5")
	List<QnABoardVO> QnAListSearch(QnABoardVO qvo);

	/*
	 * @Select("SELECT * FROM board ORDER BY bno DESC limit 1,5") List<BoardVO>
	 * BoardList();
	 */

}
