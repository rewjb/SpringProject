<!-- 
마이 페이지 - 개인정보 수정 / 개인 계획서 리스트 / 명소 등록신청 / 선호태그 수정
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이페이지</title>
  <!-- header -->
  <%@ include file="/UserMainHeader.jsp"%>
  
  <!-- 이메일 유효성  -->
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- 파일 업로드시 미리보기 -->
  <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
  <script type="text/javascript">
//<!------------------------- 개인정보 수정 ---------------------------->
	$(function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행
		
		$(window).load(setInfo());
		
	// 정규식을 변수에 할당
	// 변수 이름을 're_'로 정한것은 'Reguar Expression'의 머릿글자
		// 비밀번호 검사식 : 소문자,대문자,숫자 / 6~18자
		var re_pw = /^[a-zA-Z0-9]{6,18}$/; 
		// 전화번호 검사식 : 숫자 / 11~15자
		var re_tel = /^[0-9]{10,13}$/; 
		
		//식을 간단하게 하기 위해 변수에 담아주기
		var pw = $('#inputMpw');
		var cf = $('#cf');	//비밀번호 확인
		var tel = $('#mtel');
		var g = $("#gender");
		var gs = $("#genderSelector");	//gender select태그
		var ag = $("#agegroup");
		var ags = $("#agegroupSelector");	//agegroup select태그
		
		var pwCheck = 0;
		var cfCheck = 0;
		
		//페이지에 정보를 뿌려주는 함수
		function setInfo() {
			$("#mid").val('${memberDTO.mid}');
			$("#mpw").val('${memberDTO.mpw}');
			$("#mname").val('${memberDTO.mname}');
			$("#mprofile").val('${memberDTO.mprofile}');
			$("#mprofileImg").attr('src','${memberDTO.mprofile}');
			$("#mtel").val('${memberDTO.mtel}');
			$("#maddr1").val('${memberDTO.maddr1}');
			$("#maddr2").val('${memberDTO.maddr2}');
			$("#gender").val('${memberDTO.gender}');
			$("#agegroup").val('${memberDTO.agegroup}');
			$("#rdate").val('${memberDTO.rdate}');
		}
		
		setInfo();
		
		
		//유효성 결과에 따라 다른 클래스(input style)에 포함시켜주는 함수-----------------------------------
		function hasColor(input,v){
			if(v==2){ //success
				input.parent().attr("class","form-group has-success");
				input.parent().css("height", "30px")
				input.attr("class","form-control is-valid");
			}else if(v==1){ //danger
				input.parent().attr("class","form-group has-danger");
				input.parent().css("height", "45px")
				input.attr("class","form-control is-invalid");				
			}else{ //default
				input.parent().attr("class","form-group");
				input.parent().css("height", "30px")
				input.attr("class","form-control");
			}//end if
		}//end function hasColor()
					
		//pw유효성 : #mpw에서 keyup 이벤트가 발생시---------------------------------------------------
		pw.keyup(function() {
			pwCheck = 0;
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-mpw"); 
			//유효성 검사
			if (pw.val().length == 0) { // 입력 값이 없을 때
				//기본설정
				hasColor(pw,0);			//default
				f.text('');				//비워주기
			} else if(pw.val().length < 6){
				//문제시 설정
				hasColor(pw,1);			//danger
				f.text('6자 이상 입력해주세요'); //문제에 대한 안내 출력
			} else if (pw.val().length > 18) { 
				//문제시 설정
				hasColor(pw,1);			//danger
				f.text('18자 이내로 입력해주세요'); //문제에 대한 안내 출력
			} else { // 길이가 적당할때 - 유효성 검사
				if (!re_pw.test(pw.val())) { // 비밀번호 검사
					//문제시 설정
					hasColor(pw,1);		//danger
					f.text('영문 대소문자와 숫자를 사용하여 6~18자 사이로 만들어주세요.');
				} else { //유효성 검사 통과 후
					//성공시 설정
					hasColor(pw,2);		//success
					f.text('');			//비워주기
					pwCheck = 1;
				}//end if()
			}//end if
		});//end keyup()
		
		//pw일치확인 : #cf에서 keyup 이벤트가 발생시
		cf.keyup(function() {
			cfCheck = 0;
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-cf"); 
			//유효성 검사
			if (cf.val().length == 0) { // 입력 값이 없을 때
				//기본설정
				hasColor(cf,0);			//default
				f.text('');				//비워주기
			} else if(cf.val() != pw.val()){
				//문제시 설정
				hasColor(cf,1);			//danger
				f.text('비밀번호가 일치하지 않습니다.'); //문제에 대한 안내 출력
			} else { // 비밀번호가 일치할때\
				//성공시 설정
				hasColor(cf,2);			//success
				f.text('');				//비워주기
				$("#mpw").val(cf.val());
				cfCheck = 1;
			}//end if()
		});//end keyup()	
		
		//tel유효성 검사 : # 에서 keyup이벤트 발생시-------------------------------------------------------------------
		tel.keyup(function() {
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-tel"); 
			//유효성 검사
			if (tel.val().length == 0) { // 입력 값이 없을 때
				//기본설정
				hasColor(tel,0);			//default
				f.text('');				//비워주기
			} else if(tel.val().length<10){	//너무 짧거나 길때
				//문제시 설정
				hasColor(tel,1);			//danger
				f.text('연락 가능한 10~13자 번호를 입력해주세요.') //문제에 대한 안내 출력
			} else if(tel.val().length>13){	//너무 짧거나 길때
				//문제시 설정
				hasColor(tel,1);			//danger
				f.text('연락 가능한 10~13자 번호를 입력해주세요.') //문제에 대한 안내 출력
			} else { 					// 길이가 적당할때
				//성공시 설정
				hasColor(tel,2)			//success
				f.text('');				//비워주기
			}//end if()
		})//end keyup()
		
		//mprofile에 관계된 설정 이미지 업로드시 미리보기---------------------------------------------------------------
		/* FileReader 라는 Javascript 객체로 이미지 미리보기를 할 수 있다.*/
		$(function() {
		          $("#mprofile").on('change', function(){
		              readURL(this);
		          });
		      });
		      function readURL(input) {
		          if (input.files && input.files[0]) {
		          var reader = new FileReader();
		
		          reader.onload = function (e) {
		                  $('#mprofileImg').attr('src', e.target.result);
		              }
		            reader.readAsDataURL(input.files[0]);
		          }
		      }
		      
		//gender에 관계된 설정----------------------------------------------------------------------
		if(g.val() == 'F'){gSelected(2);}
		else if(g.val() =='M'){gSelected(1);}
		else{				gSelected(0);}
		
		function gSelected(index) {
			//gender값에 따라서 selected항목 설정해주는 함수
			gs.find("option:eq(0)").prop("selected", false);
			gs.find("option:eq(1)").prop("selected", false);
			gs.find("option:eq(2)").prop("selected", false);
			
			gs.find("option:eq("+index+")").prop("selected",true);
		}
		//genderSelector의 선택여부에 따라 input #gender에 값을 넣어주는 함수
		gs.change(function() {
			g.val(gs.val());
		})
		      
		//agegroup에 관계된 설정--------------------------------------------------------------------
		if(ag.val() == '10s'){agSelected(0);}
		else if(ag.val() =='20s'){agSelected(1);}
		else if(ag.val() =='30s'){agSelected(2);}
		else if(ag.val() =='40s'){agSelected(3);}
		else if(ag.val() =='50s'){agSelected(4);}
		else if(ag.val() =='60s'){agSelected(5);}
		else if(ag.val() =='70s'){agSelected(6);}
		else{					agSelected(7);}	//80대 이상
		
		//agegroup값에 따라서 selected항목 설정해주는 함수
		function agSelected(index) {
			ags.find("option:eq(0)").prop("selected", false);	//10s
			ags.find("option:eq(1)").prop("selected", false);	//20s
			ags.find("option:eq(2)").prop("selected", false);	//30s
			ags.find("option:eq(3)").prop("selected", false);	//40s
			ags.find("option:eq(4)").prop("selected", false);	//50s
			ags.find("option:eq(5)").prop("selected", false);	//60s
			ags.find("option:eq(6)").prop("selected", false);	//70s
			ags.find("option:eq(7)").prop("selected", false);	//80s~
			
			ags.find("option:eq("+index+")").prop("selected",true);
		}
		//agegroupSelector의 선택여부에 따라 input #agegroup에 값을 넣어주는 함수
		ags.change(function() {
			ag.val(ags.val());
		})
		      
			
		//updateBtn버튼 눌렀을때 동작하는 함수--------------------------------------------------------
		$("#updateBtn").click(function() {
			if(pwCheck + cfCheck == 2) {
				var form = $("#infoForm");
				
                // 자바스크립트 객체를 배열에 담아줌
                var formSerial = $(form).serializeArray();
                var sendData = {};
                for (var i = 0; i < formSerial.length; i++) {
                	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value);
				}
                //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환 
                console.log('update:'+JSON.stringify(sendData));
				$.ajax({
					url : "/springProject/won/updateMember",
					type : "POST",
					data : sendData,
					success : function(result) {
						console.log(result+'--1:실패,0:성공');
						if(result=="0"){
							alert("수정성공!");
							setInfo();
						}else{
							alert("다시 시도해주세요.")
						}
						
						setInfo();
					}//end success
				});//end ajax					
			}//end if()
		})//end #updateBtn.click()
		
		//deleteBtn버튼 눌렀을때 동작하는 함수-------------------------------------------------------
		$("#deleteBtn").click(function() {
			var cfPw = prompt( '비밀번호를 한번 더 입력해주세요.', '' );
			var mpw = $("#mpw").val();
			if(mpw==cfPw) {
				$.ajax({
					url : "/springProject/won/deleteMember",
					type : "POST",
					success : function(result) {
						console.log(result+'--1:실패,0:성공');
						if(result==0){
							alert("탈퇴가 정상적으로 처리되었습니다. 이용해주셔서 감사합니다.");
							location.href="/springProject/main.jsp"
						}else{
							alert("정상적으로 처리되지 않았습니다. 다시 시도해주세요.")
						}//end inner_if()
					}//end success
				});//end ajax					
			}else{
				alert("비밀번호가 다릅니다.");
			}//end if()
		})//end #deleteBtn.click()
	});
	
