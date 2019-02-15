<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>




</head>
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>

<form>
	<input name="temp" value="11">
</form>


<button onclick="temp();">dd</button>

<script type="text/javascript">

function temp() {

	alert($('form').children('input[name=temp]').val());
	
}


</script>

<body>


</body>
</html>