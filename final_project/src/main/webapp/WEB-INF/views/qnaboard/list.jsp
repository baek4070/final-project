<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h1 class="text-center" >QnA</h1>
	<table class="table table-hover" border=1>
		<tr>
			<th scope="row">번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>첨부파일</th>
		</tr>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="qnaboard" items="${list}">
					<tr style="cursor:pointer;" onclick="location.href='detail?qno=${qnaboard.qno}'">
						<td>${qnaboard.qno}</td>
						<td>${qnaboard.title}</td>
						<td>${qnaboard.userNickname}</td>
						<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaboard.regdate}"/></td>
						<td>${qnaboard.filename}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>작성된 글이 없습니다</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<!-- 페이징 블럭 -->
		<tr>
			<th colspan="5">
				<c:if test="${pm.prev}">
					<a href="list?page=${pm.startPage-1}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" 
								   end="${pm.endPage}">
				   <a href="list${pm.search(i)}">[${i}]</a>
				</c:forEach>
				<c:if test="${pm.next}">
					<a href="list?page=${pm.endPage+1}">[다음]</a>
				</c:if>
			</th>
		</tr>
	</table>
	<a href="write" class="btn btn-outline-danger" >글쓰기</a>
</body>
</html>