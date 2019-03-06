<!-- 
로그인 방법 선택하는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<!-- <meta name="description" content=""> -->
<!-- <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors"> -->
<!-- <meta name="generator" content="Jekyll v3.8.5"> -->

<title>로그인</title>
<!-- header -->
<%@ include file="/UserMainHeader.jsp"%>

<!-- 구글  -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<script type="text/javascript">
//<!------------------------- body2-1 : 이메일 가입 관련 설정 ---------------------------->
	$(function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행
		
		//식을 간단하게 하기 위해 변수에 담아주기
		var id = $('#inputMid');
		var pw = $('#inputMpw');
		
		//ID유효성 : #inputMid에서 onkeyup 이벤트가 발생시
 		id.keyup(function() {
 			//feedback div : 피드백 내용을 모여주는 div
 			var f = $("#feedback-inputMid");
 			//유효성 검사
 			if (id.val().length > 0 && id.val().length < 30) {	// 입력 값이 없을 때
 				// 길이가 적당할때
				// 아이디(이메일) 검사식 : 소문자,대문자,숫자 @ 소문자 . 소문자 2-3글자
				var re_email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
 				if (re_email.test(id.val())) { // 아이디(이메일) 검사
 					f.text(''); 				//비워주기
					$("#mid").val(id.val());	//전송폼에 값 세팅
 				}//end if()
 			}//end if()
 		});//end keyup()
		
 		
		//pw유효성 : #inputMpw에서 onkeyup 이벤트가 발생시
		pw.keyup(function() {
			var f = $("#feedback-inputMpw");
			f.text('');				//비워주기
			$("#mpw").val(pw.val());//전송폼에 값 세팅
		});//end keyup()
			 
		//login버튼 눌렀을때 동작하는 함수
		$("#loginBtn").click(function() {
			var form = $("#hidden");
			
            // 자바스크립트 객체를 배열에 담아줌
            var formSerial = $(form).serializeArray();
            var sendData = {};
            for (var i = 0; i < formSerial.length; i++) {
            	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value);
			}
            //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환 
            console.log("sendData : "+JSON.stringify(sendData));
			$.ajax({
				url : "login",
				type : "POST",
				data : sendData,
				success : function(result) {
					alert(result);
					console.log(result+' (-1 : db관련 실패 / 0 : 성공 / 1 : 아이디가 없음 / 2 : 비밀번호가 없음)');
					if(result == "0"){
						//로그인 성공 - 세션 등록 후 메인으로 이동
						alert("로그인 성공");
					} else {
						//로그인 실패
						alert("아이디, 비밀번호를 확인해주세요.<br>문제가 계속되면 관리자에게 문의해주세요.<br>xx-xxxx-xxxx");
						id.text()="";
						pw.text()="";
					}
				}//end success
			});//end ajax
		})//end #loginBtn click()
	});
	
//<!------------------------- body2-1 : 이메일 가입 관련 설정 ---------------------------->
   
</script>
<style type="text/css">
/* 로그인 폼 테두리 */
	.rounded {
	  background: silver;
	  height: 50px; width: 200px;
	  border-radius: 5px;
	}
	
/* -------전송하는 폼 설정 form id="hidden"------- */
	.feedback{
		text-align : left;
		padding-left : 5px;
		color:red;
		font-size: 10px;
	}
	.form-group{
		height: 27px;
	}

/* -------구글 로그인 버튼 설정-------------------- */
#customBtn {
	display: inline-block;
	background: white;
	color: #444;
	width: 300px;
	height: 40px;
	border-radius: 5px;
	border: thin solid #888;
	white-space: nowrap;
	vertical-align: top;
}

#customBtn:hover {
	cursor: pointer;
}

span.icon {
	background: url(/springProject/resources/IMAGE/LoginLogo/googleLogo.png);
	display: inline-block;
	vertical-align: middle;
	width: 42px;
	height: 42px;
	background-size: 20px 20px;
	background-repeat: no-repeat;
	background-position: 00% 50%;
}

span.buttonText {
	display: inline-block;
	vertical-align: middle;
	padding-left: 42px;
	padding-right: 42px;
	font-size: 16px;
	font-weight: bold;
	/* Use the Roboto font that is loaded in the <head> */
	font-family: 'Roboto', sans-serif;
}

.button {
	height: 55px;
	vertical-align: top;
	padding-top: 10%;
}

/* -------페이스북 로그인 버튼 설정--------------------- */
#authBtn {
	display: inline-block;
	color: #FFFFFF;
	width: 300px;
	height: 40px;
	border-radius: 5px;
	border: thin solid #888;
	white-space: nowrap;
	vertical-align: top;
	background: url(/springProject/resources/IMAGE/LoginLogo/fbookLogo.png);
	background-color: #3A559F;
	background-size: 25px 25px;
	background-repeat: no-repeat;
	background-position: 5% 45%;
	font-size: 16px;
	font-family: 'Roboto', sans-serif;
	text-align: right;
	padding-right: 50px;
}

#authBtn:hover {
	cursor: pointer;
}

#authBth {
	display: inline-block;
}
</style> 

