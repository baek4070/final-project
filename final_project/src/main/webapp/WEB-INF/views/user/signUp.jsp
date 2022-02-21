<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>
	#signInBtn{
		width:100%;
		background-color:skyblue;
		color:white;
	}
	#signInBtn:hover{
		background-color:#ccc;
	}
	#emailCodeWrap{
		display:none;
	}
</style>
<form action="signUpPost" method="POST">
	<table border=1>
		<tr>
			<th colspan=2><h1>회원가입</h1></th>
		</tr>
		<tr>
			<td>아이디(email)</td>
			<td>
				<input type="text" name="u_id" id="u_id" autocomplete="off" required/>
				<button type="button" id="acceptEmail">이메일 인증</button>
				<div class="result"></div>
				<div id="emailCodeWrap">
					<input type="text" id="emailCode" />
					<button type="button" id="emailAcceptBtn">인증완료</button>
				</div>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="u_pw" id="u_pw" required/>
				<div class="result"></div>
			</td>
		</tr>	
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" name="u_repw" required/>
				<div class="result"></div>
			</td>
		</tr>	
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="u_name" id="u_name" required/> 
				<div class="result"></div>
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="text" name="u_birth" id="u_birth" required/>
				<div class="result"></div>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<div>
					<input type="text" name="u_post" id="u_post" class="addr" placeholder="우편번호" />
					<input type="button" value="주소찾기" onclick="daumPostCode();"/>
				</div>
				<input type="text" name="u_addr" id="u_addr" class="addr" placeholder="주소"/>
				<input type="text"  name="u_addr_detail" id="u_addr_detail" class="addr" placeholder="상세주소"/>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<div id="phoneWrap">
					<input type="text" name="u_phone" id="u_phone" />
					<div class="result"></div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" id="signInBtn" value="회원가입"/>
				<input type="button" onclick="location.href='${path}/user/signIn';" value="SIGN IN"/>
			</td>
		</tr>
	</table>
</form>
<!-- 주소용 script -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPostCode(){
		new daum.Postcode({
			oncomplete: function(data){
				console.log(data);
				
				var fullAddr = "";		// 최종 주소
				var extraAddr = "";		// 조합하는 주소
				
				// 지번인지 도로명인지
				if(data.userSelectedType == "R"){
					console.log("도로명 주소");
					fullAddr = data.roadAddress;
				}else{
					console.log("지번으로 된 주소");
					fullAddr = data.jibunAddress;
				}
				
				if(data.userSelectedType =="R"){
					// 법적 동명
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					
					if(data.buildingName !== ''){
						extraAddr += extraAddr !== '' ? ', '+data.buildingName : data.buildingName; 
					}
					
					fullAddr += (extraAddr !== '') ? '('+extraAddr+')' : '';
				}
				$("#u_post").val(data.zonecode);
				$("#u_addr").val(fullAddr);
				$("#u_addr_detail").focus();
			}
		}).open();
	}
</script>

<script>
	// data 입력했을때 형식에 맞게 입력했는지 여부 확인용
	function showMessage(elP,messageP,isCheck){
		var html = "<span style='margin-left:5px;font-size:12px;";
		html += isCheck ? "color:green;" : "color:red;";
		html += "'>'";
		html += messageP;
		html += "</span>";
		$(elP).html(html);
	}
	
	// 아이디용 script
	// 아이디용 script
	// 아이디용 script
	
	var boolUid = false;
	
	// 이메일 정규식
	var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	function checkRegex(elP,valP,regexP,messageP,ajaxP){
		if(regexP.test(valP) === false){
			showMessage(elP,messageP,false);
			return false;
		}else if(regexP.test(valP) !== false && ajaxP === null){
			showMessage(elP,"사용 가능합니다.",true);
			return true;
		}else{
			if(ajaxP !== null){
				checkUidAjax(elP);
			}
		}
	}
	
	$("#u_id").on("input",function(){
		boolEmailCode = false;
		var tempVal = $(this).val();
		console.log(tempVal);
		var elP = $(this).parent().find(".result");
		var message = "올바른 이메일 형식이 아닙니다.";
		boolUid = checkRegex(elP,tempVal,regexEmail,message,checkUidAjax());
	});
	
	function checkUidAjax(elP){
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/user/uidCheck",
			data : {
				u_id : $("#u_id").val()
			},
			dataType : "json",
			success : function(result){
				console.log(result);
				boolUid = result;
				showMessage(
						elP,
						boolUid ? "사용가능한 아이디입니다." : "이미 존재하는 아이디입니다.",
						boolUid
				)
				if(boolUid){
					$("#emailCodeWrap").show();
				}else{
					$("#emailCodeWrap").hide();
				}
			}
		});
	}
	
	// 인증 메일로 발송된 코드 담아놓는곳
	var emailCode = "";
	
	$("#acceptEmail").click(function(){
		$.ajax({
			type : "GET",
			dataType : "text",
			url : "${pageContext.request.contextPath}/user/checkEmail",
			data : {
				u_id : $("u_id").val()
			},
			success : function(code){
			// 쓸때는 지울것 확인용
				console.log(code);
			if(code){
				emailCode = code;
				alert("메일 발송 완료 \n 메일을 확인해주세요.");
				$("#emailCodeWrap").show();
			}else{
				alert("메일 전송 실패\n담당자에게 문의해주세요.");
			}
			}
		});
	});
	
	var boolEmailCode = false;
	
	$("#emailAcceptBtn").click(function(){
		var userCode = $("#emailCode").val();
		if(emailCode == userCode){
			console.log("일치");
			boolEmailCode = true;
			alert("이메일 인증완료");
		}else{
			console.log("불일치");
			boolEmailCode = false;
			alert("일치하지않습니다.\n다시 확인해주세요.");
		}
	});
	
	/* 비밀번호 확인용 */
	/* 비밀번호 확인용 */
	/* 비밀번호 확인용 */
	
	
	
	
</script>






















<script>
	var msg = '${message}';
	if(msg != ''){
		alert(msg);
	}
</script>
</body>
</html>