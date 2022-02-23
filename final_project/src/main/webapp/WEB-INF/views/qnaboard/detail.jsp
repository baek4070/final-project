<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h1 class="text-center">QnA</h1>
	<table class="table table-hover">
		<tr>
			<th>제목</th>
			<td colspan="5" class="text-center">${vo.title}<td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.userNickname}<td>
			<th>작성일자</th>
			<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/><td>
			<th>조회수</th>
			<td>${vo.viewcnt}<td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5" class="text-center">${vo.content}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="5" class="text-center">${vo.filename}</td>
		</tr>
	</table>
	<a href="modify" class="btn btn-outline-danger" >수정</a>
	<a href="delete" class="btn btn-outline-danger" >삭제</a>
	<a href="reply" class="btn btn-outline-danger" >답글</a>
	<a href="list" class="btn btn-outline-danger" >목록으로</a>
</body>
</html>