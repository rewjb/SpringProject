<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
일단 이동<br>

<c:forEach items="${list}" var="list">
PID = ${list.pid} <br/>
PID = ${list.title} <br/>
PID = ${list.latitude} <br/>
PID = ${list.longitude} <br/>
PID = ${list.mainImg} <br/>
------------------------------------------<br>
</c:forEach>
</body>
</html>