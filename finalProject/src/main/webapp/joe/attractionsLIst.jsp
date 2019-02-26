<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<!--제이쿼리-->
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
		<style type="text/css">
	
{
   font-family: 'Noto Sans KR', sans-serif;
}
	
	</style>

<script type="text/javascript">

 var count = 0;
$(function () {
	if (count==0) {
		alert("뭐하니");
		$.ajax({ 
			url : "allList?page=0",
			Type : "POST",
			success : function(result) {
					$("#container").append(result);
			}
		});
	}count += 1;
})
 
var arr = new Array();
arr = ["아시아" , "동남아시아" , "유럽" , "미주" , "남태평양" , "대한민국"];
  
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
	if ($(con).attr("class")=="btn btn-secondary my-2") {
	
	$("#city").empty();
	$("#tag").empty();
	$("button[name=1]").attr("class","btn btn-secondary my-2");
	$("button[name=1]").attr("id","");
		
	 $(con).attr("class" , "btn btn-primary my-2");
	 $(con).attr("id" , "1");
	var temp2 = $(con).text();
	$.ajax({
		url : "tagCon",
		Type : "POST",
		data : "tag="+temp2,
		success : function(result) {
				$("#city").append(result);
		}
	});
	
	
	}else if ($(con).attr("class") == "btn btn-primary my-2") {
		alert($("[name = '1']").attr("class"));
		$("#city").empty();
		$("#tag").empty();
		$(con).attr("class" , "btn btn-secondary my-2");
	}
}

function city(event) {
	var con = event.target;
	
	if ($(con).attr("class")=="btn btn-secondary my-2") {
	
	$("#tag").empty();
	$("button[name=2]").attr("class","btn btn-secondary my-2");
	$("button[name=2]").attr("id","");
	
	$(con).attr("class" , "btn btn-primary my-2");
	$(con).attr("id" , "2");
	var temp2 = $(con).text();
	$.ajax({
		url : "tagCity",
		Type : "POST",
		data : "tag="+temp2,
		success : function(result) {
				$("#tag").append(result);
		}
	});
	
	}else if($(con).attr("class") == "btn btn-primary my-2") {
		$("#tag").empty();
		$("button[name=2]").attr("id","");
		$(con).attr("class" , "btn btn-secondary my-2");
		
	}
}

function tag(event) {
	var con = event.target;
	
	if ($(con).attr("class")=="btn btn-secondary my-2") {
	
	$("button[name=tag]").attr("class","btn btn-secondary my-2");
	$("button[name=tag]").attr("id","");
	$(con).attr("class" , "btn btn-primary my-2");
	$(con).attr("id" , "3");
	
	}else if ($(con).attr("class") == "btn btn-primary my-2") {
		$("button[name=tag]").attr("id","");
		$(con).attr("class" , "btn btn-secondary my-2");
	}
	
}

function tagSearch() {
	
	var con = $("button[id=1]").text();
	var city = $("button[id=2]").text();
	var tag = $("button[id=3]").text();
	
	$.ajax({
		url : "attList",
		Type : "POST",
		data : "continent="+con+"&city="+city+"&category="+tag,
		success : function(result) {
			$("#container").empty();
			$("#container").append(result);
		}
	});
}
</script>
</head>
<body>
	<jsp:include page="/UserMainHeader.jsp" />
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
			
				<div style="height: 80px; width: 1080px; overflow : auto;" id = "continentList">  
				</div>  
			</li>
			<li class="navbar-brand"><label>도시</label>
			 	<div style="overflow-x : auto; height: 80px; width: 1080px;" id = "city">
			 	</div>
			</li>
			<li class="navbar-brand"><label>태그</label>
				<div style="overflow-x : auto; height: 80px; width: 1080px;" id = "tag">
				
				</div>
			</li>
			<li><button id ="searchBtn"    class="btn btn-secondary my-2" style="text-align: center; width: 1080px;" onclick="tagSearch()">검색</button></li>
		</ul>
	</div>
	</nav>
</div>
	<!--해더랑 리스트랑 공간  어차피  jstl for문을 통해서 구현할곳  -->
	<div style="width: 100%; height: 100px;"></div>
		<textarea style="width: 200px; height: 500px; margin-left: 50px; position: fixed;"></textarea>
  
	<!--추천에 의해 뿌려줄 리스트   -->
	<div class="container marketing" id = "container" >
	
	</div>
		
	</body>
</html>
