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
			<div class="col-md-8"
				style="width: 750px; overflow: scroll; overflow-x: hidden; border: 5px ridge; padding: 0px;" id="Project_container">

				<nav class="navbar navbar-expand navbar-dark bg-dark"  style="margin-bottom: 7px;">
				<div class="collapse navbar-collapse" id="navbarsExample02">
					<button class="btn btn-secondary" id="Project_ptitle">프로젝트 제목</button>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="#"
							onclick="alert('저장');">저장</a></li>
						<li class="nav-item active"><a class="nav-link" onclick="Project_create_step();">
							생성</a></li>
						<li class="nav-item active"><a class="nav-link" data-toggle="modal" data-target="#Project_place_delete">
						삭제</a></li>
						<li class="nav-item active"><a class="nav-link" href="#"
							onclick="alert('공유');">공유</a></li>
					</ul>
					<form>
						<input class="form-control" type="text" placeholder="내용을 입력">
					</form>
				</div>
				</nav>
				
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
								<th colspan="2" style="vertical-align : middle;">
								<input class="form-control" id="Project-Search" placeholder="계획서명을 입력" onkeyup="Project_Search(this);">
								</th>
								<th style="text-align: right;">
									<!-- 여행계획 프로젝트 생성 버튼 -->
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="width: 60px">
									생성
									</button>
									<!-- /.여행계획 프로젝트 생성 버튼 -->
								</th>
							</tr>
						</thead>
						<tbody id="Project-Container">
							<tr>
								<td alt="Project-Content" colspan="3" onclick="Move_Project_Data(this);">project01</td>
							</tr>
							<tr>
								<td alt="Project-Content" colspan="3" onclick="Move_Project_Data(this);">project02</td>
							</tr>
							<tr>
								<td alt="Project-Content" colspan="3" onclick="Move_Project_Data(this);">project03</td>
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
								<th colspan="3"><input class="form-control" id="Cart-Search" type="text" placeholder="관광명소명을 입력" onkeyup="Cart_Search(this);"></th>
							</tr>
						</thead>
						<tbody>
						
						    <!-- 회원의 장바구니 정보를 get! -->
							<c:forEach items="${cart_list}" var="cart_list">
							<form alt="나는 form!" onsubmit="return cart_form();" >
							<tr>
								<th style="padding: 2px;width:66px">
								 <img  style="width:66px;height:50px;vertical-align: middle;"  class="img-fluid" src="http://placehold.it/500x300" alt="${cart_list.mainImg}">
								</th>
								<td alt="Cart-Content" style="vertical-align: middle;">${cart_list.title}</td>
								
								<!-- 관광명소 id,경도,위도를 숨기기 -->
								<input type="hidden" name="pid" value="${cart_list.pid}"><!-- 관광명소 아이디 -->
								<input type="hidden" name="title" value="${cart_list.title}"><!-- 대제목  -->
								<input type="hidden" name="content" value="${cart_list.content}"><!-- 소제목  -->
								<input type="hidden" name="longitude" value="${cart_list.longitude}"><!-- 경도 -->
								<input type="hidden" name="latitude" value="${cart_list.latitude}"><!-- 위도 -->
								<input type="hidden" name="mainImg" value="${cart_list.mainImg}"><!-- 이미지 -->
								
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
    
 <!-- 여행계획 프로젝트  생성 버튼 클릭시 생성되는 모달  -->
 <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">당신의 여행계획을 만드세요.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <table>
      <td>계획서명</td>
      <td id="PlanName" style="color: green;"></td>
      </table>
          <input class="form-control" id="MakePlan" onkeyup="validity_MakePlan(this);">
       </div>
      <div class="modal-footer">
        <button type="button" id="cancel_button" class="btn btn-secondary" alt="cancel" data-dismiss="modal" onclick="finish_MakePlan(this);">취소</button>
        <button type="button" id="save_button" class="btn btn-primary" alt="save" onclick="finish_MakePlan(this);">생성</button>
      </div>
    </div>
  </div>
 </div>
 <!-- /.여행계획 프로젝트  생성 버튼 클릭시 생성되는 모달  -->
 
 <!-- 프로젝트 step 컴포넌트 삭제시  -->
 <div class="modal fade" id="Project_place_delete" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
    선택하신 여행장소를 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="Project_delete_button" onclick="Project_delete(this)">삭제</button>
      </div>
    </div>
  </div>
 </div>
 
 <!-- /.프로젝트 step 컴포넌트 삭제시  -->
 
			<script type="text/javascript">
			
			function Project_delete(button) {
				$(button).prev().click();
				
				var steps = $('#Project_container').children('div[alt=Project_div_step]');
				
					//step이 1개 초과일때
					for (var i = 0; i < steps.length; i++) {
						
						if (steps.length==1) {
							$(steps[0]).prev().children('a').text('이동경로를 설정하세요.');
							$(steps[0]).next().next().remove();
							$(steps[0]).next().remove();
							$(steps[0]).remove();
						}else {
						
						 if (steps[i].style.outline != '') {
							
							if (i+1==steps.length) {
								//선택 step이 마지막
								$(steps[i]).prev().remove();
								$(steps[i]).next().remove();
								$(steps[i]).remove();
							}else {
								//선택 step이 마지막 x
								$(steps[i]).prev().children('a').text('이동경로를 설정하세요.');
								$(steps[i]).next().next().remove();
								$(steps[i]).next().remove();
								$(steps[i]).remove();
							}
						 }
						}
					}
				
			
				
				
				steps =  $('#Project_container').find('h3');
				
				for (var i = 0; i < steps.length; i++) {

					steps[i].innerHTML = i+1;
					//번호 새로 부여
					
					}

				}

				function Project_step_onclick(step_div) {

					var steps = $('#Project_container').children(
							'div[alt=Project_div_step]');

					for (var i = 0; i < steps.length; i++) {
						$(steps[i]).css('outline', '');
					}

					$(step_div).css('outline', 'blue 6px solid');

				}

				// Project_create_step
				function Project_create_step() {

					//console.log($('#Project_container').children('div:last').last().children('td[alt=Project_detail_num] h3').text());
					var steps = $('#Project_container').children(
							'div[alt=Project_div_step]');

					var component = Project_insert_element(steps.length + 1,
							'http://placehold.it/500x300',
							'장바구니 혹은 경로설정을 통해 장소를 결정', '', '', '', '',
							'이동경로를 설정하세요.', '');
					if (steps.length + 1 != 1) {
						$('#Project_container')
								.append(component.component_move);
						$('#Project_container')
								.append(component.component_step);
					} else {
						$('#Project_container')
								.append(component.component_step);
					}

				}
				// ...Project_create_step

				// 여행계획 공정 생성
				function Project_insert_element(num, src, title, content,
						detail_content, latitude, longitude, distance, way) {
					//아직 src는 설정이 안되어 있다.

					//생성시 나오는 폼
					var component_move_text = '<div alt="Project_div_move" class="alert alert-info" role="alert" style="padding: 0px;display: inline-block;margin-top: 10px;margin-bottom: 5px;margin-left:30px;">'
							+ '이동 : <a href="#">'
							+ way
							+ distance
							+ '</a>'
							+ '</div>';

					var component_step_text = '<div class="shadow p-1 mb-1 bg-white rounded" style="border: 1px solid;" alt="Project_div_step" onclick="Project_step_onclick(this);">'
							+ '<table style="word-break: break-word;">'
							+ '<tr he>'
							+ '<td alt="Project_detail_num" class="btn-dark"><h3>'
							+ num
							+ '</h3></td>'
							+ '<td alt="Project_detail_img"><img alt="img"	style="width: 140px; height: 105px"	src="'+src+'"></td>'
							+ '<td alt="Project_detail_content" style="vertical-align: top; width: 100%;">'
							+ '<div alt="Project_detail_content_head" style="border-bottom: 1px solid;">'
							+ '<h5 style="margin: 0px;">'
							+ title
							+ '</h5>'
							+ '<span style="color: gray;font-size: 11px;">'
							+ content
							+ '</span>'
							+ '</div>'
							+ '<textarea alt="Project_detail_content_body" style="width: 100%;height: 64px;resize: none;border: 0px;" placeholder="상세계획을 작성해 봅시다!">'
							+ detail_content
							+ '</textarea>'
							+ '</td>'
							+ '</tr>'
							+ '</table>'
							+ '</div>'
							+ '<form>'
							+ '<input name="num" type="hidden" value="">'
							+ '<input name="mainimg" type="hidden" value="">'
							+ '<input name="title" type="hidden" value="">'
							+ '<input name="content" type="hidden" value="">'
							+ '<input name="detail" type="hidden" value="">'
							+ '<input name="latitude" type="hidden" value="'+latitude+'">'
							+ '<input name="longitude" type="hidden" value="'+longitude+'">'
							+ '<input name="distance" type="hidden" value="">'
							+ '<input name="way" type="hidden" value="">'
							+ '</form>';
					var component_step = $(component_step_text);
					var component_move = $(component_move_text);

					var component = {
						component_step : component_step,
						component_move : component_move
					};

					return component;

				}
				// ...여행계획 공정 생성

				// 프로젝트 선택 시 = > 해당 프로젝트에 맞는 프로젝트를 불러온다.
				function Move_Project_Data(data) {

					//alert($(data).text());
					//검사용

					var dataArray = $('td[alt=Project-Content]');

					for (var i = 0; i < dataArray.length; i++) {
						$(dataArray[i]).css('outline', '');
					}

					$(data).css('outline', 'blue 6px solid');

					$('#Project_ptitle').text($(data).text());

					$
							.ajax({
								url : "GetProjectData?mid=temp&ptitle="
										+ $(data).text(),//요청을 보낼 url
								dataType : "json",//반환받을 데이터 타입 선택
								success : function(result, confirm) {

									var Project_children = $(
											'#Project_container').children();
									// step 모든 객체 얻어오기

									for (var i = 1; i < Project_children.length; i++) {
										$(Project_children[i]).remove();
									}
									//기존에 화면에 있던 상세 step 삭제!

									console.log('ajax Json length ='
											+ result.length);

									var steps = $('#Project_container')
											.children(
													'div[alt=Project_div_step]');

									var component;

									for (var i = 0; i < result.length; i++) {
										//console.log( i+'번째 : '+ result[i].latitude);

										component = Project_insert_element(
										//step과 move 갖고오기
										result[i].num,
												'http://placehold.it/500x300',
												result[i].title,
												result[i].content,
												result[i].detail,
												result[i].latitude,
												result[i].longitude, '이동방법 : '
														+ result[i].way,
												'거리 : ' + result[i].distance
														+ 'km / ');

										if (result[i].num != 1) {
											$('#Project_container').append(
													component.component_move);
											$('#Project_container').append(
													component.component_step);
										} else {
											$('#Project_container').append(
													component.component_step);
										}

									}
									//작업중

									//mid,ptitle,title,content,latitude,longitude,way,mainImg,num;
									//var list = result.result;
									//$(list).each(function(index, person) {
									//})//each 끝
								}//success끝
							})//ajax끝

				}
				// ...프로젝트 선택 시 = > 해당 프로젝트에 맞는 프로젝트를 불러온다.

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

				// 프로젝트 검색어
				function Project_Search(inputValue) {

					var Cart_Content = $('td[alt=Project-Content]');

					//하위 for 문을 통해 보여줄 th를 정한다.
					for (var i = 0; i < Cart_Content.length; i++) {

						if (Cart_Content[i].innerHTML.indexOf(inputValue.value) != -1) {
							Cart_Content[i].style.display = 'table-cell';
							//Cart_Content[i].style.display = 'table-row';
						} else {
							Cart_Content[i].style.display = 'none';
							//Cart_Content[i].style.display = 'none';
							if (inputValue.vlaue == '') {
								Cart_Content[i].style.display = 'table-cell';
							}
						}
					}

				}
				// ...프로젝트 검색어

				// 프로젝트 생성 자바스크립트
				function validity_MakePlan(inputValue) {

					var PlanName = $('td[alt=Project-Content]');

					for (var i = 0; i < PlanName.length; i++) {

						//console.log(PlanName[i].innerHTML+'는'+(PlanName[i].innerHTML==inputValue));
						//확인용
						if (PlanName[i].innerHTML.indexOf(inputValue.value) != -1) {
							$('#PlanName').css('color', 'red');
							$('#PlanName').text('이미 존재하는 이름입니다.');
							break;
						} else {
							$('#PlanName').css('color', 'green');
							$('#PlanName').text('사용이 가능한 이름입니다.');
						}
					}
				}
				// ...프로젝트 생성 자바스크립트

				// 프로젝트 생성  확인 및 취소 자바스크립트
				function finish_MakePlan(button) {

					if (button.getAttribute('alt') == 'save') {

						if ($('#PlanName').text() == '사용이 가능한 이름입니다.') {
							// 설명 : 저장을 할 수 있는 if문 내부!

							var component_text = '<tr>'
									+ '<td alt="Project-Content" colspan="3" onclick="Move_Project_Data(this);">'
									+ $('#MakePlan').val() + '</td>' + '</tr>';
							//생설될 태그 컴포넌트 미리 제작

							$('#MakePlan').val('');
							$('#cancel_button').click();
							$('#PlanName').text('');
							// 모달을 취소하며 input의 value를 ''로 대체

							var component = $(component_text);

							$('#Project-Container').prepend(component);

						} else {

							$('#MakePlan').val('');
						}
					} else {
						$('#MakePlan').val('');
						$('#PlanName').text('');
					}
				}
				// ...프로젝트 생성  확인 및 취소 자바스크립트

				// 장바구니에 있는 버튼 자바스크립트
				var inNde;

				function cart_form() {

					if (inNde == 'in') {
						//var form = $(event.target);
						//var data = JSON.stringify(decodeURI(form.serialize(true)));
						//console.log(data);
						//var data_json = JSON.parse(data);
						//console.log(data_json.pid);
						//alert(form.serialize(true));
						//alert(form.serialize(false));
						//위 주석은 개발 과정

						var arr = $(event.target).serializeArray();
						var len = arr.length;
						var dataObj = {};//자바스크립트 객체

						for (i = 0; i < len; i++) {
							dataObj[arr[i].name] = arr[i].value;
						}

						//console.log(dataObj['pid']);
						//console.log(dataObj['title']);
						//console.log(dataObj['content']);
						//console.log(dataObj['longitude']);
						//console.log(dataObj['latitude']);
						//console.log(dataObj['mainImg']);
						//확인용!

						var steps = $('#Project_container').children(
								'div[alt=Project_div_step]');
						//'<td alt="Project_detail_num" class="btn-dark"><h3>'+num+'</h3></td>'+
						var step_num;

						for (var i = 0; i < steps.length; i++) {
							if (steps[i].style.outline != '') {
								step_num = i + 1;
							}
						}
						
						$(steps[step_num - 1]).next().remove();

						$(steps[step_num - 1])
								.replaceWith(
										Project_insert_element(step_num,
												'http://placehold.it/500x300',
												dataObj['title'],
												dataObj['content'], '',
												dataObj['latitude'],
												dataObj['longitude'], '미정',
												'미정').component_step);

					} else {
						alert('삭제');
					}

					return false;
				}

				function cart_button() {
					inNde = $(event.target).attr('alt');
					//console.log('inNde 값 = ' + inNde);
				}
				// ...장바구니에 있는 버튼 자바스크립트
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