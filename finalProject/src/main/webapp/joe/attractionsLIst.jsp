<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<%@ include file="/UserMainHeader.jsp"%>
	<div class = "container marketing">
	<nav class="navbar navbar-dark bg-dark"> 
	<button style="margin-left: 0;"  class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarsExample01" aria-controls="navbarsExample01"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span><span class="navbar-brand">조건검색</span>
	</button>
		 <form class="form-inline my-2 my-md-0">
    <span class="navbar-brand">검색</span><input class="form-control" type="text" placeholder="Search" aria-label="Search">
    </form>

	<div class="collapse navbar-collapse" id="navbarsExample01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">대륙
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">도시
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">태그
			</a></li>
		</ul>
		  
	</div>
	</nav>
</div>

	<!--해더랑 리스트랑 공간  어차피  jstl for문을 통해서 구현할곳  -->
	<div style="width: 100%; height: 100px;"></div>
		<textarea style="width: 200px; height: 500px; margin-left: 50px; position: fixed;"></textarea>

	<!--추천에 의해 뿌려줄 리스트   -->
	<div class="container marketing">
		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-4">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="300" height="300" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder: 500x500">
				<title>Placeholder</title>
				<rect fill="#eee" width="100%" height="100%"></rect>
				<text fill="#aaa" dy=".3em" x="50%" y="50%"></text></svg>
				<title>Placeholder</title>
				<rect fill="#eee" width="100%" height="100%"></rect>
				<text fill="#777" dy=".3em" x="50%" y="50%"></text>
				</svg>
				<h2>조광재</h2>
				<p>짱짱맨</p>
				<p>
					<a class="btn btn-secondary" href="#" role="button">장바구니</a>
				</p>
			</div>
			<!-- /.col-lg-4 -->
			
		</div>
		<!-- /.row -->
		<br>
		<br>
		<br>
		 <div >
                <ul class="pagination pagination-lg">
                  <li class="page-item disabled">
                    <a class="page-link" href="#">&laquo;</a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">2</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">3</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                  </li>
                </ul>
              </div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
	</body>
</html>