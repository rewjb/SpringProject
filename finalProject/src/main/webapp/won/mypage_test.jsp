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
  
  <script type="text/javascript">
//<!------------------------- 개인정보 수정 ---------------------------->
	$(function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행
		
	// 정규식을 변수에 할당
	// 변수 이름을 're_'로 정한것은 'Reguar Expression'의 머릿글자
		// 아이디(이메일) 검사식 : 소문자,대문자,숫자 @ 소문자 . 소문자 2-3글자
		var re_email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		// 비밀번호 검사식 : 소문자,대문자,숫자 / 6~18자
		var re_pw = /^[a-zA-Z0-9]{6,18}$/; 
		// 유저이름 검사식 : 소문자,대문자,숫자,_ / 3~16자
		var re_name = /^[a-zA-Z0-9_-]{3,16}$/; 
		
		//식을 간단하게 하기 위해 변수에 담아주기
		var id = $('#inputMid');
		var pw = $('#inputMpw');
		var cf = $("#inputConform"); //비밀번호 확인
		var name = $('#inputMname');
		
		var idCheck = 0;
		var pwCheck = 0;
		var cfCheck = 0;
		var nameCheck = 0;

		//유효성 결과에 따라 다른 클래스(input style)에 포함시켜주는 함수
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
		
		//ID유효성 : #inputMid에서 onkeyup 이벤트가 발생시
		id.keyup(function() {
			idCheck = 0;
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-inputMid"); 
			//유효성 검사
			if (id.val().length == 0) {	// 입력 값이 없을 때
				//기본설정
				hasColor(id,0);			//default
				f.text(''); 			//비워주기
			} else if (id.val().length > 30) { //기준보다 입력값이 길때 
				//문제시 설정
				hasColor(id, 1);		//danger
				f.text('너무 길어요.');		//feedback div에 문자 출력
			} else { 
				// 길이가 적당할때 - 유효성 검사
				if (!re_email.test(id.val())) { // 아이디(이메일) 검사
					//문제시 설정
	 				hasColor(id, 1);	//danger
					f.text('spring@abc.com 유효한 메일 주소를 입력해주세요.')
				} else { //유효성 검사 통과 후 중복 아이디 확인
					var mid = id.val();
					$.ajax({
						url : "/springProject/won/checkMid?mid=" + mid,
						type : "POST",
						success : function(result) {
							//성공시 설정
		 					hasColor(id,2);			//success
		 					f.text(''); 			//비워주기
							$("#mid").val(result);	//전송폼에 값 세팅
							
							idCheck = 1;
						}//end success
					});//end ajax
				}//end if()
			}//end if
		});//end keyup()
		
		
		//pw유효성 : #inputMpw에서 onkeyup 이벤트가 발생시
		pw.keyup(function() {
			pwCheck = 0;
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-inputMpw"); 
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
		
		//pw일치확인 : #inputConform에서 onkeyup 이벤트가 발생시
		cf.keyup(function() {
			cfCheck = 0;
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-inputMpw1"); 
			//유효성 검사
			if (cf.val().length == 0) { // 입력 값이 없을 때
				//기본설정
				hasColor(cf,0);			//default
				f.text('');				//비워주기
			} else if(cf.val() != pw.val()){
				//문제시 설정
				hasColor(cf,1);			//danger
				f.text('비밀번호가 일치하지 않습니다.') //문제에 대한 안내 출력
			} else { // 비밀번호가 일치할때\
				//성공시 설정
				hasColor(cf,2)			//success
				f.text('');				//비워주기
				$("#mpw").val(pw.val());//전송폼에 값 세팅
				cfCheck = 1;
			}//end if()
		});//end keyup()
		 
			 
		//name유효성 : #inputMname에서 onkeyup 이벤트가 발생시
		name.keyup(function() {
			nameCheck = 0;
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-inputMname"); 
			//유효성 검사
			if (name.val().length == 0) {	// 입력 값이 없을 때
				//기본설정
				hasColor(name,0);			//default
				f.text(''); 				//비워주기
			} else if(name.val().length < 3){
				//문제시 설정
				hasColor(name,1);			//danger
				f.text('3자 이상 입력해주세요')	//문제에 대한 안내 출력
			} else if (name.val().length > 16) { 
				//문제시 설정
				hasColor(name,1);			//danger
				f.text('16자 이내로 입력해주세요'); //문제에 대한 안내 출력
			} else { // 길이가 적당할때 - 유효성 검사
				if (!re_name.test(name.val())) { // 이름 검사
					//문제시 설정
					hasColor(name,1);
					f.text('영문 대소문자와 숫자를 사용하여 3~16자 사이로 만들어주세요.')
				} else {
					var mname = name.val();
					$.ajax({
						url : "/springProject/won/checkMname?mname=" + mname,
						type : "POST",
						success : function(result) {
							//성공시 설정
							hasColor(name,2);		//success
							f.text(''); 			//비워주기
							$("#mname").val(result);	//전송폼에 값 세팅
							$("#mprofile").val(
								"/springProject/resources/IMAGE/LoginLogo/user.png");
							$("img").attr("src", $("mprofile").val())
							nameCheck = 1;
						}//end success
					});//end ajax
				}//end if()
			}//end if
		});//end keyup()

		
		//signup버튼 눌렀을때 동작하는 함수
		$("#signupBtn").click(function() {
			if(idCheck + pwCheck + cfCheck + nameCheck == 4) {
				
				if($("#mid").val() != id.val()) { // 아이디(이메일) 입력폼과 전송폼 일치여부 확인
					//문제시 설정
	 				hasColor(id, 1);		//danger
	 				id.focus();				//id 입력폼으로 이동
	 	 			var f = $("#feedback-inputMid");
					f.text('다시 입력해주세요')	//알림 띄워줌
				} else if($("#mpw").val() != pw.val()){ // 비밀번호 입력폼과 전송폼이 일치하는지 확인
					//문제시 설정
	 				hasColor(pw,1);		//danger
	 				pw.focus();			//pw 입력폼으로 이동
	 				cf.val("");			//pw 확인폼 지워줌	
	 	 			var f = $("#feedback-inputMpw1");
					f.text('다시 입력해주세요')	//알림 띄워줌
				} else if($("#mname").val() != name.val()){
					//문제시 설정
					hasColor(name,1);	//danger
					name.focus();		//name 입력폼으로 이동
					var f = $("#feedback-inputMname");
					f.text('다시 입력해주세요')
				} else {
					var form = $("#hidden");
					
	                // 자바스크립트 객체를 배열에 담아줌
	                var formSerial = $(form).serializeArray();
	                var sendData = {};
	                for (var i = 0; i < formSerial.length; i++) {
	                	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value);
					}
	                //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환 
	                console.log(JSON.stringify(sendData));
					$.ajax({
						url : "/springProject/won/insertMember",
						type : "POST",
						data : sendData,
						success : function(result) {
							$("#id").attr("value", $("#mid").val());
							console.log(result+'--1:실패,0:성공');
						}//end success
					});//end ajax					
				}//end if()
				$("#hdnBtn").trigger("click");
			}
		})//end click()
	});
	
