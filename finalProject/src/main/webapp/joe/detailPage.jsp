<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- <% 
	String pid = request.getParameter("pid"); 
    String mid = request.getParameter("mid");	
%> --%>

<!--제이쿼리-->
<script type="text/javascript"
	src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">


function Reply(bnum) {//댓글눌렀을때 다이얼로그 보여주는 함수
 	$("#updateDialog").css('display', 'none');
	var num = "#" + bnum;
	$(num).after($("#replyDialog").css('display', 'block'));
	$("#input").val(bnum);//댓글번호로 컨트롤러가서 select로 찾아서 대댓글을 등록함 
	
	return false;
}
    
function comment() {//대댓글 등록시 처리함수
	
	if ($("#content2").val() == "") {
		alert("내용을 입력해주세요")
	}else{
	//alert("여기는오나")
	var data = $("#formSecond").serialize();
	//alert(data);
	$.ajax({
		url : "review2",
		Type : "POST",
		data : data,
		success : function (result) {
			$("#content2").val("");
			 $("#temp").after($("#replyDialog").css('display', 'none'));
			if (result != null) {
				$("#replyList").empty();
				 $("#replyList").append(result); 
			}//if문 끝
			
		}//success끝
	})//ajax끝
}

	return false;
}

function Update(bnum) {//댓글의 수정버튼 클릭시 다이얼로그 창 띄우는 함수
	alert(bnum);
	var num = "#" + bnum;
	alert(num);	
	$("#updateDialog").css('display', 'block');
	$(num).after($("#updateDialog"));
	$("#replyDialog").css('display', 'none');
	$("#input2").val(bnum);//댓글번호로 컨트롤러가서 select로 찾아서 대댓글을 등록함
	
	return false;
}

function updateResult() {
	if ($("#content3").val() == "") {
		alert("내용을 입력해주세요")
	}else{
	//alert("여기는오나")
	var data = $("#updateForm").serialize();
	//alert(data);
	$.ajax({
		url : "reviewUpdate",
		Type : "POST",
		data : data,
		success : function (result) {
			$("#content3").val("");	
			 $("#temp").after($("#updateDialog").css('display', 'none'));
			if (result != null) {
				$("#replyList").empty();
				 $("#replyList").append(result); 
			}//if문 끝
			
		}//success끝
	})//ajax끝
	}
	
	return false;
	
}


function updateCancel() {
	$("#content3").val("");	
	$("#updateDialog").css('display', 'none');
	
	return false;
}

function commentCancel() {
	$("#content2").val("");
	$("#replyDialog").css('display', 'none');
	
	return false;
}


function deleteComment(bnum) {//댓글 삭제 함수
	var num = "#" + bnum;
	var data = $(num).serialize();//폼 아이디가 댓글번호와 같다
	
	alert(num);
	$.ajax({
		url : "reviewDelete",
		Type : "POST",
		data : data,
		success : function (result) {
			if (result != null) {
				$("#replyList").empty();
				 $("#replyList").append(result); 
			}//if문 끝
		}//success끝
	})//ajax끝
	
	return false;
}

var time = 0;

$(function() {
	 if (time==0) {//최초실행시 댓글 리스트 보여주는 조건문
		$.ajax({
			url : "reviewAll",
			Type : "POST",
			success : function(result) {
				if (result != null) {
					$("#replyList").append(result);
				}//if문 끝
			}//success끝
		})//ajax끝
	}
	 time += 1; 
	
	$("#b1").click(function() {//댓글입력시 등록해주는 함수 
		
		if ($("#content").val() == "") {
			alert("내용을 입력해주세요 ");
		}else{
		
		  var data = $("#comForm").serialize();
		$.ajax({
			url : "review",
			Type : "POST",
			data : data,
			success : function(result) {
				if (result != null) {
					$("#replyList").empty();
					 $("#replyList").append(result); 
					 $('html, body').scrollTop( $(document).height() );
				}//if문 끝
			}//success끝
		})//ajax끝
		
		}//else문 끝
	})//click끝
})//ready끝

	var time = 0;
	var form = "1000000074101";
	$(function() {

		if (time == 0) {//최초실행시 댓글 리스트 보여주는 조건문
			$.ajax({
				url : "cartList",
				Type : "POST",
				success : function(result) {
					if (result != null) {
						$("#cartTable").append(result);

						if ($("#" + form).find('label').text() != '') {
							$("#cart").attr("class", "btn btn-primary my-2");
						} else if ($("#" + form).find('label').text() == '') {
							$("#cart").attr("class", "btn btn-secondary my-2");
						}
					}
				}//success끝
			})//ajax끝
		}
		time += 1;
	})

	function cart() {

		if ($("#cart").attr("class") == "btn btn-secondary my-2") {
			$("#cart").attr("class", "btn btn-primary my-2");

			var data = $("#form").serialize();
			$.ajax({
				url : "cartInsert",
				Type : "POST",
				data : data,
				success : function(result) {
					$("#cartTable").empty();
					$("#cartTable").append(result);
				}//success끝
			})//ajax끝

		} else if ($("#cart").attr("class") == "btn btn-primary my-2") {
			$("#cart").attr("class", "btn btn-secondary my-2");

			var data = $("#form").serialize();

			$.ajax({
				url : "cartDelete",
				Type : "POST",
				data : data,
				success : function(result) {
					$("#cartTable").empty();
					$("#cartTable").append(result);
				}//success끝
			})//ajax끝 
		}

	}
