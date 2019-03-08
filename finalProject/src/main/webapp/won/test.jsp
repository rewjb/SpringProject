<%@page import="com.itbank.springProject.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="springProject/resources/JS/jquery.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script> <!-- 제이쿼리 1.x 최신 버전 로드 -->
<!--[if lt IE 9]>
	<script src="https://bestvpn.org/wp-content/themes/focusblog/js/html5/dist/html5shiv.js"></script>
	<script src="//css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
	<!--[if IE 8]>
	<link rel="stylesheet" type="text/css" href="https://bestvpn.org/wp-content/themes/focusblog/css/ie8.css"/>
	<![endif]-->
	<!--[if IE 7]>
	<link rel="stylesheet" type="text/css" href="https://bestvpn.org/wp-content/themes/focusblog/css/ie7.css"/>
	<![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">

	
			
<!-- All in One SEO Pack 2.10.1 by Michael Torbert of Semper Fi Web Designob_start_detected [-1,-1] -->
<!-- /all in one seo pack -->
<link rel="dns-prefetch" href="//a.optmnstr.com">
<link rel="dns-prefetch" href="//fonts.googleapis.com">
<link rel="dns-prefetch" href="//s.w.org">
		<script type="text/javascript" src="https://wr.iljmp.com/track/click?product=9&amp;url=https%3A%2F%2Fbestvpn.org%2Fhtml5demos%2Ffile-api-simple%2F&amp;user_agent=Mozilla%2F5.0%20(Windows%20NT%2010.0%3B%20Win64%3B%20x64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F72.0.3626.121%20Safari%2F537.36&amp;screen=1920x1080x24&amp;identity=&amp;rand=40" async=""></script><script async="" src="//load.sumo.com/" data-sumo-site-id="8cd63400cd3141008697a600833b7300510e4b00219cc0003c1d6600bee9b400" data-sumo-platform="wordpress"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" src="https://wr.iljmp.com/improvely.js" async="">
<script>
// input file 이미지 미리보기 함수
function previewImage(targetObj, previewId) {
 
    var ext = $(targetObj).val().split('.').pop().toLowerCase();
 
    if ($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
        alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
        return;
    }
 
    var preview = document.getElementById(previewId); // 미리보기 div id   
    var ua = window.navigator.userAgent;
 
    
    if (ua.indexOf("MSIE") > -1) { //ie일때
 
        targetObj.select();
 
        try {
            var src = document.selection.createRange().text; // get file full path 
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + previewId);
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
 
            var img = document.getElementById(previewId); //이미지가 뿌려질 곳 
 
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')"; //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + previewId)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + previewId;
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } else { //ie가 아닐때
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {
 
            var file = files[i];
 
            var imageType = /image.*/; //이미지 파일일 경우만 뿌려줌.
            if (!file.type.match(imageType))
                continue;
 
            var prevImg = document.getElementById("prev_" + previewId); // 이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }
 
            var img = document.createElement("img"); // 크롬은 div에 이미지가 뿌려지지 않기때문에 자식 Element를 만듬.
            img.id = "prev_" + previewId;
            img.classList.add("obj");
            img.file = file;
            $("#prev_").css("width", "100px");
            
            preview.appendChild(img);
 
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"+ previewId)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + previewId;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}

function readURL(input) {
	 
    if (input.files && input.files[0]) {
        var reader = new FileReader();
 
        reader.onload = function (e) {
            $('#image_section').attr('src', e.target.result);
        }
 
        reader.readAsDataURL(input.files[0]);
    }
}
 







// function previewImage(targetObj, previewId) {
 
//     var ext = $(targetObj).val().split('.').pop().toLowerCase();
 
//     if ($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
//         alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
//         return;
//     }
 
//     var preview = document.getElementById(previewId); // 미리보기 div id   
//     var ua = window.navigator.userAgent;
 
//     if (ua.indexOf("MSIE") > -1) { //ie일때
 
//         targetObj.select();
 
//         try {
//             var src = document.selection.createRange().text; // get file full path 
//             var ie_preview_error = document
//                     .getElementById("ie_preview_error_" + previewId);
 
//             if (ie_preview_error) {
//                 preview.removeChild(ie_preview_error); //error가 있으면 delete
//             }
 
//             var img = document.getElementById(previewId); //이미지가 뿌려질 곳 
 
//             img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
//                     + src + "', sizingMethod='scale')"; //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
//         } catch (e) {
//             if (!document.getElementById("ie_preview_error_" + previewId)) {
//                 var info = document.createElement("<p>");
//                 info.id = "ie_preview_error_" + previewId;
//                 info.innerHTML = "a";
//                 preview.insertBefore(info, null);
//             }
//         }
//     } else { //ie가 아닐때
//         var files = targetObj.files;
//         for ( var i = 0; i < files.length; i++) {
 
//             var file = files[i];
 
//             var imageType = /image.*/; //이미지 파일일 경우만 뿌려줌.
//             if (!file.type.match(imageType))
//                 continue;
 
//             var prevImg = document.getElementById("prev_" + previewId); // 이전에 미리보기가 있다면 삭제
//             if (prevImg) {
//                 preview.removeChild(prevImg);
//             }
 
//             var img = document.createElement("img"); // 크롬은 div에 이미지가 뿌려지지 않기때문에 자식 Element를 만듬.
//             img.id = "prev_" + previewId;
//             img.classList.add("obj");
//             img.file = file;
//             $("#prev_").css("width", "100px");
            
//             preview.appendChild(img);
 
//             if (window.FileReader) { // FireFox, Chrome, Opera 확인.
//                 var reader = new FileReader();
//                 reader.onloadend = (function(aImg) {
//                     return function(e) {
//                         aImg.src = e.target.result;
//                     };
//                 })(img);
//                 reader.readAsDataURL(file);
//             } else { // safari is not supported FileReader
//                 //alert('not supported FileReader');
//                 if (!document.getElementById("sfr_preview_error_"+ previewId)) {
//                     var info = document.createElement("p");
//                     info.id = "sfr_preview_error_" + previewId;
//                     info.innerHTML = "not supported FileReader";
//                     preview.insertBefore(info, null);
//                 }
//             }
//         }
//     }
// }
</script>

</head>
<body>
<!-- 테스트 하는 페이지 -->
<div id="user_upload_img">
	<img id="prev_img" src="">
</div>
<input id="ex_file" type="file" onchange="previewImage(this, 'user_upload_img');">


<form id="form">
    <input type='file' id="imgInput" />
    <img id="image_section" src="#" alt="your image" />
</form>



<article>
  <p id="status" class="success">File API &amp; FileReader available</p>
  <p><input type="file"></p>
  <p>Select an image from your machine to read the contents of the file without using a server</p>
  <div id="holder"><img src=""></div>
</article>
<script>
var upload = document.getElementsByTagName('input')[0],
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = 'File API & FileReader available';
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
</script>
<%
	String mid = (String)request.getAttribute("mid1");

%>
id : <%=mid %>

<!-- 
<a href="/WEB-INF/views/won/insertMember.jsp"> /WEB-INF/views/won/insertMember.jsp </a><br>
<a href="springProject/WEB-INF/views/won/insertMember.jsp"> springProject/WEB-INF/views/won/insertMember.jsp </a><br>
<a href="/springProject/WEB-INF/views/won/insertMember.jsp"> /springProject/WEB-INF/views/won/insertMember.jsp </a><br> 
-->
<!-- <a href="/won/test2.jsp"> /won/test2 </a><br>
<a href="springProject/won/test2.jsp"> springProject/won/test2 </a><br>
<a href="/springProject/won/test2.jsp"> /springProject/won/test2 </a><br>

<a href="/testest.jsp"> /testest </a><br>
<a href="springProject/testest.jsp"> springProject/testest </a><br>
<a href="/springProject/testest.jsp"> /springProject/testest </a><br>


<a href="/springProject/WEB-INF/views/home.jsp"> views/home.jsp </a><br> -->
<!-- 
<a href="/WEB-INF/views/won/won.jsp"> views/won/won.jsp </a><br>
<a href="/WEB-INF/views/won/insertMember.jsp"> views/won/insertMember.jsp </a><br>
 -->

<%-- <c:forEach var="dto" items="${list}">
	${dto.mid} ${dto.mpw} ${dto.mname} ${dto.mprofile} <br>
</c:forEach> --%>
</body>
</html>