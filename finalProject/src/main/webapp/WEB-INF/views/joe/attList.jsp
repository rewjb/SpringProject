<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">

	<style type="text/css">
	.row
{
   font-family: 'Noto Sans KR', sans-serif;
}
	
	</style>
<%
  ArrayList list2 = (ArrayList)request.getAttribute("list");
	int tempPage = 0;
	if (request.getParameter("page") == null) {
		System.out.println(request.getParameter("page"));
		tempPage = 1;
	} else {
		System.out.println(request.getParameter("page"));
		tempPage = Integer.parseInt(request.getParameter("page"));
	}
	
	pageContext.setAttribute("tempPage", tempPage);
	System.out.println(tempPage);

%>

<c:set var="list" value="${list}" />
	
<div class="row" style="margin-left: auto; margin-right: auto; padding-left: 70px;">
<c:choose>	
<c:when test="${fn:length(list) ne 0}">

<c:choose>

<c:when test="${tempPage eq 0 or tempPage eq 1}">

<c:choose>

<c:when test="${fn:length(list) le 12}"><!-- ge   =   <= -->
	<c:forEach items="${list}" var="list">
		<div class="col-lg-4">
			<a href="/springProject/joe/detailPage.jsp"><img style="border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; bor"
				src="/springProject/resources/IMAGE/attractions/${list.mainImg}"
				width="300px" height="250px"></a>
				<table>
					<tr style="width: 300px;">
						<td>
							<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 160px;">${list.title} </p>
							<p style="padding: 1%; width: 160px;">${list.content}</p>
						</td>				
						<td style="text-align: right; "><button class="btn btn-secondary">장바구니</button></td>
					</tr>
				</table>
		</div>
		<!-- /.col-lg-4' -->
	</c:forEach>
</c:when>
<c:when test="${fn:length(list) gt 12}">
<c:forEach begin="1" end="12" items="${list}" var="list">
		<div class="col-lg-4">
			<a href="/springProject/joe/detailPage.jsp"><img style="border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; bor"
				src="/springProject/resources/IMAGE/attractions/${list.mainImg}"
				width="300px" height="250px"></a>
				<table>
					<tr style="width: 300px;">
						<td>
							<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 160px;">${list.title} </p>
							<p style="padding: 1%; width: 160px;">${list.content}</p>
						</td>
						<td style="text-align: right; "><button class="btn btn-secondary">장바구니</button></td>
					</tr>
				</table>
		</div>
		<!-- /.col-lg-4' -->
	</c:forEach>
</c:when>
</c:choose>
</c:when>
<c:when test="${tempPage gt 1}">
	<c:choose>
		<c:when test="${tempPage lt fn:length(list)/12}">
			<c:forEach begin="${((tempPage-1)*12)+1 }" end="${tempPage*12}" items="${list}" var="list">
				<div class="col-lg-4">
					<a href="/springProject/joe/detailPage.jsp"><img style="border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; bor"
						src="/springProject/resources/IMAGE/attractions/${list.mainImg}"
						width="300px" height="250px"></a>
						<table>
							<tr style="width: 300px;">
								<td>
									<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 160px;">${list.title} </p>
									<p style="padding: 1%; width: 160px;">${list.content}</p>
								</td>
								<td style="text-align: right; "><button class="btn btn-secondary">장바구니</button></td>
							</tr>
						</table>
				</div>
				<!-- /.col-lg-4' -->
			</c:forEach>
		</c:when>
			<c:when test="${tempPage gt fn:length(list)/12}">
				<c:forEach begin="${(tempPage-1)*10 }" end="${(tempPage*12) + fn:length(list) % 12 }" items="${list}" var="list">
				<div class="col-lg-4">
					<a href="/springProject/joe/detailPage.jsp"><img style="border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; bor"
						src="/springProject/resources/IMAGE/attractions/${list.mainImg}"
						width="300px" height="250px"></a>
						<table>
							<tr style="width: 300px;">
								<td>
									<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 160px;">${list.title} </p>
									<p style="padding: 1%; width: 160px;">${list.content}</p>
								</td>
								<td style="text-align: right; "><button class="btn btn-secondary">장바구니</button></td>
							</tr>
						</table>
				</div>
				<!-- /.col-lg-4' -->
			</c:forEach>
			
			</c:when>
	</c:choose>
</c:when>
</c:choose>
</c:when>
</c:choose>

</div>


	<div>
	<ul class="pagination pagination-lg">
		<li class="page-item active"><a class="page-link" id="firstA">1</a>
		</li>
		<li class="page-item"><a class="page-link"  id="firstB">2</a>
		</li>
		<li class="page-item"><a class="page-link"  id="firstC">3</a>
		</li>
	</ul>
</div>



<script type="text/javascript">
		$( function() {
			var firstBtn = document.getElementById("firstA");
			var secondBtn = document.getElementById("firstB");
			var thirdBtn = document.getElementById("firstC");
			
			var page = <%=tempPage %>;
			
			
	<%if(list2.size() == 0){
		
	}else{%>
	
	console.log("0");
			secondBtn.innerHTML = page; 
			if (page==1) {
				console.log("1");
				firstBtn.innerHTML = "";
			}else{
				console.log("2");
				firstBtn.innerHTML = page-1;
				firstBtn.setAttribute("href","attractionsLIst.jsp?page=" +'<%= (tempPage-1) %>');
			}
			
		if (page < <%= list2.size()/12 %> + <%= list2.size()%12 %> && page <= <%= list2.size()/12 %>){
			console.log("3");
				thirdBtn.innerHTML = page+1;
				thirdBtn.setAttribute("href","attractionsLIst.jsp?page="+ '<%=(tempPage+1) %>');
		}else{
			console.log("4");
				thirdBtn.innerHTML = "";
			}
		<%}%>
		});
	</script>
	