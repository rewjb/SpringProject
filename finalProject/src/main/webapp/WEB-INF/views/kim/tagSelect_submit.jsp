<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	//이미지 업로드 했을 때의 액션처리
	$("#form").on("submit", function(){
		var data = $(this).serialize();
		
		$.ajax({
			url: "recommend",
			type: "post",
			data: data,
			success: function(result){
				$("div").append(result);
			}			
		})
		return false;
	})
}

</script>

</head>
<body>
<%@ include file="/UserMainHeader.jsp" %>

<div class="container marketing" style="background-color: rgba(255,255,255,0.8); border-radius: 1.0rem;">
<div class="col-12 pt-3" style="height: 600px;">

<form action="recommend" id="form">
	<input type="submit" value="추천리스트 불러오기">
</form>

<div id="div"></div>

</div>
</div>

<%@ include file="/UserMainFooter.jsp" %>
</body>
</html>