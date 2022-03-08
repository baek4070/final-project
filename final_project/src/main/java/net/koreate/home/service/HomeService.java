package net.koreate.home.service;

import java.util.List;

import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardVO;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface HomeService {

	public List<QnABoardVO> qlist() throws Exception;

	public List<BoardVO> boardListSearch(BoardVO qvo);

	public List<QnABoardVO> qlistSearch(QnABoardVO qvo);

	public List<BoardVO> wish(WishVO wish);

	public List<BellVO> bellList(int uno);

	public void updateCheckBoard(BellVO bell);

	public void updateCheckMessage(BellVO bell);

	public MessageVO getMessage(MessageVO message);

	public List<MessageVO> messageList(int uno);

	public MessageVO messageDetail(int mno);

	public void updateMessageCheck(int mno);

	public boolean insertMessage(MessageVO vo);
	
}
