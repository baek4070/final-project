<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body>
	<c:choose>
		<c:when test="${!empty sessionScope.userInfo}">
		<span>${userInfo.u_name}</span>
			<a href="user/info">회원정보</a>
		</c:when>
		<c:otherwise>
			<a href="user/signIn">로그인</a>
			<a href="user/signUp">회원가입</a>
		</c:otherwise>
	</c:choose>	
	<br/>
		<a href="board/list">게시판리스트</a>
		<a href="qnaboard/list">QnA게시판리스트</a>
</body>
</html>
