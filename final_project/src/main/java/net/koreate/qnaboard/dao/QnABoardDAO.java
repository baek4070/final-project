package net.koreate.qnaboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import net.koreate.qnaboard.provider.QnABoardQueryProvider;
import net.koreate.qnaboard.util.QnACriteria;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface QnABoardDAO {

	@Insert("INSERT INTO qna_tbl(userId, title, content, userNickname ) "
			+ " VALUES(#{userId},#{title},#{content},#{userNickname})")
	void regist(QnABoardVO vo) throws Exception;
	
	//@Select("SELECT * FROM qna_tbl")
	@SelectProvider(type=QnABoardQueryProvider.class,
			method="searchSelectSql")
	List<QnABoardVO> list(QnACriteria cri) throws Exception;
	
	@Select("SELECT * FROM qna_tbl WHERE qno=#{qno}")
	QnABoardVO detail(int bno) throws Exception;
	
	@SelectProvider(type=QnABoardQueryProvider.class,
		 	method="searchSelectCount")
	int listCount(QnACriteria cri) throws Exception;
}
