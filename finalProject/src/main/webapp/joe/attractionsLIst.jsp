<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--제이쿼리-->
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
	

<script type="text/javascript">

var arr = new Array();
arr = ["아시아" , "동남아시	아" , "유럽" ,"미주" , "남태평양" ,"대한민국"];

var count  = 0;

$(function () {
	if (count == 0) {
		for (var i = 0; i < arr.length; i++) {
			$("#continentList").append($("<button name = '1' class='btn btn-secondary my-2' onclick = 'continent(event)'>" +arr[i] +  "</button>"));  
		}
	}count +=1
})

function continent(event) {
	var con = event.target;
	
	$("#city").empty();
	$("#tag").empty();
	$("button[name=1]").attr("class","btn btn-secondary my-2");
		
	var temp = $(con).attr("class" , "btn btn-primary my-2");
	var temp2 = $(con).text();
	$.ajax({
		url : "tagCon",
		Type : "POST",
		data : "tag="+temp2,
		success : function(result) {
				$("#city").append(result);
		}
	});
}
     

function city(event) {
	var con = event.target;
	
	$("#tag").empty();
	$("button[name=2]").attr("class","btn btn-secondary my-2");
	
	var temp = $(con).attr("class" , "btn btn-primary my-2");
	var temp2 = $(con).text();
	$.ajax({
		url : "tagCity",
		Type : "POST",
		data : "tag="+temp2,
		success : function(result) {
				$("#tag").append(result);
		}
	});
}
     






</script>
</head>
<body>
	<%@ include file="/UserMainHeader.jsp"%>
	<div class = "container marketing">
	<nav class="navbar navbar-dark bg-dark"> 
	<button style="margin-left: 0;"  class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarsExample01" aria-controls="navbarsExample01"
		aria-expanded="false" aria-label="Toggle navigation" >  
		<span class="navbar-toggler-icon"></span><span class="navbar-brand" >조건검색</span>
	</button>
		 <form class="form-inline my-2 my-md-0">
    <span class="navbar-brand">검색</span><input class="form-control" type="text" placeholder="Search" aria-label="Search">
    </form>
	<div class="collapse navbar-collapse" id="navbarsExample01">
		<ul class="navbar-nav mr-auto">
			<li class="navbar-brand"><label>대륙</label> 
			
				<div style="height: 70px; width: 1000px; overflow : auto;" id = "continentList">  
				</div>  
				
			</li>
			<li class="navbar-brand"><label>도시</label>
			 	<div style="overflow-x : auto; height: 70px; width: 1000px;" id = "city">
								 
			 	</div>
			</li>
			<li class="navbar-brand"><label>태그</label>
				<div style="overflow-x : auto; height: 70px; width: 1000px;" id = "tag">
					
				</div>
			</li>
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
				<text fill="#aaa" dy=".3em" x="50%" y="50%"></text>
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
		
		
	</body>
</html>