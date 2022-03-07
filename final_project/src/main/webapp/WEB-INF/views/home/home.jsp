<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
	<div class="row">
		<div class="col-lg-4">
		    <div class="card border-secondary mb-3" style="max-width: 20rem;">
		  		<div class="card-header">Q&A</div>
		  			<table class="table table-hover">
		  				<c:if test="${!empty qlist}">
		  					<c:forEach var="question" items="${qlist}">
		  				<tr>
		  					<td style="cursor:pointer;" onclick="location.href='${path}/qnaboard/detail?qno=${question.qno}'">Q. ${question.title}</td>
		  				</tr>
		  					</c:forEach>
		  				</c:if>
		  				<c:if test="${empty qlist}">
		  					<h3>내용이 없습니다.</h3>
		  				</c:if>
    					
		  			</table>
		 		 	<div class="card-body">
		 		 </div>
			</div>
		</div>
		<div class="col-lg-4">
			<form class="bs-component">
				<h2>Example body text</h2>
				<p>Nullam quis risus eget <a href="#">urna mollis ornare</a> vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>
				<p><small>This line of text is meant to be treated as fine print.</small></p>
				<p>The following is <strong>rendered as bold text</strong>.</p>
				<p>The following is <em>rendered as italicized text</em>.</p>
				<p>An abbreviation of the word attribute is <abbr title="attribute">attr</abbr>.</p>
			</form>
		</div>
		<div class="col-lg-4">
	    	<div class="card border-secondary mb-3" style="max-width: 20rem;">
	  			<div class="card-header">Header</div>
	 		 		<div class="card-body">
	  	 			 <h4 class="card-title">Secondary card title But maybe third? lorem is lorem is lorem</h4>
	 	  			 <p class="card-text"></p>
		 		 </div>
			</div>
		</div>
		<div class="col-lg-4">
		    <div class="card border-secondary mb-3" style="max-width: 20rem;">
		  		<div class="card-header">Header</div>
		 		 	<div class="card-body">
		  	 			 <h4 class="card-title">Secondary card title</h4>
		 	  			 <p class="card-text"></p>
		 		 </div>
			</div>
		</div>
			<div class="col-lg-4">
	    		<div class="card border-secondary mb-3" style="max-width: 20rem;">
	  				<div class="card-header">Header</div>
	 		 			<div class="card-body">
	  	 				 <h4 class="card-title">Secondary card title But maybe third? lorem is lorem is lorem Secondary card title But maybe third? lorem is lorem is lorem Secondary card title But maybe third? lorem is lorem is lorem</h4>
	 	  				 <p class="card-text"></p>
		 		 </div>
			</div>
		</div>
		<div class="col-lg-4">
			<form class="bs-component">
				<h2>Example body text</h2>
				<p>Nullam quis risus eget <a href="#">urna mollis ornare</a> vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>
				<p><small>This line of text is meant to be treated as fine print.</small></p>
				<p>The following is <strong>rendered as bold text</strong>.</p>
				<p>The following is <em>rendered as italicized text</em>.</p>
				<p>An abbreviation of the word attribute is <abbr title="attribute">attr</abbr>.</p>
			</form>
		</div>
	</div>
	<form action="/">
	<input type="hidden" name="uno" value="${user.uno}"/>
	</form>
<jsp:include page="/WEB-INF/views/home/footer.jsp"/>
<script>
	
</script>