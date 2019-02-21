<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
일단 이동<br>


<c:forEach items="${cart_list}" var="cart_list">
PID = ${cart_list.pid} <br/>
PID = ${cart_list.title} <br/>
PID = ${cart_list.content} <br/>
PID = ${cart_list.latitude} <br/>
PID = ${cart_list.longitude} <br/>
PID = ${cart_list.mainImg} <br/>
------------------------------------------<br>
</c:forEach>

 
<c:forEach items="${project_list}" var="project_list">
프로젝트 ${project_list} <br/>
</c:forEach>


<c:forEach items="${projectShare_list}" var="projectShare_list">
프로젝트 ${projectShare_list.reg_date} <br/>
프로젝트 ${projectShare_list.mid} <br/>
프로젝트 ${projectShare_list.ptitle} <br/>
</c:forEach>



</body>
</html>