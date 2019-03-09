<%@page import="com.itbank.springProject.db.AttractionsDTO"%>
<%@page import="com.itbank.springProject.db.PlaceCartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%-- <%ArrayList list = (ArrayList)request.getAttribute("list");  --%>
<!-- 	System.out.println("사이즈 몇이야 : "+ list.size()); -->

<!-- %> -->

<c:set var="list" value="${list}"/><!-- 모델 속성으로 넘어온 list를 변수에 담는다 -->
<c:if test="${fn:length(list) ne 0}"><!-- 리스트의 길이가 0과 다르면 -->

<c:forEach items="${list}" var="list">

<form alt='${list.pid }' >
		<img
			src="/springProject/resources/IMAGE/attractionsImg/${list.mainImg }"
			style="width: 150px; height: 130px;"><br> <label>${list.title }</label>
</form>
			<button class="btn btn-primary my-2" value ='${list.pid}' onclick="deleteCart(event)">삭제</button>
			<hr>
</c:forEach>
</c:if>
