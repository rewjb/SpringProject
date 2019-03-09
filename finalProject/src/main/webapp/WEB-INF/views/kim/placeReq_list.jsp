<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: black;}
a:hover {text-decoration: underline; color: black;}




</style>

</head>
<body>
<%@ include file="/UserMainHeader.jsp" %>
<div class="container marketing" style="background-color: rgba(255,255,255,0.8); border-radius: 1.0rem;">
<div class="col-12 pt-3 margin-auto">
	
	
	<ol class="breadcrumb" style="background-image: url('/springProject/resources/IMAGE/sky2.jpg')">
	  <li class="breadcrumb-item active margin-auto h3" style="font-family: 'Jua', sans-serif; color: black;">여행지 신청 리스트</li>
	</ol>
	</div>
		<hr>
		<div class="margin-auto" style="background-color: rgba(255,255,255,0.9); width: 1050px;">
		<table class="table table-hover table-striped">
		  <thead>
		    <tr style="background: linear-gradient(to bottom, #cecece, white);">
		      <th scope="col" width="10%">No</th>
		      <th scope="col" width="50%">Title</th>
		      <th scope="col" width="20%">User</th>
		      <th scope="col" width="20%">Time</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%-- 리스트 출력 반복문 --%>
		  <c:forEach var="list" items="${sessionScope.req_list }" varStatus="i">
		  	<c:choose>
		  		<c:when test="${i.count < page*10 && i.count > (page-1)*10}">		  		
				  	<tr>
				  		<th>${list.no }</th>
				  		<th><a href="placeReq_content?no=${list.no }">${list.title }</a></th>
				  		<th>${list.userId }</th>
				  		<th>${list.time }</th>
				  	</tr>		  	
		  		</c:when>
		  	</c:choose>		  			  	
		  </c:forEach>
		  
		  </tbody>		  
		</table> 
		</div>
	
	</fieldset>
	<div class="margin-auto">
	  <ul class="pagination pl-4 pb-2 margin-auto" style="width: auto;">
	    <li class="page-item disabled">
	      <a class="page-link" href="#">&laquo;</a>
	    </li>
	    <%-- 페이지 번호 출력 반복문 --%>
	    <c:forEach var="num" items="${sessionScope.req_page}" varStatus="i">
		    <c:choose>
			    <c:when test="${i.count == page}">
				    <li class="page-item active">
				      <a class="page-link" href="placeReq_page?page=${num }">${num}</a>
				    </li>
			    </c:when>
		    	<c:otherwise>
				    <li class="page-item">
				      <a class="page-link" href="placeReq_page?page=${num }">${num}</a>
				    </li>
		    	</c:otherwise>
		    </c:choose>
	    </c:forEach>
	    
	    <li class="page-item">
	      <a class="page-link" href="#">&raquo;</a>
	    </li>
	  </ul>
	</div>
	
	<p class="pt-1">
</div>
<%@ include file="/UserMainFooter.jsp" %>
</body>
</html>