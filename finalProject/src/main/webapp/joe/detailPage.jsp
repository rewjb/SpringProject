<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT"> -->
<title>Insert title here</title>

 <% 
   String pid = request.getParameter("pid"); //상세페이지를 넘어올때 갖고오는 관광명소 (상품) 아이디값
    String mid = (String)session.getAttribute("mid"); // 로그인을 하였을경우 갖고오는 회원 아이디값
//     System.out.println("mid : " + mid);
//     System.out.println("pid : " + pid);
%> 

<style type="text/css">
ul {
    list-style:none;
    margin:0;
    padding:0;
}

li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}

</style>
<!--제이쿼리-->
<script type="text/javascript"
   src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">

function Reply(bnum) {//댓글눌렀을때 다이얼로그 보여주는 함수
    $("#updateDialog").css('display', 'none');
//    var num = "#" + bnum;
   $("#replyItem"+bnum).after($("#replyDialog").css('display', 'block'));
   $("#input").val(bnum);//댓글번호로 컨트롤러가서 select로 찾아서 대댓글을 등록함 
   
   var offset = $("#replyItem" + bnum).offset();
   $('html, body').animate({scrollTop : offset.top}, 400);
   
//    $('html, body').scrollTop( $(document).height() );
   
   return false;
   
}
function comment() {//대댓글 등록시 처리함수
   
   if('<%=mid%>' != 'null'){
   if ($("#content2").val() == "") {//내용입력란이 빈칸이면
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
          $("#temp").after($("#updateDialog").css('display', 'none'));
         if (result != null) {
            $("#replyList").empty();
             $("#replyList").append(result); 
         }//if문 끝
         
      }//success끝
   })//ajax끝
}
   }else{
      alert("로그인한 회원만 댓글을 입력할 수 있습니다.");
   }
   return false;
}

function Update(bnum,id) {//댓글의 수정버튼 클릭시 다이얼로그 창 띄우는 함수
   
   if (id == '<%=session.getAttribute("mid") %>' ) {
   $("#updateDialog").css('display', 'block');
   $("#replyItem"+bnum).after($("#updateDialog"));
    $("#replyDialog").css('display', 'none');
   $("#input2").val(bnum);//댓글번호로 컨트롤러가서 select로 찾아서 대댓글을 등록함
   var offset = $("#replyItem" + bnum).offset();
   $('html, body').animate({scrollTop : offset.top}, 400);
//    $('html, body').scrollTop( $(document).height() );
   
   return false;
   }else{
      alert("본인이 작성한 댓글만 수정이 가능합니다");
   }
}

