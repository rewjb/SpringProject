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
		
		//식을 간단하게 하기 위해 변수에 담아주기
		var id = $('#inputMid');
		
		//ID유효성 : #inputMid에서 onkeyup 이벤트가 발생시
 		id.keyup(function() {
 			//feedback div : 피드백 내용을 모여주는 div
 			var f = $("#feedback-inputMid");
 			//유효성 검사
 			if (id.val().length == 0) { // 입력 값이 없을 때
 				id.parent().attr("class", "form-group")
 				id.attr("class","form-control")
 				f.text(''); // feedback 요소에 포함된 문자 지움
 			} else if (id.val().length > 30) { 
 				id.parent().attr("class", "form-group has-danger")
 				id.attr("class","form-control is-invalid")
 				f.text('너무 길어요.'); // feedback div에 문자 출력
 			} else { // 길이가 적당할때 - 유효성 검사
 				if (!re_email.test(id.val())) { // 아이디(이메일) 검사
     				id.parent().attr("class", "form-group has-danger")
     				id.attr("class","form-control is-invalid")
 					f.text('spring@abc.com 유효한 메일 주소를 입력해주세요.')
 				} else {
 					var mid = id.val();
 					$.ajax({
 						url : "checkMid?mid=" + mid,
 						type : "GET",
 						success : function(result) {
			 				$(id).attr("class","form-control is-valid")
			 				id.parent().attr("class", "form-group has-success")
 			 				f.text(''); // feedback 요소에 포함된 문자 지움
 							$("#mid").val(result);
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
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Email address" id="inputMid">
	                    <div class="feedback" id="feedback-inputMid"></div>
					</div>
                 	
					<div class="form-group has-success">
						<label class="form-control-label" for="inputSuccess1">성공</label> 
						<input type="text" value="correct value" class="form-control is-valid" id="inputValid">
						<div class="valid-feedback">Success! You've done it.</div>
					</div>

					<div class="form-group has-danger">
						<label class="form-control-label" for="inputDanger1">실패</label> 
						<input type="text" value="wrong value" class="form-control is-invalid" id="inputInvalid">
						<div class="invalid-feedback">Sorry, that username's taken. Try another?</div>
					</div>

					<div class="form-group">
					  <label class="col-form-label" for="inputDefault">Default input</label>
					  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
					</div>
                    
                    
                    <div style="height: 7px;"></div> 
                    
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