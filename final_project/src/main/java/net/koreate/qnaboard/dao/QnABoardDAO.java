package net.koreate.qnaboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

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
	
	@Select("SELECT * FROM qna_tbl WHERE qno=#{qno} AND deleted='n'")
	QnABoardVO detail(int qno) throws Exception;
	
	@SelectProvider(type=QnABoardQueryProvider.class,
		 	method="searchSelectCount")
	int listCount(QnACriteria cri) throws Exception;
	
	@Update("UPDATE qna_tbl SET title = #{title},"
			+ "content = #{content}," 
			+ "userNickname = #{userNickname}," 
			+ "updatedate = now() "
			+ "WHERE qno = #{qno}")
	void update(QnABoardVO vo) throws Exception;
	
	@Update("UPDATE qna_tbl SET deleted = 'y' WHERE qno=#{qno}")
	void delete(int qno) throws Exception;
	;
}
