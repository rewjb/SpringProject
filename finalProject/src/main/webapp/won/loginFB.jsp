<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	//로그인 상태 체크
	var checkLoginStatus = function(response) {
		console.log(response);
		/* statusChangeCallback(response); */
		if (response.status === 'connected') {
			//로그인 되었을때
			document.querySelector('#authBtn').value = 'Use Facebook account';
			FB.api('/me',function(resp) {
				//mid(이메일)받아오기
				console.log(resp.name);
				document.getElementById('mid').value = resp.name;
				//mname받아오기
				console.log(resp.id);
				document.getElementById('mname').value = resp.id;
				//mprofile받아오기
				console.log('https://graph.facebook.com/' + resp.id + '/picture?width=250&height=250>');
				document.getElementById('mprofile').value = 'https://graph.facebook.com/'
					+ resp.id + '/picture?width=250&height=250>'
			});
		} else {
			//로그인 안되어 있을때
			document.querySelector('#authBtn').value = 'Login with Facebook';
		}
	}

	//SDK함수 초기화
	window.fbAsyncInit = function() {
		FB.init({
			appId : '767168977001948',
			cookie : true, // enable cookies to allow the server to access 
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v3.2' // The Graph API version to use for the call
		});

		// Now that we've initialized the JavaScript SDK, we call 
		// FB.getLoginStatus().  This function gets the state of the
		// person visiting this page and can return one of three states to
		// the callback you provide.  They can be:
		//
		// 1. Logged into your app ('connected')
		// 2. Logged into Facebook, but not your app ('not_authorized')
		// 3. Not logged into Facebook and can't tell if they are logged into
		//    your app or not.
		//
		// These three cases are handled in the callback function.

		FB.getLoginStatus(checkLoginStatus);
	};
	
	//페이스북의 SDK를 가져오기
	// Load the SDK asynchronously 
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

</script>
<style type="text/css">
/* 사용자 설정 css */
/* 구글 로그인 버튼 설정 */
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
