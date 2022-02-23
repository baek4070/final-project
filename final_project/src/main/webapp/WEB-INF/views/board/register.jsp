<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#img {
		max-width: 300px;
	}

	.img_cover {
		position: relative;
		cursor: pointer;
		width: 150px; height: 150px;
		padding: 10px;
		font-size: 1rem;
		font-weight: 400;
		line-height: 1.5;
		color: #333;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid #ced4da;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		border-radius: 0.25rem;
		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<h2>BoardRegister Page</h2>
	<form id="registerForm" action="/board/register" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요." required/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" name="writer" required/></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea class="form-control" name="content" required></textarea></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>
					<div class="img_cover" onclick="imgUpload()">
						<img id="img" alt="이미지 등록" src="${path}/resources/img/camera.png">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-primary" type="submit" id="register">물품등록</button>
					<button class="btn btn-primary" type="button" id="list">목록으로</button>
				</td>
			</tr>
		</table>
		<input id="uploadFile" type="file" name="uploadFile" style="display:none;"
		onchange="profileUpload(this.files)"/>
	</form>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$("#list").on("click", function(){
			location.href="/board/list";
		});
	});
	
	function imgUpload() {
		$("#uploadFile").click();
	}
	
	function profileUpload(files){
		console.log(files[0]);
		var formData = new FormData();
		formData.append("file",files[0]);
		// encType = urlEncoded
		$.ajax({
			type : "POST",
			url : "uploadAjax",
			data : formData,
			// key=value 형태의 Query String으로 변환을 하지않는다.
			processData : false,
			contentType : false,
			dataType : "text",
			success : function(result){
				// alert(result);
				$("#img").attr("src","${path}/resources/img/"+result);
				//$("#uimage").val(result);
				//$("#deleteImage").fadeIn("fast");
			}
		});
	}
</script>
</html>