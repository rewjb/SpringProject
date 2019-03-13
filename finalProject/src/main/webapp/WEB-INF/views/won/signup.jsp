<!-- 
회원가입 방법 선택하는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Noto+Serif" rel="stylesheet">

<title>회원가입</title>
<!-- 이메일  -->
<script type="text/javascript" src="springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 구글  -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<!--부트 스트랩 자바스크립트-->
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.bundle.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/bootstrap.min.js"></script>

<!-- 부트 스트랩 CSS -->
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-grid.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-grid.min.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-reboot.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap-reboot.min.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/bootstrap.min.css" />
<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="/springProject/resources/CSS/blog.css" />
<script type="text/javascript">

//<!------------------------- body2-1 : 이메일 로그인 관련 설정 ---------------------------->
$(function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행
	
	//식을 간단하게 하기 위해 변수에 담아주기
	var id_l = $('#login_inputMid');
	var pw_l = $('#login_inputMpw');
	
	//ID유효성 : #login_inputMid에서 keyup 이벤트가 발생시
		id_l.keydown(function() {
			//feedback div : 피드백 내용을 모여주는 div
			var f = $("#login_feedback-inputMid");
			//유효성 검사
			if (id_l.val().length > 0 && id_l.val().length < 30) {	// 입력 값이 없을 때
				// 길이가 적당할때
			// 아이디(이메일) 검사식 : 소문자,대문자,숫자 @ 소문자 . 소문자 2-3글자
			var re_email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				if (re_email.test(id_l.val())) { // 아이디(이메일) 검사
					f.text(''); 				//비워주기
				$("#login_mid").val(id_l.val());	//전송폼에 값 세팅
				$("#login_inputMid").blur(function() {
					$("#login_mid").val(id_l.val());	//태그를 벗어날 때 전송폼에 값 세팅
				})
				}//end if()
			}//end if()
		});//end keyup()
	
		
	//pw유효성 : #login_inputMpw에서 keyup 이벤트가 발생시
	pw_l.keyup(function() {
		var f = $("#login_feedback-inputMpw");
		f.text('');				//비워주기
		$("#login_mpw").val(pw_l.val());//전송폼에 값 세팅
		
		if(event.keyCode == 13) {
			$("#login_loginBtn").trigger("click");
		}
		
		$("#login_inputMpw").blur(function() {
			$("#login_mid").val(id_l.val());	//태그를 벗어날 때 id전송폼에 값 세팅
			$("#login_mpw").val(pw_l.val());	//태그를 벗어날 때 전송폼에 값 세팅
		})
		

	});//end keyup()
	
	if (window.event.keyCode == 13) {
		$("#login_mid").val(id_l.val());	//enter를 눌렀을 때 id전송폼에 값 세팅
		$("#login_mpw").val(pw_l.val());	//enter를 눌렀을 때 전송폼에 값 세팅
	}
		 
	//login버튼 눌렀을때 동작하는 함수
	$("#login_loginBtn").click(function() {
		var form = $("#login_hidden");
		
        // 자바스크립트 객체를 배열에 담아줌
        var formSerial = $(form).serializeArray();
        var sendData = {};
        for (var i = 0; i < formSerial.length; i++) {
        	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value);
		}
        //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환 
        console.log("sendData : "+JSON.stringify(sendData));
		$.ajax({
			url : "/springProject/won/login",
			type : "POST",
			data : sendData,
			success : function(result) {
				console.log('일반로그인'+result+' (-1 : db관련 실패 / 0 : 성공 / 1 : 아이디가 없음 / 2 : 비밀번호가 없음)');
				if(result == "-1"||result =='1'||result=='2'){
					//로그인 실패
					alert("아이디, 비밀번호를 확인해주세요.문제가 계속되면 관리자에게 문의해주세요.xx-xxxx-xxxx");
					$('#login_inputMid').val("");
					$('#login_inputMpw').val("");
				} else {
					var rsMid = result.split('#')[1];	
					//로그인 성공 - 메인으로 이동
					alert(rsMid +'님 환영합니다.');
					location.href="/springProject/main.jsp"
				}//end inner_if()
			}//end success
		});//end ajax
	})//end #login_loginBtn click()
});
//<!------------------------- body2-1 : 이메일 로그인 관련 설정 ---------------------------->

