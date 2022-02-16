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
<h2>Board Modify Page</h2>
	<form role="form" action="/board/modify" method="post">
		<div class="form-group">
		<label>Bno</label> <input class="form-control" name="bno"
		value='<c:out value="${board.bno}"/>' readonly/>
	</div>
	<div class="form-group">
		<label>Title</label> <input class="form-control" name="title"
		value='<c:out value="${board.title}"/>' />
	</div>
	<div class="form-group">
		<label>content</label> <textarea class="form-control" name="content" rows="3">
		<c:out value="${board.content}"/></textarea>
	</div>
	<div class="form-group">
		<label>Writer</label> <input class="form-control" name="writer"
		value='<c:out value="${board.writer}"/>' readonly/>
	</div>
	<%-- <div class="form-group">
		<label>Regdate</label> <input class="form-control" name="regdate"
		value='<f:formatDate pattern="yyyy-MM-dd"
               value="${board.regdate}"/>' readonly/>
	</div>
	<div class="form-group">
		<label>Updatedate</label> <input class="form-control" name="updatedate"
		value='<f:formatDate pattern="yyyy-MM-dd"
        value="${board.updateDate}"/>' readonly/>
	</div> --%>
	<button type="submit" data-oper="modify">Modify</button>
	<button type="submit" data-oper="remove">Remove</button>
	<button type="submit" data-oper="list">List</button>
	
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>' />
	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' />
	</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form");
		$("button").on("click",function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation == "remove"){
				formObj.attr("action","/board/remove");
			} else if(operation == "list"){
				// move to list
				formObj.attr("action", "/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			formObj.submit();
		});
	});
</script>
</html>