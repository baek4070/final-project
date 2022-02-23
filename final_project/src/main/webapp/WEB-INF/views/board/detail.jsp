<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.title {
		max-width: 200px;
	}

	img {
		max-width: 700px;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2>BoardDetail Page</h2>
	<form id="detailForm" action="" method="get">
		<table class="table table-hover">
			<tr>
				<td class="title">글번호</td>
				<td><input type="text" class="form-control" name="title" value="${board.bno}" readonly/></td>
			</tr>
			<tr>
				<td class="title">제목</td>
				<td>
					<input type="text" class="form-control" name="title" value="${board.title}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="title">작성자</td>
				<td>
					<input type="text" class="form-control" name="writer" value="${board.writer}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="title">내용</td>
				<td>
					<textarea class="form-control" readonly>${board.content}</textarea>
				</td>
			</tr>
			<tr>
				<td class="title">이미지</td>
				<td class="col-lg-4">
					<img id="img" alt="이미지" src="${pageContext.request.contextPath}/resources/img/${board.fileName}">
				</td>
			</tr>
			<tr>
				<td class="title" colspan="3">
					<button class="btn btn-primary" type="submit" data-oper="modify">수정</button>
					<button class="btn btn-primary" type="submit" data-oper="remove">삭제</button>
					<button class="btn btn-primary" type="submit" data-oper="list">목록</button>
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
			
			var detailForm = $("#detailForm");
			
			$("button").on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				
				switch(operation) {
					case "modify":
						detailForm.attr("action", "/board/modify").attr("method", "get");
						break;
					case "remove":
						detailForm.attr("action", "/board/remove").attr("method", "post");
						break;
					case "list":
						detailForm.attr("action", "/board/list").attr("method", "get");
						break;
				}
				detailForm.submit();
			});
		});
	</script>
</body>
</html>