//<!------------------------- 개인정보 수정 끝 ---------------------------->
  
  
  </script>
  <style type="text/css">
  /* -------feedback div설정------- */
	.feedback{
		text-align : left;
		padding-left : 5px;
		color:red;
		font-size: 10px;
	}
  
  </style>
</head>

<body>


  <!-- Page Content -->
  <div class="container">

    <div class="row">
	<!-- mypage 사이드바 -->
	<%@ include file="mypageLeftBar.jsp" %>

      <div class="col-lg-9">
        <div>
        <legend class="display-4" style="text-align: center; font-family: 'Do Hyeon', sans-serif;">내정보 수정</legend>
        <hr style="width: 90%;">
    		<!-- 폼 전체 담아놓는 div -->
			<div style="padding-left: 5%; padding-right: 5%">
				<form id="infoForm" class="needs-validation" novalidate action="">
				<table>
					<tr style="height: 70px;">
						<td style="width: 70%;">
							<!-- column1. mid 부분 div : 수정 불가 -->
							<div class="mb-3" >
								<label for="mid"><span class="text-muted"> ID </span></label>
								<input type="text" id="mid" name="mid" class="form-control" value="" readonly="readonly">
							</div>
							<!-- column2. mname : 수정 불가 -->
							<div class="mb-2" >
								<label for="mname"><span class="text-muted"> user-name </span></label>
								<input type="text" id="mname" name="mname" class="form-control" value="" readonly="readonly">
							</div>
							<!-- column3. 프로필 사진 입력부분 -->
							<!-- 컨트롤러와 동작하는 hidden #mprofile이 있고 사용자에게 보이는부분(#inputFile, #mprofileImg)이 따로 존재함 -->
							<div class="mb-3">
								<label for="mprofile"><span class="text-muted">profile picture</span></label><br>
								<input type="file" class="form-control" id="inputFile" style="height: 45px; 
								vertical-align: middle;">
								
								<input type="hidden" id="mprofile" name="mprofile" value="" class="hidden">
							</div>
						</td>
						<td style= "vertical-align: bottom;">
							<!-- column3. 프로필 사진 미리보기 -->
							<div class="mb-3" style="text-align: center;">
								<img id="mprofileImg" style="width: 60%; height: 60%;"
									src="">
							</div>
						</td>
					</tr>
				</table>
				<br>
				<table style="width: 100%;">
					<tr>
						<td style="vertical-align: top; width: 45%; padding-right: 1%;">
							<!-- column4. mpw부분   -->
							<!-- 컨트롤러와 동작하는 hidden #mpw가 있고 사용자에게 보이는부분(#inputMpw,#cf)이 따로 존재함 -->
							<label for="password"><span class="text-muted">	PASSWORD </span></label> 
							<div class="form-group" style="width:100%;">
								<input type="password" id="inputMpw" class="form-control" value="" required>
								<div id="feedback-mpw" class="feedback"></div>
								<input type="hidden" id="mpw" name="mpw" value="" class="hidden">
							</div>
						</td>
						<td style="vertical-align: top; width: 45%;">
							<!-- column4. mpw conform부분   -->
							<label for="password"><span class="text-muted">	CONFIRM </span></label>
							<div class="form-group" style="width:100%;">
								<input type="password" id="cf" class="form-control" value="" required>
								<div id="feedback-cf" class="feedback"></div>
							</div>
						</td>
					</tr>
				</table>
				
				<!-- 기본정보 : 필수입력 / 추가정보 : 선택입력 구분해주는 선-->
				<br><hr class="mb-4" style="">

				<!-- column5.전화번호 입력부분 -->
				<table><tr>
					<td style="width: 40%; height: 100px; vertical-align: top;">
						<div class="form-group">
							<label for="mtel"><span class="text-muted">phone</span></label> 
							<input type="text" id="mtel"name="mtel" class="form-control" 
							placeholder="01012345678" value="">
							<div id="feedback-tel" class="feedback"></div>
						</div>
					</td>
					<td></td>
				</tr></table>
				
				<!-- column6,column7. 주소 입력부분 1,2 -->
				<div class="mb-3">
					<label for="address"><span class="text-muted">Address</span></label> 
					<input type="text" id="maddr1" name="maddr1" class="form-control" 
					placeholder="서울시 금천구 벚꽃로 244" value="">
				</div>
				<div class="mb-3">
					<input type="text" id="maddr2" name="maddr2" class="form-control" 
					placeholder="벽산디지털밸리 5차" value="">
				</div>
				
				<br><hr class="mb-4">
				
				<div class="row">
					<!-- column8. 성별선택 -->
					<div class="col-md-6 mb-3">
						<div class="d-block my-3">
							<label for="gender"><span class="text-muted">gender</span></label>
							<select class="custom-select d-block w-100" id="genderSelector" style="width: 100px;">
								<option value="OTHER">OTHER</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select>
							<input type="hidden" id="gender" name="gender" value="${memberDTO.gender}" class="hidden">
						</div>
					</div>
					<!-- column9. 연령대 -->
					<div class="col-md-6 mb-3">
						<div class="d-block my-3">
							<label for="ageGroup"><span class="text-muted">ageGroup</span></label>
							<select class="custom-select d-block w-100" id="agegroupSelector" style="width: 100px;">
								<option value="10s">10대</option>
								<option value="20s" selected="selected">20대</option>
								<option value="30s">30대</option>
								<option value="40s">40대</option>
								<option value="50s">50대</option>
								<option value="60s">60대</option>
								<option value="70s">70대</option>
								<option value="80s">80대 이상</option>
							</select>
							<input type="hidden" id="agegroup" name="agegroup" value="" class="hidden">
						</div>
					</div>
				</div>
				

				<hr class="mb-4"><br>
				
				<!-- column10. 최근 로그인한 날자 -->
				<input type="hidden" name="rdate" value="" class="hidden">
				
				<!-- 수정 / 삭제 버튼 -->
				<div class="row">
					<div class="col-md-6 mb-3" style="text-align: left;">
						<button class="btn btn-primary btn-lg btn-block" 
						id="updateBtn" name="updateBtn" type="button">수정</button>
					</div>
					<div class="col-md-6 mb-3" style="text-align: right;">
						<button class="btn btn-primary btn-lg btn-block" 
						id="deleteBtn" name="deleteBtn" type="button">삭제</button>
					</div>
				</div>
			</form>
			<!-- 아래쪽 공간 만들기 위한 div -->
			<div style="height: 80px;"></div>
		</div>
      </div>
    </div>
  </div>
  <!-- /.container -->
</div>
  <!-- footer -->
<%@ include file="/UserMainFooter.jsp"%>

</body>

</html>
