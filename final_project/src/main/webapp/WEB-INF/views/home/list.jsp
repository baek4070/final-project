<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
<table class="table table-hover">
	<tr>
		<th>Q&A</th>
	</tr>
	<c:if test="${!empty qBoard}">
	<c:forEach var="question" items="${qBoard}">
		<tr>
    		<td>${question.title}</td>
    	</tr>
    	<tr>
      		<td>${question.content}</td>
    	</tr>
    </c:forEach>
    </c:if>
    <c:if test="${empty qBoard}">
    <tr class="table-active">
      <td>내용이 없습니다.</td>
    </tr>
    </c:if>
 </table>
</div>
</body>
</html>