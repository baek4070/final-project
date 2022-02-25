<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet" />
<style>
	.remote{
		position: fixed;
		right: 0.1%;
		bottom: 50px;
		text-align:center;
		width: 120px;
		z-index:999;
	}
	
	#navLeft{
		max-height:300px;
		border: 0.5px solid gray;
		border-radius:5px;
		max-width: 200px;
		padding:0;
	}
	
	.nav-item{
		margin : 5px 0 5px 0px;
		cursor:pointer;
	}
	
	#navLeft ul li a{
		padding-left:10px;
	}
	
	#navLeft ul li a:hover{
		background-color:gray;
		color:white;
		text-align:center;
		padding-left:0px;
	}
	
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">사이트</a>
    <div class="navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="${path}">홈
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/board/list">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${path}/qnaboard/list">QnA</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">등등...</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" id="toggle" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu" id="drop" aria-labelledby="toggle">
            <a class="dropdown-item" href="user/signIn">Action</a>
            <a class="dropdown-item" href="user/signUp">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
      <c:choose>
      <c:when test="${!empty userInfo}">
      <ul class="navbar-nav ms-md-auto">
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/info">${userInfo.u_id}님 반갑습니다.</a>
      	</li>
       	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signOut">로그아웃</a>
      	</li>
      </ul>
      </c:when>
      <c:otherwise>
      <ul class="navbar-nav ms-md-auto">
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signIn">로그인</a>
      	</li>
      	<li class="nav-item">
      		<a class="nav-link" href="${path}/user/signUp">회원가입</a>
      	</li>
      </ul>
      </c:otherwise>
      </c:choose>
    </div>
  </div>
  <div class="remote">
  	<button type="button" class="btn btn-secondary" id="remoteTop" >△</button><br/><br/>
  	<button type="button" class="btn btn-secondary" id="remoteBottom" >▽</button>
  </div>
</nav>
<div class="col-10 offset-1 my-2">
	<div class="row" style="margin-top:100px;">
	<div class="col-lg-5" style="margin-top:5px;">
		<h1>사이트 아이콘</h1>
	</div>
		<div class="col-lg-3 ms-md-auto" style="margin-top:16px;">
			<div class="input-group mb-3">
	    		<input type="text" class="form-control" placeholder="상품 검색" >
	    		<button class="btn btn-primary" type="button" id="button-addon2">검색</button>
	    	</div>
    	</div>
    </div>
</div>
<div class="col-10 offset-1 ">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <div class="navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">content1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">content2</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">content more</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu" id="drop">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>
</div>
<div class="row col-10 offset-1">
	<div id="navLeft" class="col-lg-2 navbar-light my-1">
		<ul class="navbar-nav ms-md-auto">
			<li class="nav-item">
      			<a class="nav-link" href="${path}/user/signIn">상품1</a>
      		</li>
      		<li class="nav-item">
      			<a class="nav-link" href="${path}/user/signIn">상품2</a>
      		</li>
      		<li class="nav-item">
      			<a class="nav-link" href="${path}/user/signIn">상품3</a>
      		</li>
      		<li class="nav-item">
      			<a class="nav-link" href="${path}/user/signIn">상품4</a>
      		</li>
      		<li class="nav-item">
      			<a class="nav-link" href="${path}/user/signIn">상품5</a>
      		</li>
      	</ul>
	</div>
<div class="contentWrap col-lg-10 my-5">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
$('#toggle').click(function(event){
    event.stopPropagation();
    $('#drop').toggle();
});
 
$(document).click(function(){
    $('#drop').hide();
});

$("#remoteTop").click(function(){
    $(window).scrollTop(0);
});

$("#remoteBottom").click(function(){
	window.scrollTo(0,document.body.scrollHeight);
});
	
</script>
