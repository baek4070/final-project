<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<link href="${path}/resources/css/bootstrap.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<style>
	.remote{
		position: fixed;
		right: 0.1%;
		bottom: 50px;
		text-align:center;
		width: 120px;
		z-index:999;
	}
	
	.accordion{
		padding-left : 0;
	}
	

</style>
</head>
<body>
<div id="dialog-message" title="쪽지" style='display:none'>
	<table>
		<tr>
			<td>보낸이</td>
			<td><p id="sender"></p></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><p id="title"></p></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="content" readonly></textarea></td>
		</tr>
	</table>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="position:fixed; top:0%; width:100%; z-index:999; min-height:72px;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">사이트</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
    <sec:authorize access="isAuthenticated()">
	<sec:authentication var="user" property="principal.user"/>
      <c:if test="${!empty user}">
      <ul class="navbar-nav ms-auto">
      <sec:authorize access="hasAnyRole('ROLE_MASTER','ROLE_ADMIN')">
      	<li class="nav-item navbar-text">
      		<a class="nav-link" href="${path}/user/master">MANAGEMENT</a>
      	</li>
      	</sec:authorize>
      	<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          	<img style="width:35px; height:auto;" src="../resources/css/bells.png"/>
          </a>
          <div class="dropdown-menu" id="bell">
          	<div>알림<div class="ms-auto"><a href="${path}/home/bell.jsp">더보기</a></div></div>
        <!--
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
          <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a> -->
          </div>
        </li>
<%--       	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signIn"><img style="width:35px; height:auto;" src="../resources/css/bells.png"/></a>
      	</li> --%>
      	<li class="nav-item navbar-text">
      		<a class="nav-link wish" href="#">찜목록</a>
      	</li>
      	<li class="nav-item navbar-text">
      		<a class="nav-link" href="${path}/user/info">${user.u_name}님 반갑습니다.</a>
      	</li>
       	<li class="nav-item navbar-text">
      		<a class="nav-link" href="${path}/user/signOut">로그아웃</a>
      	</li>
      </ul>
      </c:if>
      </sec:authorize>
      <sec:authorize access="isAnonymous()">
      <ul class="navbar-nav ms-auto">
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signIn">로그인</a>
      	</li>
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signUp">회원가입</a>
      	</li>
      </ul>
      </sec:authorize>
    </div>
  </div>
  <div class="remote">
  	<button type="button" class="btn btn-secondary" id="remoteTop" >△</button><br/><br/>
  	<button type="button" class="btn btn-secondary" id="remoteBottom" >▽</button>
  </div>
</nav>
<div class="col-10 offset-1 my-2">
	<div class="row" style="margin-top:100px;">
	<div class="col-lg-9" style="margin-top:5px;">
		<h1>사이트 아이콘</h1>
	</div>
		<div class="col-lg-3 ms-md-auto" style="margin-top:16px;">
		<form action="total" id="total">
			<div class="input-group mb-3">
	    		<input type="text" class="form-control" name="searchValue" id="searchValue" placeholder="상품 검색" >
	    		<button class="btn btn-primary totalSearch" type="button" id="button-addon2">검색</button>
	    	</div>
	    	</form>
    	</div>
    </div>
</div>
<div class="col-10 offset-1 ">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">홈</a>
    <div class="navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="${path}/qnaboard/list">Q&A</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/board/list?tradeType=buy">삽니다(전체)</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/board/list?tradeType=sell">팝니다(전체)</a>
        </li>
        <li class="nav-item">
        <form action="${path}/home/myList" method="post" id="wishGo">
          <a class="nav-link wish" href="#">찜목록</a>
          <input type="hidden" name="uno" value="${user.uno}"/>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        </li>
      </ul>
    </div>
  </div>
