<!-- 구글 로그인을 위한 설정들입니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">
	/* 구글 계정 연동하여 회원가입 */
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

		},function(error) {
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
	background: url(/test1/resources/IMAGE/LoginLogo/googleLogo.png);
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
</style>