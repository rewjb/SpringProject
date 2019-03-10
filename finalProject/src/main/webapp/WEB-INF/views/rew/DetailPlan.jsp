<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행계획서 상세페이지</title>
<style>
.R_button_delete {
    background-image: url('/springProject/resources/IMAGE/PlaceCartImg/cart-delete.jpg');
	background-size: 100% 100%;
	width: 35px;
	height: 35px;
	margin: 0px;
	border-color: gray;
}
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
</head>

<body>
<%@ include file="/UserMainHeader.jsp"%>

	<!-- 최상위 컨테이너 -->
	<div class="container">

		<!-- 페이지 큰 글자 제목 -->
		<h1 class="my-4">
			${mid}님 : <small> ${ptitle}</small>
			<div style="display: inline-block;background: gray;">
			<img alt="" style="width: 35px" src="/springProject/resources/IMAGE/star/star_on.png">
			${star}
			</div>
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
				<c:choose>
                <c:when  test="${lastIdex.index==0}">
                </c:when>
                <c:when test = "${planDetail_list.way eq 'unset'}">
		        <div alt="Project_div_move" class="alert alert-info" role="alert" style="padding: 0px;display: inline-block;margin-top: 10px;margin-bottom: 5px;margin-left:30px;">
				이동 = <a onclick="alert('해당하는 경로가 없습니다.');">
				경로 미설정</a></div>
                </c:when>
                <c:when test = "${planDetail_list.way ne 'unset'}">
		        <div alt="Project_div_move" class="alert alert-info" role="alert" style="padding: 0px;display: inline-block;margin-top: 10px;margin-bottom: 5px;margin-left:30px;">
				이동 = <a data-target="#GoogleMap" data-toggle="modal" onclick="openMap(this);">
				${planDetail_list.distance} km / 이동방법 : ${planDetail_list.way}</a></div>
                </c:when>
                </c:choose>
				<div class="shadow p-1 mb-1 bg-white rounded" style="border: 1px solid;" alt="Project_div_step">
				<table style="word-break: break-word;">
				<tr he>
				<td alt="Project_detail_num" class="btn-dark"><h3>
				${planDetail_list.num}
				</h3></td>
				<td alt="Project_detail_img"><img  alt="img" style="outline: 1px solid;width: 140px; height: 105px"	src="/springProject/resources/IMAGE/attractionsImg/${planDetail_list.mainImg}" onerror="errImage(this)"></td>
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
						style="padding: 3px;position: sticky;top:0px">

					<div class="collapse navbar-collapse" id="navbarsExample02">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active"><a class="nav-link" href="#">
									장바구니 </a></li>
						</ul>
						<input  id="Cart-Search" class="form-control" type="text" placeholder="Search" style="width: 200px; margin-right: 10px;" onkeyup="Cart_Search(this);">
					</div>
					</nav>
                   
					<!-- 관광명소 테이블 -->		
					<table class="table table-striped" style="width: 100%;word-break:break-word;border: 1px">
						<tbody>
						
					<c:forEach items="${cart_list}" var="cart_list">
							<tr>
								<th style="padding: 2px;width:66px">
								 <img  style="width:66px;height:50px;vertical-align: middle;"  class="img-fluid" src="/springProject/resources/IMAGE/attractionsImg/${cart_list.mainImg}" alt="${cart_list.mainImg}">
								</th>
								<td alt="Cart-Content" style="vertical-align: middle;">${cart_list.title}</td>
								<td style="width:80px;padding: 0px;vertical-align :middle;text-align: right;" alt="asd" >
								<button class="R_button_delete"  alt="${cart_list.pid}" onclick="setDeleteCart(this);" />
								</td>
							</tr>
					 </c:forEach>
						</tbody>
					</table>
					<!-- /.관광명소 테이블 -->		
							
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
<!--       <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#privateCommentDiv" role="tab" aria-controls="v-pills-profile" aria-selected="false">내 댓글</a> -->
<!--       <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#relatedReviewDiv" role="tab" aria-controls="v-pills-messages" aria-selected="false">관련리뷰</a> -->
<!--       <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#makeReviewDiv" role="tab" aria-controls="v-pills-settings" aria-selected="false">리뷰 작성하기</a> -->
    </div>
  </div>
  <div class="col-9">
