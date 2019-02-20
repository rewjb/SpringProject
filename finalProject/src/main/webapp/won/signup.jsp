<!-- 
회원가입 방법 선택하는 페이지
일반 회원가입 : 회원가입 페이지로 그냥 이동 ( won/signup_InsertMember.jsp )
외부 회원가입 : 회원가입 페이지로 받아온 값 가지고 이동 ( won/signup_IsertMember.jsp )
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

</head>
<body class="text-center">
	<!-- header -->
	<%@ include file="/UserMainHeader.jsp"%>
	<div  id="signup">
		<!-- 위쪽공간 -->
		<div style="text-align: center;">
			<!-- 가입방식 선택 -->
			<table style="width: 100%; text-align: center;">
				<tr>
					<td></td>
					<td style="width:300px;">
						<!-- 이메일 회원가입 -->
						<div class="button">
							<button class="btn btn-lg btn-secondary btn-block" type="button"
								id="signIn" style="width: 300px; height: 40px;">Sign up</button>
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
								<span class="icon"></span> 
								<span class="buttonText">Login with Google</span>
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
						<div class="fb-login-button" data-width="300px" data-size="large" data-button-type="login_with" data-auto-logout-link="false" data-use-continue-as="false"></div>
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
					<td>
						<!-- 외부 계정을 통한 회원가입 -->
						<div class="button">
							<button class="btn btn-lg btn-primary btn-block" type="button"
								id="google">OtherLogin1</button>
						</div>
						<div class="button">
							<button class="btn btn-lg btn-primary btn-block" type="button"
								id="github">OtherLogin2</button>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div style="height: 150px;">
							<!-- 외부 로그인 성공시 데이터를 임시로 담아둘 공간 -->
							<form id="hidden" action="insertMember.jsp">
								<input type="text" id="mid" name="mid" class="hidden"> <input
									type="text" id="mname" name="mname" class="hidden"> <input
									type="text" id="mprofile" name="mprofile" class="hidden">
							</form>
						</div>
					</td>
					<td></td>
				</tr>
			</table>
		</div>





		<p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
		</div>
	<!-- footer -->
	<%@ include file="/UserMainFooter.jsp"%>

</body>
</html>