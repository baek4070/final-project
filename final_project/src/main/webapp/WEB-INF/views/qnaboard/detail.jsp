<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h1 class="text-center">QnA</h1>
	<table class="table table-hover">
		<tr>
			<th>제목</th>
			<td colspan="5" class="text-center">${vo.title}<td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.userNickname}<td>
			<th>작성일자</th>
			<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/><td>
			<th>조회수</th>
			<td>${vo.viewcnt}<td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5" class="text-center">${vo.content}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="5" class="text-center">${vo.filename}</td>
		</tr>
	</table>
	<sec:authentication property="principal" var="pinfo"/>
	<sec:authorize access="isAuthenticated()">
	<c:if test="${pinfo.username eq vo.userId or pinfo.username eq 'qwe@qwe' }">
	<a href="modify?qno=${vo.qno}" class="btn btn-outline-danger" >수정</a>
	<a href="#" id="delete" class="btn btn-outline-danger" data-uri="delete?qno=${vo.qno}" >삭제</a>
	</c:if>
	</sec:authorize>
	<sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
	<a href="reply?qno=${vo.qno}" class="btn btn-outline-danger" >답글</a>
	</sec:authorize>
	<a href="list" class="btn btn-outline-danger" >목록으로</a>
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type='text/javascript'>
		$(document).ready(function(){
		    $("#delete").on('click', function() {  // 클래스값이 delete인 엘리먼트가 눌리면?
		        if(confirm("정말로 삭제하시겠습니까?")) {  // 확인 창이 열림
		            location.href = $(this).data('uri');  // data-uri 속성값으로 URL 호출
		        }
		    });
		});
	</script>
</body>
</html>