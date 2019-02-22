<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
<c:forEach  items="${list}" var="list">   
<button class = "btn btn-secondary my-2" onclick = 'city(event)' name = "2">
${list.city}
</button>
</c:forEach> 