<!-- /.댓글 및 리뷰에 관한 버튼 -->

<!-- 전체댓글,내댓글,리뷰 관련된 내용이 보이는 곳 -->
    <div class="tab-content" id="v-pills-tabContent">
<!-- 전체댓글 보기 -->
      <div class="tab-pane fade show active" id="totalCommentDiv" role="tabpanel" aria-labelledby="v-pills-home-tab" style="">
       <div id="totalCommentDiv_head" style="margin-left: 50px;margin-right: 50px;margin-bottom: 10px;background: gainsboro;" >
       <div  style="margin-left: 10px;">댓글작성</div>
        <div id="head_star"  alt=0 style="margin-left: 10px;display: inline-block;">
<!--       별점이 들어가는 곳 -->
        </div>
         <div style="margin-left: 10px;"></div>
          <div style="margin: 10px">
           <textarea  placeholder="댓글을 입력해주세요!" name="headTextArea" style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" onkeydown="cal_text_margin(this);"></textarea>
           <div style="text-align: right;color: gray;" ><span alt=150>150</span>글자</div>
           <div style="text-align: right;"><button onclick="headCommentInsert();">입력</button></div>
         </div>
       </div>
        <div id="totalCommentDiv_body">
<!--       댓글이 들어가는 곳  -->
		</div>
		
		<div style="text-align: center;">
		<div id="pageButton" class="btn-group mr-2" role="group" aria-label="Second group">
        <button alt="prev" type="button" class="btn btn-secondary btn-lg" onclick="pageChage(this)"></button>
        <button alt="now" type="button" class="btn  btn-primary btn-lg" onclick="pageChage(this)">1</button>
        <button alt="next" type="button" class="btn btn-secondary btn-lg" onclick="pageChage(this)"></button>
        </div>
		</div>
		
      </div>
<!-- /.전체댓글 보기 -->
<!-- 내 댓글 -->
      <div class="tab-pane fade" id="privateCommentDiv" role="tabpanel" aria-labelledby="v-pills-profile-tab">
      내 댓글
      </div>
<!-- /.내 댓글 -->
<!-- 관련리뷰 -->
      <div  class="tab-pane fade" id="relatedReviewDiv" role="tabpanel" aria-labelledby="v-pills-messages-tab">
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

   <!-- 구글 맵이 들어있는 모달 -->
<div class="modal fade" id="GoogleMap" role="dialog" aria-hidden="true" style="z-index: 9000" >
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document" style="z-index: 1">
    <div class="modal-content">
      <div class="modal-body ">
      
      
      <!-- 구글 지도  -->
        <div style="display: inline-block;float: left;">
		<div id="map" style="width: 500px; height: 500px;border: 1px"></div>
		<div id="infowindow-content">
			<img src="" width="16" height="16" id="place-icon"> <span
				id="place-name" class="title"></span><br> <span
				id="place-address"></span>
		</div>
	</div>
      <!-- /.구글 지도  -->
    <!-- 구글 경로 -->
	<div id="right-panel"
		style="float: left; overflow: scroll; width: 265px; height: 500px;overflow-x: hidden">
		<p>	거리 : <span id="total"></span></p>
	</div>
    <!-- /.구글 경로 -->
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="GoogleMap_exit" data-dismiss="modal" >취소</button>
        <button type="button" class="btn btn-primary" onclick="GoogleMap_confirm(this)">선택</button>
      </div>
    </div>
  </div>
</div>
<!-- /.구글 맵이 들어있는 모달 -->

