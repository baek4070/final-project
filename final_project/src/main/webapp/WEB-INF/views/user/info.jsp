<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

 <sec:authorize access="isAuthenticated()">
 <sec:authentication var="user" property="principal.user"/>
<form id="signUpdateForm" action="${pageContext.request.contextPath}/user/signUpdatePost" method="POST">
	<input type="hidden" name="uno" id="uno" value="${user.uno}"/>
	<table border=1>
		<tr>
			<th colspan=2><h1>ȸ������ ����</h1></th>
		</tr>
		<tr>
			<td>���̵�(email)</td>
			<td>
				<input type="text" class="form-control" name="u_id" id="u_id" autocomplete="off" value="${user.u_id}"/>
			</td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td>
				<input type="text" class="form-control" name="u_pw" id="u_pw" value="${user.u_pw}" autocomplete="off"/>
			</td>
		</tr>
		<tr>
			<td>�̸�(2~6���̳�)</td>
			<td>
				<input type="text" name="u_name" class="form-control" id="u_name" value="${user.u_name}"/>
			</td>
		</tr>
		<tr>
			<td>�������(ex-19820607)</td>
			<td>
				<input type="text" name="u_birth" class="form-control" id="u_birth" value="${user.u_birth}" autocomplete="off"/>
			</td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td>
				<div class="row">
					<div class="col-md-8">
						<input type="text" class="form-control" name="u_addr_post" id="u_addr_post" value="${user.u_addr_post}"/>
					</div>
					<div class="col-md-4">
						<input type="button" class="form-control btn btn-default" onclick="sample6_execDaumPostcode();" value="�ּ�ã��"/>
					</div>
				</div>
				<br/>
				<input type="text" class="form-control" name="u_addr" id="u_addr" value="${user.u_addr}"/>
				<br/>
				<input type="text" class="form-control" name="u_addr_detail" id="u_addr_detail" value="${user.u_addr_detail}"/>
			</td>
		</tr>
		<tr>
			<td>��ȭ��ȣ(-���� ���ڸ�)</td>
			<td>
				<input type="text" name="u_phone" class="form-control" id="u_phone" value="${user.u_phone}"/>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="button" value="Ȩ" onclick="location.href='${path}/'"/>
				<input type="submit" value="�����ϱ�" /> 
			</td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</sec:authorize>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