</head>
<body class="text-center">
   <div id="login">
      <div style="text-align: center;">
	     <!-- 위쪽공간 -->
         <!-- 로그인 방식 선택 -->
         <table style="width: 100%; text-align: center;">
            <tr>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
              <td></td>
              <td>
				<div style="height: 150px;">
<!------------------------- body1 : 실제 컨트롤러와 동작하는 공간-------------->
					<form id="hidden">
						<input type="hidden" id="mid" name="mid" class="hidden" placeholder="mid"><br>
						<input type="hidden" id="mpw" name="mpw" class="hidden" placeholder="mpw"><br>
					</form>
<!------------------------- body1 : 실제 컨트롤러와 동작하는 공간 끝------------>
				</div>
               </td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td style="width: 300px;">
<!------------------------- body2 : 이메일 가입 설정 -------------------------->
					<form id="EmForm" class="form-signin" style="width: 300px;">
						<!-- MID 아이디(이메일) 입력 폼 -->
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Email address" id="inputMid">
							<div class="feedback" id="feedback-inputMid"></div>
						</div>

						<div style="height: 5px"></div>

						<!-- MPW 비밀번호 입력 폼 -->
						<div class="form-group">
							<input type="password" id="inputMpw" class="form-control"
								placeholder="Password" required>
							<div id="feedback-inputMpw" class="feedback"></div>
						</div>
						
						<div style="height: 5px"></div>

					</form> 
					<!-- 이메일 로그인 -->
					<div style="height: 60px; vertical-align: top; padding-top: 10px">
						<button class="btn btn-lg btn-secondary btn-block" type="button"
							id="loginBtn" style="width: 300px;">로그인</button>
						<hr>
					</div>
				</td>
<!------------------------- body2 : 이메일 가입 끝 ---------------------------->
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td>
<!------------------------- body3 : 구글 로그인 관련 ---------------------------->
               	<!-- 구글 로그인 설정 -->
				<!-- 구글 계정 연동하여 로그인 -->
				<script type="text/javascript">
				var googleUser = {};

				var startAppGG = function() {
					gapi.load('auth2',function() {
						// Retrieve the singleton for the GoogleAuth library and set up the client.
						auth2 = gapi.auth2
							.init({
								client_id : '702698149904-d84keomrhgpc92u84qi1uobuugmnja3s.apps.googleusercontent.com',
								cookiepolicy : 'single_host_origin',
							// Request scopes in addition to 'profile' and 'email'
							//scope: 'additional_scope'
							});
						attachSignin(document.getElementById('customBtn'));
					});//end gapi.load()
				};//end startApp

				function attachSignin(element) {
					console.log(element.id);
					auth2.attachClickHandler(element, {}, function(googleUser) {
						console.log("GOOGLE");
						//mid(이메일)받아오기
						var ggId = googleUser.getBasicProfile().getEmail()
						console.log(ggId);
						document.getElementById('mid').value = ggId;
						//mpw세팅하기 : Google EXternal LOGIN
						document.getElementById('mpw').value = "GgEXLOGIN";

						//로그인 진행 
						var form = $("#hidden");
		                //자바스크립트 객체를 배열에 담아줌
		                var formSerial = $(form).serializeArray();
		                var sendData = {};
		                for (var i = 0; i < formSerial.length; i++) {
		                	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value);
						}
		                //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환 
		                console.log(JSON.stringify(sendData));
						$.ajax({
							url : "login",
							type : "POST",
							data : sendData,
							success : function(result) {
								console.log(result);
							}//end success
						});//end ajax

						 $("#hidden").on("submit", function(event) {
						       event.preventDefault();
						       // process form
						    });

					},function(error) {
						console.log(JSON.stringify(error, undefined, 2));
					}); //attachClickHandler()
				}//end function attachSignin() 
				
				var loginGG = function() {
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
						url : "login",
						type : "POST",
						data : sendData,
						success : function(result) {
							console.log(result+' (-1 : db관련 실패 / 0 : 성공 / 1 : 아이디가 없음 / 2 : 비밀번호가 없음)');
							if(result == "0"){
								//로그인 성공 - 세션 등록 후 메인으로 이동
								alert("로그인 성공");
							} else {
								//로그인 실패
								alert("아이디, 비밀번호를 확인해주세요.<br>문제가 계속되면 관리자에게 문의해주세요.<br>xx-xxxx-xxxx");
								id.text()="";
								pw.text()="";
							}
						}//end success
					});//end ajax
						
				};//end gglogin
				
				</script>
				<!-- 구글 로그인 버튼 -->
				<div id="gSignInWrapper" class="button">
					<div id="customBtn" class="customGPlusSignIn">
						<span class="icon"></span> <span class="buttonText"> Google로 로그인</span>
					</div>
					<script>
				       startAppGG();
				    </script>
				</div>
<!------------------------- body3 : 구글 로그인 관련 끝 ---------------------------->
               </td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td style="height: 150px"></td>
               <td></td>
            </tr>
         </table>
      </div>
   </div>
   <!-- footer -->
   <%@ include file="/UserMainFooter.jsp"%>

</body>
</html>