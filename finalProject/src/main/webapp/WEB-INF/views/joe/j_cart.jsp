<%@page import="com.itbank.springProject.db.AttractionsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	AttractionsDTO dto = (AttractionsDTO)request.getAttribute("dto");
%>

<form id = '<%=dto.getId() %>'>
	<img  src="<%=dto.getMainImg() %>"><br>
	<label><%= dto.getTitle() %></label>
</form>

    
    