<%@page import="com.itbank.springProject.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* 	System.out.println("test.jsp");
	String mid = request.getParameter("mid");
	System.out.println(mid); */
%>

<!-- 
<a href="/WEB-INF/views/won/insertMember.jsp"> /WEB-INF/views/won/insertMember.jsp </a><br>
<a href="springProject/WEB-INF/views/won/insertMember.jsp"> springProject/WEB-INF/views/won/insertMember.jsp </a><br>
<a href="/springProject/WEB-INF/views/won/insertMember.jsp"> /springProject/WEB-INF/views/won/insertMember.jsp </a><br> 
-->
<a href="/won/test2"> /won/test2 </a><br>
<a href="springProject/won/test2"> springProject/won/test2 </a><br>
<a href="/springProject/won/test2"> /springProject/won/test2 </a><br>

<a href="/testest"> /testest </a><br>
<a href="springProject/testest"> springProject/testest </a><br>
<a href="/springProject/testest"> /springProject/testest </a><br>


<!-- 
<a href="/WEB-INF/views/home.jsp"> views/home.jsp </a><br>
<a href="/WEB-INF/views/won/won.jsp"> views/won/won.jsp </a><br>
<a href="/WEB-INF/views/won/insertMember.jsp"> views/won/insertMember.jsp </a><br>
 -->

<%-- <c:forEach var="dto" items="${list}">
	${dto.mid} ${dto.mpw} ${dto.mname} ${dto.mprofile} <br>
</c:forEach> --%>
</body>
</html>