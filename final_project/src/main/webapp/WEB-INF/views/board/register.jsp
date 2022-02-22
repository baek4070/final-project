<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2>상품 정보</h2>
	<form id="registerForm" action="/board/register" method="post" enctype="multipart/form-data">
		<table id="boardRegisterWrap" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" placeholder="제목을 입력해주세요."/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer"/></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="register">물품등록</button>
					<button type="button" id="list">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$("#list").on("click", function(){
			location.href="/home/board/list";
		});
	});
</script>
</html>