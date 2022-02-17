<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../home/home.jsp"/>  
<form action="userInfo" method="POST">
	<table border=1>
		<tr>
			<th colspan=2><h1>회원정보</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="u_id" id="u_id" value="${userInfo.u_id}" readonly/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="u_name" id="u_name" value="${userInfo.u_name}" readonly/> 
			</td>
			
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="수정" onclick="location.href='${path}/home/user/signUpdate';"/>
				<input type="button" value="홈" onclick="location.href='${path}/home';"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>