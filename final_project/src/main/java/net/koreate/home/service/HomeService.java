package net.koreate.home.service;

import java.util.List;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.qnaboard.vo.QnABoardVO;
import net.koreate.user.vo.UserVO;

public interface HomeService {

	List<QnABoardVO> qlist() throws Exception;

	List<BoardVO> boardListSearch(BoardVO qvo);

	List<QnABoardVO> qlistSearch(QnABoardVO qvo);

	List<BoardVO> wish(WishVO wish);

	List<BellVO> bellList(int uno);

	void updateCheckBoard(BellVO bell);

	void updateCheckMessage(BellVO bell);

	MessageVO getMessage(MessageVO message);

	List<MessageVO> messageList(int uno);
	
}
