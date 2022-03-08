<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-bs-toggle="tab" href="#home">전체 메세지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#profile">안읽은 메세지</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade active show" id="home">
  <table class="table table-hover">
  	<tr>
  		<th scope="col">번호</th>
  		<th scope="col">제목</th>
  		<th scope="col">내용</th>
  		<th scope="col">보낸이</th>
  		<th scope="col">수신날짜</th>
  	</tr>
  	<c:if test="${!empty mList}">
		<c:forEach var="m" items="${mList}">
			<tr style="cursor:pointer;" onclick="location.href='${path}/qnaboard/detail?uno=${m.uno}&mno=${m.mno}'">
				<td>${m.mno}</td>
				<td>${m.title}</td>
		  		<td>${m.content}</td>
		  		<td>${m.sender}</td>
		  		<td>${m.sendDate}</td>
		  	</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty mList}">
		<h3>내용이 없습니다.</h3>
	</c:if>
  </table>
  </div>
  <div class="tab-pane fade" id="profile">
  </div>
</div>
<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
</body>
</html>