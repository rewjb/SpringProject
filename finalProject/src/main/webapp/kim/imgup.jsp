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
	height: 30px;
	background: #777;
	color: #fff;
	text-align: center;
	line-height: 30px;
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
	height: 28px;
	line-height: 28px;
	font-size: 11px;
	padding: 0;
	border: 0;
	border: 1px solid #777;
}
</style>

</head>
<form method="post" enctype="multipart/form-data" action="imgTest.jsp">

	<div class="file_input">
		<label> 제품사진1 <input
			onchange="javascript:document.getElementById('file_route1').value=this.value"
			type="file" name="filename1">
		</label> 
		<input title="File Route" id="file_route1" type="text" 
			readonly="readonly">
	</div>

<input type="submit" value="업로드"><br><br>
</form>

<body>

</body>
</html>