</nav>
</div>
<div class="row col-10 offset-1">
<div class="accordion col-lg-2" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        삽니다
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=one'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=one">상품1</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=two'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=two">상품2</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=three'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=three">상품3</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=four'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=four">상품4</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=buy&category=five'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=buy&category=five">상품5</a>
      	</li>
      </ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        팝니다
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=sell&category=one'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=sell&category=one">상품1</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=sell&category=two'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=sell&category=two">상품2</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=sell&category=three'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=sell&category=three">상품3</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=sell&category=four'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=sell&category=four">상품4</a>
      	</li>
      </ul>
      <ul class="navbar-nav me-auto">
      	<li class="nav-item page-link mb-1" style="text-align:center;" onclick="location.href='${path}/board/list?tradeType=sell&category=five'">
      		<a class="nav-item" style="text-decoration:none;" href="${path}/board/list?tradeType=sell&category=five">상품5</a>
      	</li>
      </ul>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        문의하기
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      </div>
    </div>
  </div>
   <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        Accordion Item #4
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
    <div class="accordion-item">
    <h2 class="accordion-header" id="headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        Accordion Item #5
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
	</div>
<div class="contentWrap col-lg-10 my-5">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var exist = '${mslist}'
console.log(exist);

if(exist != ''){
	$(document).on('ready',function(){
		window.open('${path}/message/msgWrite?mno=${mslist.mno}', '_blank', ' scrollbars=no, location=no,resizable=no, width=800, height=600');
	});
}


$(document).on('ready',function(){
	var uno = '${user.uno}'
	console.log(uno);
	if(uno !== ''){
		var url = "${path}/bell/"+uno
		$.getJSON(url,function(data){
			console.log(data);
			printList(data);
		});
	}
});

function printList(list){
	var str = "<div class='dropdown-divider'></div><a class='dropdown-item href='#' >등록된 알림이 없습니다.</a>";
	if($(list).length !== 0){
		str = "";
		$(list).each(function(){
			let bno = this.bno;
			let uno = this.uno;
			let mno = this.mno;
			let sender = this.sender;
			if(this.checked == 'n'){
				if(bno >= 1){
					str += "<div class='dropdown-divider'></div>"
		        	str += "<a class='dropdown-item new' href='${path}/selected?bno="+bno+"&uno="+uno+"'>"+bno+"번 글에 댓글이 추가되었습니다.</a>"
				}else if(mno >= 1){
					str += "<div class='dropdown-divider'></div>"
					str += "<a class='dropdown-item message new' href='${path}/called?uno="+uno+"&mno="+mno+"' >"+sender+"님에게서 쪽지가 도착했습니다.</a>"
				}
			}
		});
	}
	console.log(str);
	$("#bell").append(str);
}

/*  $(".message").on("click",function(event){
	 event.preventDefault();
	$.ajax({
		type : "get",
		url : "${path}/called",
		headers : {
			"Content-Type" : "application/json"
		},
		dataType : "text",
		data : JSON.stringify({
			uno : this.uno,
			mno : this.mno
		}),
		success : function(data){
			 $('#dialog-message').dialog({
					modal: true, 
					buttons: {
						"PHP": function() { $(this).dialog('close'); },
						"ASP": function() { $(this).dialog('close'); },
						"JSP": function() { $(this).dialog('close'); }
					}
				});
		}
	}); 
}); */

 $(".message").click(function(event){
	event.preventDefault();
	window.open(this.href, '_blank', ' scrollbars=no, location=no,resizable=no, width=800, height=600'); 
}); 

$(".totalSearch").click(function(event){
	event.stopPropagation();
	if($("#searchValue").val() == "" || $("#searchValue").val() == null){
		alert("검색어를 입력해주세요");
		return;
	}
	total.submit();
});

$(".wish").click(function(event){
	event.stopPropagation();
	$("#wishGo").submit();
});

/* <!--  $('#toggle').click(function(event){
event.stopPropagation();
$('#drop').toggle();
});

$(document).click(function(){
$('#drop').hide();
});

--!> */

$("#remoteTop").click(function(){
    $(window).scrollTop(0);
});

$("#remoteBottom").click(function(){
	 window.scrollTo(0,document.body.scrollHeight);
	
});



</script>
