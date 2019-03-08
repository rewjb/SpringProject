<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="springProject/resources/JS/jquery.min.js"></script>
	<script type="text/javascript">
		function LoadImg(value) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#LoadImg').attr('src',e.target.result);
				}
				reader.readAsDataURL(value.file[0]);
			}
		}
	
	</script>
</head>
<body>
	<pre class="brush:html">
		<input type="file" id="imgAttach" name="imgAttach" onchange="LoadImg(this);">
	</pre>
	<img id="LoadImg">
</body>
</html>