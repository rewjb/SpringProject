<!-- 
회원가입 방법 선택하는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">

<title>logIn</title>
<script type="text/javascript" src="springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
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

		//유효성 결과를 화면에 띄워주는 함수
		function hasColor(var input, var v){
			if(v == 0){ //success
				
			}else if{
				
			}
			input.parent().attr("class", v1);
			input.attr("class",v2);				
		}
		
		//ID유효성 : #inputMid에서 onkeyup 이벤트가 발생시
 		id.keyup(function() {
 			//feedback div : 피드백 내용을 모여주는 div
 			var f = $("#feedback-inputMid");
 			//유효성 검사
 			if (id.val().length == 0) { // 입력 값이 없을 때
 				//기본설정
 				hasColor(id,"form-group","form-control");
 				f.text(''); // feedback 요소에 포함된 문자 지움
 			} else if (id.val().length > 30) { 
 				//기준보다 입력값이 길때
 				hasColor(id,"form-group has-danger","form-control is-invalid");
 				f.text('너무 길어요.'); // feedback div에 문자 출력
 			} else { 
 				// 길이가 적당할때 - 유효성 검사
 				if (!re_email.test(id.val())) { // 아이디(이메일) 검사
	 				hasColor(id,"form-group has-danger","form-control is-invalid");
 					f.text('spring@abc.com 유효한 메일 주소를 입력해주세요.')
 				} else { //유효성 검사 통과 후 중복 아이디 확인
 					var mid = id.val();
 					$.ajax({
 						url : "checkMid?mid=" + mid,
 						type : "GET",
 						success : function(result) {
			 				hasColor(id,"form-group has-success","form-control is-valid");
 			 				f.text(''); // feedback 요소에 포함된 문자 지움
 			 				//중복아이디 확인까지 끝나면 값 세팅
 							$("#mid").val(result);
 						}//end success
 					});//end ajax
 				}//end if()
 			}//end if
 		});//end keyup()
		
		//pw유효성 : #inputMpw에서 onkeyup 이벤트가 발생시
		pw.keyup(function() {
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-inputMpw"); 
			//유효성 검사
			if (pw.val().length == 0) { // 입력 값이 없을 때
				f.text(''); // feedback 요소에 포함된 문자 지움
			} else if(pw.val().length < 6){
				f.text('6자 이상 입력해주세요') // feedback div에 문자 출력
			} else if (pw.val().length > 18) { 
				f.text('18자 이내로 입력해주세요'); // feedback div에 문자 출력
			} else { // 길이가 적당할때 - 유효성 검사
				if (!re_pw.test(pw.val())) { // 비밀번호 검사
					f.text('영문 대소문자와 숫자를 사용하여 6~18자 사이로 만들어주세요.')
				} else {
					var mpw = pw.val();
					console.log("pw : " + mpw);
					f.text(''); // feedback 요소에 포함된 문자 지움
				}//end if()
			}//end if
		});//end keyup()
		
		//pw유효성 : #inputConform에서 onkeyup 이벤트가 발생시
		cf.keyup(function() {
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-inputMpw1"); 
			//유효성 검사
			if (pw.val().length == 0) { // 입력 값이 없을 때
				f.text(''); // feedback 요소에 포함된 문자 지움
			} else if(cf.val() != pw.val()){
				var mcf = cf.val();
				console.log("cf : " + mcf);
				f.text('비밀번호가 일치하지 않습니다.') // feedback div에 문자 출력
			} else { // 비밀번호가 일치할때
				var mcf = cf.val();
				console.log("cf : " + mcf);
				$("#mpw").val(mcf);
				f.text(''); // feedback 요소에 포함된 문자 지움
			}//end if()
		});//end keyup()
		 
			 
		//name유효성 : #inputMname에서 onkeyup 이벤트가 발생시
		name.keyup(function() {
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#feedback-inputMname"); 
			//유효성 검사
			if (name.val().length == 0) { // 입력 값이 없을 때
				f.text(''); // feedback 요소에 포함된 문자 지움
			} else if(name.val().length < 3){
				f.text('3자 이상 입력해주세요') // feedback div에 문자 출력
			} else if (name.val().length > 16) { 
				f.text('16자 이내로 입력해주세요'); // feedback div에 문자 출력
			} else { // 길이가 적당할때 - 유효성 검사
				if (!re_name.test(name.val())) { // 아이디(이메일) 검사
					f.text('영문 대소문자와 숫자를 사용하여 3~16자 사이로 만들어주세요.')
				} else {
					var mname = name.val();
					$.ajax({
						url : "checkMname?mname=" + mname,
						type : "GET",
						success : function(result) {
							f.text('사용 가능한 이름 입니다.'); // feedback div에 문자 출력
							f.css("color", "grey")
							$("#mname").val(result)
						}//end success
					});//end ajax
				}//end if()
			}//end if
		});//end keyup()
		
		$("#signup").click(function() {
			
		})
	});