/* 
	windows.onload(function(){
		if(${check} == false){
			alert('��������');
		};
	});
	
 */
	function sample6_execDaumPostcode(){
		new daum.Postcode({
			oncomplete : function(data){
				// �ּ� �˻� ���
				console.log(data);
				
				var fullAddr='';	// ���� �ּ�
				var extraAddr = ''; // ������ �ּ�
				
				// ������ �ּ� Ÿ�Կ� ���� �ּҰ��� �����´�
				if(data.userSelectedType === 'R'){ // ���θ� �ּ�
					fullAddr = data.roadAddress;
				}else{
					// ���� �ּ�
					fullAddr = data.jibunAddress;
				}
				
				// ���θ� �ּ� Ÿ�� ����
				if(data.userSelectedType === 'R'){
					// ���������� ������ �������� �߰�
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					
					// �ǹ����� ���� �Ѵٸ�..�ǹ��� �߰�
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ?','+data.buildingName : data.buildingName);
					}
					
					fullAddr += (extraAddr !== '' ? ' ('+extraAddr+')' : '');
				}
				// �����ȣ ����
				$("#u_addr_post").val(data.zonecode);
				// ��ü �ּ� ����
				$("#u_addr").val(fullAddr);
				// ���ּ� �ۼ�
				$("#u_addr_detail").focus();
			}
		}).open();
	}

	$("#u_birth").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : "yymmdd",
		dayNames : ['������','ȭ����','������','�����','�ݿ���','�����','�Ͽ���'],
		dayNamesMin : ['��','ȭ','��','��','��','��','��'],
		monthNamesShort : ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] 	
	});
	
	
	$.validator.addMethod("regex",function(value,element,regexpr){
		return regexpr.test(value);
	});
	
	var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;			
	
	
	$("#signUpdatePost").validate({
		rules : {
			u_id : {
				required : true,
				email : true,
				remote : {
					type : "POST",
					url : "${pageContext.request.contextPath}/user/uidCheck",
				}
			},
			u_pw : {
				required : true, 
				minlength : 8,
				maxlength : 16,
				regex : regexPass
			},
			u_repw : {
				required : true, 
				minlength : 8,
				maxlength : 16,
				equalTo : "#u_pw"
			},
			u_name : {
				required : true,
				rangelength : [2,6]
			},
			u_birth : {
				required : true
			},
			u_addr_post : {
				required : true
			},
			u_addr : {
				required : true
			},
			u_addr_detail : {
				required : true
			},
			u_phone : {
				required : true,
				regex : regexMobile
			}
		},
		messages : {
			u_id : {
				required : "�̸���(���̵�)�� �ۼ����ּ���.",
				email : "�ùٸ� �̸��� ������ �ƴմϴ�.",
				remote : "�̹� �����ϴ� ID�Դϴ�."
			},
			u_pw : {
				required : "��й�ȣ�� �ۼ����ּ���.",
				minlength : "��й�ȣ�� �ּ� 8���� �̻��Դϴ�.",
				maxlength : "��й�ȣ�� �ִ� 16���ڸ� �����մϴ�.",
				regex : "��й�ȣ�� Ư�����ڿ� ���ڸ� �����ؾ��մϴ�."
			},
			u_repw : {
				required : "��й�ȣ�� �ۼ����ּ���.",
				minlength : "��й�ȣ�� �ּ� 8���� �̻��Դϴ�.",
				maxlength : "��й�ȣ�� �ִ� 16���ڸ� �����մϴ�.",
				equalTo : "��й�ȣ�� ��ġ���� �ʽ��ϴ�."
			},
			u_name : {
				required : "�̸��� �ۼ��� �ּ���.",
				rangelength : $.validator.format(
					"���� ���̰� {0}���� {1}������ ���� �Է��ϼ���."
				)
			},
			u_birth : {
				required : "��������� �ۼ����ּ���."
			},
			u_addr_post : {
				required : "�����ȣ�� Ȯ���� �ּ���."
			},
			u_addr : {
				required : "�ּҸ� Ȯ���� �ּ���."
			},
			u_addr_detail : {
				required : "���ּҸ� �Է����ּ���."
			},
			u_phone : {
				required : "��ȭ��ȣ�� �Է����ּ���.",
				regex : "�ùٸ� ��ȭ��ȣ ������ �ƴմϴ�."
			}
		},
//		debug : true,	// Ȯ�� �� submit �������� ����
		errorElement : "span",
		errorClass : "text-danger"
	});
	
	$.validator.setDefaults({
		submitHandler : function(){
			$("#signUpdateForm").submit();
		}
	});
	
	// ���� �ڵ� �����
	var emailCode = "";
	
	$("#acceptEmail").click(function(){
		$.ajax({
			type : "GET",
			dataType : "text",
			url : "${pageContext.request.contextPath}/user/checkEmail",
			data : {
				u_id : $("#u_id").val()
			},
			success : function(code){
				// Ȯ�ο� �������
				console.log(code);
				if(code){
					emailCode = code;
					alert("���� �߼ۿϷ�");
					$("#emailCodeWrap").show();
				}else{
					alert("�߼� ����");
				}
			}
		});
	});
	
	var boolEmailCode = false;
	
	$("#emailAcceptBtn").click(function(){
		var userCode =  $("#emailCode").val();
		if(emailCode == userCode){
			console.log("��ġ");
			boolEmailCode = true;
			alert("�̸��� ���� �Ϸ�");
		}else{
			console.log("����ġ");
			boolEmailCode = false;
			alert("�ٽ� �������ֽʽÿ�.");
		}
	});
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(
				// "${_csrf.parameterName}",
				"${_csrf.headerName}",
				"${_csrf.token}");
	});
	
</script>
</body>
</html>