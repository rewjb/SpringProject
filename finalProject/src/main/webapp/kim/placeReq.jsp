<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

.margin-auto {
  	margin-left: auto; 
  	margin-right: auto;
  	margin-top: auto;
  	margin-bottom: auto;
}

.file_input label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
 	width: auto;
	height: auto; 
	max-width: 700px;
	max-height: 500px;
	background: white;
	color: white;
	text-align: center;
	/* line-height: 30px; */
}

.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.file_input input[type=text] {
	vertical-align: middle;
	display: inline-block;
/* 	width: 200px;
	height: 100px;
	line-height: 100px; */
	font-size: 11px;
	padding: 0;
	border: 0;
	border: 1px solid #777;
}

</style>

<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">
		
		$(function() {
			$("#filename1").change(function(){ 
				var form = document.getElementById("form");
				
				form.method = "POST";
				form.enctype = "multipart/form-data"
				var formData = new FormData(form);
				
				$.ajax({
					url: "imgForm.jsp",
					type: "post",
					data: formData,
					cache: false,
					contentType: false,
					processData: false,
					success: function(result){
						
					 	$("#picture").attr("src", "/springProject/resources/IMAGE/placeAdd/loading.gif");
						
				 		setTimeout(function() {	
							$("#picture").attr("width", "700");
							$("#picture").attr("height", "500"); 
				 			$("#picture").attr("src", result);
						}, 3500);
					}
				})
				return false;
			})			
		})
		
		
</script>

<%@ include file="/UserMainHeader.jsp" %>
</head>
<!-- <body style="background: #e5ffeb;"> -->
<body style="background-image: url('/springProject/resources/IMAGE/placeAdd/bg.jpg');">

<div class="container marketing" style="background-color: rgba(255,255,255,0.8); border-radius: 1.0rem;">
<div class="col-12 pt-3">

  <fieldset>
    <legend class="display-4" style="text-align: center;">여행지 등록 신청</legend>
<form method="post" enctype="multipart/form-data" action="imgTest.jsp" id="form">
    <hr>
    <div class="card border-secondary mb-3 margin-auto" style="max-width: 50rem;">
	  <div class="card-header">이미지 등록</div>
	  <div class="card-body margin-auto">
	    <p class="card-text">
	    <div class="file_input">
	   		<label>
	    	<img src="/springProject/resources/IMAGE/placeAdd/imgAdd.png" width="100" height="100" id="picture">	   		
	   		<input onchange="javascript:document.getElementById('file_route1').value=this.value"
				type="file" name="filename1" id="filename1">
			</label> 
			<input title="File Route" id="file_route1" type="hidden" 
				readonly="readonly" onchange="img()">				
	    </div>
	    </p>
	  </div>
	</div>
	<hr>
</form>
    
<form action="placeReq">
    <div class="form-group">
      <label for="exampleSelect1">대륙</label>
      <select class="form-control" id="exampleSelect1">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
    </div>
    <div class="form-group">
      <label for="exampleSelect2">도시</label>
		<input type="text" class="form-control" id="city" name="city" placeholder="Enter city">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">여행지 명</label>
      <input type="text" class="form-control" id="title" name="title" placeholder="Enter title">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">주소</label>
      <input type="text" class="form-control" id="addr" name="addr" placeholder="Enter address">
    </div>
    <div class="form-group">
      <label for="exampleTextarea">소개</label>
      <textarea class="form-control" id="content" name="content" rows="2" placeholder="Enter intro"></textarea>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">설명</label>
      <textarea class="form-control" id="contentElements" name="contentElements" rows="5" placeholder="Enter explaination"></textarea>
    </div>
       
    <input type="submit" class="btn btn-primary">
    </form>
    <p class="pb-1">
  </fieldset>

</div>
</div>
<%@ include file="/UserMainFooter.jsp" %>
</body>
</html>