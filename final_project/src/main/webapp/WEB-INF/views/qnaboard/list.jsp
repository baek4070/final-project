<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>QnA</h1>
	<a href="write">글쓰기</a>
	<table border=1>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일자</td>
			<td>첨부파일</td>
		</tr>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="qnaboard" items="${list}">
					<tr>
						<td>${qnaboard.qno}</td>
						<td><a href="detail?qno=${qnaboard.qno}">${qnaboard.title}</a></td>
						<td>${qnaboard.userNickname}</td>
						<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaboard.regdate}"/></td>
						<td>${qnaboard.filename}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>작성된 글이 없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>