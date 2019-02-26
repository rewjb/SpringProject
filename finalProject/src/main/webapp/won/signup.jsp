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
		var re_inputMid = /^[a-zA-Z0-9]+@[a-z]*+\.[a-z]{2,3}$/; 
		// 비밀번호 검사식 : 소문자,대문자,숫자 / 6~18자
		var re_inputMpw = /^[a-zA-Z0-9]{6,18}$/; 
		// 유저이름 검사식 : 소문자,대문자,숫자,_ / 3~16자
		var re_inputMname = /^[a-zA-Z0-9_-]{3,16}$/; 
		// 모든 공백 정규식 : 
		var re = /\w+\s/g;
				
		
		// 선택할 요소를 변수에 할당
		var emForm = $('#EmForm');
		var inputMname = $('#inputMname');
		var inputMpw = $('#inputMpw');
		var inputMid = $('#inputMid');

		// 서밋 이벤트가 발생하면 실행한다
		// if (사용자 입력 값이 정규식 검사에 의해 참이 아니면) {포함한 코드를 실행}
		// if 조건절 안의 '정규식.test(검사할값)' 형식은 true 또는 false를 반환한다
		// if 조건절 안의 검사 결과가 '!= true' 참이 아니면 {...} 실행
		// 사용자 입력 값이 참이 아니면 alert을 띄운다
		// 사용자 입력 값이 참이 아니면 오류가 발생한 input으로 포커스를 보낸다
		// 사용자 입력 값이 참이 아니면 form 서밋을 중단한다
		$("#signup").click(function() {
			if (re_inputMid.test(inputMid.val()) != true) { // 아이디(이메일) 검사
				alert('[ID 입력 오류] 유효한 이메일 주소를 입력해 주세요.');
				$("#inputMid").css("display", "inline")
				inputMid.focus();
				return false;
			} else if (re_inputMpw.test(uinputMpw.val()) != true) { // 비밀번호 검사
				alert('[PW 입력 오류] 유효한 inputMpw를 입력해 주세요.');
				uinputMpw.focus();
				return false;
			} else if (re_inputMname.test(inputMname.val()) != true) { // 이름 검사
				alert('[user name 입력 오류] 유효한 inputMname를 입력해 주세요.');
				uinputMname.focus();
				return false;
			} 
		});

		// #inputMname, #inputMpw 인풋에 입력된 값의 길이가 적당한지 알려주려고 한다

		// #inputMname 인풋에서 onkeyup 이벤트가 발생하면
		$("#inputMid").keyup(function() {
			var s = $("#feedback-inputMid"); // strong 요소를 변수에 할당
			if (inputMname.val().length == 0) { // 입력 값이 없을 때
				s.text(''); // strong 요소에 포함된 문자 지움
			} else if (inputMname.val().length < 3) { // 입력 값이 3보다 작을 때
				s.text('너무 짧아요.'); // strong 요소에 문자 출력
			} else if (inputMname.val().length > 16) { // 입력 값이 16보다 클 때
				s.text('너무 길어요.'); // strong 요소에 문자 출력
			} else { // 입력 값이 3 이상 16 이하일 때
				s.text('적당해요.'); // strong 요소에 문자 출력
				
			}
		});

		// #inputMpw 인풋에서 onkeyup 이벤트가 발생하면
		inputMpw.keyup(function() {
			var s = $(this).next('strong'); // strong 요소를 변수에 할당
			if (uinputMpw.val().length == 0) { // 입력 값이 없을 때
				s.text(''); // strong 요소에 포함된 문자 지움
			} else if (uinputMpw.val().length < 6) { // 입력 값이 6보다 작을 때
				s.text('너무 짧아요.'); // strong 요소에 문자 출력
			} else if (uinputMpw.val().length > 18) { // 입력 값이 18보다 클 때
				s.text('너무 길어요.'); // strong 요소에 문자 출력
			} else { // 입력 값이 6 이상 18 이하일 때
				s.text('적당해요.'); // strong 요소에 문자 출력
			}
		});
		
		
		// 원본 : #inputMpw 인풋에서 onkeyup 이벤트가 발생하면
		inputMpw.keyup(function() {
			var s = $(this).next('strong'); // strong 요소를 변수에 할당
			if (uinputMpw.val().length == 0) { // 입력 값이 없을 때
				s.text(''); // strong 요소에 포함된 문자 지움
			} else if (uinputMpw.val().length < 6) { // 입력 값이 6보다 작을 때
				s.text('너무 짧아요.'); // strong 요소에 문자 출력
			} else if (uinputMpw.val().length > 18) { // 입력 값이 18보다 클 때
				s.text('너무 길어요.'); // strong 요소에 문자 출력
			} else { // 입력 값이 6 이상 18 이하일 때
				s.text('적당해요.'); // strong 요소에 문자 출력
			}
		});

		// #tel 인풋에 onkeydown 이벤트가 발생하면
		// 하이픈(-) 키가 눌렸는지 확인
		// 하이픈(-) 키가 눌렸다면 입력 중단
		tel.keydown(function() {
			if (event.keyCode == 109 || event.keyCode == 189) {
				return false;
			}
		});
		
		
	});
</script>
<style type="text/css">
	.feedback{
 		display: none;
		text-align : left;
		padding-left : 5px;
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
                    <!-- 아이디 비밀번호 입력 폼 -->
                    <label for="inputEmail" class="sr-only">Email address</label> 
                    <input type="email" id="inputMid" class="form-control"
                       placeholder="Email address" required autofocus onkeyup="midCheck">
                    <div id="feedback-inputMid" class="feedback">abc@spring.com 유효한 메일 주소를 입력해주세요.</div>
                    <div style="height: 7px;"></div> 
                    <label for="inputPassword" class="sr-only">Password</label> 
                    <input type="password" id="inputMpw" class="form-control"
                       placeholder="Password" required>
  					<div id="feedback-inputMpw" class="feedback">영문 대소문자와 숫자를 사용하여 6~18자 사이로 만들어주세요.</div>
                    <div style="height: 3px;"></div> 
                    <label for="inputPassword" class="sr-only">Password</label> 
                    <input type="password" id="inputMpw" class="form-control"
                       placeholder="Password" required>
                    <div id="feedback-inputMid3" class="feedback">비밀번호가 일치하지 않습니다.</div>
                    <div style="height: 7px;"></div> 
                    <label for="inputUserName" class="sr-only">UserName</label> 
                    <input type="text" id="inputMname" class="form-control"
                       placeholder="UserName" required>
                    <div id="feedback-inputMname" class="feedback" style="width: 100%;">유효한 이름을 입력해 주세요.</div>
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
                        <input type="text" id="mprofile" name="mprofile" class="hidden"><br>
                        <img id="imgTest" src="">
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