//<!------------------------- body2-1 : 이메일 가입 관련 설정 ---------------------------->
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
		
		//ID유효성 : #inputMid에서 keyup 이벤트가 발생시
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
							
							$(id).blur(function() {
								$("#mid").val(result);	//태그를 벗어날 때 전송폼에 값 세팅
							})
							
							idCheck = 1;
 						}//end success
 					});//end ajax
 				}//end if()
 			}//end if
 		});//end keyup()
		
 		
		//pw유효성 : #inputMpw에서 keyup 이벤트가 발생시
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
		
		//pw일치확인 : #inputConform에서 keyup 이벤트가 발생시
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
				
				$(cf).blur(function() {
					$("#mpw").val(pw.val());	//태그를 벗어날 때 전송폼에 값 세팅
				})
			}//end if()
		});//end keyup()
		 
			 
		//name유효성 : #inputMname에서 keyup 이벤트가 발생시
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
							
							$(name).blur(function() {
								$("#mname").val(result);	//태그를 벗어날 때 전송폼에 값 세팅
							})						
						}//end success
					});//end ajax
				}//end if()
			}//end if
			
			$("#inputMpw").blur(function() {
				$("#login_mid").val(id_l.val());	//태그를 벗어날 때 id전송폼에 값 세팅
				$("#login_mpw").val(pw_l.val());	//태그를 벗어날 때 전송폼에 값 세팅
			})
			
			if (key.keyCode == 13) {
				$("#login_mid").val(id_l.val());	//enter를 눌렀을 때 id전송폼에 값 세팅
				$("#login_mpw").val(pw_l.val());	//enter를 눌렀을 때 전송폼에 값 세팅
			}
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
							console.log('일반회원가입'+result+':1-실패,0-성공');
							if(result==0){
								//회원가입 성공 - 다음 페이지로 이동
								alert($("#mid").val()+'님 가입을 환영합니다!');
								$("#id").attr("value", $("#mid").val());
								$("#hdnBtn").trigger("click");
							}else{
								//가입 실패
								alert("다시 시도해주세요. 문제가 계속되면 관리자에게 문의해주세요.xx-xxxx-xxxx");
								id.val("");
								pw.val("");
							}//end inner_if()
						}//end success
					});//end ajax					
				}//end if()
			}
		})//end click()
	});
	
