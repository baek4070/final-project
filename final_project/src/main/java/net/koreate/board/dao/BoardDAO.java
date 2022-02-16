package net.koreate.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import net.koreate.board.util.Criteria;
import net.koreate.board.vo.BoardVO;

public interface BoardDAO {
	
	//@Select
	//("SELECT * FROM board ORDER BY bno DESC limit #{page}, #{perPageNum}")
	List<BoardVO> list(Criteria cri) throws Exception;

	//@Select("SELECT count(*) from board")
	int listCount(Criteria cri);
	
}
