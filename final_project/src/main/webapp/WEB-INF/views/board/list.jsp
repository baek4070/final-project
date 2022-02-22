<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<style>
	img {
		width: 302px; height: 150px;
		object-fit: contain;
	}

	.row {
		align-content: space-around;
		margin: auto;
	}
	
	.pagination {
		display: flex;
		align-items: center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2>BoardList Page</h2>
	<form action="register" method="get">
		<button class="btn btn-primary">새 게시물 작성</button>
	</form>
		<div class="row">
		<c:choose>
	  	 	<c:when test="${!empty list}">
	  	 		<c:forEach items="${list}" var="board">
	  	 			<div class="card border-primary mb-3 p-0 mx-2" style="max-width: 19rem; height: 200px;" onclick="location.href='detail?bno=${board.bno}'">
			  		<div class="card-body p-0" style="cursor: pointer;">
						<img alt="이미지" src="${pageContext.request.contextPath}/resources/img/${board.fileName}">
			  		</div>
		  				<div style="cursor: pointer; background-color: #ccc;">
		  					<div>${board.title}</div>
	  	 					<div class="boardWriter">${board.writer}</div>
		  				</div>
					</div>
	  	 			<%-- <div class="col-lg-4">
	  	 				<div class="boardItem mx-2 my-4" onclick="location.href='detail?bno=${board.bno}'">
	  	 					<div>${board.title}</div>
	  	 					<div class="boardWriter">${board.writer}</div>
	  	 				</div>
					</div> --%>
	  	 		</c:forEach>
	  	 	<!-- 페이징 블럭 시작 -->
	  	 	<ul class="pagination">
				<c:if test="${pm.prev}">
					<li class="page-item">
      					<a class="page-link" href="${pm.startPage-1}">&laquo;</a>
    				</li>
				</c:if>
				<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
					<li class="page-item">
      					<a class="page-link" href="${num}">${num}</a>
    				</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item">
						<a class="page-link" href="${pm.endPage+1}">&raquo;</a>
					</li>
				</c:if>
			</ul>
	  	 	<!-- 페이징 블럭 끝 -->
	  	 	</c:when>
	  	 	<c:otherwise>
	  	 		<h3>등록된 게시물이 없습니다.</h3>
	  	 	</c:otherwise>
   		</c:choose>
	</div>
	<%-- <hr/>
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
				  		<td>${board.bno}</td>
				  		<td><a href="detail?bno=${board.bno}">${board.title}</a></td>
				  		<td>${board.writer}</td>
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
						<c:forEach var="num" begin="${pm.startPage}" end="${pm.endPage}">
							<a href="${num}">[${num}]</a>
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
	</table> --%>
	<form id="listForm">
		<input type="hidden" name="page" value="${pm.cri.page}"/>
		<input type="hidden" name="perPageNum" value="${pm.cri.perPageNum}"/>
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			var result = '<c:out value="${result}"/>';
			
			registerCheck(result);
			
			history.replaceState({}, null, null);
			
			function registerCheck(result) {
				if(result === '' || history.state) {
					return;
				}
				alert(result);
			}
			
			// 페이징 블록 클릭
			$(".pagination a").on("click", function(e){
				e.preventDefault();
				
				var targetPage = $(this).attr("href");
				var listForm = $("#listForm");
				listForm.find("[name='page']").val(targetPage);
				listForm.attr("action", "list");
				listForm.submit();
			});
		});
	</script>
	</div>
	<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
</body>
</html>