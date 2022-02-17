package net.koreate.qnaboard.service;

import java.util.List;

import net.koreate.qnaboard.vo.QnABoardVO;

public interface QnABoardService {

	// QnA게시판 게시글 작성
	void regist(QnABoardVO vo) throws Exception;
	
	List<QnABoardVO> list() throws Exception;
}
