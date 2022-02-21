package net.koreate.home.service;

import java.util.List;

import net.koreate.board.vo.BoardVO;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface HomeService {

	List<QnABoardVO> qlist() throws Exception;
	
}
