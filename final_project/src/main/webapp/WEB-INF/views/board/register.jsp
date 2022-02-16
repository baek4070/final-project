<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 정보</h2>
	<form action="/board/register" method="post">
		<table id="boardRegisterWrap" border="1">
			<!-- 제목 -->
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" placeholder="제목을 입력해주세요."/>
				</td>
			</tr>
			<!-- 상품설명 -->
			<tr>
				<td>상품설명</td>
				<td>
					<textarea name="content" rows="10" cols="35"></textarea>
				</td>
			</tr>
			<!-- 작성자 -->
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="writer"/>
				</td>
			</tr>
			<!-- 버튼 -->
			<tr>
				<td>
					<div id="buttonWrap">
						<button type="submit" id="register">물품등록</button>
						<button type="button" id="list">목록으로</button>
					</div>
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