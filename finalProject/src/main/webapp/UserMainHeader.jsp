<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	if(session.getAttribute("recommend") == null) {
		response.sendRedirect("/springProject/kim/Tag_Select_Submit2");		
	}
%>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Do+Hyeon|Jua|Noto+Sans+KR|Stylish" rel="stylesheet">

<!--제이쿼리-->
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>

<!--부트 스트랩 자바스크립트-->
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.bundle.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.min.js"></script>

<!--부트 스트랩 CSS-->
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-grid.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-grid.min.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-reboot.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-reboot.min.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap.min.css" />

<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/blog.css" />
  <div style="background: white; background: linear-gradient(to bottom, #ddfdff, white);">
  <div class="container">
  <header class="blog-header py-4 rounded">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="text-muted pl-3" href="#">Subscribe</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/springProject/main.jsp">
        <img src="/springProject/resources/IMAGE/logo4.png" width="250px"></a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center pr-4">
		<!-- session에 mid의 존재유무에 따라 버튼을 다르게 띄워줌 -->
		<%if(session.getAttribute("mid")==null){ %>     
	        <a class="btn btn-sm btn-outline-secondary" href="/springProject/kim/Tag_Select">Login / SignUp</a>
		<%}else{ %>     
	        &nbsp;
	        <a class="btn btn-sm btn-outline-secondary" href="/springProject/won/selectMember">mypage</a>
	        &nbsp;     
        	<a class="btn btn-sm btn-outline-secondary" href="/springProject/won/logout">Logout</a>
	        <%if(session.getAttribute("mid").equals("admin@admin.com")) {%>
	        &nbsp;
	        <a class="btn btn-sm btn-outline-secondary" href="/springProject/kim/placeReq_list">admin</a>
	        <%} %>
		<%} %>
      </div>
    </div>
  </header>
  
  <div class="btn-group" role="group" aria-label="Basic example" style="width: 100% ;">
  
  <!--여행정보 버튼-->
  <div class="btn-group" role="group" style="width: 25%">
    <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         여행정보
    </button>  
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"  style="width: 100%">
      <a class="dropdown-item" href="/springProject/joe/attractionsLIst.jsp">관광명소 보기</a>
      <a class="dropdown-item" href="/springProject/rew/planList?page=1">여행계획서 보기</a>
    </div>
  </div>
  
  <!--여행계획 버튼-->
  <div class="btn-group" role="group" style="width: 25%">
    <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         여행계획서
    </button>  
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="width: 100%">
      <a class="dropdown-item" href="/springProject/rew/TravelPlan">여행계획 세우기</a>
    </div>
  </div>
  
  <!--관광명소 신청 버튼-->
  <div class="btn-group" role="group" style="width: 25%">
    <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         관광명소 신청
    </button>  
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"  style="width: 100%">
      <a class="dropdown-item" href="/springProject/kim/placeReq.jsp">명소 신청</a>
    </div>
  </div>
  
  <!--고객센터 버튼-->
  <div class="btn-group" role="group" style="width: 25%">
    <button id="btnGroupDrop1" type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         고객센터
    </button>  
    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"  style="width: 100%">
    </div>
  </div>
</div>
</div>
</div>
      <br>













