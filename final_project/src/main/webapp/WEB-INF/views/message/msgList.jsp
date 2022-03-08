<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<style>
	th{
		max-width:600px;
	
	}
	
	td{
		max-width:600px;
	
	}
</style>
<ul class="nav nav-tabs mx-auto" style="max-width: 800px;">
  <li class="nav-item">
    <a class="nav-link active" data-bs-toggle="tab" href="#all">전체 메세지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#non-read">안읽은 메세지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#read">읽은 메세지</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content mx-auto" style="max-width: 800px;">
  <div class="tab-pane fade active show" id="all">
  <table class="table table-hover">
  	<tr>
  		<th scope="col">번호</th>
  		<th scope="col">제목</th>
  		<th scope="col">보낸이</th>
  		<th scope="col">수신날짜</th>
  	</tr>
  	<c:choose>
  	<c:when test="${!empty mList}">
		<c:forEach var="m" items="${mList}">
			<tr class="msg" style="cursor:pointer;" >
				<td class="mno">${m.mno}<input type="hidden" class="suno" value="${m.suno}"/></td>
				<td>${m.title}</td>
		  		<td>${m.sender}</td>
		  		<td>
		  			<f:formatDate value="${m.sendDate}" pattern="yyyy-MM-dd (E) HH:mm"/>
		  		</td>
		  	</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
		 	<td colspan="4" style="text-align:center;"><h3>내용이 없습니다.</h3></td>
		</tr>
	</c:otherwise>
	</c:choose>
  </table>
  </div>
  <div class="tab-pane fade mx-auto" id="non-read" style="max-width: 800px;">
  <table class="table table-hover">
  	<tr>
  		<th scope="col">번호</th>
  		<th scope="col">제목</th>
  		<th scope="col">보낸이</th>
  		<th scope="col">수신날짜</th>
  	</tr>
  	<c:choose>
  	<c:when test="${!empty mList}">
		<c:forEach var="m" items="${mList}">
				<c:if test="${m.checked eq 'n'}">
					<tr class="msg" style="cursor:pointer;" >
						<td class="mno">${m.mno}<input type="hidden" class="suno" value="${m.suno}"/></td>
						<td>${m.title}</td>
				  		<td>${m.sender}</td>
				  		<td>
				  			<f:formatDate value="${m.sendDate}" pattern="yyyy-MM-dd (E) HH:mm"/>
				  		</td>
				  	</tr>
			  	</c:if>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<c:if test="${empty mList}">
				<tr>
		 			<td colspan="4" style="text-align:center;"><h3>내용이 없습니다.</h3></td>
				</tr>			  		
			</c:if>		
	</c:otherwise>
	</c:choose>
	</table>
  </div>
    <div class="tab-pane fade mx-auto" id="read" style="max-width: 800px;">
  <table class="table table-hover">
  	<tr>
  		<th scope="col">번호</th>
  		<th scope="col">제목</th>
  		<th scope="col">보낸이</th>
  		<th scope="col">수신날짜</th>
  	</tr>
  	<c:if test="${!empty mList}">
		<c:forEach var="m" items="${mList}">
				<c:if test="${m.checked eq 'y'}">
					<tr class="msg" style="cursor:pointer;" >
						<td class="mno">${m.mno}<input type="hidden" class="suno" value="${m.suno}"/></td>
						<td>${m.title}</td>
				  		<td>${m.sender}</td>
				  		<td>
				  			<f:formatDate value="${m.sendDate}" pattern="yyyy-MM-dd (E) HH:mm"/>
				  		</td>
				  	</tr>
			  	</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${empty mList}">
		<tr>
		 	<td colspan="4" style="text-align:center;"><h3>내용이 없습니다.</h3></td>
		</tr>
	</c:if>
	</table>
  </div>
</div>
<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
</body>
<script>
	$(".msg").click(function(){
		var mno = $(this).children(".mno").text();
		var suno = $(this).children(".mno").children("input[type='hidden']").val();
		console.log(suno);
		console.log(mno);
		window.open('${path}/message/msgDetail?mno='+mno+'&suno='+suno+'', '_blank',' width=800, height=600, scrollbars=no, resizable=no');
	});
</script>
</html>