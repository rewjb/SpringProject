<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- <% 
	String pid = request.getParameter("pid"); 
    String mid = request.getParameter("mid");	
%> --%>

<!--제이쿼리-->
<script type="text/javascript"
	src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">
	var time = 0;
	var form = "1000003978101";
	$(function() {

		if (time == 0) {//최초실행시 댓글 리스트 보여주는 조건문
			$.ajax({
				url : "cartList",
				Type : "POST",
				success : function(result) {
					if (result != null) {
						$("#cartTable").append(result);

						if ($("#" + form).find('label').text() != '') {
							$("#cart").attr("class", "btn btn-primary my-2");
						} else if ($("#" + form).find('label').text() == '') {
							$("#cart").attr("class", "btn btn-secondary my-2");
						}
					}
				}//success끝
			})//ajax끝
		}
		time += 1;
	})

	function cart() {

		if ($("#cart").attr("class") == "btn btn-secondary my-2") {
			$("#cart").attr("class", "btn btn-primary my-2");

			var data = $("#form").serialize();
			$.ajax({
				url : "cartInsert",
				Type : "POST",
				data : data,
				success : function(result) {
					$("#cartTable").empty();
					$("#cartTable").append(result);
				}//success끝
			})//ajax끝

		} else if ($("#cart").attr("class") == "btn btn-primary my-2") {
			$("#cart").attr("class", "btn btn-secondary my-2");

			var data = $("#form").serialize();

			$.ajax({
				url : "cartDelete",
				Type : "POST",
				data : data,
				success : function(result) {
					$("#cartTable").empty();
					$("#cartTable").append(result);
				}//success끝
			})//ajax끝 
		}

	}
</script>

</head>
<body>
	<%@ include file="/UserMainHeader.jsp"%>
	<form id="form">
		<div class="row featurette">
			<div style="margin-left: 50px; position: fixed;">
				<h2>장바구니</h2>
			</div>

			<div
				style="width: 180px; height: 500px; margin-left: 40px; margin-top: 65px; position: fixed; overflow: auto;"
				id="cartTable"></div>

			<input type="hidden" value="1000003978101" name="pid"> <input
				type="hidden" value="rhkdwo" name="mid">

			<div class="col-md-5" style="margin-left: auto; margin-right: auto;">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="1500" height="1000" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
				<title>Placeholder</title>
				<rect width="100%" height="100%" fill="#eee" /></svg>
			</div>
		</div>
	</form>
	<div class="col-md-5" style="margin-left: auto; margin-right: auto;">
		<button class="btn btn-secondary my-2" onclick="cart()" id="cart">장바구니</button>
		<button class="btn btn-secondary my-2">예비 버튼</button>
		<h2 class="featurette-heading">★별점</h2>
	</div>
	<hr class="featurette-divider">
	<br>
	<br>

	<div class="col-md-7" style="margin-left: auto; margin-right: auto;"
		align="center">
		<h2 class="featurette-heading">
			관광명소 설명1<span class="text-muted">관광명소 설명2</span>
		</h2>
		<br>
		<p class="lead">관광명소 설명3</p>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>