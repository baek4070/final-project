<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h1 class="text-center" >질문과 답하기</h1>
	<table class="table table-hover" border=1>
		<tr>
			<th scope="row">번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>마지막수정<th>
			<th>첨부파일</th>
		</tr>
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="qnaboard" items="${list}">
					<tr style="cursor:pointer;" onclick="location.href='detail?qno=${qnaboard.qno}'">
						<td>${qnaboard.root}</td>
						<td>${qnaboard.title}</td>
						<td>${qnaboard.userNickname}</td>
						<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaboard.regdate}"/></td>
						<c:choose>
							<c:when test="${qnaboard.regdate eq qnaboard.updatedate}">
								<td></td>
							</c:when>
							<c:otherwise>
								<td><f:formatDate pattern="MM월dd일 HH시" value="${qnaboard.updatedate}"/></td>
							</c:otherwise>
						</c:choose>
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
	
	<select>
		<option value="n">미선택</option>
		<option value="t">제목</option>
		<option value="c">내용</option>
		<option value="tc">제목+내용</option>
	</select>
	<input type="text" id="keyword"/>
	<input type="button" value="검색" id="searchBtn"/>
	<hr/>
	<sec:authorize access="isAuthenticated()">
	
		<a href="write" class="btn btn-outline-danger" >글쓰기</a>
	
	</sec:authorize>
	
	
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		// 검색 요청
		$("#searchBtn").click(function(){
			var searchType = $("select option:selected").val();
			var keyword = $("#keyword").val();
			console.log("searchType : " + searchType);
			console.log("keyword : " + keyword);
			location.href="list?searchType="+searchType+"&keyword="+keyword;
		});
		
	</script>
</body>
</html>