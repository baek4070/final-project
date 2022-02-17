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
	<h3>QnA 글조회</h3>
	<table>
		<tr>
			<th>제목</th>
			<td><td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><td>
			<th>작성일자</th>
			<td><td>
			<th>조회수</th>
			<td><td>
		</tr>
		<tr>
			<th>내용</th>
			<td></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td></td>
		</tr>
	</table>
</body>
</html>