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
			
			//이미지 업로드 했을 때의 액션처리
			$("#filename1").change(function(){ 
				
				//파일업로드 form의 데이타방식 세팅
				var form = document.getElementById("form");				
				form.method = "POST";
				form.enctype = "multipart/form-data"
				var formData = new FormData(form);
				
				//이미지 업로드 페이지로 ajax전송
				$.ajax({
					url: "imgForm.jsp",
					type: "post",
					data: formData,
					cache: false,
					contentType: false,
					processData: false,
					success: function(result){
						
						//업로드 완료 전까지 로딩이미지를 띄워줌
					 	$("#picture").attr("src", "/springProject/resources/IMAGE/placeAdd/loading.gif");
					 	$("#picture").attr("width", "100");
					 	$("#picture").attr("height", "100");
						
					 	//이미지 업로드 4초 후(업로드 시간 대기) 업로드된 이미지로 교체
				 		setTimeout(function() {	
							$("#picture").attr("width", "700");
							$("#picture").attr("height", "500"); 
				 			$("#picture").attr("src", result);
							$("#mainImg").attr("value", result);
						}, 4000);
					}
				})				
				return false;
			})			
		})
		
		
</script>

<%@ include file="/UserMainHeader.jsp" %>
</head>
<!-- <body style="background: #e5ffeb;"> -->
<body>

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
      <select class="form-control" id="continent" name="continent">
        <option>아시아</option>
        <option>유럽</option>
        <option>북아메리카</option>
        <option>남아메리카</option>
        <option>동남아시아</option>
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
      <input type="text" class="form-control" id="address" name="address" placeholder="Enter address">
    </div>
    <div class="form-group">
      <label for="exampleTextarea">소개</label>
      <textarea class="form-control" id="content" name="content" rows="2" placeholder="Enter intro"></textarea>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">설명</label>
      <textarea class="form-control" id="contentElements" name="contentElements" rows="5" placeholder="Enter explaination"></textarea>
    </div>
    
    <input type="hidden" id="mainImg" name="mainImg" value="123">
    <input type="hidden" id="userId" name="userId" value="유저아이디">
    
    <input type="submit" class="btn btn-primary">
    <a class="btn btn-sm btn-outline-secondary" href="Tag_Select">태그페이지</a>
    <a class="btn btn-sm btn-outline-secondary" href="../joe/crawling">크롤링</a>
    </form>
    <p class="pb-1">
  </fieldset>

</div>
</div>
<%@ include file="/UserMainFooter.jsp" %>
</body>
</html>