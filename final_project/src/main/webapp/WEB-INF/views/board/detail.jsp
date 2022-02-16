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
	<h2>BoardDetail Page</h2>
	<table>
		<tr>
			<td>#</td>
			<td>${board.bno}</td>
			<td>
				<input type="text" name="bno" value='<c:out value="${board.bno}"/>' readonly/>
			</td>
		</tr>
	</table>
	<div class="form-group">
		<label>Bno</label> <input class="form-control" name="bno"
		value='<c:out value="${board.bno}"/>' readonly/>
	</div>
	<div class="form-group">
		<label>Title</label> <input class="form-control" name="title"
		value='<c:out value="${board.title}"/>' readonly/>
	</div>
	<div class="form-group">
		<label>content</label> <input class="form-control" name="content"
		value='<c:out value="${board.content}"/>' readonly/>
	</div>
	<div class="form-group">
		<label>Writer</label> <input class="form-control" name="writer"
		value='<c:out value="${board.writer}"/>' readonly/>
	</div>
	<div class="form-group">
		<label>Regdate</label> <input class="form-control" name="regdate"
		value='<f:formatDate pattern="yyyy-MM-dd"
               value="${board.regdate}"/>' readonly/>
	</div>
	<div class="form-group">
		<label>Updatedate</label> <input class="form-control" name="updatedate"
		value='<f:formatDate pattern="yyyy-MM-dd"
        value="${board.updateDate}"/>' readonly/>
	</div>
	<button data-oper="modify">Modify</button>
	<button data-oper="list">List</button>
	<form id="operForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>' />
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>' /> 
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'/>
 	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			var operForm = $("#operForm");
			
			$("button[data-oper='modify']").on("click",function(e){
				operForm.attr("action","/board/modify").submit();
			});
			
			$("button[data-oper='list']").on("click",function(e){
				operForm.find("#bno").remove();
				operForm.attr("action","/board/list")
				operForm.submit();
			});
		});
	</script>
</body>
</html>