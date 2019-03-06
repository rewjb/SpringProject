<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
      <label for="exampleSelect2">도시</label>
		<input type="text" class="form-control" id="city" name="city" placeholder="Enter city">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">여행지 명</label>
      <input type="text" class="form-control" id="title" name="title" placeholder="Enter title">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">주소</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="Enter address">
    </div>
    <div class="form-group">
      <label for="exampleTextarea">소개</label>
      <textarea class="form-control" id="content" name="content" rows="2" placeholder="Enter intro"></textarea>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">설명</label>
      <textarea class="form-control" id="contentElements" name="contentElements" rows="5" placeholder="Enter explaination"></textarea>
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