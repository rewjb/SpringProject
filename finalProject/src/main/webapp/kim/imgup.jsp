<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.file_input label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
	width: 100px;
	height: 100px;
	background: #777;
	color: #fff;
	text-align: center;
	line-height: 100px;
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
	width: 200px;
	height: 100px;
	line-height: 100px;
	font-size: 11px;
	padding: 0;
	border: 0;
	border: 1px solid #777;
}

</style>

<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		//$("#form").on("submit", function() {
		$("#submit").click(function(){ 
			
			//var d = $(this).serialize();
			var form = document.getElementById("form");
			
			form.method = "POST";
			form.enctype = "multipart/form-data"
			var formData = new FormData(form);
			
			$.ajax({
				url: "imgTest.jsp",
				type: "post",
				data: formData,
				cache: false,
				contentType: false,
				processData: false,
				success: function(result){
					$("#div1").prepend(result);
				}
			})
			return false;
		})
	})
</script>

</head>
<form method="post" enctype="multipart/form-data" action="imgTest.jsp" id="form">

	<div class="file_input">
		<label> 제품사진1 <input
			onchange="javascript:document.getElementById('file_route1').value=this.value"
			type="file" name="filename1">
		</label> 
		<input title="File Route" id="file_route1" type="text" 
			readonly="readonly">
	</div>

<button id="submit" value="업로드">업로드</button><br><br>
</form>
<div id="div1">
</div>

<body>

</body>
</html>
