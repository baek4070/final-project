<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<form action="resister" method="POST" enctype="multipart/form-data" >
				<sec:authentication property="principal" var="pinfo"/>
			<input type="hidden" name="userId" value="${pinfo.username}"/>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table border=1>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userNickname" value="${pinfo.user.u_name}" readonly required/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="30" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile" multiple/ ></td>
			</tr>
			<tr>
				<td class='uploadResult'> 
					<ul>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" />
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>