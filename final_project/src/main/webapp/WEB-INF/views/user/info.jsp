<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/> 
<form action="userInfo" method="POST">
	<table border=1>
		<tr>
			<th colspan=2><h1>회원정보</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="u_id" id="u_id" value="${user.u_id}" readonly/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="u_name" id="u_name" value="${user.u_name}" readonly/> 
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="text" name="u_birth" class="form-control" id="u_birth" value="${user.u_birth}"/>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<div class="row">
					<div class="col-md-8">
						<input type="text" class="form-control" name="u_addr_post" id="u_addr_post" value="${user.u_addr_post}"/>
					</div>
				</div>
				<br/>
				<input type="text" class="form-control" name="u_addr" id="u_addr" value="${user.u_addr}"/>
				<br/>
				<input type="text" class="form-control" name="u_addr_detail" id="u_addr_detail" value="${user.u_addr_detail}"/>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="u_phone" class="form-control" id="u_phone" value="${user.u_phone}"/>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="수정" onclick="location.href='${path}/home/user/signUpdate';"/>
				<input type="button" value="홈" onclick="location.href='${path}/home';"/>
			</td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>