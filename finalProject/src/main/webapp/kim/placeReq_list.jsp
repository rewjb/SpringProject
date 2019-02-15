<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image: url('/springProject/resources/IMAGE/placeAdd/bg2.jpg');">
<%@ include file="/UserMainHeader.jsp" %>
<div class="container marketing" style="background-color: rgba(255,255,255,0.8); border-radius: 1.0rem;">
<div class="col-12 pt-3">
	<fieldset>
	<legend class="display-4" style="text-align: center;">여행지 신청 리스트</legend>
		<hr>
		</div>
		<div style="background: white;">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col" width="10%">No</th>
		      <th scope="col" width="50%">Title</th>
		      <th scope="col" width="20%">User</th>
		      <th scope="col" width="20%">Time</th>
		    </tr>
		  </thead>
		  <c:forEach var="list" items="">
		  <tbody>
		  	<tr>
		  		<th></th>
		  	</tr>
		  </tbody>		  
		  </c:forEach>
		</table> 
		</div>
	
	</fieldset>
</div>
</div>
<%@ include file="/UserMainFooter.jsp" %>
</body>
</html>