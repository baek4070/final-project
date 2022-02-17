<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="resources/css/bootstrap.min.css" rel="stylesheet" />
<jsp:include page="/WEB-INF/views/home/header.jsp"/>
<div class="col-10 offset-1 my-2">
	<div class="row" style="margin-top:100px;"">
	<div class="col-lg-5" style="margin-top:5px;">
		<h1>사이트 아이콘</h1>
	</div>
		<div class="col-lg-3 offset-4" style="margin-top:16px;">
			<div class="input-group mb-3">
	    		<input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2"">
	    		<button class="btn btn-primary" type="button" id="button-addon2"">Button</button>
	    	</div>
    	</div>
    </div>
</div>
<div class="col-10 offset-1">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <div class="collapse navbar-collapse" id="navbarColor02">
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
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu">
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
<div class="mx-5 my-5">
	<div class="row">
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
	</div>
</div>
<div class="mx-5 my-5">
	<div class="row">
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
</div>
</div>
</body>
</html>