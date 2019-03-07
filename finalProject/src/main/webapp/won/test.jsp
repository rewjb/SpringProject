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
// // input file 이미지 미리보기 함수
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