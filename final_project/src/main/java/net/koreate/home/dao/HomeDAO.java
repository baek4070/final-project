package net.koreate.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface HomeDAO {

	@Select("SELECT * FROM qna_tbl ORDER BY viewcnt desc limit 1,10")
	List<QnABoardVO> QnaList();

	/*
	 * @Select("SELECT * FROM board ORDER BY bno DESC limit 1,5") List<BoardVO>
	 * BoardListSearch(BoardVO bvo);
	 */

	@Select("SELECT * FROM qna_tbl WHERE title LIKE CONCAT('%',#{title},'%') OR content LIKE CONCAT('%',#{content},'%') OR userNickname LIKE CONCAT('%',#{userNickname},'%') ORDER BY qno DESC limit 1,5")
	List<QnABoardVO> QnAListSearch(QnABoardVO qvo);

	
	@Select("SELECT * FROM board WHERE title LIKE CONCAT('%',#{title},'%') OR content LIKE CONCAT('%',#{content},'%') ORDER BY bno DESC limit 1,5")
	List<BoardVO> BoardListSearch(BoardVO bvo);

	/*
	 * @Select("SELECT B.*, U.uname AS writer FROM re_tbl_board AS B NATURAL JOIN tbl_user AS U WHERE B.bno = #{bno}"
	 * )
	 */
	@Select("SELECT B.* FROM board AS B NATURAL JOIN wish AS W WHERE uno = #{uno}")
	List<BoardVO> wish(WishVO wish);

	@Select("SELECT * FROM ring_the_bell WHERE uno = #{uno} AND checked = 'n' GROUP BY bno, mno limit 1,5")
	List<BellVO> bellList(int uno);

	// 알림용 보드 체크
	@Update("UPDATE ring_the_bell SET checked='y' WHERE bno = #{bno} AND uno = #{uno}")
	void updateCheckBoard(BellVO bell);

	// 알림용 메세지 체크
	@Update("UPDATE ring_the_bell SET checked='y' WHERE uno = #{uno} AND mno = #{mno}")
	void updateCheckMessage(BellVO bell);

	// 알림용 메세지 받아오기
	@Select("SELECT * FROM message WHERE uno = #{uno} AND mno = #{mno}")
	MessageVO getMessage(MessageVO message);

	// 쪽지함 리스트
	@Select("SELECT * FROM message WHERE uno = #{uno} ORDER BY mno DESC limit 0,15")
	List<MessageVO> messageList(int uno);

	// 메세지 상세내용
	@Select("SELECT * FROM message WHERE mno = #{mno}")
	MessageVO messageDetail(int mno);

	// 쪽지함 체크여부 업데이트
	@Update("UPDATE message SET checked='y' WHERE mno = #{mno}")
	void updateMessageCheck(int mno);

	@Insert("INSERT INTO message(uno,suno,title,sender,content) VALUES(#{uno},#{suno},#{title},#{sender},#{content})")
	boolean insertMessage(MessageVO vo);
}