<script type="text/javascript">

    var session = '${sessionScope.mid}';
   
	var totalComment;

    var changedStar;
    //댓글 수정시 변경 별점을 기억하는 변수

	function body_starChange(starDiv){
    	
        var updateVail =   $(starDiv).parent('div[alt=starNum]').next().next().attr('readonly');
        // 수정중인지 여부
        
        if (updateVail != 'readonly') {
			
    	var starArray = $(starDiv).parent('div[alt=starNum]').find('img');
        //같은 층에 있는 이미지 별 클릭
    	
    	var starNumber = Number($(starDiv).attr('alt'));
        //클릭한 이미지의 해당 숫자
        
    	for (var i = 0; i < starArray.length; i++) {
    		$(starArray[i]).attr('src','/springProject/resources/IMAGE/star/star_off.png');
		}
        
        for (var i = 0; i < starNumber; i++) {
    		$(starArray[i]).attr('src','/springProject/resources/IMAGE/star/star_on.png');
		}
        
        changedStar=starNumber;

		}
		
	}
	
	
	function setDeleteCart(button) {

		var pid = $(button).attr('alt');

		$.ajax({
			url : "setDeleteCart?pid=" + pid,
			type : 'post',
			dataType : "text",//반환받을 데이터 타입 선택
			success : function(result, confirm) {
				if (result == 'success') {
					$(button).closest('tr').remove();
					alert('삭제가 완료되었습니다.');
				} else {
					alert('삭제오류 발생!');
				}
			}//success끝
		})//ajax끝

	}
	// ...setDeleteCart

	// 장바구니 검색어 (input 아이디 : Cart-Search)
	function Cart_Search(inputValue) {

		var Cart_Content = $('td[alt=Cart-Content]');

		//하위 for 문을 통해 보여줄 th를 정한다.
		for (var i = 0; i < Cart_Content.length; i++) {
			if (Cart_Content[i].innerHTML.indexOf(inputValue.value) != -1) {
				Cart_Content[i].parentNode.style.display = 'table-row';
				//Cart_Content[i].style.display = 'table-row';
			} else {
				Cart_Content[i].parentNode.style.display = 'none';
				//Cart_Content[i].style.display = 'none';
				if (inputValue.value == '') {
					Cart_Content[i].parentNode.style.display = 'table-row';
				}
			}
		}
	}
	// ...장바구니 검색어

	function errImage(img) {
		img.src = '/springProject/resources/IMAGE/star/lostImg.png';
	}

	// 페이지 변환 메서드
	function pageChage(button) {
		
		var pageInCount = 10;
		
		//보여줄 댓글 수량

		$.ajax({
			url : "getCommentInfoAjax?pMid=${mid}&ptitle=${ptitle}",
			dataType : "json",
			async : false,
			success : function(result) {
				totalComment = result;
				alert(totalComment.length);
			},
			error : function() {
				alert('댓글로딩에 오류 발생!');
			}
		});

		$('div#totalCommentDiv_body').empty();

		var inputNum = parseInt($(button).text());

		$('button[alt=prev]').text(inputNum - 1);
		$('button[alt=now]').text(inputNum);
		$('button[alt=next]').text(inputNum + 1);

		if ($('button[alt=now]').text() == '1') {
			$('button[alt=prev]').css('visibility', 'hidden');
		} else {
			$('button[alt=prev]').css('visibility', 'visible');
		}
		
		var firstCommentCount=0;
		
		for (var i = 0; i < totalComment.length ; i++) {
			if (totalComment[i].level==1) {
				++firstCommentCount;
			}
		}
		

		var lastpage = Math.ceil(firstCommentCount / pageInCount);
		
		if (lastpage  == $('button[alt=now]')
				.text() ) {
			$('button[alt=next]').css('visibility', 'hidden');
		} else {
			$('button[alt=next]').css('visibility', 'visible');
		}
		

		var index = -1;

		var startIndex = (inputNum - 1) * pageInCount;

		var endIndex = (inputNum - 1) * pageInCount + pageInCount;
		//마지막 번호는 미포함!

		var standardHiddenDiv;
		//가장 최근에 생성된 hidden div!

		for (var i = 0; i < totalComment.length; i++) {

			if (totalComment[i].level == 1) {
				++index;

				if (index == endIndex) {
					break;
				}
				if (index >= startIndex) {

					$('div#totalCommentDiv_body').append(
							insertViewCommentO(totalComment[i].star,
									totalComment[i].reg_date,
									totalComment[i].mid,
									totalComment[i].content));
					standardHiddenDiv = insertViewHiddenDiv();
					$('div#totalCommentDiv_body').append(standardHiddenDiv);
				}
			} else {
				$(standardHiddenDiv).append(
						insertViewCommentX(totalComment[i].level,
								totalComment[i].reg_date, totalComment[i].mid,
								totalComment[i].content));
			}
		}


		$('button[alt=down_comment]').click(function() {
			var temp = $(this).parents('table').nextAll('div')[0]
			$(temp).toggle(500);
		});

		$('div[alt=down_comment_container').hide();
	}
	// ...페이지 변환 메서드

	// 시작하자마자 별을 추가하는 메서드
	$(document)
			.ready(
					function start() {

						// 밑에는 별을 추가하는 메서드	
						var star;

						for (var i = 0; i < 5; i++) {
							star = '<img alt="'
									+ (i + 1)
									+ '" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_off.png"  onclick="checkStar(this);">';
							$('#head_star').append($(star));

						}
						$
								.ajax({
									url : "getCommentInfoAjax?pMid=${mid}&ptitle=${ptitle}",
									dataType : "json",
									async : false,
									success : function(result) {
										totalComment = result;
									},
									error : function() {
										alert('댓글로딩에 오류 발생!');
									}
								});

						//       alert(totalComment.length);
						//       확인용

						$('button[alt=now]').click();


					});
	// ...시작하자마자 별을 추가하는 메서드

	// 최초 댓글 입력
	function headCommentInsert() {
		//작업중
		
		if (session =='') {
			alert('로그인을 먼저 해주세요!');
		}else {
			
		

		var text = $('#totalCommentDiv_head').find('textarea').val();
		$('#totalCommentDiv_head').find('textarea').val('');
		var star = $('#head_star').attr('alt');

		//     	alert(star);
		//     	alert(text);
		//      확인용

		$.ajax({
			url : "setHeadCommentInfoAjax",
			data : 'starValue=' + star + '&Content=' + text
					+ '&ptitle=${ptitle}&pMid=${mid}',
			dataType : "json",
			async : false,
			success : function(result) {
				//mid,content,reg_date,star
				if (result != null) {
					$('div#totalCommentDiv_body')
							.prepend(insertViewHiddenDiv());
					$('div#totalCommentDiv_body').prepend(
							insertViewCommentO(result.star, result.reg_date,
									result.mid, result.content));
				} else {
					alert('댓글등록 오류발생!');
				}
			},
			error : function() {
				alert('댓글등록 오류발생!');
			}
		});
		
		}
	}
	// ...최초 댓글 입력

	// 댓글에 답글 달기!
	function showLinkAddComment(button) {
		
		if (session =='') {
			alert('로그인을 먼저 해주세요!');
		} else {

		

		var table = $(button).parents('table');
		var td = $(table).find('td')[0];
		var width = parseInt($(td).css('width').split('p')[0]) + 25;

		$('table[alt=addForm]').remove();
		var temp = insertFormComment(width);
		$(table).after(temp);
		
		}
	}
	// ...댓글에 답글 달기!

	// 댓글-답글-등록
	function bodyCommentInsert(button) {
		
		if (session =='') {
			alert('로그인을 먼저 해주세요');
			
		}else {
			
		

		var parentTable = $(button).parents('table');
		var prevTable = $(button).parents('table').prev();

		var Content = $(parentTable).find('textarea').val();
		var level = parseInt($(prevTable).attr('alt')) + 1;
		var distinction = $(prevTable).find('span[alt=mid]').text() + '&&'
				+ $(prevTable).find('span[alt=time]').text();
		var sendContent = $(parentTable).find('textarea').val();
		var pMid = '${mid}';
		var ptitle = '${ptitle}';

		var sendData = {
			Content : Content,
			level : level,
			distinction : distinction,
			sendContent : sendContent,
			pMid : pMid,
			ptitle : ptitle
		};
		$.ajax({
			url : "setBodyCommentInfoAjax",
			data : sendData,
			type : "POST",
			dataType : "json",
			async : false,
			success : function(result) {

				var Level = parseInt($(prevTable).attr('alt'));

				if (Level == 1) {
					$(parentTable).next().prepend(
							insertViewCommentX(Level + 1, result.reg_date,
									result.mid, result.content));
				} else {
					$(prevTable).after(
							insertViewCommentX(Level + 1, result.reg_date,
									result.mid, result.content));
				}
				$('table[alt=addForm]').remove();
			},
			error : function() {
				alert('댓글로딩에 오류 발생!');
			}
		});
		
		}
	}
	// ...댓글-답글-등록

	// 헤드 댓글 별 추가 메서드 
	function checkStar(star) {
		var number = $(star).attr('alt');

		var stars = $(star).parent('div#head_star').children();

		for (var i = 0; i < stars.length; i++) {
			$(stars[i]).attr('src',
					'/springProject/resources/IMAGE/star/star_off.png');
		}

		for (var i = 0; i < number; i++) {
			$(stars[i]).attr('src',
					'/springProject/resources/IMAGE/star/star_on.png');
		}

		$(star).parent('div#head_star').attr('alt', number);
	}
	// ...헤드 댓글별 추가 메서드 

	//  글자 계산 메서드  + 글자입력 제한
	function cal_text_margin(textArea) {
		// 		console.log('입력값 = '+$(textArea).val() + ' / 길이 = '+$(textArea).val().length );
		// 		글자 갯수 확인용
		var length = $(textArea).val().length;

		var temp = '';

		if (length > 150) {

			for (var i = 0; i < 150; i++) {
				temp += $(textArea).val()[i];
			}
			$(textArea).val(temp);
			$('#text_length').text(0);
		} else {
			$(textArea).next().find('span').text(150 - length);
		}
	}
	//  ...글자 계산 메서드  + 글자입력 제한

	//댓글 수정
	function updateTextarea(button) {
		
		if (session =='') {
			alert('로그인을 먼저 해주세요!');
		}else {
		

		if ($(button).text() == '수정') {

			$(button).parents('table').find('textarea').removeAttr('readonly');
			$(button)
					.before(
							'<div style="text-align: right;color: gray;" ><span alt=150></span>글자</div>');

			$(button).text('수정완료')
		} else {
			var parentTable = $(button).parents('table')

			var content = $(parentTable).find('textarea').val();
			var level = parseInt($(parentTable).attr('alt'));
			var distinction = $(parentTable).find('span[alt=mid]').text()
					+ '&&' + $(parentTable).find('span[alt=time]').text();
			var pMid = '${mid}';
			var ptitle = '${ptitle}';
			var beforeStar = $(parentTable).find('div[alt=starNum]').attr('num');
			var starValue = changedStar;

			var sendData = {
				content : content,
				level : level,
				distinction : distinction,
				pMid : pMid,
				ptitle : ptitle,
				beforeStar : beforeStar,
				starValue : starValue
			};

			$.ajax({
				url : "setBodyCommentInfoUpdateAjax",
				data : sendData,
				dataType : "text",
				async : false,
				success : function(result) {
					if (result == 'yes') {
						$(button).prev().remove();
						$(button).parents('table').find('textarea').attr(
								'readonly', 'readonly');
						$(button).text('수정')
						alert('댓글수정 완료');
					} else {
						alert('댓글수정 - 데이터 베이스 오류!');
					}
				},
				error : function() {
					alert('댓글수정에 오류 발생!');
				}
			});
		}
		}
	}
	// ...댓글 수정

	// 댓글 삭제
	function deleteComment(button) {
		
		if (session == '') {
		alert('로그인을 먼저 해주세요!');	
		}else {
			
		
		
		var temp = confirm('정말로 삭제하시겠습니까?');

		if (temp == true) {

			var parentTable = $(button).parents('table');

			var distinction;
			var level;
			var pMid;
			var ptitle;

			if (parseInt($(parentTable).attr('alt')) > 2) {
				distinction = $(parentTable).prev().find('span[alt=mid]')
						.text()
						+ '&&'
						+ $(parentTable).prev().find('span[alt=time]').text();
			} else if (parseInt($(parentTable).attr('alt')) == 2) {
				var tempP = $(parentTable).parent('div');
				distinction = $(tempP).prev().find('span[alt=mid]').text()
						+ '&&' + $(tempP).prev().find('span[alt=time]').text();
			} else {
				distinction = $(parentTable).find('span[alt=mid]').text()
						+ '&&' + $(parentTable).find('span[alt=time]').text();
			}

			var level = parseInt($(parentTable).attr('alt'));
			var pMid = '${mid}';
			var ptitle = '${ptitle}';
			var starValue = parseInt($(parentTable).find('div[alt=starNum]').attr('num'));

			var dist = $(parentTable).find('span[alt=mid]').text() + '&&'
					+ $(parentTable).find('span[alt=time]').text();

			var sendData = {
				level : level,
				distinction : distinction,
				pMid : pMid,
				ptitle : ptitle,
				dist : dist,
				starValue : starValue
			};
			
			alert( JSON.stringify(sendData));
			$
					.ajax({
						url : "setDeleteCommentAjax",
						data : sendData,
						dataType : "text",
						async : false,
						success : function(result) {
							if (result == 'yes') {
								if (parseInt($(parentTable).attr('alt')) == 1) {
									$(parentTable).next().remove();
									$(parentTable).remove();
								} else {
									while (true) {
										if ($(parentTable).attr('alt') >= $(
												parentTable).next().attr('alt')
												|| $(parentTable).next().attr(
														'alt') == null) {
											break;
										} else {
											$(parentTable).next().remove();
										}
									}
									$(parentTable).remove();
								}
							} else {
								alert('댓글삭제 오류발생!');
							}
						},
						error : function() {
							alert('댓글삭제에 오류 발생!');
						}
					});
		}
		}
	}
	// ...댓글 삭제

	function insertViewHiddenDiv() {

		var hiddenDiv = '<div alt="down_comment_container" style="background: ghostwhite;">'
				+ '</div>';

		return $(hiddenDiv);
	}

	function insertFormComment(width) {

		var starComment = '<table class="table" style="margin: 0px;" alt="addForm">'
				+ '<tr>'
				+ '<td style="text-align: right;width: ' 
				+ width
				+ 'px"  alt="width"><img alt="댓글 이미지"  style="width: 75px" src="/springProject/resources/IMAGE/star/add.png"></td>'
				+ '<td>'
				+ '<textarea style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" onkeydown="cal_text_margin(this);"></textarea>'
				+ '<div style="text-align: right;color: gray;" ><span alt=150>150</span>글자</div>'
				+ '<div style="text-align: right;">'
				+ '<button onclick="bodyCommentInsert(this);">등록</button>'
				+ '</div>' + '</td>' + '</tr>' + '</table>';

		return $(starComment);
	}

	function insertViewCommentX(levelNum, reg_date, mid, content) {

		var starComment = '<table class="table" style="margin: 0px;" alt='+levelNum+'>'
				+ '<tr>'
				+ '<td style="text-align: right;width: '
				+ (85 + levelNum * 25)
				+ 'px"  alt="width"><img alt="댓글 이미지"  style="width: 75px" src="/springProject/resources/IMAGE/star/add_comment.png"></td>'
				+ '<td>'
				+ '<p style="color: gray;">작성시간 : <span alt="time">'
				+ reg_date
				+ '</span> / 작성자 : <span alt="mid">'
				+ mid
				+ '</span>님 </p>'
				+ '<textarea style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" readonly="readonly" onkeydown="cal_text_margin(this);">'
				+ content
				+ '</textarea>'
				+ '<div style="text-align: right;">'
				+ '<button onclick="updateTextarea(this);">수정</button>'
				+ '<button onclick="deleteComment(this);">삭제</button>'
				+ '<button onclick="showLinkAddComment(this)">답글</button>'
				+ '</div>' + '</td>' + '</tr>' + '</table>';

		return $(starComment);
	}

	function insertViewCommentO(starNum, reg_date, mid, content) {

		var starComment = '<table class="table" style="margin: 0px;" alt=1>'
				+ '<tr>'
				+ '<td style="text-align: right;width: 1px" ></td>'
				+ '<td>'
				+ '<div alt="starNum" desc="false" num='+starNum+' style="margin-bottom: 10px;float: left;margin-right: 20px">';

		for (var i = 0; i < starNum; i++) {
			starComment += '<img alt="'+(i+1)+'" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_on.png" onclick="body_starChange(this)">';
		}
		for (var i = 0; i < 5 - starNum; i++) {
			starComment += '<img alt="'+(i+starNum+1)+'" style="width: 25px;" src="/springProject/resources/IMAGE/star/star_off.png" onclick="body_starChange(this)">';
		}

		starComment = starComment
				+ '</div>'
				+ '<p style="color: gray;">작성시간 : <span alt="time">'
				+ reg_date
				+ '</span> / 작성자 : <span alt="mid">'
				+ mid
				+ '</span>님 </p>'
				+ '<textarea style="margin-bottom: 0px;width: 100%;  resize: none;height: 100px" readonly="readonly" onkeydown="cal_text_margin(this);">'
				+ content + '</textarea>' + '<div style="text-align: right;">'
				+ '<button onclick="updateTextarea(this);">수정</button>'
				+ '<button onclick="showLinkAddComment(this)">답글</button>'
				+ '<button onclick="deleteComment(this);">삭제</button>'
				+ '<button alt="down_comment">답글열기</button>' + '</div>'
				+ '</td>' + '</tr>' + '</table>';
		return $(starComment);
	}
