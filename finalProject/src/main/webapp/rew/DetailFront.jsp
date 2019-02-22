<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행계획서 상세페이지</title>

<style>
#cart_container {
	
}
</style>

</head>
<body>
	<%@ include file="/UserMainHeader.jsp"%>

	<
	<!-- 최상위 컨테이너 -->
	<div class="container">

		<!-- 페이지 큰 글자 제목 -->
		<h1 class="my-4">
			Plan your trip : <small>I want the plan to be a good trip.</small>
		</h1>
		<!-- /.페이지 큰 글자 제목 -->

		<!-- 계획 툴 -->
		<div class="row">

			<!-- 프로젝트 상세 기록 -->
			<div class="col-md-8"
				style="width: 750px; border: 5px ridge; padding: 0px; height: 100%"
				id="Project_container">

				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
			</div>
			<!-- /.프로젝트 상세 기록 -->


			<!-- 프로젝트 목록 + 관광명소 장바구니 -->
			<div class="col-md-4" style="padding: 0px">

				<!-- 관광명소 장바구니 -->
				<div id="cart_container"
					style="height: 500px; border: 5px ridge; overflow: scroll; overflow-x: hidden; position: fixed; width: 380px;">

					<nav class="navbar navbar-expand navbar-dark bg-dark"
						style="padding: 3px;">

					<div class="collapse navbar-collapse" id="navbarsExample02">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active"><a class="nav-link" href="#">
									장바구니 </a></li>
						</ul>
						<input class="form-control" type="text" placeholder="Search"
							style="width: 200px; margin-right: 10px;">
					</div>
					</nav>
				</div>
				<!-- /.관광명소 장바구니 -->

			</div>
			<!-- /.프로젝트 목록 + 관광명소 장바구니 -->
		</div>
		
		<hr>
<!-- 		댓글과 게시글 내용의 구분선 -->
	
<div class="row">
  <div class="col-3">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">전체댓글</a>
      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 댓글</a>
      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">관련리뷰</a>
      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">리뷰 작성하기</a>
    </div>
  </div>
  <div class="col-9">
    <div class="tab-content" id="v-pills-tabContent">
<!-- 전체댓글 보기 -->
      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" style="background: gray;">
      hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
      <br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
      
      </div>
<!-- /.전체댓글 보기 -->
<!-- 내 댓글 -->
      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
      내 댓글
      </div>
<!-- /.내 댓글 -->
<!-- 관련리뷰 -->
      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
      관련리뷰
      </div>
<!-- /.관련리뷰 -->
<!--리뷰 작성하기 -->
      <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
      리뷰 작성하기
      </div>
<!--리뷰 작성하기 -->
    </div>
  </div>
</div>



		
		
		
		

<!-- 스크롤을 만들기 위한 br! -->
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>

		<script type="text/javascript">
		
		
		// 장바구니 위치 잡아주는 메서드
		window.onload  = window.addEventListener('scroll', function(e) {
				var Project_container = $('#Project_container');
				var cart_container = $('#cart_container');

				// 				console.log('장바구니 높이'+$(cart_container).height());
				// 				console.log('상세 공정 높이'+$(Project_container).height());
				// 				console.log($(document).scrollTop()+'/'+Project_container.offset().top );
				// 				console.log(Project_container.offset().top + '/'+ cart_container.offset().top);

				if ($(document).scrollTop() <= 170) {
					$(cart_container).css('position', '');
					$(cart_container).css('top', '');
				} else if (($(document).scrollTop() + $(cart_container)
						.height()) >= (170 + $(Project_container).height())) {
					$(cart_container).css('position', 'relative');
					$(cart_container).css(
							'top',
							$(Project_container).height()
									- $(cart_container).height());
				} else {
					$(cart_container).css('position', 'fixed');
					$(cart_container).css('top', '100px');
				}
			});
		// ...장바구니 위치 잡아주는 메서드
			
		</script>
</body>
</html>