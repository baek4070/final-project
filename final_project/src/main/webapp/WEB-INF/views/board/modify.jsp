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
	<h2>BoardModify Page</h2>
	<form id="modifyForm" action="" method="get">
		<table>
			<tr>
				<td>글번호</td>
				<td><input type="text" name="bno" value="${board.bno}" readonly/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" value="${board.title}"/>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="writer" value="${board.writer}"/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content">${board.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" data-oper="modify">수정</button>
					<button type="submit" data-oper="list">목록</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/> 
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			
			var modifyForm = $("#modifyForm");
			
			$("button").on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				
				switch(operation) {
					case "modify":
						modifyForm.attr("action", "/board/modify").attr("method", "post");
						break;
					case "list":
						modifyForm.attr("action", "/board/list").attr("method", "get");
						break;
				}
				modifyForm.submit();
			});
		});
	</script>
</body>
</html>