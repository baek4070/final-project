<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h3>QnA 글조회</h3>
	<table>
		<tr>
			<th>제목</th>
			<td>${vo.title}<td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.userNickname}<td>
			<th>작성일자</th>
			<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaboard.regdate}"/><td>
			<th>조회수</th>
			<td>${vo.viewcnt}<td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.content}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>${vo.filename}</td>
		</tr>
	</table>
</body>
</html>