<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>

<form action="signUpdatePost" method="POST">
	<input type="hidden" name="uno" id="uno"/>
	<table border=1>
		<tr>
			<th colspan=2><h1>ȸ������ ����</h1></th>
		</tr>
		<tr>
			<td>���̵�</td>
			<td>
				<input type="text" name="u_id" id="u_id" value="${userInfo.u_id}" />
			</td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td>
				<input type="text" name="u_name" id="u_name" value="${userInfo.u_name}" /> 
			</td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td>
				<input type="text" name="u_pw" id="u_pw" value="${userInfo.u_pw}" /> 
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="Ȩ" onclick="location.href='${path}/home';"/>
				<input type="submit" value="�����ϱ�" /> 
			</td>
		</tr>
	</table>
</form>

</body>
</html>