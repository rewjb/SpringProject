<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// 	int tempPage = 0;
// 	if (request.getParameter("page") == null) {
// 		tempPage = 1;
// 	} else {
// 		tempPage = Integer.parseInt(request.getParameter("page"));
// 	}
// 	ArrayList list = (ArrayList)request.getAttribute("list");
	  
%>

<div class="row">
	<c:forEach items="${list}" var="list">
		<div class="col-lg-4">
			<a href="/springProject/joe/detailPage.jsp"><img
				src="/springProject/resources/IMAGE/attractions/${list.mainImg}"
				width="200px" height="200px"></a>
			<h2>${list.title}</h2>
			<p>${list.content}</p>
			<p>
				<button class="btn btn-secondary">장바구니</button>
			</p>
		</div>
		<!-- /.col-lg-4' -->
	</c:forEach>

<!-- </div> -->
<!-- <!-- /.row --> -->
<!-- <div> -->
<!-- 	<ul class="pagination pagination-lg"> -->
<!-- 		<li class="page-item active"><a class="page-link" href="#"id="firstA">1</a> -->
<!-- 		</li> -->
<!-- 		<li class="page-item"><a class="page-link" href="#" id="firstB">2</a> -->
<!-- 		</li> -->
<!-- 		<li class="page-item"><a class="page-link" href="#" id="firstC">3</a> -->
<!-- 		</li> -->
<!-- 	</ul> -->
<!-- </div> -->

<!-- <script type="text/javascript"> -->

// $(function () {
// 	var firstBtn = document.getElementById("firstA");
// 	var secondBtn = document.getElementById("firstB");
// 	var thirdBtn = document.getElementById("firstC");
	
<%-- 	var page = <%=tempPage%>; --%>

<%-- <%if (list.size() == 0) { --%>

<%-- 	} else {%>  --%>
// 			secondBtn.innerHTML = page; 
// 		if (page==1) {
// 			firstBtn.innerHTML = "";
// 		}else{
// 			firstBtn.innerHTML = page-1;
<%-- 			firstBtn.setAttribute("href",'<%=request.getRequestURI() + "?page=" + (tempPage - 1)%>'); --%>
// 		}
	
<%-- 		if (page < <%=list.size() / 10%> + <%=list.size() % 10%> && page <= <%=list.size() / 10%>){ --%>
// 			thirdBtn.innerHTML = page+1;
<%-- 			thirdBtn.setAttribute("href",'<%=request.getRequestURI() + "?page=" + (tempPage + 1)%>'); --%>
// 		}else{
// 			thirdBtn.innerHTML = "";
// 		}
<%-- <%}%> --%>
// })
<!-- </script> -->







