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
  ArrayList attList = (ArrayList)request.getAttribute("list");//조건에 따른 리스트
   int tempPage = 0;//페이지숫자를 담을 변수
   if ( request.getAttribute("page") == null || request.getAttribute("page").equals("null") || Integer.valueOf((String)request.getAttribute("page")) > (attList.size()/12)+1) {
      tempPage = 1;//페이지가 null이거나 리스트사이즈이상으로 많아질경우 1페이지로이동
   } else {
      tempPage = Integer.valueOf((String)request.getAttribute("page"));
   }
   
   pageContext.setAttribute("tempPage", tempPage);
%>

<c:set var="list" value="${list}"/><!--모델 객체로부터 받은 리스트를 jstl변수에 대입  -->
   
<div class="row" style="margin-left: auto; margin-right: auto; ">
<c:choose>   
<c:when test="${fn:length(list) ne 0}"><!--넘어온 리스트길이가 0이랑 다르면  -->

<c:choose>

<c:when test="${tempPage eq 0 or tempPage eq 1}"><!--페이지가 0이거나 1일경우  -->

<c:choose>
  
<c:when test="${fn:length(list) le 12}"><!-- 리스트길이가 12보다 작거나 같을경우 -->
   <c:forEach items="${list}" var="list">
       <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp?pid=${list.pid}" ><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <h2>★${list.star }</h2>
            <table style="width:100%;">
               <tr>
                  <td>
                        <div>
                            <button class="btn btn-secondary my-2" onclick="cart(event)"value="${list.pid}" >장바구니</button>
                           <p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 70%; float:left; margin-bottom:0; line-height:38px; height:38px;">${list.title} </p>
                        </div>
                     
                     <p style="padding: 1%;overflow: hidden; display: -webkit-box; -webkit-line-clamp: 5;-webkit-box-orient: vertical;">${list.content}</p>
                  </td>
               </tr>
            </table>
      <form id ="${list.pid}" style="display: inline-block; width:100%;">
             <input type="hidden" name="mid" value="<%=session.getAttribute("mid") %>">
      <input type="hidden" name="pid" value="${list.pid}" >
            </form>
      </div>
      <!-- /.col-lg-4' -->
   </c:forEach>
</c:when>
<c:when test="${fn:length(list) gt 12}"><!--리스트길이가 12보다 클경우  -->

<c:forEach begin="0" end="11" items="${list}" var="list">
      <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp?pid=${list.pid}" ><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <h2>★${list.star }</h2>
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
             <input type="hidden" name="mid" value="<%=session.getAttribute("mid") %>">
      <input type="hidden" name="pid" value="${list.pid}">
            </form>
      </div>
      <!-- /.col-lg-4' -->
   </c:forEach>
   
</c:when>
</c:choose>
</c:when>
<c:when test="${tempPage gt 1}"><!-- 페이지가 1보다 클경우 -->
   <c:choose>
      <c:when test="${tempPage le fn:length(list)/12}"> <!-- 페이지가 리스트사이즈를 12로 나눈 값보다 작거나 같을경우 -->
         <c:forEach begin="${((tempPage-1)*12)}" end="${tempPage*12-1}" items="${list}" var="list">
           <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp?pid=${list.pid}" ><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <h2>★${list.star }</h2>
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
             <input type="hidden" name="mid" value="<%=session.getAttribute("mid") %>">
            <input type="hidden" name="pid" value="${list.pid}">
            </form>
      </div>
            <!-- /.col-lg-4' -->
         </c:forEach>
      </c:when>
         <c:when test="${tempPage gt fn:length(list)/12  && fn:length(list)%12 gt 0 }"><!-- 페이지가 리스트길이를 12로 나누값보다 크고 리스트사이즈를 12로나눈 나머지가 0보다 클경우  -->
            <c:forEach begin="${(tempPage-1)*12 }"  items="${list}" var="list">
        <div class="col-lg-4" style="float:left; display: inline-block; width:100%;">
         <a href="/springProject/joe/detailPage.jsp?pid=${list.pid}" ><img style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;"
            src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg}"
            width="300px" height="250px"></a>
            <h2> ★${list.star }</h2>
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
             <input type="hidden" name="mid" value="<%=session.getAttribute("mid") %>">
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
      <li class="page-item "><a class="page-link" id="firstA">1</a><!-- 페이징 할때 번호들 -->
      </li>
      <li class="page-item active"><a class="page-link"  id="firstB" >2</a>
      </li>
      <li class="page-item"><a class="page-link"  id="firstC">3</a>
      </li>
   </ul>
</div>
<script type="text/javascript">

   $(function() {//tempPage에 넘어오는 값과 list의 길이에 따른 페이지 처리 
      var firstBtn = document.getElementById("firstA");
      var secondBtn = document.getElementById("firstB");
      var thirdBtn = document.getElementById("firstC");
<%if (attList.size() == 0) {

			} else {%>
   
   page = <%=tempPage%>
   
//    console.log("0");
         secondBtn.innerHTML = page; 
         if (page==1) {
            console.log("1");
            firstBtn.innerHTML = "";
         }else{
//             console.log("2");
            firstBtn.innerHTML = page-1;
            firstBtn.setAttribute("href","attractionsLIst.jsp?page=" +'<%=(tempPage - 1)%>');
         }
      if (page < <%=attList.size() / 12%> + <%=attList.size() % 12%> && page <= <%=attList.size() / 12%>){
//          console.log("3");
            thirdBtn.innerHTML = page+1;
            thirdBtn.setAttribute("href","attractionsLIst.jsp?page="+ '<%=(tempPage + 1)%>');
		} else {
			console.log("4");
			thirdBtn.innerHTML = "";
		}
<%}%>
	});
</script> 