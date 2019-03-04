<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
img{ width: 300px;}

h3 {
    color: white;
    text-shadow:
    -1px -1px 0 #000,
    1px -1px 0 #000,
    -1px 1px 0 #000,
    1px 1px 0 #000;  
}

</style>
  <!-- Bootstrap core CSS -->
  <link href="/springProject/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/springProject/resources/bootstrap/css/modern-business.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
  <script src="/springProject/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="/springProject/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	var divWidth = 600;
	var count = 0;
	
	$("#slide").click(function() {
		if(count == 0) {
			$("#div4").remove();
			$("#a").append("<img img src='/springProject/resources/IMAGE/attractionsImg/${recommend.get(0).getMainImg()}' id='div4' style='display: inline-block; background: yellow; width: 300px; height: 250px;'>");
			$("#div1").animate({"margin-left":"-=" + divWidth + "px"},500);
			count++;
		}else if(count == 1) {
			$("#div1").remove();
			$("#a").append("<img img src='/springProject/resources/IMAGE/attractionsImg/${recommend.get(1).getMainImg()}' id='div1' style='display: inline-block; background: red; width: 300px; height: 250px;'>");
			$("#div2").animate({"margin-left":"-=" + divWidth + "px"},500);
			count++;
		}else if(count == 2) {
			$("#div2").remove();
			$("#a").append("<img img src='/springProject/resources/IMAGE/attractionsImg/${recommend.get(2).getMainImg()}' id='div2' style='display: inline-block; background: blue; width: 300px; height: 250px;'>");
			$("#div3").animate({"margin-left":"-=" + divWidth + "px"},500);
			count++;		
		}else if(count == 3) {
			$("#div3").remove();
			$("#a").append("<img img src='/springProject/resources/IMAGE/attractionsImg/${recommend.get(3).getMainImg()}' id='div3' style='display: inline-block; background: green; width: 300px; height: 250px;'>");
			$("#div4").animate({"margin-left":"-=" + divWidth + "px"},500);
			count = 0;		
		}
	})
}) 

</script>
<%@ include file="/UserMainHeader.jsp" %>
<div class="container marketing" style="text-align: center;">





<!-- 
<div id="b" style="text-align: center; overflow: hidden; max-height: 250px; height: 250px; width:930px; display: inline-block;">
<div id="a" style="text-align: center; overflow: hidden; max-height: 250px; height: 250px; width:1250px; display: inline-block;">
<img src="/springProject/resources/IMAGE/attractionsImg/${recommend.get(0).getMainImg()}" id="div1" style="display: inline-block; background: red; width: 300px; height: 250px;">
<img src="/springProject/resources/IMAGE/attractionsImg/${recommend.get(1).getMainImg()}" id="div2" style="display: inline-block; background: blue; width: 300px; height: 250px;">
<img src="/springProject/resources/IMAGE/attractionsImg/${recommend.get(2).getMainImg()}" id="div3" style="display: inline-block; background: green; width: 300px; height: 250px;">
<img src="/springProject/resources/IMAGE/attractionsImg/${recommend.get(3).getMainImg()}" id="div4" style="display: inline-block; background: yellow; width: 300px; height: 250px;">
</div>
</div>
 -->

<p class="pt-3">

<div class="row" style="text-align: center;">
<c:forEach  items="${recommend}" begin="0" end="2" var="list">
<div class="col-lg-4" style="display: inline-block;">
<a href="/springProject/joe/detailPage.jsp"><img style="border:1px inset rgba(220, 220, 220, 0.1); border-radius:1px; bor"
	src="/springProject/resources/IMAGE/attractionsImg/${list.getMainImg()}"
	width="300px" height="250px"></a>
	<table>
		<tr style="width: 300px;">
			<td>
				<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; text-align: left; width: 160px;">${list.title} </p>
				<p style="padding: 1%; width: 160px;">${list.content}</p>
			</td>
			<td style="text-align: right; "><button id="slide" class="btn btn-secondary">장바구니</button></td>
		</tr>
	</table>
</div>
</c:forEach>
</div>
</div>