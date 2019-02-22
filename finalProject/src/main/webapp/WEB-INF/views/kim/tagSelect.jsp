<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* img {float: left; width: 50%;} */
#prev_btn {position:absolute;top:0;left:0}
#next_btn {position:absolute;top:0;right:0}
/* .btn {width:2em;height:280px;border:0;background:#f5f6fa;display:none;} */
#slider {position:relative;margin:0 auto;padding:0;list-style:none;width:1300px;height:950px;overflow-x:hidden}
#slider li {display:none;position:absolute;left:0;top:0}
#slider img {height:auto; width:auto; float:left; background: black;}
</style>

<script src="js/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
 
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
    	<!-- 이미지 클릭할 때마다 body에 이미지 src를 담은 히든자식 생성해서 붙이기-->
    	var src = $(this).attr("src")
    	if(src != null) { 
    		num += 1;
    		$("#tag").append("<input type='hidden' name='tag" + num + "' value='" + src + "'>")
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

</head>
<body style="background: pink;">
<ul id="slider">
	<li>
	<h1>회원가입 화면</h1>
	<div style="background: lightblue; width: 1200px; height: 750px;">
	</div>
	<button class="next">가입완료
	</button>
	</li>
	
    <!-- 첫번째 슬라이드 -->
    <li>  
    <h1>마음에 드는 이미지 선택</h1>
    <table>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014062336.jpg" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014062340.jpg" class="next"></td>
    	</tr>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014062341.jpg" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014062343.jpg" class="next"></td>
    	</tr>
    </table>
	</li>
	
    <!-- 두번째 슬라이드 -->
    <li>
    <h1>마음에 드는 이미지 선택</h1>
    <table>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014062337.jpg" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014062344.jpg" class="next"></td>
    	</tr>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014110712.jpg" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014110718.jpg" class="next"></td>
    	</tr>
    </table>
	</li>
	
    <!-- 세번째 슬라이드 -->
    <li>
    <h1>마음에 드는 이미지 선택</h1>
    <table>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014120542.jpg" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014120543.jpg" class="next"></td>
    	</tr>
    	<tr>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2014120835.jpg" class="next"></td>
    		<td><img src="/springProject/resources/IMAGE/placeAdd2015010902.jpg" class="next"></td>
    	</tr>
    </table>
	</li>
</ul>

<div id="tag">
</div>

</body>
</html>