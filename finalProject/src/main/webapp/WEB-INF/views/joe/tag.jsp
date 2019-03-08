<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
<c:forEach  items="${tagList}" var="list"><!-- 도시를 선택햇을때 선호태그 뿌리는 곳  -->   
<button class = "btn btn-secondary my-2" onclick = 'city(event)' name = "2">
${list.city}
</button>
</c:forEach> 