<%@page import="com.itbank.springProject.db.AttractionsDTO"%>
<%@page import="com.itbank.springProject.db.PlaceCartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:set var="list" value="${list}"/>


<c:if test="${fn:length(list) ne 0}">

<c:forEach items="${list}" var="list">

<form alt='${list.pid }'>
		<img
			src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg }"
			width="50" height="150"><br> <label>${list.title }</label>
</form>
			<button class="btn btn-primary my-2" value ='${list.pid}' onclick="deleteCart(event)">삭제</button>
</c:forEach>
</c:if>
