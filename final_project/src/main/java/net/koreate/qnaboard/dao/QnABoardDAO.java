package net.koreate.qnaboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.qnaboard.vo.QnABoardVO;

public interface QnABoardDAO {

	@Insert("INSERT INTO qna_tbl(userId, title, content, userNickname ) "
			+ " VALUES(#{userId},#{title},#{content},#{userNickname})")
	void regist(QnABoardVO vo) throws Exception;
	
	@Select("SELECT * FROM qna_tbl")
	List<QnABoardVO> list() throws Exception;
}