//<!------------------------- body2-1 : 이메일 가입 관련 설정 ---------------------------->
   
   $(function(){
 
//<!--------------------------------- 슬라이드 코드 start ------------------------------------------>
	
	var ch_val = "<c:out value='${change}' />";
	
	//태그수정으로 왔을 시
 	if(ch_val == "t") {
		$("#li1").remove();
		$("#li2").remove();
		$("#li3").remove();
		num ++;
	}
	
	var num = 0;
    var time = 500;
    var idx = idx2 = 0;
       
    var slide_width = $("#slider").width();
    var slide_count = $("li").length;
    
   $("#slider li:first").css("display", "block");
    
    if(slide_count > 1)
        $(".btn").css("display", "inline");
    
    $(".prev_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx - 1) % slide_count;
            if(idx2 < 0)
                idx2 = slide_count - 1;
            $("#slider li:hidden").css("left", "-"+slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "+="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", "-"+slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "+="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
    
    $(".next").click(function() {
    	//<!-- 이미지 클릭할 때마다 body에 이미지 src를 담은 히든자식 생성해서 붙이기-->
    	var src = $(this).attr("src")
    	
    	if(src != null) { 
    		num += 1;
    		$("#tag").append("<input type='hidden' name='tag" + num + "' value='" + src + "'>")
    	}
    	
    	if(num == 3){
    		$("#form").submit();
    	}
    	
        if(slide_count > 1) {
            idx2 = (idx + 1) % slide_count;
            $("#slider li:hidden").css("left", slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "-="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "-="+slide_width+"px" }, time);
            idx = idx2;
        }            
        
    });   
//<!--------------------------------- 슬라이드 코드 end ------------------------------------------>
	
	//<!-- 이미지에 마우스 오버 효과 -->
    $("img").hover( 
    		  function () { 
    		    $(this).css("opacity", 0.7); 
    		  }, 
    		  function () { 
    		    $(this).css("opacity", 1);
    		  } 
    )    
})
   
   
</script>
<style type="text/css">
/* -------feedback div설정------- */
	.feedback{
		text-align : left;
		padding-left : 5px;
		color:red;
		font-size: 10px;
	}
	.form-group{
		height: 27px;
	}

/* -------구글로 회원가입  버튼 설정-------------------- */
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
	background-position: 50% 50%;
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

/* -------페이스북으로 회원가입 버튼 설정--------------------- */
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

/**************************************************************************************************/


/* img {float: left; width: 50%;} */
/* .btn {width:2em;height:280px;border:0;background:#f5f6fa;display:none;} */
#slider {position:relative;margin:0 auto;padding:0;list-style:none;width:1300px;height:980px;overflow-x:hidden} 
#slider li {display:none;position:absolute;left:0;top:0; margin: auto;}
#slider img {height:400px; width:600px; float:left; background: black; border-radius: 0.75rem}
li{padding-top: 1rem;}
/* body{ background: linear-gradient(to bottom, #a6bddb, white);} */

/* 퍼온 부트스트랩 css코드 */

:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #007bff;
  background: linear-gradient(to bottom, #70a6ff, #d8e7ff);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-img-left {
  width: 550px;
  /* Link to your background image using in the property below! */
  background: scroll center url('/springProject/resources/IMAGE/login.jpg');
  background-size: cover;
}

.card-signin .card-img-left2 {
  width: 550px;
  /* Link to your background image using in the property below! */
  background: scroll center url('/springProject/resources/IMAGE/signup2.jpg');
  background-size: cover;
}

.card-signin .card-body {
  padding: 5rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}

.card-body h5 {
  font-family: 'Noto Serif', serif;
}

/* -------구글로 로그인  버튼 설정-------------------- */
#login_customBtn {
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

#login_customBtn:hover {
	cursor: pointer;
}



/* -------페이스북으로 로그인 버튼 설정--------------------- */
#login_authBtn {
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
	padding-right: 85px;
}

#login_authBtn:hover {
	cursor: pointer;
}

#login_authBth {
	display: inline-block;
}
</style> 
</head>
<body>
<%@ include file="/won/signupHeader.jsp"%> 
   <!-- header : 회원가입 페이지는 헤더 모양이 달라서 다른 헤더를 사용 -->
   <button id="hdnBtn" class="next" style="visibility: hidden;"></button>
<ul id="slider">

	<li style="width: 1300px;" id="li1">
	 <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex" style="height: 750px; weight: 400px;">
             <!-- Background image for card set in CSS! -->
          </div>
          
          		<div>
<!------------------------- body1 : 실제 컨트롤러와 동작하는 공간-------------->
					<form id="login_hidden">
						<input type="hidden" id="login_mid" name="mid" class="hidden" placeholder="mid"><br>
						<input type="hidden" id="login_mpw" name="mpw" class="hidden" placeholder="mpw"><br>
					</form>
