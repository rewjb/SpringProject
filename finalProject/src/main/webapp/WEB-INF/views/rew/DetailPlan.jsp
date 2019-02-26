<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행계획서 상세페이지</title>

<style>
@import url('//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css')
</style>
</head>

<body>
<%@ include file="/UserMainHeader.jsp"%>

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
				
				<!--  프로젝트 세부 내용 -->
				<c:forEach items="${planDetail_list}" var="planDetail_list" varStatus="lastIdex">
				<div class="shadow p-1 mb-1 bg-white rounded" style="border: 1px solid;" alt="Project_div_step">
				<table style="word-break: break-word;">
				<tr he>
				<td alt="Project_detail_num" class="btn-dark"><h3>
				${planDetail_list.num}
				</h3></td>
				<td alt="Project_detail_img"><img alt="img"	style="width: 140px; height: 105px"	src="http://placehold.it/500x300"></td>
				<td alt="Project_detail_content" style="vertical-align: top; width: 100%;">
				<div alt="Project_detail_content_head" style="border-bottom: 1px solid;">
				<h5 style="margin: 0px;">
				${planDetail_list.title}
				</h5>
				<span style="color: gray;font-size: 11px;">
				${planDetail_list.content}
				</span>
				</div>
				<textarea alt="Project_detail_content_body" style="width: 100%;height: 64px;resize: none;border: 0px;" readonly="readonly">${planDetail_list.detail}</textarea>
				</td>
				</tr>
				</table>
				<input name="latitude" type="hidden" value="${planDetail_list.latitude}">
				<input name="longitude" type="hidden" value=" ${planDetail_list.longitude}">
				<input name="way" type="hidden" value="">
				</div>
				<c:choose>
                <c:when  test="${lastIdex.last}">
                </c:when>
                <c:when test = "${planDetail_list.way eq 'unset'}">
		        <div alt="Project_div_move" class="alert alert-info" role="alert" style="padding: 0px;display: inline-block;margin-top: 10px;margin-bottom: 5px;margin-left:30px;">
				이동 = <a data-toggle="modal" alt="move">
				경로 미설정</a></div>
                </c:when>
                <c:otherwise>
		        <div alt="Project_div_move" class="alert alert-info" role="alert" style="padding: 0px;display: inline-block;margin-top: 10px;margin-bottom: 5px;margin-left:30px;">
				이동 = <a data-toggle="modal" alt="move">
				${planDetail_list.distance} km / 이동방법 : ${planDetail_list.way}</a></div>
                </c:otherwise>
                </c:choose>
				</c:forEach>
				<!--  /.프로젝트 세부 내용 -->
			</div>
			<!-- /.프로젝트 상세 기록 -->


			<!-- 프로젝트 목록 + 관광명소 장바구니 -->
			<div class="col-md-4" style="padding: 0px">

				<!-- 관광명소 장바구니 -->
				<div id="cart_container"
					style="height: 300px; border: 5px ridge; overflow: scroll; overflow-x: hidden; position: fixed; width: 380px;">

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
		
<!-- 		댓글과 게시글 내용의 구분선 -->
		<hr>
<!-- 		/.댓글과 게시글 내용의 구분선 -->

<!-- 댓글 및 리뷰에 관한 버튼 -->
<div class="row">
  <div class="col-3">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#totalCommentDiv" role="tab" aria-controls="v-pills-home" aria-selected="true">전체댓글</a>
      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#privateCommentDiv" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 댓글</a>
      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#relatedReviewDiv" role="tab" aria-controls="v-pills-messages" aria-selected="false">관련리뷰</a>
      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#makeReviewDiv" role="tab" aria-controls="v-pills-settings" aria-selected="false">리뷰 작성하기</a>
    </div>
  </div>
  <div class="col-9">
<!-- /.댓글 및 리뷰에 관한 버튼 -->





<!-- 전체댓글,내댓글,리뷰 관련된 내용이 보이는 곳 -->
    <div class="tab-content" id="v-pills-tabContent">
<!-- 전체댓글 보기 -->
      <div class="tab-pane fade show active" id="totalCommentDiv" role="tabpanel" aria-labelledby="v-pills-home-tab" style="">
       <div id="totalCommentDiv_head" style="margin-left: 50px;margin-right: 50px;margin-bottom: 10px" >
       <div  style="margin-left: 10px;">댓글작성</div>
        <div id="head_star"  alt="" style="margin-left: 10px;display: inline-block;">
