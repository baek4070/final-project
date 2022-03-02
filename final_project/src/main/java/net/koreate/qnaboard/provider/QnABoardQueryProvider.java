package net.koreate.qnaboard.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.qnaboard.util.QnACriteria;


public class QnABoardQueryProvider {

	public String searchSelectSql(QnACriteria cri) {
		/*
		String queryString = "SELECT B.*, U.uname AS writer FROM ";
		queryString += "re_tbl_board AS B NATURAL JOIN tbl_user AS U";
		if(cri.getSearchType() != null && 
			!cri.getSearchType().equals("n")) {
			queryString += " WHERE ..";
		}
		*/
		/*
		SQL sql = new SQL();
		// SELECT ( * ) FROM 
		sql.SELECT("*");
		sql.FROM("re_tbl_board");
		if(cri.getSearchType().equals("t")) {
			sql.WHERE("title LIKE CONCAT('%',"+cri.getKeyword()+",'%')");
		}
		sql.ORDER_BY("origin desc , seq ASC");
		sql.LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
		*/
		/*
		sql.JOIN("tbl_user AS U");
		sql.WHERE("B.uno = U.uno");
		*/
		SQL sql = new SQL();
		
//		sql.SELECT("B.* , U.uname AS writer");
//		sql.FROM("re_tbl_board AS B NATURAL JOIN tbl_user AS U");
//		
//		getSearchWhere(cri,sql);
//		
//		sql.ORDER_BY("B.origin DESC, B.seq ASC");
//		sql.LIMIT(cri.getPageStart()+", "+cri.getPerPageNum());
//		
//		String query = sql.toString();
//		System.out.println(query);
//		return query;
		sql.SELECT("*");
		sql.FROM("qna_tbl");
		getSearchWhere(cri,sql);
		sql.ORDER_BY("qno desc");
		sql.LIMIT(cri.getStartRow()+","+cri.getPerPageNum());
		String query =sql.toString();
		System.out.println(query);
		return query;
	}
	
	public String searchSelectCount(QnACriteria cri) {
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("qna_tbl");
				getSearchWhere(cri,this);
			}
		}.toString();
	}
	
	// WHERE 조건 절 추가
		public void getSearchWhere(QnACriteria cri, SQL sql) {
			String deletedQuery = "deleted='n'";
			if(cri.getSearchType() != null 
					&& 
			   !cri.getSearchType().equals("n")) {
			   String titleQuery
			   = "title LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			   String contentQuery
			   = "content LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			   switch(cri.getSearchType()) {
				   case "t" :
					   sql.WHERE(titleQuery).AND().WHERE(deletedQuery);
					   break;
				   case "c" :
					   sql.WHERE(contentQuery).AND().WHERE(deletedQuery);
					   break;
				   case "tc" :
					   sql.WHERE(titleQuery).OR().WHERE(contentQuery).AND().WHERE(deletedQuery);
					   break;
			   }
			  
			}
			sql.WHERE(deletedQuery);
		}
}
