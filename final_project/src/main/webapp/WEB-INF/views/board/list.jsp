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
	<h2>BoardList Page</h2>
	<form action="register" method="get">
		<button>새 게시물 작성</button>
	</form>
	<hr/>
	<table border="1" style="border-collapse: collapse;">
	    <tr>
	        <th>#</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>수정일</th>
	    </tr>
	    <!-- 게시글 목록 출력 시작 -->
   		<c:choose>
	  	 	<c:when test="${!empty list}">
	  	 		<c:forEach items="${list}" var="board">
			  		<tr>
				  		<td><c:out value="${board.bno}"/></td>
				  		<td>
				  			<a href="detail?bno=${board.bno}">
				  			<c:out value="${board.title}"/></a>
				  		</td>
				  		<td><c:out value="${board.writer}"/></td>
				  		<td><f:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
				  		<td><f:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
			  		</tr>
	  			</c:forEach>
	  			<!-- 페이징 블럭 -->
				<tr>
					<th colspan="5" id="pagination">
						<c:if test="${pm.prev}">
							<a href="${pm.startPage-1}">[이전]</a>
						</c:if>
						<c:forEach var="i"
						 begin="${pm.startPage}"
						 end="${pm.endPage}">
							<a href="${i}">[${i}]</a>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="${pm.endPage+1}">[다음]</a>
						</c:if>
					</th>
				</tr>	
	  	 	</c:when>
	  	 	<c:otherwise>
	  	 		<tr>
	  	 			<td colspan="5">등록된 게시물 없음</td>
	  	 		</tr>
	  	 	</c:otherwise>
   		</c:choose>
   		<!-- 게시글 목록 출력 끝 -->
	</table>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			var result = '<c:out value="${result}"/>';
			
			registerCheck(result);
			
			history.replaceState({},null,null);
			
			function registerCheck(result) {
				if(result === '' || history.state) {
					return;
				}
				alert("게시물이 등록되었습니다.");
			}
			
			$("#pagination a").on("click",function(event){
				// a tag의 기본 이벤트 (hyperlink) 이벤트 무시
				event.preventDefault();
				var targetPage = $(this).attr("href");
				// alert(targetPage);
				var listForm = $("#listForm");
				listForm.find("[name='page']").val(targetPage);
				listForm.attr("action","listPage");
				listForm.submit();
			});
		});
	</script>
</body>
</html>