</script>

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
		
  <script type="text/javascript">
  //구글맵
    
      var directionsService ;
      var directionsDisplay ;
      var map;
      var start_marker;
      var end_marker;
      
      function openMap(button) {
    	  
    	  var center =  $(button).closest('div');
    	  var prevStep = center.prev();
    	  var nextStep = center.next();
    	  
    	  var method = $(button).text();
    	  var method_step1 = method.split('/')[1];
    	  var method_step2 = method_step1.split(':')[1].trim();
    	  
    	  var wayMethod;
    	  
          switch (method_step2) {
		case '걷기': wayMethod= 'WALKING';
			break;
		case '대중교통': wayMethod= 'TRANSIT';
			break;
		case '자전거': wayMethod= 'BICYCLING';
			break;
		case '자동차': wayMethod= 'DRIVING';
		}
          
          
          
    	  
    	  var prevStep_Head =  prevStep.find('h5').text();
    	  var prevStep_Body = prevStep.find('span').text();
    	  var prevStep_lat = prevStep.find('input[name=latitude]').val();
    	  var prevStep_lon = prevStep.find('input[name=longitude]').val();
    	   
    	  var nextStep_Head = nextStep.find('h5').text();
    	  var nextStep_Body = nextStep.find('span').text();
    	  var nextStep_lat = nextStep.find('input[name=latitude]').val();
    	  var nextStep_lon = nextStep.find('input[name=longitude]').val();
//     	  start = {lat : Number(back_latitude) ,	lng :  Number(back_longitude) };

	    var start = {lat : Number(prevStep_lat) ,	lng :  Number(prevStep_lon) };
	    var end = {lat: Number(nextStep_lat) , lng : Number(nextStep_lon)}

  		start_marker = new google.maps.Marker({
			position : start,
			map : map
		});
  		end_marker = new google.maps.Marker({
			position : end,
			map : map
		});
  		
    	 displayRoute(start, end, directionsService,
     	            directionsDisplay,wayMethod);
	}
      
      function initMap() {
    	  
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: -24.345, lng: 134.46}  // Australia.
        });
         directionsService = new google.maps.DirectionsService;
         directionsDisplay = new google.maps.DirectionsRenderer({
          draggable: false,
          map: map,
          panel: document.getElementById('right-panel')
        });
        directionsDisplay.addListener('directions_changed', function() {
          computeTotalDistance(directionsDisplay.getDirections());
        });

      }
      
      function displayRoute(origin, destination, service, display , wayMethod) {
          service.route({
            origin: origin,
            destination: destination,
            travelMode: wayMethod,
            avoidTolls: true
          }, function(response, status) {
            if (status === 'OK') {
              display.setDirections(response);
            } else {
              alert('Could not display directions due to: ' + status);
            }
          });
        }

      function computeTotalDistance(result) {
        var total = 0;
        var myroute = result.routes[0];
        for (var i = 0; i < myroute.legs.length; i++) {
          total += myroute.legs[i].distance.value;
        }
        total = total / 1000;
        document.getElementById('total').innerHTML = total + ' km';
      }
      
		function attachSecretMessage(marker, secretMessage) {
		
		    infowindow_start = new google.maps.InfoWindow({
				content : secretMessage
			});

			infowindow_start.open(marker.get('map'), marker);
			
			marker.addListener('click', function() {
				infowindow_start.open(marker.get('map'), marker);
			});
		}
	    
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-jWynFZkmm5Ewdpk0b7ubq0zExpO0gpw&libraries=places&callback=initMap">
    </script>

		
</body>
</html>