function updateResult() {//최종 수정 버튼 클릭시 
   if ($("#content3").val() == "") {//내용을 입력 안했을때
      alert("내용을 입력해주세요")
   }else{
   //alert("여기는오나")
   var data = $("#updateForm").serialize();
   //alert(data);
   $.ajax({
      url : "reviewUpdate" ,
      Type : "POST",
      data : data,
      success : function (result) {
         $("#content3").val("");   
          $("#temp").after($("#updateDialog").css('display', 'none'));
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

function updateCancel() {//수정창 취소 눌렀을때 
   $("#content3").val("");   
   $("#updateDialog").css('display', 'none');
   return false;
}

function commentCancel() {//대댓글창 취소 눌렀을때
   $("#content2").val("");
   $("#replyDialog").css('display', 'none');
   return false;
}
  
function deleteComment(bnum,id) {//댓글 삭제 함수
   if (id == '<%=session.getAttribute("mid") %>' ) {
   var num = "#" + bnum;
   var data = $(num).serialize();//폼 아이디가 댓글번호와 같다
   
   $.ajax({
      url : "reviewDelete?pid=" + <%=pid%>,
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
      
   }else{
      alert("본인이 작성한 댓글만 삭제할 수 있습니다.")
   }
}

function deleteCart(event) {//장바구니란에 삭제버튼 클릭시
	var deleteBtn = event.target;
// 	alert(deleteBtn.value);
	  
	        	 $.ajax({
	        			url : "cartDelete?pid="+deleteBtn.value + "&mid=" + '<%=mid%>',
	        			Type : "POST",
	        			success : function(result) {
	        				if (deleteBtn.value == <%= pid%>) {
	        				$("#cart").attr("class","btn btn-secondary my-2");
							}
	        				$("#cartTable").empty();
	        				$("#cartTable").append(result);
	        		     
	        			}//success끝
	        		})//ajax끝
	         }

$(function() {
	
   if ('<%=pid%>' != 'null') {//상품 아이디가 존재할경우
      $.ajax({
         url : "selectPid?pid=" + '<%=pid%>',
         Type : "POST",
         success : function(result) {
            if (result != null) {
//                alert(result.pid);
               $("#content6").text(result.contentElements);
               $("#pid").val(result.pid);
               $("#img").attr("src" ,"/springProject/resources/IMAGE/attractionsImg/"+result.mainImg);
               $("#cPid").val('<%=pid%>');
               $("#firstId").val('<%=pid%>');
               $("#star").text( "★"+ result.star);
               alert(result.star);
//                $("#cart").val()
               if ('<%=mid%>' != 'null') {
                  $("#mid").val('<%=mid%>');                  
               }
            }//if문 끝
         }//success끝
      })//ajax끝
   }
   
    if ('<%=pid%>' != 'null') {//최초실행시 댓글 리스트 보여주는 조건문
      $.ajax({
         url : "reviewAll?pid="+'<%=pid%>',
         Type : "POST",
         success : function(result) {
            if (result != null) {
            	$("#replyList").empty();
               $("#replyList").append(result);
            }//if문 끝
         }//success끝
      })//ajax끝
   }
    
   $("#b1").click(function() {//댓글입력시 등록해주는 함수 
      
      if('<%=mid%>' != 'null'){//로그인한 사용자였을경우만 댓글 입력가능
         
         var test = document.getElementById("content").value;
         var trimStr = $.trim(test) ;
         if (trimStr.length == 0) {
            alert("내용을 입력해주세요");
            $("#content").focus();
            document.getElementById("content").setSelectionRange(1, 1);   
         }else{
             
         if ($("#j_grade").val()=="") {
            alert("별점을 입력해주세요");
          }else{
      
        var data = $("#comForm").serialize();
      $.ajax({
         url : "review",
         Type : "POST",
         data : data,
         success : function(result) {
            if (result != null) {
               $("#temp").after($("#updateDialog").css('display', 'none'));
                $("#temp").after($("#replyDialog").css('display', 'none'));
               $("#replyList").empty();
                $("#replyList").append(result); 
                $('html, body').scrollTop( $(document).height() );
                $("#j_grade").attr("value","");
                $("#content").val("");
                for (var i = 1; i <= 5; i++) {
                     image = 'j_image' + i;
                     el = document.getElementById(image);
                     el.src = "/springProject/resources/IMAGE/star/unstar.png";
                  }
            }//if문 끝
         }//success끝
      })//ajax끝
      
      }//else문 끝
      }
      }else{
         alert("로그인한 회원만 댓글을 입력할 수 있습니다.")
      }
   })//click끝
})//ready끝

   $(function() {

      if ('<%=mid%>' != 'null') {//최초실행시 장바구니 리스트 보여주는 조건문
         $.ajax({
            url : "midCartList?mid="+'<%=mid%>',
            Type : "POST",
            success : function(result) {
               if (result != null) {
                  $("#cartTable").append(result);

                  $.ajax({
                      url : "midCart?mid="+'<%=mid%>',
                      Type : "POST",
                      success : function(result) {
                    	  for (var i = 0; i < result.length; i++) {
							if (result[i].pid==<%=pid %>) {//현재페이지의 pid가 장바구니에도 있을경우
								$("#cart").attr("class", "btn btn-primary my-2");
							}else{
								  $("#cart").attr("class", "btn btn-secondary my-2");
							}
						}//for문
                      }
                  })
               }
            }//success끝
         })//ajax끝
      }
   })

   function cart() {//장바구니 버튼 클릭시 

      if ('<%=mid%>' != 'null') {//로그인한 회원만 장바구니 등록가능
      
      if ($("#cart").attr("class") == "btn btn-secondary my-2") {
         $("#cart").attr("class", "btn btn-primary my-2");

         var data = $("#form").serialize();
//          alert(data);
         $.ajax({//장바구니 등록시 Ajax
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

         $.ajax({//장바구니 삭제시 Ajax
            url : "cartDelete",
            Type : "POST",
            data : data,
            success : function(result) {
               $("#cartTable").empty();
               $("#cartTable").append(result);
            }//success끝
         })//ajax끝 
      }
      }else{
         alert("로그인한 회원만 장바구니에 담을수 있습니다.")
      }
   }
   
   
   //별점 기능
   var locked = 0;
   function mouseIn(imagenr) {//마우스가 별점이미지 위로 올라왔을때 
      var image;
      var el;

      if (document.getElementById('j_grade').value != "") {// 별점을 선택하지 않았을때 
         for (var i = 1; i <= 5; i++) {
            image = 'j_image' + i;
            el = document.getElementById(image);
            el.src = "/springProject/resources/IMAGE/star/unstar.png";
         }
         for (var i = 1; i <= imagenr; i++) {
            image = 'j_image' + i;
            el = document.getElementById(image);
            el.src = "/springProject/resources/IMAGE/star/star2.png";
         }
         /*  document.getElementById("j_grade").value = "";  */
      } else {
         for (var i = 1; i <= 5; i++) {
            image = 'j_image' + i;
            el = document.getElementById(image);
            el.src = "/springProject/resources/IMAGE/star/unstar.png";
         }
         for (var i = 1; i <= imagenr; i++) {
            image = 'j_image' + i;
            el = document.getElementById(image);
            el.src = "/springProject/resources/IMAGE/star/star2.png";
         }
      }
   }

   function trueClick(imagenr) {//별점을 선택하였을때 표시
      for (var i = 1; i <= 5; i++) {
         image = 'j_image' + i;
         el = document.getElementById(image);
         el.src = "/springProject/resources/IMAGE/star/unstar.png";
      }
      for (var i = 1; i <= imagenr; i++) {
         image = 'j_image' + i;
         el = document.getElementById(image);
         el.src = "/springProject/resources/IMAGE/star/star.png";
      }
   }

   function mouseOut(imagenr) {//마우스가 별점 밖으로 나갔을때

      if (locked) {
         locked = 0;
         return;
      }
      var a;
      var el;

      if (document.getElementById("j_grade").value == "") {
         for (var i = 1; i <= imagenr; i++) {
            a = 'j_image' + i;
            el = document.getElementById(a);
            el.src = "/springProject/resources/IMAGE/star/unstar.png";
         }
      } else {
         for (var i = 1; i <= 5; i++) {
            image = 'j_image' + i;
            el = document.getElementById(image);
            el.src = "/springProject/resources/IMAGE/star/unstar.png";
         }
         for (var i = 1; i <= document.getElementById("j_grade").value; i++) {
            a = 'j_image' + i;
            el = document.getElementById(a);
            el.src = "/springProject/resources/IMAGE/star/star.png";
         }
      }
   }

   function clicked(imagenr) {//별점클릭시 
      document.getElementById("j_grade").value = imagenr;
      trueClick(imagenr);
      locked = 1;
   }
   
</script>

</head>
<body>
   <%@ include file="/UserMainHeader.jsp"%>
         <div style="width: 180px; height: 500px; margin-left: 40px; margin-top: 65px; position: fixed; overflow: auto;"
            id="cartTable"></div>
   <form id="form">
      <div class="row featurette">
         <div style="margin-left: 50px; position: fixed;">
            <h2 style="font-family: 'Jua', sans-serif;">장바구니</h2>
         </div>

         <input type="hidden" value="" name="pid" id ="pid"> 
         <input type="hidden" value="" name="mid" id = "mid">

         <div class="col-md-5" style="margin-left: auto; margin-right: auto;">
            <img id="img"  style="width:100%; border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; margin-bottom:10%;" width="300px" height="450px">
         </div>
      </div>  
   </form>
   <div class="col-md-5" style="margin-left: auto; margin-right: auto;">
      <button class="btn btn-secondary my-2" onclick="cart()" id="cart" >장바구니</button>
      <h2 class="featurette-heading" id = "star"></h2>
   </div>
   <hr class="featurette-divider">
   <br>
   <br>

   <div class="col-md-7" style="margin-left: auto; margin-right: auto;"
      align="center">
      <h2 class="featurette-heading" id = "content4">
         <span class="text-muted" id = "content5"></span>
      </h2>
      <br>
      <p class="lead" id = "content6"></p>
   </div>
   <br>
   <br>
   <br>
   <br>
   <br>
   <div class="jumbotron mt-3" style="border: 1px solid; width: 600px; padding: 5px; margin-left: auto; margin-right: auto;">
    <form id="comForm" name="form" method="post" >
        <input type="hidden" name="pid" id = "firstId" value="<%=pid%>" > <!-- 각 게시물의 고유아이디가 들어간다. -->
        <ul>
           <li><IMG style="width: 30px; height: 30px;" id=j_image1 onmouseover= "mouseIn(1)"  onmouseout="mouseOut(1)" onclick="clicked(1)" src="/springProject/resources/IMAGE/star/unstar.png"></li>
            <li><IMG style="width: 30px; height: 30px;" id=j_image2 onmouseover= "mouseIn(2)"  onmouseout="mouseOut(2)" onclick="clicked(2)" src="/springProject/resources/IMAGE/star/unstar.png"></li>
          <li><IMG style="width: 30px; height: 30px;" id=j_image3 onmouseover= "mouseIn(3)"  onmouseout="mouseOut(3)" onclick="clicked(3)" src="/springProject/resources/IMAGE/star/unstar.png"></li>
          <li><IMG style="width: 30px; height: 30px;" id=j_image4 onmouseover= "mouseIn(4)"  onmouseout="mouseOut(4)" onclick="clicked(4)" src="/springProject/resources/IMAGE/star/unstar.png"></li>
          <li><IMG style="width: 30px; height: 30px;" id=j_image5 onmouseover= "mouseIn(5)"  onmouseout="mouseOut(5)" onclick="clicked(5)" src="/springProject/resources/IMAGE/star/unstar.png"></li>
       </ul>
       <input type="hidden" name = "star" id = "j_grade" value ="">
       <input type="hidden" name="mid" value="<%=mid%>"> 
        <textarea name="content" id = "content" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
    </form>
      <input class="btn btn-secondary my-2" type="button" value="등록" id = "b1">
</div>   

<div id = "temp"></div>

<div id="replyList" style="text-align: center;"> 

</div>

<!-- 대댓글을 입력 할 수 있는 다이얼로그창 평소에는 display:none;상태 -->
<div class="jumbotron mt-3" id="replyDialog" style="width: 45%; display:none; margin-left: auto; margin-right: auto;">
    <form id= "formSecond"  method="post">
        <input type="hidden" name="pid" id = "cPid" value=""> 
        <input type="hidden" name="parents"> 
        <input type="hidden" id = "input" name = "input">
        <input type="hidden" name="mid" value="<%=mid%>" ><br>
        <textarea class="form-control" name="content" id = "content2" rows="3" cols="60" maxlength="500"></textarea>
        <button class="btn btn-secondary my-2" id ="onclick" onclick="return comment()">등록</button>
        <button class="btn btn-secondary my-2" onclick="return commentCancel()">취소</button>
    </form>
</div>  

<!-- 수정 할 수 있는 다이얼로그창 평소에는 display:none;상태 -->
 <div class="jumbotron mt-3" id="updateDialog" style="width: 45%; display:none; margin-left: auto; margin-right: auto;">
    <form id= "updateForm"  method="post">
        <input type="hidden" name="pid" value="<%=pid%>"> 
        <input type="hidden" name="parents"> 
        <input type="hidden" id = "input2" name = "input2">
        <input type="hidden" name="mid" value="<%=mid%>"><br>
        <textarea class="form-control" name="content" id  = "content3" rows="3" cols="60" maxlength="500"></textarea>
        <button class="btn btn-secondary my-2" onclick="return updateResult()">수정</button>
        <button class="btn btn-secondary my-2" onclick="return updateCancel()">취소</button>
    </form>
</div>  
   
</body>
</html>