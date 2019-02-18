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

<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">
	/* 구글 계정 연동하여 회원가입 */
	var googleUser = {};

	var startApp = function() {
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
			//mid(이메일)받아오기
			console.log(googleUser.getBasicProfile().getEmail());
			document.getElementById('mid').value = googleUser.getBasicProfile()
					.getEmail();
			//mname받아오기
			console.log(googleUser.getBasicProfile().getName());
			document.getElementById('mname').value = googleUser
					.getBasicProfile().getName();
			//mprofile받아오기
			console.log(googleUser.getBasicProfile().getImageUrl());
			document.getElementById('mprofile').value = googleUser
					.getBasicProfile().getImageUrl();

			 $("#hidden").on("submit", function(event) {
			       event.preventDefault();
			       // process form
			    });

				}//end success
			})//end ajax

		}, function(error) {
			alert(JSON.stringify(error, undefined, 2));
		}); //attachClickHandler()
	}//end function attachSignin() 

	/* 이메일로 회원가입 */
	$(function() {
		$("#signIn").click(function() {
			 $("#hidden").on("submit", function(event) {
			       event.preventDefault();
			       // process form
			    });//end on()
		})//end click()
	})//end funcion
</script>
<style type="text/css">
/* 사용자 설정 css */
/* 구글 로그인 버튼 설정 */
#customBtn {
	display: inline-block;
	background: white;
	color: #444;
	width: 300px;
	border-radius: 5px;
	border: thin solid #888;
	white-space: nowrap;
}

#customBtn:hover {
	cursor: pointer;
}

span.icon {
	background: url(/test1/resources/IMAGE/LoginLogo/googleLogo.png);
	display: inline-block;
	vertical-align: middle;
	width: 42px;
	height: 42px;
	background-size: 20px 20px;
	background-repeat: no-repeat;
	background-position: 0% 50%;
}

span.buttonText {
	display: inline-block;
	vertical-align: middle;
	padding-left: 42px;
	padding-right: 42px;
	font-size: 20px;
	font-weight: bold;
	/* Use the Roboto font that is loaded in the <head> */
	font-family: 'Roboto', sans-serif;
}

.button {
	height: 55px;
	vertical-align: top;
	padding-top: 10%;
}
</style>

</head>
<body class="text-center">
	<!-- header -->
	<%@ include file="/UserMainHeader.jsp"%>
	<div  id="signup">
		<!-- 가입방식 선택 -->
		<div style="text-align: center; display: inline-block;">
			<!-- 위쪽공간 -->
			<div style="height: 150px;"></div>
			<!-- 이메일 회원가입 -->
			<div class="button">
				<button class="btn btn-lg btn-secondary btn-block" type="button"
					id="signIn">Sign up</button>
			</div>
			<!-- 구글 계정을 통한 회원가입 -->
			<div id="gSignInWrapper" class="button">
				<div id="customBtn" class="customGPlusSignIn">
					<span class="icon"></span> <span class="buttonText">Google</span>
				</div>
				<script>
					startApp();
				</script>
			</div>
	
			<!-- 외부 계정을 통한 회원가입 -->
			<div class="button">
				<button class="btn btn-lg btn-primary btn-block" type="button"
					id="google">OtherLogin1</button>
			</div>
			<div class="button">
				<button class="btn btn-lg btn-primary btn-block" type="button"
					id="github">OtherLogin2</button>
			</div>
			<p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
			<!-- 아래쪽 공간 -->
			<div style="height: 150px;">
				<!-- 외부 로그인 성공시 데이터를 임시로 담아둘 공간 -->
				<form id="hidden" action="insertMember.jsp">
					<input type="hidden" id="mid" name="mid" class="hidden"> <input
						type="hidden" id="mname" name="mname" class="hidden"> <input
						type="hidden" id="mprofile" name="mprofile" class="hidden">
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/UserMainFooter.jsp"%>

</body>
</html>