//<!------------------------- 개인정보 수정 끝 ---------------------------->
  
  
  </script>
</head>

<body>


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3" style="padding-top: 10px;">
        <div style=""></div>
        <h3 class="display-4 pt-3" style="text-align: center; 
        	font-family: 'Do Hyeon', sans-serif; font-size: 30px;">
        	마이페이지</h3>
        <div class="list-group">
          <a href="#" class="list-group-item" style="color: black;">내정보 수정</a>
          <a href="#" class="list-group-item" style="color: black;">선호태그 수정</a>
          <a href="#" class="list-group-item" style="color: black;">내 계획서 리스트</a>
          <a href="#" class="list-group-item" style="color: black;">Category 4</a>
        </div>
      </div>

      <div class="col-lg-9">

        <div>
        <legend class="display-4" style="text-align: center; font-family: 'Do Hyeon', sans-serif;">승인대기중인 여행지</legend>
        <hr style="width: 80%;">
    		<!-- 폼 전체 담아놓는 div -->
			<div style="padding-left: 5%; padding-right: 5%">
<!-- 				공간 만들기 위한 div -->
<!-- 				<div style="height: 30px;"> -->
<!-- 				</div> -->
				<form class="needs-validation" novalidate action="insertMember.do">
<!-- 					column1. mid 부분 div : 수정 불가 -->
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="mid">ID <span class="text-muted"></span></label> -->
<!-- 						<input type="text" class="form-control" id="mid" name="mid"	value="" readonly="readonly"> -->
<!-- 					</div> -->
					
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="username">user-name</label> -->
<!-- 						<div class="input-group"> -->
<!-- 							<div class="input-group-prepend"> -->
<!-- 								<span class="input-group-text"></span> -->
<!-- 							</div> -->
<!-- 							<input type="text" id="inputMname" class="form-control" value="" readonly="readonly"> -->
<!-- 						</div> -->
<!-- 					</div> -->

					<!-- column1. mid : 수정 불가 -->
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mid">ID <span class="text-muted"></span></label>
						<input type="text" class="form-control" id="mid" name="mid"	value="" readonly="readonly">
						</div>
						<div class="col-md-6 mb-3">
							<label for="username">user-name</label>
					<!-- column3. mname : 수정 불가 -->
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">@</span>
							</div>
							<input type="text" id="inputMname" class="form-control" value="" readonly="readonly">
						</div>
						</div>
					</div>

					<!-- column2. mpw부분   -->
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="password">PASSWORD</label> 
							<input type="password" id="inputMpw" class="form-control" placeholder="Password" required>
							<div id="feedback-inputMpw" class="feedback"></div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="passwordC">CONFIRM</label> 
							<input type="password" id="inputConform" class="form-control" placeholder="Password Conform" required>
							<div id="feedback-inputMpw1" class="feedback"></div>
						</div>
					</div>

					
					<!-- column4. 프로필 사진 입력부분 -->
					<div class="mb-3">
						<label for="mprofile">profile picture<span class="text-muted"></span></label> 
						<input type="text" class="form-control" name="mprofile" placeholder="your profile picture" style="height: 45px">
					</div>
					
					<!-- 기본정보 : 필수입력 / 추가정보 : 선택입력 구분해주는 선-->
					<br><hr class="mb-4" style=""><br>
					
					<!-- column5.전화번호 입력부분 -->
					<div class="mb-3">
					<label for="tel">phone <span class="text-muted"></span></label> 
					<input type="number" class="form-control" name="mtel" placeholder="01012345678">
					<div class="invalid-feedback"></div>
					</div><br>
					
					<!-- column6,column7. 주소 입력부분 1,2 -->
					<div class="mb-3">
						<label for="address">Address</label> 
						<input type="text" class="form-control" name="maddr1" placeholder="서울시 금천구 벚꽃로 244">
					</div>
					<div class="mb-3">
						<label for="address2">Address<span class="text-muted">(Optional)</span></label>
						<input type="text" class="form-control" name="maddr2" placeholder="벽산디지털밸리 5차">
					</div><br>

					<!-- column8. 성별선택 -->
					<div class="d-block my-3">
						<label for="gender">gender</label> 
						<select class="custom-select d-block w-100" name="gender">
							<option value="other" selected="selected">other</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</select>
					</div><br>
					
					<!-- column9. 연령대 -->
					<div class="d-block my-3">
						<label for="ageGroup">ageGroup</label>
						<select class="custom-select d-block w-100" name="agegroup">
							<option value="10">~10대</option>
							<option value="2030" selected="selected">20~30대</option>
							<option value="4050">40~50대</option>
							<option value="6070">60~70대</option>
							<option value="80">80대~</option>
						</select>
					</div><br><br>

					<hr class="mb-4">
					
					<!-- column10. 날자 -->
					<input type="hidden" name="rdate" value="SYSDATE">

					<!-- 수정 / 삭제 버튼 -->
					<button style="width: 100px" class="btn btn-primary btn-lg btn-block" type="submit">수정</button>
					<button style="width: 100px" class="btn btn-primary btn-lg btn-block" type="submit">삭제</button>
				</form>
				<!-- 아래쪽 공간 만들기 위한 div -->
				<div style="height: 80px;"></div>
			</div>
        </div>

      </div>

    </div>

  </div>
  <!-- /.container -->

  <!-- footer -->
<%@ include file="/UserMainFooter.jsp"%>

</body>

</html>
