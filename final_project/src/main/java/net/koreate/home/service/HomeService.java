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

	public List<BoardVO> boardListSearch(BoardVO qvo) throws Exception;

	public List<QnABoardVO> qlistSearch(QnABoardVO qvo) throws Exception;

	public List<BoardVO> wish(WishVO wish) throws Exception;

	public List<BellVO> bellList(int uno) throws Exception;

	public void updateCheckBoard(BellVO bell) throws Exception;

	public void updateCheckMessage(BellVO bell) throws Exception;

	public MessageVO getMessage(MessageVO message) throws Exception;

	public List<MessageVO> messageList(int uno) throws Exception;

	public MessageVO messageDetail(int mno) throws Exception;

	public void updateMessageCheck(int mno) throws Exception;

	public boolean insertMessage(MessageVO vo) throws Exception;

	public MessageVO getMessageRecent() throws Exception;

	public void insertBell(BellVO bell) throws Exception;
	
}
