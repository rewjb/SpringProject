<%@page import="com.itbank.springProject.db.AttractionsDTO"%>
<%@page import="com.itbank.springProject.db.PlaceCartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	ArrayList list = (ArrayList)request.getAttribute("list");
	AttractionsDTO dto;
	
	
	if (list.size() != 0) {
		for (int i = 0; i < list.size(); i++) {
			dto = (AttractionsDTO) list.get(i);
%>

<form id='<%=dto.getPid()%>'>
	<img
		src="/springProject/resources/IMAGE/attractionsImg/<%=dto.getMainImg()%>"
		width="150" height="150"><br> <label><%=dto.getTitle()%></label>
</form>

<%
		}
	}
%>

