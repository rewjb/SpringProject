<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
.R_button_insert {
    background-image: url('/springProject/resources/IMAGE/PlaceCartImg/cart-insert.jpg');
	background-size: 100% 100%;
	width: 35px;
	height: 35px;
	margin: 0px;
	border-color: gray;
}

.R_button_delete {
    background-image: url('/springProject/resources/IMAGE/PlaceCartImg/cart-delete.jpg');
	background-size: 100% 100%;
	width: 35px;
	height: 35px;
	margin: 0px;
	border-color: gray;
}
</style>

</head>
<body>
 <%@ include file="/UserMainHeader.jsp" %>

 
 <!-- 최상위 컨테이너 -->
<div class="container">

  <!-- 페이지 큰 글자 제목 -->
  <h1 class="my-4">Plan your trip : 
    <small>I want the plan to be a good trip.</small>
  </h1>
  <!-- /.페이지 큰 글자 제목 -->

  <!-- 계획 툴 -->
  <div class="row" style="height:600px">

    <!-- 프로젝트 상세 기록 -->
    <div class="col-md-8" style="width: 750px;background: red;overflow:scroll;overflow-x:hidden; ">
    </div>
    <!-- /.프로젝트 상세 기록 -->

    <!-- 프로젝트 목록 + 관광명소 장바구니 -->
    <div class="col-md-4" style="padding: 0px">

				<!-- 프로젝트 목록 -->
				<div
					style="height: 40%; border: 5px ridge; overflow: scroll; overflow-x: hidden;">
					
					<table class="table table-striped" style="width: 100%;word-break:break-word;">
						<thead>
							<tr>
								<th style="vertical-align : middle;">검색</th>
								<th colspan="2"><input class="form-control" id="Project-Search"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<td>Markdddddddddddddd</td>
								<td >Otto</td>
							</tr>
							<tr>
								<th>2</th>
								<td>Jacob</td>
								<td>Thornton</td>
							</tr>
							<tr>
								<th>3</th>
								<td>Larry</td>
								<td>the Bird</td>
							</tr>
						</tbody>
					</table>
					
					
				</div>
				<!-- /.프로젝트 목록 -->

				<!-- 관광명소 장바구니 -->
				<div
					style="height: 60%; border: 5px ridge; overflow: scroll; overflow-x: hidden;">

					<table class="table table-striped" style="width: 100%;word-break:break-word;border: 1px">
						<thead>
							<tr>
								<th style="vertical-align : middle;">검색</th>
								<th colspan="2"><input class="form-control" id="Cart-Search"></th>
							</tr>
						</thead>
						<tbody>
						
						    <!-- 회원의 장바구니 정보를 get! -->
							<c:forEach items="${cart_list}" var="cart_list">
							<form alt="나는 form!" onsubmit="return cart_form();">
							<tr alt="나  tr이다!">
								<th style="padding: 2px;width:50px">
								<img  style="width:50px;height:50px;vertical-align: middle;"  class="img-fluid" src="http://placehold.it/500x300" alt="${cart_list.mainImg}">
								</th>
								<td alt="Cart-Content" style="vertical-align: middle;">${cart_list.title}	</td>
								
								<!-- 관광명소 id,경도,위도를 숨기기 -->
								<input type="hidden" name="pid" value="${cart_list.pid}">
								<input type="hidden" name="title" value="${cart_list.title}">
								<input type="hidden" name="longitude" value="${cart_list.longitude}"><!-- 경도 -->
								<input type="hidden" name="latitude" value="${cart_list.latitude}"><!-- 위도 -->
								
								<td style="width:80px;padding: 0px;vertical-align :middle;" alt="asd" >
								<input type="submit" class="R_button_insert" alt="in" onclick="cart_button();">
								<input type="submit" class="R_button_delete" alt="de" onclick="cart_button();">
								</td>
							</tr>
							</form>
							</c:forEach>
							<!-- /.회원의 장바구니 정보를 get! --> 
						</tbody>
					</table>
				</div>
				<!-- /.관광명소 장바구니 -->
			</div>
    <!-- /.프로젝트 목록 + 관광명소 장바구니 -->
    
    <script type="text/javascript">
    
    var inNde;
    
    function cart_form() {
    	if (inNde == 'in') {

    		var asd = {aa:'aa' , bb:'bb' };
    		//alert(decodeURI($(event.target).serializeObject());
    		alert($(event.target).get('longitude'));
			alert('삽입='+$(event.target).serialize());
		}else{
			alert('삭제');
		}
    	
    	return false;
	}
    
    function cart_button() {
    	
    	inNde = $(event.target).attr('alt');
    	console.log('inNde 값 = '+inNde);
    	
	}
    
    
    
    </script>





		</div>
  <!-- /.계획 툴 -->

  <!-- Related Projects Row -->
  <h3 class="my-4">Popular projects</h3>

  <div class="row">

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
             <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

  </div>
  <!-- /.row -->

</div>
<!-- /.최상위 컨테이너 -->
 
 
 
</body>
</html>