</script>

</head>
<body>
	<%@ include file="/UserMainHeader.jsp"%>
	<form id="form">
		<div class="row featurette">
			<div style="margin-left: 50px; position: fixed;">
				<h2>장바구니</h2>
			</div>

			<div
				style="width: 180px; height: 500px; margin-left: 40px; margin-top: 65px; position: fixed; overflow: auto;"
				id="cartTable"></div>

			<input type="hidden" value="1000000074101" name="pid"> <input
				type="hidden" value="rhkdwo" name="mid">

			<div class="col-md-5" style="margin-left: auto; margin-right: auto;">
				<svg
					class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
					width="1500" height="1000" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
				<title>Placeholder</title>
				<rect width="100%" height="100%" fill="#eee" /></svg>
			</div>
		</div>
	</form>
	<div class="col-md-5" style="margin-left: auto; margin-right: auto;">
		<button class="btn btn-secondary my-2" onclick="cart()" id="cart">장바구니</button>
		<button class="btn btn-secondary my-2">예비 버튼</button>
		<h2 class="featurette-heading">★별점</h2>
	</div>
	<hr class="featurette-divider">
	<br>
	<br>

	<div class="col-md-7" style="margin-left: auto; margin-right: auto;"
		align="center">
		<h2 class="featurette-heading">
			관광명소 설명1<span class="text-muted">관광명소 설명2</span>
		</h2>
		<br>
		<p class="lead">관광명소 설명3</p>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="border: 1px solid; width: 600px; padding: 5px; margin-left: auto; margin-right: auto;">
    <form id="comForm" name="form" action="review" method="post" >
        <input type="hidden" name="pid" value="id"> <!-- 각 게시물의 고유아이디가 들어간다. -->
        <textarea name="content" id = "content" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
    </form>
		<input type="button" value="넘어가요" id = "b1" >
</div>	

<div id = "temp"></div>

<div id="replyList" style="text-align: center;"> 

</div>

 <div id="replyDialog" style="width: 99%; display:none">
    <form id= "formSecond"  action="review2" method="post">
        <input type="hidden" name="pid" value="id"> 
        <input type="hidden" name="parents"> 
        <input type="hidden" id = "input" name = "input">
        작성자: <input type="hidden" name="id"><br>
        <textarea name="content" id = "content2"rows="3" cols="60" maxlength="500"></textarea>
        <a href="#" id ="onclick" onclick="return comment()">등록</a>
        <a href="#" onclick="return commentCancel()">취소</a>
    </form>
</div>  

 <div id="updateDialog" style="width: 99%; display:none">
    <form id= "updateForm"  action="review2" method="post">
        <input type="hidden" name="pid" value="id"> 
        <input type="hidden" name="parents"> 
        <input type="hidden" id = "input2" name = "input2">
        작성자: <input type="hidden" name="id"><br>
        <textarea name="content" id  = "content3" rows="3" cols="60" maxlength="500"></textarea>
        <a href="#" onclick="return updateResult()">수정</a>
        <a href="#" onclick="return updateCancel()">취소</a>
    </form>
</div>  
	
</body>
</html>