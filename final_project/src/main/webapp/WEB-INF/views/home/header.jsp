<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
<style>
	.remote{
		position: fixed;
		right: 3%;
		bottom: 50px;
		text-align:center;
		width: 120px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">사이트</a>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}">홈
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/board/list">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/qnaboard/list">QnA</a>
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
      		<a class="nav-link" href="#">${userInfo.u_id}님 반갑습니다.</a>
      	</li>
       	<li class="nav-item">
      		<a class="nav-link" href="${pageContext.request.contextPath}/user/signOut">로그아웃</a>
      	</li>
      </ul>
      </c:when>
      <c:otherwise>
      <ul class="navbar-nav ms-md-auto">
      	<li class="nav-item">
      		<a class="nav-link" href="${pageContext.request.contextPath}/user/signIn">로그인</a>
      	</li>
      	<li class="nav-item">
      		<a class="nav-link" href="${pageContext.request.contextPath}/user/signUp">회원가입</a>
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
