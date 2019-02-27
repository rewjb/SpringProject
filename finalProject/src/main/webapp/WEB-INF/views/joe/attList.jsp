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
	System.out.println(list2.size());
   int tempPage = 0;
   if ( request.getAttribute("page") == null || request.getAttribute("page").equals("null")) {
      System.out.println(request.getAttribute("page") + "null일때");
      tempPage = 1;
   } else {
      System.out.println(request.getAttribute("page") + "null아닐때");
      tempPage = Integer.valueOf((String)request.getAttribute("page"));
   }
   
   pageContext.setAttribute("tempPage", tempPage);
   System.out.println("temp체크"+ tempPage);
%>

<c:set var="list" value="${list}"/>
   
<div class="row" style="margin-left: auto; margin-right: auto; ">
<c:choose>   
<c:when test="${fn:length(list) ne 0}">

<c:choose>

<c:when test="${tempPage eq 0 or tempPage eq 1}">

<c:choose>

<c:when test="${fn:length(list) le 12}"><!-- ge   =   <= -->
   <c:forEach items="${list}" var="list">
       <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp"><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <table style="width:100%;">
               <tr>
                  <td>
                  		<div>
                  			 <button class="btn btn-secondary my-2" onclick="cart(event)"value="${list.pid}" >장바구니</button>
                  			<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 70%; float:left; margin-bottom:0; line-height:38px; height:38px;">${list.title} </p>
                  		</div>
                     
                     <p style="padding: 1%;overflow: hidden; display: -webkit-box; -webkit-line-clamp: 5;-webkit-box-orient: vertical;">${list.content}</p>
                  </td>
<!--                   <td style="text-align: right; "></td> -->
               </tr>
            </table>
      <form id ="${list.pid}" style="display: inline-block; width:100%;">
             <input type="hidden" name="mid" value="123">
      <input type="hidden" name="pid" value="${list.pid}" id ="${list.pid}">
            </form>
      </div>
      <!-- /.col-lg-4' -->
   </c:forEach>
</c:when>
<c:when test="${fn:length(list) gt 12}">

<c:forEach begin="1" end="12" items="${list}" var="list">
      <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp"><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <table style="width:100%;">
               <tr>
                  <td>
                  		<div>
                  			 <button class="btn btn-secondary my-2" onclick="cart(event)" value="${list.pid}">장바구니</button>
                  			<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 70%; float:left; margin-bottom:0; line-height:38px; height:38px;">${list.title} </p>
                  		</div>
                     
                     <p style="padding: 1%;overflow: hidden; display: -webkit-box; -webkit-line-clamp: 5;-webkit-box-orient: vertical;">${list.content}</p>
                    
                  </td>
<!--                   <td style="text-align: right; "></td> -->
               </tr>
            </table>
      <form id ="${list.pid}" style="display: inline-block; width:100%;">
             <input type="hidden" name="mid" value="123">
      <input type="hidden" name="pid" value="${list.pid}">
            </form>
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
           <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp"><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <table style="width:100%;">
               <tr>
                  <td>
                  		<div>
                  			 <button class="btn btn-secondary my-2" onclick="cart(event)" value="${list.pid}">장바구니</button>
                  			<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 70%; float:left; margin-bottom:0; line-height:38px; height:38px;">${list.title} </p>
                  		</div>
                     
                     <p style="padding: 1%;overflow: hidden; display: -webkit-box; -webkit-line-clamp: 5;-webkit-box-orient: vertical;">${list.content}</p>
                    
                  </td>
<!--                   <td style="text-align: right; "></td> -->
               </tr>
            </table>
      <form id ="${list.pid}" style="display: inline-block; width:100%;">
             <input type="hidden" name="mid" value="123">
      		<input type="hidden" name="pid" value="${list.pid}">
            </form>
      </div>
            <!-- /.col-lg-4' -->
         </c:forEach>
      </c:when>
         <c:when test="${tempPage gt fn:length(list)/12}">
            <c:forEach begin="${(tempPage-1)*10 }" end="${(tempPage*12) + fn:length(list) % 12 }" items="${list}" var="list">
            <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp"><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <table style="width:100%;">
               <tr>
                  <td>
                  		<div>
                  			 <button class="btn btn-secondary my-2" onclick="cart(event)" value="${list.pid}">장바구니</button>
                  			<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 70%; float:left; margin-bottom:0; line-height:38px; height:38px;">${list.title} </p>
                  		</div>
                     
                     <p style="padding: 1%;overflow: hidden; display: -webkit-box; -webkit-line-clamp: 5;-webkit-box-orient: vertical;">${list.content}</p>
                    
                  </td>
<!--                   <td style="text-align: right; "></td> -->
               </tr>
            </table>
      <form id ="${list.pid}" style="display: inline-block; width:100%;">
             <input type="hidden" name="mid" value="123">
      		<input type="hidden" name="pid" value="${list.pid}">
            </form>
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
      <li class="page-item"><a class="page-link"  id="firstB" >2</a>
      </li>
      <li class="page-item"><a class="page-link"  id="firstC">3</a>
      </li>
   </ul>
</div>



<script type="text/javascript">

	

	$(function() {
		var firstBtn = document.getElementById("firstA");
		var secondBtn = document.getElementById("firstB");
		var thirdBtn = document.getElementById("firstC");
<%if(list2.size() == 0){
      
   }else{%>
   
   page = <%= tempPage%>
   
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
   