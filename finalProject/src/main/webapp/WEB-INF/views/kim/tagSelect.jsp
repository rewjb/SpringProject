<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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

<style>

/* img {float: left; width: 50%;} */
/* .btn {width:2em;height:280px;border:0;background:#f5f6fa;display:none;} */
#slider {position:relative;margin:0 auto;padding:0;list-style:none;width:1300px;height:980px;overflow-x:hidden} 
#slider li {display:none;position:absolute;left:0;top:0; margin: auto;}
#slider img {height:400px; width:600px; float:left; background: black; border-radius: 0.75rem}
li{padding-top: 1rem;}
/* body{ background: linear-gradient(to bottom, #a6bddb, white);} */

/* 퍼온 부트스트랩 css코드 */

:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #84ceff);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-img-left {
  width: 550px;
  /* Link to your background image using in the property below! */
  background: scroll center url('/springProject/resources/IMAGE/login.jpg');
  background-size: cover;
}

.card-signin .card-body {
  padding: 5rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}

</style>

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


<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
 
	<!--------------------------------- 슬라이드 코드 start ------------------------------------------>
	var num = 0;
    var time = 500;
    var idx = idx2 = 0;
       
    var slide_width = $("#slider").width();
    var slide_count = $("li").length;
    
   $("#slider li:first").css("display", "block");
    
    if(slide_count > 1)
        $(".btn").css("display", "inline");
    
    $(".prev_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx - 1) % slide_count;
            if(idx2 < 0)
                idx2 = slide_count - 1;
            $("#slider li:hidden").css("left", "-"+slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "+="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", "-"+slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "+="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
    
    $(".next").click(function() {
    	<!-- 이미지 클릭할 때마다 body에 이미지 src를 담은 히든자식 생성해서 붙이기-->
    	var src = $(this).attr("src")
    	
    	if(src != null) { 
    		num += 1;
    		$("#tag").append("<input type='hidden' name='tag" + num + "' value='" + src + "'>")
    	}
    	
    	if(num == 3){
    		$("#form").submit();
    	}
    	
        if(slide_count > 1) {
            idx2 = (idx + 1) % slide_count;
            $("#slider li:hidden").css("left", slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "-="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "-="+slide_width+"px" }, time);
            idx = idx2;
        }
    });   
    <!--------------------------------- 슬라이드 코드 end ------------------------------------------>
	
	<!-- 이미지에 마우스 오버 효과 -->
    $("img").hover( 
    		  function () { 
    		    $(this).css("opacity", 0.7); 
    		  }, 
    		  function () { 
    		    $(this).css("opacity", 1);
    		  } 
    ) 
    
    
})

</script>

</head>
<body>

<form id="form" action="Tag_Select_Submit">
<ul id="slider">
	<li style="width: 1300px;">
	 <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex" style="height: 750px; weight: 400px;">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">Register</h5>
            <div class="form-signin">
              <div class="form-label-group">
                <input type="text" id="inputUserame" class="form-control" placeholder="Username" required autofocus>
                <label for="inputUserame">Username</label>
              </div>

              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required>
                <label for="inputEmail">Email address</label>
              </div>
              
              <hr>

              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <label for="inputPassword">Password</label>
              </div>
              
              <div class="form-label-group">
                <input type="password" id="inputConfirmPassword" class="form-control" placeholder="Password" required>
                <label for="inputConfirmPassword">Confirm password</label>
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase next" type="button">Register</button>
              <a class="d-block text-center mt-2 small" href="#">Sign In</a>
              <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign up with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	</li>
	
	<li style="width: 1300px;">
		 <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
			<div class="card-body" style="background: white; margin: auto;">
				
				<div class="jumbotron pt-5">
				  <h1 class="display-4">선호 여행지 선택</h1><br>
				  <p class="lead">마음에 드는 여행지들을 선택하면 취향에 맞는 여행지를 추천 받을 수 있습니다!</p>
				  <hr class="my-4">
				  <p>*선택한 여행지는 추후 수정가능합니다.</p><br>
				  <a class="btn btn-primary btn-lg next" href="#" role="button">시작</a>&nbsp;&nbsp;
				  <a href="#">다음에 할래요.</a>
				</div>
				
			</div>
			</div>
			</div>
			</div>
			</div>
	</li>
	
    <c:forEach begin="1" end="3" varStatus="status"> 
    <!-- 슬라이드 -->
    <li>
	<p class="pt-5">
    <table style="border-spacing: 5px; border-collapse: separate;"> 
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-4]}" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-3]}" class="next"></td>
    	</tr>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-2]}" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-1]}" class="next"></td>
    	</tr>
    </table>
	</li>
    </c:forEach>
</ul>

<div id="tag">
</div>
</form>

</body>
</html>