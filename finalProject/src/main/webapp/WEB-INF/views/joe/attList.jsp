<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<%
// 	int tempPage = 0;
// 	if (request.getParameter("page") == null) {
// 		tempPage = 1;
// 	} else {
// 		tempPage = Integer.parseInt(request.getParameter("page"));
// 	}
	
  	ArrayList list = (ArrayList)request.getAttribute("list");
 	System.out.println(list.size()) ;
%>
	<style type="text/css">
	.row
{
   font-family: 'Noto Sans KR', sans-serif;
}
	
	
	</style>

	
	
	
	
	

<div class="row" style="margin-left: auto; margin-right: auto; padding-left: 70px;">
	<c:forEach  items="${list}" var="list">
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
</div>
<div>
	<ul class="pagination pagination-lg">
		<li class="page-item active"><a class="page-link" href="#"id="firstA">1</a>
		</li>
		<li class="page-item"><a class="page-link" href="#" id="firstB">2</a>
		</li>
		<li class="page-item"><a class="page-link" href="#" id="firstC">3</a>
		</li>
	</ul>
</div>








