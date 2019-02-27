<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>   
<%@ include file="/UserMainHeader.jsp"%>


<div>
<p>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>

<button alt="temp" onclick="temp(this);">dd</button>

<p>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>

</div>

<script type="text/javascript">


$('button[alt=temp]').click(function() {
	$(this).next().toggle(500);
})



// function temp(asd) {
	  
// 	  $(asd).click
	  
// // 	$(asd).prev().remove();
// // 	$(asd).next().remove();
// // 	$(asd).next().attr('background','red');
// 	$(asd).next().hide(1000);
// 	$(asd).prev().hide(1000);
// }



</script>


</body> 
</html>