<!------------------------- body1 : 실제 컨트롤러와 동작하는 공간 끝------------>
				</div>
          
          <div class="card-body">
          	<div style="height: 100px;"></div>
            <h5 class="card-title text-center">Login</h5>
            
            <form id="login_EmForm" class="form-signin" style="width: 300px;">
						<!-- MID 아이디(이메일) 입력 폼 -->
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Email address" id="login_inputMid">
							<div class="feedback" id="login_feedback-inputMid"></div>
						</div>

						<div style="height: 5px"></div>

						<!-- MPW 비밀번호 입력 폼 -->
						<div class="form-group">
							<input type="password" id="login_inputMpw" class="form-control" 
							placeholder="Password" required>
							<div id="login_feedback-inputMpw" class="feedback"></div>
						</div>
						
						<div style="height: 5px"></div>

					</form> 
					<!-- 이메일 로그인 -->
					<div style="height: 60px; vertical-align: top; padding-top: 10px">
						<button class="btn btn-lg btn-secondary btn-block" type="button"
							id="login_loginBtn" style="width: 300px;">로그인</button>
						<div style="height: 10px;"></div>
					</div>
					<div style="height: 3px;"></div>
					<div><button class="btn btn-lg btn-secondary btn-block next">회원가입</button></div>
					<hr>
<!------------------------- body2 : 이메일 로그인 끝 ---------------------------->
<!------------------------- body3 : 구글로 로그인  관련 ---------------------------->
				<!-- 구글 계정 연동하여 로그인 -->
				<script type="text/javascript">
				var googleUser = {};

				var startAppGGLogin = function() {
					gapi.load('auth2',function() {
						// Retrieve the singleton for the GoogleAuth library and set up the client.
						auth2 = gapi.auth2
							.init({
								client_id : '702698149904-d84keomrhgpc92u84qi1uobuugmnja3s.apps.googleusercontent.com',
								cookiepolicy : 'single_host_origin',
							// Request scopes in addition to 'profile' and 'email'
							//scope: 'additional_scope'
							});
						attachLogin(document.getElementById('login_customBtn'));
					});//end gapi.load()
				};//end startAppGGLogin

				function attachLogin(element) {
					console.log(element.id);
					auth2.attachClickHandler(element, {}, function(googleUser) {
						console.log("GOOGLE");
						//mid(이메일)받아오기
						var ggId = googleUser.getBasicProfile().getEmail()
						console.log(ggId);
						document.getElementById('login_mid').value = ggId;
						//mpw세팅하기 : Google EXternal LOGIN
						document.getElementById('login_mpw').value = "GgEXLOGIN";

						//로그인 진행 
						var form = $("#login_hidden");
		                //자바스크립트 객체를 배열에 담아줌
		                var formSerial = $(form).serializeArray();
		                var sendData = {};
		                for (var i = 0; i < formSerial.length; i++) {
		                	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value);
						}
		                //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환 
		                console.log(JSON.stringify(sendData));
						$.ajax({
							url : "/springProject/won/login",
							type : "POST",
							data : sendData,
							success : function(result) {
								console.log('구글로그인'+result+' (-1 : db관련 실패 / 0 : 성공 / 1 : 아이디가 없음 / 2 : 비밀번호가 없음)');
								if(result == "-1"||result =='1'||result=='2'){
									//로그인 실패
									alert("아이디, 비밀번호를 확인해주세요.문제가 계속되면 관리자에게 문의해주세요.xx-xxxx-xxxx");
									$('#login_inputMid').val("");
									$('#login_inputMpw').val("");
								} else {
									var rsMid = result.split('#')[1];	
									//로그인 성공 - 메인으로 이동
									alert(rsMid +'님 환영합니다.');
									location.href="/springProject/main.jsp"
								}//end inner_if()
							}//end success
						});//end ajax

						 $("#login_hidden").on("submit", function(event) {
						       event.preventDefault();
						       // process form
						    });

					},function(error) {
						console.log(JSON.stringify(error, undefined, 2));
					}); //attachClickHandler()
				}//end function attachSignin() 
				
				</script>
				<!-- 구글 로그인 버튼 -->
				<div id="login_gSignInWrapper">
					<div id="login_customBtn" class="customGPlusSignIn">
						<span class="icon"></span> <span class="buttonText"> Google로 로그인</span>
					</div>
					<script>
				       startAppGGLogin();
				    </script>
				</div>