<!--       별점이 들어가는 곳 -->
        </div>
         <div style="margin-left: 10px;"></div>
          <div style="margin: 10px">
           <textarea placeholder="댓글을 입력해주세요!"  style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" onkeydown="cal_text_margin(this);"></textarea>
           <div style="text-align: right;color: gray;" ><span  id="text_length" alt=150>150</span>글자</div>
         </div>
       </div>
        <div id="totalCommentDiv_body">

							<table class="table">
									<tr>
										<td style="text-align: right;width: 1px" ></td>
										<td>
										<div style="margin-bottom: 10px;float: left;margin-right: 20px">
										<img alt="1" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="2" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="3" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="4" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="5" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_off.png">
										</div>
										<p style="color: gray;">작성시간 : <span alt="time">2019-02-25</span> / 작성자 : <span alt="mid">유주빈</span>님 </p>
										<textarea style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" readonly="readonly">멋져요 1</textarea>
										<div style="text-align: right;">
										<button>수정</button>
										<button>삭제</button>
										<button alt="down_comment">답글</button>
										</div>
										</td>
									</tr>
							</table>
							<div alt="down_comment_container">
							<table class="table">
									<tr>
										<td style="text-align: right;width: 75px" ><img alt="댓글 이미지"  style="width: 50px" src="/springProject/resources/IMAGE/star/add_comment.png"></td>
										<td>
										<div style="margin-bottom: 10px;float: left;margin-right: 20px">
										<img alt="1" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="2" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="3" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="4" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="5" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_off.png">
										</div>
										<p style="color: gray;">작성시간 : <span alt="time">2019-02-25</span> / 작성자 : <span alt="mid">유주빈</span>님 </p>
										<textarea style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" readonly="readonly">멋져요 2</textarea>
										<div style="text-align: right;">
										<button>수정</button>
										<button>삭제</button>
										</div>
										</td>
									</tr>
							</table>
							<table class="table">
									<tr>
										<td style="text-align: right;width: 100px" ><img alt="댓글 이미지"  style="width: 50px" src="/springProject/resources/IMAGE/star/add_comment.png"></td>
										<td>
										<div style="margin-bottom: 10px;float: left;margin-right: 20px">
										<img alt="1" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="2" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="3" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="4" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png">
										<img alt="5" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_off.png">
										</div>
										<p style="color: gray;">작성시간 : <span alt="time">2019-02-25</span> / 작성자 : <span alt="mid">유주빈</span>님 </p>
										<textarea style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" readonly="readonly">멋져요 3</textarea>
										<div style="text-align: right;">
										<button>수정</button>
										<button>삭제</button>
										</div>
										</td>
									</tr>
							</table>
							</div>
							
							dddddddddddddddddddddd

		</div>
      </div>
<!-- /.전체댓글 보기 -->
<!-- 내 댓글 -->
      <div class="tab-pane fade" id="privateCommentDiv" role="tabpanel" aria-labelledby="v-pills-profile-tab">
      내 댓글
      </div>
<!-- /.내 댓글 -->
<!-- 관련리뷰 -->
      <div class="tab-pane fade" id="relatedReviewDiv" role="tabpanel" aria-labelledby="v-pills-messages-tab">
      관련리뷰
      </div>
<!-- /.관련리뷰 -->
<!--리뷰 작성하기 -->
      <div class="tab-pane fade" id="makeReviewDiv" role="tabpanel" aria-labelledby="v-pills-settings-tab">
      리뷰 작성하기
      </div>
<!--/..리뷰 작성하기 -->
    </div>
<!-- /.전체댓글,내댓글,리뷰 관련된 내용이 보이는 곳 -->
  </div>
</div>



<script type="text/javascript">
// 	/springProject/resources/IMAGE/star/star_off.png


    // 시작하자마자 별을 추가하는 메서드ㅊ
	$(document).ready(function start() {
		
	 // 밑에는 별을 추가하는 메서드	
	 var star;

	 for (var i = 0; i < 5; i++) {
		star = '<img alt="'+(i+1)+'" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_off.png"  onclick="checkStar(this);">';
		$('#head_star').append($(star));

	 }
	 
	 
	 $('div[alt=down_comment_container').hide();
	 
	 $('button[alt=down_comment]').click(function() {
			$(this).parents('table').next().toggle(500);
	  })
      
      parents('table');
	});
    // ...시작하자마자 별을 추가하는 메서드ㅊ
	
	// 별 추가 메서드 
	function checkStar(star) {
		var number = $(star).attr('alt');
		
		var stars = $(star).parent('div#head_star').children();	
		
		for (var i = 0; i < stars.length; i++) {
			$(stars[i]).attr('src' ,'/springProject/resources/IMAGE/star/star_off.png');
		}
		
		for (var i = 0; i < number; i++) {
			$(stars[i]).attr('src' ,'/springProject/resources/IMAGE/star/star_on.png');
		}
		
		$(star).parent('div#head_star').attr('alt',number);
	}
	// ...별 추가 메서드 


	
	
	//  글자 계산 메서드  + 글자입력 제한
	function cal_text_margin(textArea) {
// 		console.log('입력값 = '+$(textArea).val() + ' / 길이 = '+$(textArea).val().length );
// 		글자 갯수 확인용
		var length = $(textArea).val().length;
		
		$('#text_length').text(150-length);
		
		var temp ='';
		
		if (length>150) {
			
			for (var i = 0; i < 150; i++) {
				temp += $(textArea).val()[i];
			}
			$(textArea).val(temp);
		    $('#text_length').text(0);
		}
	}
	//  ...글자 계산 메서드  + 글자입력 제한
	
	
</script>

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
		
				
	
				
		</script>
		
		  
		
		




<%-- <c:forEach items="${planDetail_list}" var="planDetail_list"> --%>
<%-- PID = ${planDetail_list.pid} <br/> --%>
<%-- PID = ${planDetail_list.mid} <br/> --%>
<%-- PID = ${planDetail_list.ptitle} <br/> --%>
<%-- PID = ${planDetail_list.title} <br/> --%>
<%-- PID = ${planDetail_list.content} <br/> --%>
<%-- PID = ${planDetail_list.latitude} <br/> --%>
<%-- PID = ${planDetail_list.longitude} <br/> --%>
<%-- PID = ${planDetail_list.way} <br/> --%>
<%-- PID = ${planDetail_list.detail} <br/> --%>
<%-- PID = ${planDetail_list.num} <br/> --%>
<%-- PID = ${planDetail_list.distance} <br/> --%>
<!-- ------------------------------------------<br> -->
<%-- </c:forEach> --%>


		
</body>
</html>