package net.koreate.qnaboard.dao;

import org.apache.ibatis.annotations.Insert;

import net.koreate.qnaboard.vo.QnABoardVO;

public interface QnABoardDAO {

	@Insert("INSERT INTO qna_tbl(userId, title, content, userNickname )"
			+ " VALUES(#{userId}, #{title}, #{content}, #{userNickname}")
	void regist(QnABoardVO vo) throws Exception;
	
}
