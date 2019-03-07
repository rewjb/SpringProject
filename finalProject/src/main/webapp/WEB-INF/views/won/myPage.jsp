<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>

.inputDiv {
display: inline-block;
width: 150px;
text-align: center;
}
.inputDiv2 {
display: inline-block;
width: 500px;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/UserMainHeader.jsp" %>

<div class="container marketing">

<legend class="display-4 pt-3" style="text-align: center; font-family: 'Do Hyeon', sans-serif;">마이페이지</legend>
<hr>
<div>

<form action="placeReq">
   
    <div class="form-group">
    	<div class="inputDiv">이름</div>
    	<div class="inputDiv2">
    	<input type="text" class="form-control" id="city" name="city" placeholder="Enter city"></div>
    </div>
 
    
    <input type="hidden" id="mainImg" name="mainImg" value="123">
    <input type="hidden" id="userId" name="userId" value="유저아이디">
    
    <input type="submit" class="btn btn-primary">
    <a class="btn btn-sm btn-outline-secondary" href="Tag_Select">태그페이지</a>
    <a class="btn btn-sm btn-outline-secondary" href="/springProject/joe/attractionsLIst.jsp">여행지 리스트</a>
    </form>


</div>
</div>

<%@ include file="/UserMainFooter.jsp" %>
</body>
</html>