<!------------------------- body3 : 구글로 로그인 관련 끝 ---------------------------->
<!------------------------- body4 : 페이스북으로 로그인 관련 ---------------------------->
				<!-- 페이스북 계정을 통한 로그인 -->
				<script type="text/javascript">
				   var check = 0;
				   //로그인 상태 체크
				   var checkLoginStatus = function(response) {
				      console.log(response);
				      /* statusChangeCallback(response); */
				      if (response.status === 'connected') {
				         //로그인 되었을때
				         document.querySelector('#login_authBtn').value = 'Facebook으로 로그인하기';
				         FB.api('/me',function(resp) {
							console.log("FACEBOOK");
				            //mid(이메일)받아오기
				            console.log(resp.id);
				            document.getElementById('mid').value = resp.id;
				            //mpw세팅 : FaceBook EXternal LOGIN
				            document.getElementById('mpw').value = "FBEXLOGIN"
				         });
				      } else {
				         //로그인 안되어 있을때
				         document.querySelector('#login_authBtn').value = 'Facebook 으로 로그인하기';
				      }
				   }

				   //SDK함수 초기화
				   window.fbAsyncInit = function() {
				      FB.init({
				         appId : '419729095466115',
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
				<!-- 페이스북으로 로그인 버튼 -->
				<div style="height: 5px;"></div> 
				<input type="button" id="login_authBtn" value="페이스북 로그인"
				 onclick="
                     if(this.value === 'Facebook 으로 로그인하기'){
                        //now logout
                        console.log('no!');
                        FB.login(function(res){
                           console.log('login =>',res);
                           checkLoginStatus(res);
                        });
                     }else{
                        //now login
                        console.log('oh!');                        
                     }//end if
                     
                     var form = $('#hidden');
 					
					 // 자바스크립트 객체를 배열에 담아줌
					  var formSerial = $(form).serializeArray(); 
					  var sendData = {}; 
					  for (var i = 0; i < formSerial.length; i++) { 
					  	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value); 
					  } 
					 //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환  
					  console.log(JSON.stringify(sendData)); 
					  $.ajax({ 
						  	url : '/springProject/won/login', 
						  	type : 'POST', 
						  	data : sendData, 
						  	success : function(result) { 
		  						console.log('페북로그인'+result+' (-1 : db관련 실패 / 0 : 성공 / 1 : 아이디가 없음 / 2 : 비밀번호가 없음)');
								if(result == '-1'||result =='1'||result=='2'){
									//로그인 실패
									alert('아이디, 비밀번호를 확인해주세요.문제가 계속되면 관리자에게 문의해주세요.xx-xxxx-xxxx');
									$('#login_inputMid').val('');
									$('#login_inputMpw').val('');
								} else {
									var rsMid = result.split('#')[1];	
									//로그인 성공 - 메인으로 이동
									alert(rsMid +'님 환영합니다.');
									location.href='/springProject/main.jsp'
								}//end inner_if()
					  		}//end success 
					  });//end ajax
                  ">
<!------------------------- body4 : 페이스북으로 로그인 관련 끝---------------------------->

					</div>
            
          </div>
        </div>
      </div>
    </div>
	</li>

	<li style="width: 1300px;" id="li2">
	 <div class="container" id="joinBtn">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left2 d-none d-md-flex" style="height: 750px; weight: 400px;">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">Register</h5>
               <div id="signup">
      <div>
	     <!-- 위쪽공간 -->
      <div style="text-align: center;">
         <!-- 가입방식 선택 -->
         <table style="width: 100%;">
            <tr>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
              <td></td>
              <td>
				<div>
<!------------------------- body1 : 실제 컨트롤러와 동작하는 공간-------------->
					<form id="hidden">
						<input type="hidden" id="mid" name="mid" class="hidden" placeholder="mid">
						<input type="hidden" id="mpw" name="mpw" class="hidden" placeholder="mpw">
						<input type="hidden" id="mname" name="mname" class="hidden" placeholder="mname">
						<input type="hidden" id="mprofile" name="mprofile" class="hidden" placeholder="mprofile">
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
						<div class="form-group">
							<input type="password" id="inputConform" class="form-control"
								placeholder="Password Conform" required>
							<div id="feedback-inputMpw1" class="feedback"></div>
						</div>

						<div style="height: 5px"></div>

						<!-- 이름 입력 폼 -->
						<div class="form-group">
							<input type="text" id="inputMname" class="form-control"
								placeholder="UserName" required>
							<div id="feedback-inputMname" class="feedback"
								style="width: 100%;"></div>
						</div>

					</form> <!-- 이메일 회원가입 -->
					<div style="height: 60px; vertical-align: top; padding-top: 10px">
						<button class="btn btn-lg btn-secondary btn-block" type="button" alt="false"
							id="signupBtn" style="width: 300px;">회원가입</button>
						<hr>
					</div>
				</td>
<!------------------------- body2 : 이메일 가입 끝 ---------------------------->
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td>
<!------------------------- body3 : 구글로 회원가입  관련 ---------------------------->
				<!-- 구글 계정 연동하여 회원가입 -->
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
						//mname받아오기
						var ggName = googleUser.getBasicProfile().getName(); 
						console.log(ggName);
						document.getElementById('mname').value = ggName;
						//mprofile받아오기
						var ggprofile = googleUser.getBasicProfile().getImageUrl(); 
						console.log(ggprofile);
						document.getElementById('mprofile').value = ggprofile;
						//mpw세팅하기 : Google EXternal LOGIN
						document.getElementById('mpw').value = "GgEXLOGIN";

						//회원가입 진행 
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
							url : "/springProject/won/insertMember",
							type : "POST",
							data : sendData,
							success : function(result) {
								console.log('구글회원가입'+result+':1-실패,0-성공');
								if(result==0){
									//회원가입 성공 - 다음 페이지로 이동
									alert($("#mid").val()+'님 가입을 환영합니다!');
									$("#id").attr("value", $("#mid").val());
									$("#hdnBtn").trigger("click");
								}else{
									//가입 실패
									alert("다시 시도해주세요. 문제가 계속되면 관리자에게 문의해주세요.xx-xxxx-xxxx");
									$('#inputMid').val("");
									$('#inputMpw').val("");
								}//end inner_if()
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
						
				</script>
				<!-- 구글로 회원가입 버튼 -->
				<div id="gSignInWrapper" class="button">
					<div id="customBtn" class="customGPlusSignIn">
						<span class="icon"></span> <span class="buttonText"> Google로 가입하기 </span>
					</div>
					<script>
				       startAppGG();
				    </script>
				</div>
<!------------------------- body3 : 구글로 회원가입 관련 끝 ---------------------------->
               </td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td>
<!------------------------- body4 : 페이스북으로 회원가입 관련 ---------------------------->
				<!-- 페이스북 계정을 통한 회원가입 -->
				<script type="text/javascript">
				   var check = 0;
				   //로그인 상태 체크
				   var checkSignupStatus = function(response) {
				      console.log(response);
				      /* statusChangeCallback(response); */
				      if (response.status === 'connected') {
				         //로그인 되었을때
				         document.querySelector('#authBtn').value = 'Facebook으로 가입하기';
				         FB.api('/me',function(resp) {
							console.log("FACEBOOK");
				            //mid(이메일)받아오기
				            console.log(resp.id);
				            document.getElementById('mid').value = resp.id;
				            //mpw세팅 : FaceBook EXternal LOGIN
				            document.getElementById('mpw').value = "FBEXLOGIN"
				            //mname받아오기
				            console.log(resp.name);
				            document.getElementById('mname').value = resp.name;
				            //mprofile받아오기
				            var profile = 'https://graph.facebook.com/'+ resp.id +'/picture?width=250&height=250'
				            console.log(profile);
				            document.getElementById('mprofile').value = profile;
				         });
				      } else {
				         //로그인 안되어 있을때
				         document.querySelector('#authBtn').value = 'Facebook 으로 가입하기';
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
				      
				      FB.getLoginStatus(checkSignupStatus);
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
				<!-- 페이스북으로 회원가입 버튼 -->
				<div style="height: 20px;"></div> 
				<input type="button" id="authBtn" value="Facebook Login"
				 onclick="
                     if(this.value === 'Facebook 으로 가입하기'){
                        //now logout
                        console.log('no!');
                        FB.login(function(res){
                           console.log('login =>',res);
                           checkSignupStatus(res);
                        });
                     }else{
                        //now login
                        console.log('oh!');                        
                     }//end if
                     
                     var form = $('#hidden');
 					
					 // 자바스크립트 객체를 배열에 담아줌
					  var formSerial = $(form).serializeArray(); 
					  var sendData = {}; 
					  for (var i = 0; i < formSerial.length; i++) { 
					  	sendData[formSerial[i].name] = decodeURIComponent(formSerial[i].value); 
					  } 
					 //stringify : JavaScript 값이나 객체를 JSON 문자열로 변환  
					  console.log(JSON.stringify(sendData)); 
					  $.ajax({ 
						  	url : '/springProject/won/insertMember', 
						  	type : 'POST', 
						  	data : sendData, 
						  	success : function(result) { 
								console.log('페북회원가입'+result+':1-실패,0-성공');
								if(result==0){
									//회원가입 성공 - 다음 페이지로 이동
									alert($('#mid').val()+'님 가입을 환영합니다!');
									$('#id').attr('value', $('#mid').val());
									$('#hdnBtn').trigger('click');
								}else{
									//가입 실패
									alert('다시 시도해주세요. 문제가 계속되면 관리자에게 문의해주세요.xx-xxxx-xxxx');
									$('#inputMid').val('');
									$('#inputMpw').val('');
								}//end inner_if()
					  		}//end success 
					  });//end ajax
                  ">
                  
<!------------------------- body4 : 페이스북으로 회원가입 관련 끝---------------------------->
               </td>
               <td></td>
            </tr>
            <tr>
               <td></td>
               <td style="height: 100px"></td> 
               <td></td>
            </tr>
         </table>
      </div>
   </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	</li>
	<li style="width: 1300px;" id="li3">
		 <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
			<div class="card-body" style="background: white; margin: auto;">
				
				<div class="jumbotron pt-5">
				  <h1 class="display-4" style="font-family: 'Noto Sans KR', sans-serif;">선호 여행지 선택</h1><br>
				  <p class="lead">마음에 드는 여행지들을 선택하면 취향에 맞는 여행지를 추천 받을 수 있습니다!</p>
				  <hr class="my-4">
				  <p>*선택한 여행지는 추후 수정가능합니다.</p><br>
				  <a class="btn btn-primary btn-lg next" href="#" role="button">시작</a>&nbsp;&nbsp;
				  <a href="Tag_Select_Submit2">다음에 할래요.</a>
				</div>
				
			</div>
			</div>
			</div>
			</div>
			</div>
	</li>
    <c:forEach begin="1" end="3" varStatus="status"> 
    <!-- 슬라이드 -->
    <li>
    <table style="border-spacing: 5px; border-collapse: separate;"> 
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-4]}" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-3]}" class="next"></td>
    	</tr>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-2]}" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/attractionsImg/${ranImgs[status.count*4-1]}" class="next"></td>
    	</tr>
    </table>
	</li>
    </c:forEach>
    
</ul>

<form id="form" action="Tag_Select_Submit">	
<div id="tag">
<input type="hidden" name="id" id="id">
</div>
</form>

</body>
</html>