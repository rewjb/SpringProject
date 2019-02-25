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


<%-- <c:forEach items="${cart_list}" var="cart_list"> --%>
<%-- PID = ${cart_list.pid} <br/> --%>
<%-- PID = ${cart_list.mid} <br/> --%>
<%-- PID = ${cart_list.ptitle} <br/> --%>
<%-- PID = ${cart_list.title} <br/> --%>
<%-- PID = ${cart_list.content} <br/> --%>
<%-- PID = ${cart_list.latitude} <br/> --%>
<%-- PID = ${cart_list.longitude} <br/> --%>
<%-- PID = ${cart_list.way} <br/> --%>
<%-- PID = ${cart_list.detail} <br/> --%>
<%-- PID = ${cart_list.num} <br/> --%>
<%-- PID = ${cart_list.distance} <br/> --%>
<!-- ------------------------------------------<br> -->
<%-- </c:forEach> --%>


	

<c:forEach items="${planDetail_list}" var="planDetail_list">
PID = ${planDetail_list.pid} <br/>
PID = ${planDetail_list.mid} <br/>
PID = ${planDetail_list.ptitle} <br/>
PID = ${planDetail_list.title} <br/>
PID = ${planDetail_list.content} <br/>
PID = ${planDetail_list.latitude} <br/>
PID = ${planDetail_list.longitude} <br/>
PID = ${planDetail_list.way} <br/>
PID = ${planDetail_list.detail} <br/>
PID = ${planDetail_list.num} <br/>
PID = ${planDetail_list.distance} <br/>
------------------------------------------<br>
</c:forEach>

</body>
</html>