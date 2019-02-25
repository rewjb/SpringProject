<%@page import="com.itbank.springProject.db.AttractionsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	AttractionsDTO dto = (AttractionsDTO)request.getAttribute("dto");
%>

<form id = '<%=dto.getPid() %>'>
	<img src="/springProject/resources/IMAGE/attractionsImg/<%=dto.getMainImg()%>" width="150" height="150"><br>
	<label><%= dto.getTitle() %></label>
</form>

    
    