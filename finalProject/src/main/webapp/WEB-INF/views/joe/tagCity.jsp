<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach  items="${cityList}" var="list">   
<button class = "btn btn-secondary my-2" onclick = 'tag(event)' name = "tag">
${list.category}
</button>
</c:forEach> 