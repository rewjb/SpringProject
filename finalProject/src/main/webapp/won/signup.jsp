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
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>

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
                  <form action="" class="form-signin" style="width: 300px;">
                     <!-- 아이디 비밀번호 입력 폼 -->
                     <label for="inputEmail" class="sr-only">Email address</label> 
                     <input type="email" id="inputMid" class="form-control"
                        placeholder="Email address" required autofocus>
                     <div style="height: 3px;"></div> 
                     <label for="inputPassword" class="sr-only">Password</label> 
                     <input type="password" id="inputMpw" class="form-control"
                        placeholder="Password" required>
                     <div style="height: 3px;"></div> 
                     <label for="inputUserName" class="sr-only">UserName</label> 
                     <input type="text" id="inputMname" class="form-control"
                        placeholder="UserName" required>
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