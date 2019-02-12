<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>전체 회원</h2>
<hr>
<c:forEach var="list" items="${list }">

ID : ${list.id }<br>
PW : ${list.pw }<br>
name : ${list.name }<br>
tel : ${list.tel }
<hr>
	
</c:forEach>
</body>
</html>