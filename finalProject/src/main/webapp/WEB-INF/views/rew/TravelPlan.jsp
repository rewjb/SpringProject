<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행계획서 작성하기!</title>
<style>
/* Always set the map height explicitly to define the size of the div
 * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
#description {
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
}

#infowindow-content .title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}

.pac-card {
	margin: 10px 10px 0 0;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	background-color: #fff;
	font-family: Roboto;
}

#pac-container {
	padding-bottom: 12px;
	margin-right: 12px;
}

.pac-controls {
	display: inline-block;
	padding: 5px 11px;
}

.pac-controls label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

#title {
	color: #fff;
	background-color: gray;
	font-size: 25px;
	font-weight: 500;
	padding: 6px 12px;
}
</style>


<style>
#right-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#right-panel select, #right-panel input {
	font-size: 15px;
}

#right-panel select {
	width: 100%;
}

#right-panel i {
	font-size: 12px;
}

#right-panel {
	float: right;
	width: 34%;
	height: 100%;
}

.panel {
	height: 100%;
	overflow: auto;
}

.pac-container {
   z-index: 10000;
}
</style>




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
<!-- 세션이 없으면 메인페이지로 다시 이동 -->
<script type="text/javascript">

var session 

</script>
<%@ include file="/UserMainHeader.jsp" %>
<!-- 	<div class="spinner-border"  id="loading" role="status" style="position:relative;z-index: 1">  -->
<!-- 		<span class="sr-only">Loading...</span> -->
<!-- 	</div> -->
<!-- 	로딩 -->
	
<script type="text/javascript">

$('#loading').css('top',document.body.clientWidth/2);
$('#loading').css('left',document.body.clientHeight/2);

</script>

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
				style="width: 750px; overflow: scroll; overflow-x: hidden; border: 5px ridge; padding: 0px;height: 600px" id="Project_container">

				<nav class="navbar navbar-expand navbar-dark bg-dark"  style="margin-bottom: 7px;">
				<div class="collapse navbar-collapse" id="navbarsExample02">
					<button class="btn btn-secondary" id="Project_ptitle">프로젝트 제목</button>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="#"
							onclick="return save_project();">저장</a></li>
						<li class="nav-item active"><a class="nav-link" onclick="Project_create_step();">
							생성</a></li>
						<li class="nav-item active"><a class="nav-link" data-toggle="modal" data-target="#Project_place_delete">
						삭제</a></li>
						<li class="nav-item active"><a class="nav-link" data-toggle="modal" data-target="#Project_place_share">
						공유</a></li>
					</ul>
				</div>
				</nav>
				
			
				
			</div>
			<!-- /.프로젝트 상세 기록 -->
			

    <!-- 프로젝트 목록 + 관광명소 장바구니 -->
    <div class="col-md-4" style="padding: 0px">

				<!-- 프로젝트 목록 -->
				<div id="projectList_container" 
					style="height: 240px; border: 5px ridge; overflow: scroll; overflow-x: hidden;">
					
					<table class="table table-striped" style="width: 100%;word-break:break-word;">
						<thead>
							<tr>
								<th colspan="2" style="vertical-align : middle;width: 170px">
								<input style="width: 100%" class="form-control" id="Project-Search" placeholder="계획서명을 입력"  onkeyup="Project_Search(this);">
								</th>
								<th style="text-align: right;padding: 0px;vertical-align: middle;">
									<!-- 여행계획 프로젝트 생성 버튼 -->
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="width: 60px;float: left;">
									생성
									</button>
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenterdelete" style="width: 60px;float: left;">
									삭제
									</button>
									<!-- /.여행계획 프로젝트 생성 버튼 -->
								</th>
							</tr>
						</thead>
						<tbody id="Project-Container">
						<c:forEach items="${project_list}" var="project_list">
						 <c:choose>
						  <c:when test="${projectShare_list.contains(project_list)}">
							<tr>
								<td style="background:cadetblue;" alt="Project-Content" colspan="3" onclick="Move_Project_Data(this);">${project_list}</td>
							</tr>
						  </c:when>
						  <c:otherwise>
							<tr>
								<td alt="Project-Content" colspan="3" onclick="Move_Project_Data(this);">${project_list}</td>
							</tr>
						  </c:otherwise>
						 </c:choose>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /.프로젝트 목록 -->

				<!-- 관광명소 장바구니 -->
				<div
					style="height: 360px; border: 5px ridge; overflow: scroll; overflow-x: hidden;">

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
								 <img  style="width:66px;height:50px;vertical-align: middle;"  class="img-fluid" src="/springProject/resources/IMAGE/attractionsImg/${cart_list.mainImg}" alt="${cart_list.mainImg}">
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
								<input type="submit" value="" class="R_button_insert" alt="in" onclick="cart_button();">
								<input type="submit" value="" class="R_button_delete" alt="de" onclick="cart_button();">
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
 
 <!-- 여행계획 프로젝트  삭제 버튼 클릭시 생성되는 모달  -->
 <div class="modal fade" id="exampleModalCenterdelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">계획서를 정말 삭제하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-footer">
        <button type="button" id="cancel_button" class="btn btn-secondary" alt="cancel" data-dismiss="modal" onclick="finish_MakePlan(this);">취소</button>
        <button type="button" id="save_button" class="btn btn-primary" alt="save" onclick="delete_project(this);">삭제</button>
      </div>
    </div>
  </div>
 </div>
 <!-- /.여행계획 프로젝트  삭제 버튼 클릭시 생성되는 모달  작업중--> 
 
 <!-- 프로젝트 step 컴포넌트 삭제시 모달  -->
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
 <!-- /.프로젝트 step 컴포넌트 삭제시 모달 -->
 
 <!-- 프로젝트 공유 버튼 모달 -->
 <div class="modal fade" id="Project_place_share" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
    선택하신 여행계획서를 공유하시겠습니까?<br>
    =주의사항=<br>
    -공유 후 여행계획서는 수정이 불가능 합니다.<br>
    -공유 후 계획서를 삭제 시 공유된 계획서도 삭제됩니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="share_projcet(this);">공유</button>
      </div>
    </div>
  </div>
</div>
 <!-- /.프로젝트 공유 버튼 모달 -->
 
			<script type="text/javascript">
			
			var selectedName;	
			
			// 프로젝트 삭제
			function delete_project(button) {
				
				$(button).prev().click();
				
				var projectList_container = $('#projectList_container').find('td[alt=Project-Content]'); 
				
				for(i=0; projectList_container.length; i++) {
					if(projectList_container[i].style.outline=='blue solid 6px'){
						selectedName = $(projectList_container[i]);
						break;
					}
				}
// 				alert(selectedName);
// 				확인용

                if (selectedName != null) {
					
                var ptitle = $('#Project_ptitle').text();

				$.ajax({
					url : "setDeleteProjcet?ptitle="+ptitle,
					type : 'post',
					dataType : "text",//반환받을 데이터 타입 선택
					contentType : 'application/json',
					success : function(result, confirm) {
						
						if (confirm == 'success') {
							alert('프로젝트 삭제가 완료되었습니다.');
							
							var Project_children = $('#Project_container').children();

					        for (var i = 1; i < Project_children.length; i++) {
						    $(Project_children[i]).remove();
				         	}
					        
					        selectedName.parent('tr').remove();
							
						}else {
							alert('프로젝트 삭제 오류 발생');
						}
					}//success끝
				})//ajax끝
                	
				}else {
					alert('프로젝트를 선택하세요');
				}
				
			}
			// ...프로젝트 삭제
			
			
			// 프로젝트 공유
			function share_projcet(button) {
				
				$(button).prev().click();
				
				var validity = save_project_validity();
				
			    if (validity) {
			    	
				var ptitle = $('#Project_ptitle').text();
				//프로젝트 이름
				
				alert('공유를 시작합니다!');
				
				$.ajax({
					url : "insertShareProject?ptitle="+ptitle,
					type : 'post',
					dataType : "text",//반환받을 데이터 타입 선택
					success : function(result, confirm) {
						if (result == 'good') {
							alert('공유가 완료되었습니다.');
							var projectList_container = $('#projectList_container').find('td[alt=Project-Content]');  
							
							for (var i = 0; i < projectList_container.length; i++) {
								if(projectList_container[i].style.outline=='blue solid 6px'){
									$(projectList_container[i]).css('background','cadetblue');
								}
							}
							
						}else {
							alert('공유오류 발생');
						}
					},//success끝
				error: function (error) {
				    ('error;');
				}
				})//ajax끝
		     	}else {
					alert('여행계획을 공유할 수 없습니다. \n다음 항목을 체크해주세요 \n1.여행공정의 내용을 채워주세요 \n2.공유중인 프로젝트는 삭제만 지원이 됩니다.');
		     	}
				
			}
			// ...프로젝트 공유
			
			
			
			// 프로젝트 "저장"
			function save_project() {
				
				var validity = save_project_validity();
				// save_project_validity 라는 메서드를 통해 유효성 검사
				
			    //alert(validity);
				//확인용
				
				var steps = $('#Project_container').children('div[alt=Project_div_step]');
				// 공정들
				var move ;
				// 각 공정별 이동
				var form ;
				// 각 공정별 db에 넘길 데이터
				var move_component;
				// 각 공정별 이동 데이터를 분류해주고 그것을 받는 변수
				var forms = $('#Project_container').children('form');
				// 각 공정별 넘길 form
				var ptitle = $('#Project_ptitle').text();
				//프로젝트 이름
				
				alert(ptitle);

				if (validity == true) {

				var tempImgCount;
					
				for (var i = 0; i < steps.length; i++) {

							move = $(steps[i]).prev();
							form = $(steps[i]).next();

							if (i == 0
									|| move.find('a').text() == '이동경로를 설정하세요.') {
								//첫번째 div에서는 경로가 없다!
								form.find('input[name=distance]').val(0);
								form.find('input[name=way]').val('unset');

							} else {
								move_component = return_move_component(move);
								form.find('input[name=distance]').val(move_component.distance);
								form.find('input[name=way]').val(move_component.method);

							}      
					        	//ptitle
						        form.find('input[name=num]').val ($(steps[i]).find('td[alt=Project_detail_num] h3').text());
						        tempImgCount = $(steps[i]).find('img').attr('src').split('/');
					        	form.find('input[name=mainImg]').val(tempImgCount.pop());
					          	form.find('input[name=title]').val($(steps[i]).find('h5').text());
					        	form.find('input[name=content]').val($(steps[i]).find('span').text());
					        	form.find('input[name=detail]').val($(steps[i]).find('textarea').val());
						        //latitude
						        //longitude
						}
				
				var dataArray=new Array;
				
				var temp_serial ;
				
				var temp_data;
				
				
				for (var i = 0; i < forms.length; i++) {
					
					temp_data = {};
					
					temp_serial= $(forms[i]).serializeArray();
					for (var j = 0; j < temp_serial.length; j++) {
						console.log(j);
						temp_data[temp_serial[j].name]= decodeURIComponent(temp_serial[j].value) ;
					}
					dataArray.push(temp_data);
					//alert('temp_data.title='+temp_data.title);
					//데이터가 정상 셋팅 여부
				}
				
				//alert(JSON.stringify(dataArray));
				// 보내기전 출력
				
				$.ajax({
					url : "projcetDataSave?ptitle="+ptitle,
					type : 'post',
					data : JSON.stringify(dataArray),
					dataType : "text",//반환받을 데이터 타입 선택
					contentType : 'application/json',
					success : function(result, confirm) {
						if (result == 'good') {
							alert('저장이 완료되었습니다.');
						}else {
							alert('저장오류 발생');
						}
					}//success끝
				})//ajax끝

					} else {
						alert('여행계획을 저장할 수 없습니다. \n 다음 항목을 체크해주세요\n1.여행공정의 내용을 채워주세요\n2.공유중인 프로젝트는 수정할 수 없습니다. ');
					}
				
				 return false;
				 //저장 클릭시 화면이 위로 올라가는 현상 방지

				}
				// ...save_project()

				function save_project_validity() {
					//프로젝트를 저장하기 위한 유효성 검사
					// 1. 공정별 장소가 정해져 있는지

					var steps = $('#Project_container').children(
							'div[alt=Project_div_step]');
					
					var projectList_container = $('#projectList_container').find('td[alt=Project-Content]');  
					var nowName = $('#Project_ptitle').text();
					var selectedName;
					
					for (var i = 0; i < projectList_container.length; i++) {
						
						if (projectList_container[i].style.outline=='blue solid 6px') {
							if (projectList_container[i].style.background=='cadetblue') {
							selectedName = $(projectList_container[i]).text();
							}
						}
					}

					var validity = true;
					
					if (nowName == selectedName) {
						validity = false;
					}

					for (var i = 0; i < steps.length; i++) {
						if ($(steps[i]).find('h5').text() == '장바구니 혹은 경로설정을 통해 장소를 결정') {
							validity = false;
						}
					}
					
					
					
					return validity;
				}
				// ...save_project_validity()

				function return_move_component(move) {

					//거리 : 1000 km / 이동방법 : WAY2
					//위에는 형식
					var total_text = move.find('a').text()
					var distance = total_text.split('/')[0].split(':')[1].replace('km','').trim();

					var method = total_text.split('/')[1].split(':')[1].trim();

					console.log(distance);

					var move_component = {
						distance : distance,
						method : method
					};

					return move_component;
				}
				// ...return_move_component
				// ...프로젝트 "저장"

				function Project_delete(button) {
					
					var steps = $('#Project_container').children(
					'div[alt=Project_div_step]');

					var validity = false;

					for (var i = 0; i < steps.length; i++) {

						//프로젝트를 선택하지 않고 생성을 눌렀을 시!
						if (steps[i].style.outline != '') {
							validity = true;
							break;
						}
					}

					
				if (validity == false) {
						alert('계획서 선택 및 계획서 내용을 선택하세요.');
						$(button).prev().click();
						return null;
					}

					$(button).prev().click();

					//step이 1개 초과일때
					for (var i = 0; i < steps.length; i++) {

						if (steps.length == 1 && steps[i].style.outline != '') {
							$(steps[i]).prev().children('a').text(
									'이동경로를 설정하세요.');
							$(steps[i]).next().next().remove();
							$(steps[i]).next().remove();
							$(steps[i]).remove();
						} else {

							if (steps[i].style.outline != '') {

								if (i + 1 == steps.length) {
									//선택 step이 마지막
									$(steps[i]).prev().remove();
									$(steps[i]).next().remove();
									$(steps[i]).remove();
								} else {
									//선택 step이 마지막 x
									$(steps[i]).prev().children('a').text(
											'이동경로를 설정하세요.');
									$(steps[i]).next().next().remove();
									$(steps[i]).next().remove();
									$(steps[i]).remove();
								}
							}
						}
					}

					steps = $('#Project_container').find('h3');

					for (var i = 0; i < steps.length; i++) {

						steps[i].innerHTML = i + 1;
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

					var dataArray = $('td[alt=Project-Content]');

					var validity = false;

					for (var i = 0; i < dataArray.length; i++) {

						//프로젝트를 선택하지 않고 생성을 눌렀을 시!
						if (dataArray[i].style.outline != '') {
							validity = true;
							break;
						}
					}

					if (validity == false) {
						alert('계획서를 선택하세요.');
						return null;
					}

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
						detail_content, latitude, longitude, distance, way , pid) {

					if (detail_content == null) {
						detail_content = '';
					}

					//생성시 나오는 폼
					var component_move_text = '<div alt="Project_div_move" class="alert alert-info" role="alert" style="padding: 0px;display: inline-block;margin-top: 10px;margin-bottom: 5px;margin-left:30px;">'
							+ '이동 = <a data-toggle="modal" alt="move"  data-target="#GoogleMap" onclick="GoogleMap_open(this);">'
							+ way + distance + '</a>' + '</div>';

					var component_step_text = '<div class="shadow p-1 mb-1 bg-white rounded" style="border: 1px solid;" alt="Project_div_step" onclick="Project_step_onclick(this);">'
							+ '<table style="word-break: break-word;">'
							+ '<tr he>'
							+ '<td alt="Project_detail_num" class="btn-dark"><h3>'
							+ num
							+ '</h3></td>'
							+ '<td alt="Project_detail_img"><img alt="img"	style="outline: 1px solid;width: 140px; height: 105px"	src="'+src+'" onerror="errImage(this)"></td>'
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
							+ '<input name="mainImg" type="hidden" value="">'
							+ '<input name="title" type="hidden" value="'+title+'">'
							+ '<input name="content" type="hidden" value="'+content+'">'
							+ '<input name="detail" type="hidden" value="">'
							+ '<input name="latitude" type="hidden" value="'+latitude+'">'
							+ '<input name="longitude" type="hidden" value="'+longitude+'">'
							+ '<input name="distance" type="hidden" value="">'
							+ '<input name="way" type="hidden" value="">'
							+ '<input name="pid" type="hidden" value="'+pid+'">'
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
				
				function errImage(img) {
					img.src='/springProject/resources/IMAGE/star/lostImg.png';
				}

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
								url : "getProjectData?mid=${sessionScope.mid}&ptitle="
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
										        '/springProject/resources/IMAGE/attractionsImg/'+result[i].mainImg,
												result[i].title,
												result[i].content,
												result[i].detail,
												result[i].latitude,
												result[i].longitude, '이동방법 : '
														+ result[i].way,
												'거리 : ' + result[i].distance
														+ ' km / ' ,result[i].pid );
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
						
						var temp = $('td[alt=Project-Content]');

						if (temp.length == 0) {
							
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
							
							
						}
						

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
				var cartComponent;

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

						var newStep = Project_insert_element(step_num,
								'/springProject/resources/IMAGE/attractionsImg/'+dataObj['mainImg'],
								dataObj['title'], dataObj['content'], '',
								dataObj['latitude'], dataObj['longitude'],
								'미정', '미정',dataObj['pid']).component_step

						$(steps[step_num - 1]).replaceWith(newStep);

						$(newStep).filter('div').css('outline',
								'blue 6px solid');

						$(newStep).filter('div').next().next().find(
								'a[alt=move]').text('이동경로를 설정하세요.');
						$(newStep).filter('div').prev().find(
								'a[alt=move]').text('이동경로를 설정하세요.');

					} else {
						
						var pid = $(cartComponent).parents('tr').find('input[name=pid]').val();
						
						$.ajax({
							url : "setDeleteCart?pid="+pid,
							type : 'post',
							dataType : "text",//반환받을 데이터 타입 선택
							success : function(result, confirm) {
								
								if (result =='success') {
						        $(cartComponent).closest('tr').remove();
						        alert('삭제가 완료되었습니다.');
								}else {
								alert('삭제오류 발생!');
								}
							}//success끝
						})//ajax끝
						
					}

					return false;
				}

				function cart_button() {
					cartComponent = $(event.target);
					inNde = $(cartComponent).attr('alt');
					//console.log('inNde 값 = ' + inNde);
				}
				// ...장바구니에 있는 버튼 자바스크립트
			</script>

		</div>
  <!-- /.계획 툴 -->

  <!-- Related Projects Row -->
  <h3 >Popular projects</h3>

  <div class="row">
  
			<c:forEach items="${allProjectListBystar}" var="allProjectListBystar"
				varStatus="Index">
				<c:choose>
					<c:when test="${Index.index < 4}">
						<div class="carousel slide carousel-fade col-md-3 col-sm-6 mb-4"
							id="carouselExampleFade" data-ride="carousel"
							style="text-align: center;">
							<a href="/springProject/rew/DetailPlan?mid=${allProjectListBystar.mid}&ptitle=${allProjectListBystar.ptitle}&star=${allProjectListBystar.star}">
							<div class="carousel-inner">
							 <div style="display: inline-block;background-color: rgba(0, 0, 0, 0.6);position: relative;z-index: 2;color: white;">
							 <img alt="" style="width: 25px" src="/springProject/resources/IMAGE/star/star_on.png">
							 ${allProjectListBystar.star}
							 </div>
								<c:set var="text" value="${allProjectListBystar.img}" />
								<c:set var="img" value="${fn:split(text,'/')}" />
								<c:forEach var="imgNum" items="${img}" varStatus="index">

									<c:choose>
										<c:when test="${index.index==0}">
											<div class="carousel-item active" style="text-align: center;">
												<img style="height: 153px; width: 225px"
													src="/springProject/resources/IMAGE/attractionsImg/${imgNum}">
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item" style="text-align: center;">
												<img style="height: 153px; width: 225px"
													src="/springProject/resources/IMAGE/attractionsImg/${imgNum}">
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							 <span class="btn btn-secondary"
								style="font-size:13px; background-color: rgba(0, 0, 0, 0.6);">${allProjectListBystar.ptitle}</span>
							</a>	
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>

		</div>
  <!-- /.row -->

</div>
<!-- /.최상위 컨테이너 -->

<!-- 구글 맵이 들어있는 모달 -->
<div class="modal fade" id="GoogleMap" role="dialog" aria-hidden="true" style="z-index: 9000" >
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document" style="z-index: 1">
    <div class="modal-content">
      <div class="modal-body ">
      
      
      <!-- 구글 지도  -->
        <div style="display: inline-block;float: left;">
		<div class="pac-card" id="pac-card" style="widows: 300px" >
			<div>
				<div id="title" style="text-align: center;">검색</div>
			</div>
			<div id="pac-container" style="z-index: 10000">
				<input id="pac-input" type="text" style="width: 270px;"Enteralocation">
			</div>
		</div>
		<div id="map" style="width: 500px; height: 500px;border: 1px"></div>
		<div id="infowindow-content">
			<img src="" width="16" height="16" id="place-icon"> <span
				id="place-name" class="title"></span><br> <span
				id="place-address"></span>
		</div>
	</div>
      <!-- /.구글 지도  -->


    <!-- 구글 경로 -->
    <nav>
  <div class="nav nav-tabs" id="travel_method" role="tablist">
    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#" role="tab" alt="WALKING" aria-selected="true" style="padding-left: 5px;padding-right: 5px;"  onclick="Mode_select(this);">걷기</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#" role="tab" alt="BICYCLING" aria-selected="false" style="padding-left: 5px;padding-right: 5px;" onclick="Mode_select(this);">자전거</a>
    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#" role="tab" alt="TRANSIT" aria-selected="false" style="padding-left: 5px;padding-right: 5px;" onclick="Mode_select(this);">대중교통</a>
    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#t" role="tab" alt="DRIVING" aria-selected="false" style="padding-left: 5px;padding-right: 5px;" onclick="Mode_select(this);">자동차</a>
  </div>
</nav>
	<div id="right-panel"
		style="float: left; overflow: scroll; width: 265px; height: 460px;overflow-x: hidden">
		<p>	거리 : <span id="total"></span></p>
		<p id="Miss_Path" style="background: yellow;display: none;">해당하는 경로가 없습니다.</p>
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
	
	var directionsService ;
	var directionsDisplay ;
	var map;
	var infowindow;
	var marker;
	var infowindowContent;
	var start_marker;
	var start;
	var end;
	var infowindow_start;
	var move_parent;
	var move;
	var g_travel_method;
	var search_place = {name : null , address: null};
	var end_mode;
	// end_mode = 1 : 검색모드로 장소 결정
	
	
	function GoogleMap_confirm(button) {
		

		 var next_step =   $(move).parent('div').next();
		 var next_step_in = $(next_step).find('div[alt=Project_detail_content_head]');
		  
		if (end_mode == 1) {
			// 검색모드로 장소 결정
		  
			
			
		 $(next_step_in).find('h5').text(search_place.name);
		 $(next_step_in).find('span').text(search_place.address);
		 
		 $(next_step).next().find('input[name=latitude]').val(end.lat);
		 $(next_step).next().find('input[name=longitude]').val(end.lng);
		 $(next_step).next().find('input[name=pid]').val(' ');
		 
		}
		
		
		if ($('#Miss_Path').css('display') == 'none') {
			//경로가 존재할 경우
			
		    var distance = $('span#total').text();
		    
		    var temp_method;
		    
		    switch (g_travel_method) {
			case 'WALKING': temp_method= '걷기';
				break;
			case 'BICYCLING': temp_method = '자전거';
				break;
			case 'TRANSIT':  temp_method = '대중교통';
				break;
			case 'DRIVING':  temp_method = '자동차' ;
			}
			
		    move.innerHTML = '거리 : '+ distance+' / 이동방법 : '+ temp_method; 
		    
		    //$(next_step).next().css('outline', 'blue 6px solid');
		    //확인용
		    
		    //$(next_step).next().children('input[]');
			
		}else {
			
			move.innerHTML =  '이동경로를 설정하세요.'; 
			
		}
		
		$(button).prev().click();
		//창 종료
		
	}

	
	// 이동 방법을 선택!
	function Mode_select(me) {
		
		var panel_children =   $('#right-panel').children();	
		
		   for (var i = 2; i < panel_children.length; i++) {
	        	
				$(panel_children[i]).remove();
	        	
			}// 기존에 기록된 경로를 전부 삭제!
			
		GoogleMap_open(move , $(me).attr('alt'));
		
	}
	// ...이동 방법을 선택!
	
	// GoogleMap_open
	function GoogleMap_open(move_in,travel_method) {
		
		//alert(now_move.innerHTML);
		//now_move에 노드가 잘 들어갔는지 확인용
		
		$('#pac-input').val('');
		
		if (travel_method==null) {
			
			end_mode=0;
			
			var methods =  $('#travel_method').children();
			
			for (var i = 0; i < methods.length; i++) {
				
				if ($(methods[i]).attr('aria-selected')=='true') {
					travel_method = $(methods[i]).attr('alt');
				}
			}
		}
		
		g_travel_method = travel_method;
		
		$('#total').text('');
		
		move = move_in;
		
        var panel_children =   $('#right-panel').children();	
        //경로 div의 자식을 얻기!
        
        for (var i = 2; i < panel_children.length; i++) {
        	
			$(panel_children[i]).remove();
        	
		}// 기존에 기록된 경로를 전부 삭제!
        
    	$('#Miss_Path').css('display','none');
		// 경로가 없는 메세지도 삭제!
		
		if (start_marker!=null) {
			
		start_marker.setMap(null);
		
		}// 전에 기록으로 남은 marker 삭제!
		
		directionsDisplay.setMap(null);
		directionsService = null;
		//전에 기록을 남은 경로 전부 삭제!
		
		directionsService = new google.maps.DirectionsService;
		directionsDisplay = new google.maps.DirectionsRenderer({
			draggable : false,
			map : map,
			panel : document.getElementById('right-panel')
		});
		
		directionsDisplay.addListener('directions_changed', function() {
			computeTotalDistance(directionsDisplay.getDirections());
			//거리 총 계산해주는 메서드
			}); 
		
	    move_parent =  $(move).parent('div');
	    
		var move_parent_back = $(move_parent).prev();
		var move_parent_front = $(move_parent).next().next();
		// 앞,뒤에 있는 form 얻기!
		
	   var back_latitude = $(move_parent_back).children('input[name=latitude]').val();
	   var back_longitude = $(move_parent_back).children('input[name=longitude]').val();
	   var front_latitude =  $(move_parent_front).children('input[name=latitude]').val();
	   var front_longitude = $(move_parent_front).children('input[name=longitude]').val();
	   // 앞,뒤에 있는 form으로부터 경도 위도 얻기
	   
	   var back_title = $(move_parent_back).children('input[name=title]').val();
	   var back_content  = $(move_parent_back).children('input[name=content]').val();
	   var front_title =  $(move_parent_front).children('input[name=title]').val();
	   var front_content = $(move_parent_front).children('input[name=content]').val();
	   
	   if (end_mode==0) {
	   start = {lat : Number(back_latitude) ,	lng :  Number(back_longitude) };
	   end = {lat: Number(front_latitude) , lng : Number(front_longitude)};
	   }else {
		   
       }
	   
	   if (back_latitude=='' && back_longitude=='') {
		   
		   alert('해당 경로의 이전과 다음 장소를 지정해주세요.');
		   event.stopPropagation();
		   //이벤트 상위로 전달 금지
		   
       }else if (front_latitude==''){
    	   
    	   alert('다음 장소를 결정해 주세요!');
    	   
   		if (start_marker!=null) {
			
   			start_marker.setMap(null);
   			
   			}// 전에 기록으로 남은 marker 삭제!
    	   
    	   map.setCenter(start);
   			// 맵을 시작위치로 중앙배치
   			
    		start_marker = new google.maps.Marker({
    			position : start,
    			map : map
    		});
   			
   			if (infowindow_start != null) {
				
   				infowindow_start.close();
    		  
   				infowindow_start = null;
    		
			}
   			
   			
    		attachSecretMessage( start_marker  , '<p style="font-weight : bold;margin:5px;">'+back_title+'</p>'+back_content);
       
    		infowindow_start.close();
    		
       }else {
		
	    console.log('뒤 좌표 : 경도='+back_latitude + '/위도='+back_longitude);
	    console.log('앞 좌표 : 경도='+front_latitude + '/위도='+front_longitude);
	    //콘솔 확인용
	    
		marker.setVisible(false);
		
		// If the place has a geometry, then present it on a map.

		marker.setPosition(end);
		marker.setVisible(true);
		
		infowindowContent.children['place-name'].textContent = front_title;
		infowindowContent.children['place-address'].textContent = front_content;
		infowindow.open(map, marker);
		
		start_marker = new google.maps.Marker({
			position : start,
			map : map
		});
		
		if (infowindow_start != null) {
			
			infowindow_start.close();
    		  
			infowindow_start = null;
    		
			}
		
		attachSecretMessage( start_marker  , '<p style="font-weight : bold;margin:5px;">'+back_title+'</p>'+back_content);
		
		displayRoute(start, end, directionsService,
				directionsDisplay ,travel_method); 
	        }
		
	    }
	// ...GoogleMap_open
	
	    // 초기에 출발지에 뜨는 메세지
		function attachSecretMessage(marker, secretMessage) {
		
		    infowindow_start = new google.maps.InfoWindow({
				content : secretMessage
			});

			infowindow_start.open(marker.get('map'), marker);
			
			marker.addListener('click', function() {
				infowindow_start.open(marker.get('map'), marker);
			});
		}
	    

		function displayRoute(origin, destination, service, display , travel_method) {
			service.route({
				origin : origin,
				destination : destination,
				//  waypoints: [{location: 'Adelaide, SA'}, {location: 'Broken Hill, NSW'}],
				travelMode : travel_method,
				avoidTolls : true
			}, function(response, status) {
				if (status === 'OK') {
					display.setDirections(response);
				} else {
					
					$('#Miss_Path').css('display','block');
					
					var panel_children =   $('#right-panel').children();	
					
					   for (var i = 2; i < panel_children.length; i++) {
				        	
							$(panel_children[i]).remove();
				        	
						}// 기존에 기록된 경로를 전부 삭제!
					//alert('Could not display directions due to: ' + status);
				}
			});
		}

		//여러개의 경로를 설정할 경우 총 거리를 얻어내는 메서드
		//여기서 사용할지느
		function computeTotalDistance(result) {
			var total = 0;
			var myroute = result.routes[0];
			for (var i = 0; i < myroute.legs.length; i++) {
				total += myroute.legs[i].distance.value;
			}
			total = total / 1000;
			document.getElementById('total').innerHTML = total + ' km';
		}

		
		function initMap() {
			//지도의 시작! 어디선가 initMap 을 호출하는 듯..

			map = new google.maps.Map(document.getElementById('map'), {
				center : {lat : 37.598472, lng : 126.9134033},
				zoom : 17
			});
			

			var card = document.getElementById('pac-card');
			var input = document.getElementById('pac-input');
			var types = document.getElementById('type-selector');
			var strictBounds = document
					.getElementById('strict-bounds-selector');

			map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

			var autocomplete = new google.maps.places.Autocomplete(input);
			autocomplete.setTypes([]);

			// Bind the map's bounds (view
			// Set the data fields to return when the user selects a place.
			autocomplete.setFields([ 'address_components', 'geometry', 'icon',
					'name' ]);

			infowindow = new google.maps.InfoWindow();
			infowindowContent = document
					.getElementById('infowindow-content');
			infowindow.setContent(infowindowContent);

			marker = new google.maps.Marker({
				map : map,
				anchorPoint : new google.maps.Point(0, -29)
			});

			// 검색시 발생하는 액션리스너
			autocomplete
					.addListener(
							'place_changed',  
							function() {  
								
								$('#Miss_Path').next().remove();
								//기존에 있던 경로 삭제
								
								infowindow.close();
								marker.setVisible(false);
								var place = autocomplete.getPlace();
								if (!place.geometry) {
									// User entered the name of a Place that was not suggested and
									// pressed the Enter key, or the Place Details request failed.
									window.alert("정확한 명칭을 적어주세요. '"+ place.name + "'");
									return;
								}

								// If the place has a geometry, then present it on a map.

								marker.setPosition(place.geometry.location);
								marker.setVisible(true);
								
								var address = '';
								if (place.address_components) {
									address = [
											(place.address_components[0]
													&& place.address_components[0].short_name || ''),
											(place.address_components[1]
													&& place.address_components[1].short_name || ''),
											(place.address_components[2]
													&& place.address_components[2].short_name || '') ]
											.join(' ');
								}

								infowindowContent.children['place-icon'].src = place.icon;
								infowindowContent.children['place-name'].textContent = place.name;
								infowindowContent.children['place-address'].textContent = address;
								infowindow.open(map, marker);
								
								search_place.name =  place.name;
								search_place.address = address;
								//검색을 임시 저장소에 저장

								end = {
									lat : place.geometry.location.lat(),
									lng : place.geometry.location.lng()
								};
								
								move_parent =  $(move).parent('div');
								var move_parent_front = $(move_parent).next().next();
								$(move_parent_front).children('input[name=latitude]').val(end.lat);
								$(move_parent_front).children('input[name=longitude]').val(end.lng);
								
								$('#Miss_Path').css('display','none');
								
								displayRoute(start, end, directionsService,
										directionsDisplay , g_travel_method);
								
								end_mode=1;
								
							});
			// Sets a listener on a radio button to change the filter type on Places
			// Autocomplete.

			directionsService = new google.maps.DirectionsService;
			directionsDisplay = new google.maps.DirectionsRenderer({
				draggable : false,
				map : map,
				panel : document.getElementById('right-panel')
			});

			directionsDisplay.addListener('directions_changed', function() {
			computeTotalDistance(directionsDisplay.getDirections());
			//거리 총 계산해주는 메서드
			}); 
				  
		}// initMap 끝
		
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-jWynFZkmm5Ewdpk0b7ubq0zExpO0gpw&libraries=places&callback=initMap"
		async defer></script>
 
 
</body>
</html>