</script>
<style type="text/css">
	.feedback{
		text-align : left;
		padding-left : 5px;
		padding-top : -10px;
		color:red;
		font-size: 10px;
	}
</style> 

</head>
<body class="text-center">
   <!-- header -->
   <%@ include file="/won/loginHeader.jsp"%>
   <div id="signup">
      <!-- 위쪽공간 -->
      <div style="text-align: center;">
         <!-- 가입방식 선택 -->
         <table style="width: 100%; text-align: center;">
            <tr>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td style="width: 300px;">
                 <form id="EmForm" class="form-signin" style="width: 300px;">
                    <!-- MID 아이디(이메일) 입력 폼 -->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Email address" id="inputMid">
	                    <div class="feedback" id="feedback-inputMid"></div>
					</div>

                    <div style="height: 7px;"></div> 
                    
                    <!-- MPW 비밀번호 입력 폼 -->
					<div class="form-group">
	                    <input type="password" id="inputMpw" class="form-control" placeholder="Password" required>
	  					<div id="feedback-inputMpw" class="feedback"></div>
					</div>
                    <div style="height: 3px;"></div> 
					<div class="form-group">
	                    <input type="password" id="inputConform" class="form-control" placeholder="Password Conform" required>
	                    <div id="feedback-inputMpw1" class="feedback"></div>
					</div>  
					                  
                    <div style="height: 7px;"></div> 
                    
                    <!-- 이름 입력 폼 -->
                    <div class="form-group">
	                    <input type="text" id="inputMname" class="form-control" placeholder="UserName" required>
	                    <div id="feedback-inputMname" class="feedback" style="width: 100%;"></div>
                    </div>

				</form>
                  
                  <!-- 이메일 회원가입 -->
                  <%@ include file="loginEm.jsp" %>
                  <div style="height: 60px; vertical-align: top; padding-top: 10px">
                     <button class="btn btn-lg btn-secondary btn-block" type="button"
                        id="signup" style="width: 300px;">Sign up</button>
                     <hr>
                  </div>
               </td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td>
                  <!-- 구글 로그인 설정 --> <%@ include file="/won/loginGG.jsp"%>
                  <!-- 구글 계정을 통한 회원가입 -->
                  <div id="gSignInWrapper" class="button">
                     <div id="customBtn" class="customGPlusSignIn">
                        <span class="icon"></span> <span class="buttonText">
                        Login with Google</span>
                     </div>
                     <script>
                        startAppGG();
                     </script>
                  </div>
               </td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td>
                  <!-- 페이스북 로그인 설정 --> <%@ include file="/won/loginFB.jsp"%>
                  <!-- 페이스북 계정을 통한 회원가입 -->
                  <div style="height: 20px;"></div> 
                  <input type="button" id="authBtn" value="checking..." 
                  onclick="
                     if(this.value === 'Login with Facebook'){
                        //now logout
                        FB.login(function(res){
                           console.log('login =>',res);
                           checkLoginStatus(res);
                        });
                     }else{
                        //now login
                        FB.logout(function(res){
                           console.log('logout =>',res);
                           checkLoginStatus(res);
                        });
                     }
                  ">
               </td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td style="height: 100px"></td>
               <td></td>
            </tr>
            <tr>
              <td></td>
              <td>
				<div style="height: 150px;">
                    <!-- 외부 로그인 성공시 데이터를 담아놨다가 넘겨주는 공간 -->
						<form id="hidden" action="insertMember.jsp">
							<input type="text" id="mid" name="mid" class="hidden"><br>
							<input type="text" id="mpw" name="mpw" class="hidden"><br>
							<input type="text" id="mname" name="mname" class="hidden"><br>
							<input type="text" id="mprofile" name="mprofile" class="hidden"
								value="/springProject/resources/IMAGE/LoginLogo/user.png"><br>
							<img id="imgTest" src="/springProject/resources/IMAGE/LoginLogo/user.png" style="width: 100px">
						</form>
					</div>
               </td>
               <td></td>
            </tr>
         </table>
      </div>
   </div>

</body>
</html>