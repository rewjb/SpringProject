	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

#map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }


.margin-auto {
  	margin-left: auto; 
  	margin-right: auto;
  	margin-top: auto;
  	margin-bottom: auto;
}

.file_input label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
 	width: auto;
	height: auto; 
	max-width: 700px;
	max-height: 500px;
	background: white;
	color: white;
	text-align: center;
	/* line-height: 30px; */
}

.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.file_input input[type=text] {
	vertical-align: middle;
	display: inline-block;
/* 	width: 200px;
	height: 100px;
	line-height: 100px; */
	font-size: 11px;
	padding: 0;
	border: 0;
	border: 1px solid #777;
}

</style>

<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
<script type="text/javascript">
		
		$(function() {
			
			//이미지 업로드 했을 때의 액션처리
			$("#filename1").change(function(){ 
				
				//파일업로드 form의 데이타방식 세팅
				var form = document.getElementById("form");				
				form.method = "POST";
				form.enctype = "multipart/form-data"
				var formData = new FormData(form);
				
				//이미지 업로드 페이지로 ajax전송
				$.ajax({
					url: "imgForm.jsp",
					type: "post",
					data: formData,
					cache: false,
					contentType: false,
					processData: false,
					success: function(result){
						
						//업로드 완료 전까지 로딩이미지를 띄워줌
					 	$("#picture").attr("src", "/springProject/resources/IMAGE/placeAdd/loading.gif");
					 	$("#picture").attr("width", "100");
					 	$("#picture").attr("height", "100");
						
					 	//이미지 업로드 4초 후(업로드 시간 대기) 업로드된 이미지로 교체
				 		setTimeout(function() {	
							$("#picture").attr("width", "700");
							$("#picture").attr("height", "500"); 
				 			$("#picture").attr("src", result);
							$("#mainImg").attr("value", result);
						}, 4000);
					}
				})				
				return false;
			})	
			
			$("#reject").click(function() {
				
				var no = $("#no").val();
				var mainImg = $("#mainImg").val();
				location.href = "placeReq_reject?no=" + no + "&mainImg=" + mainImg;
			})
			
			$("#accept").click(function() {
				$("#form2").removeAttr("onsubmit");
				$("#form2").submit();	
				alert("누름");
			})
			
		})
		
		
</script>

<%@ include file="/UserMainHeader.jsp" %>
</head>
<!-- <body style="background: #e5ffeb;"> -->
<body>

<div class="container marketing" style="background-color: rgba(255,255,255,0.8); border-radius: 1.0rem;">
<div class="col-12 pt-3">

  <fieldset>
    <legend class="display-4" style="text-align: center; font-family: 'Do Hyeon', sans-serif;">승인대기중인 여행지</legend>
	<form method="post" enctype="multipart/form-data" action="imgTest.jsp" id="form">
	    <hr>
	    <div class="card border-secondary mb-3 margin-auto" style="max-width: 50rem;">
		  <div class="card-header">이미지</div>
		  <div class="card-body margin-auto">
		    <p class="card-text">
		    <div class="file_input">
		   		<label>
		    	<img src="${dto.mainImg}" width="700" height="500" id="picture">	   		
		   		<input onchange="javascript:document.getElementById('file_route1').value=this.value"
					type="file" name="filename1" id="filename1">
				</label> 
				<input title="File Route" id="file_route1" type="hidden" 
					readonly="readonly" onchange="img()">				
		    </div>
		    </p>
		  </div>
		</div>
		<hr>
	</form>
	
	<script type="text/javascript">
	
	function temp(asd) {
		
		return false;
	}
	
	
	</script>
    
<form action="placeReq_accept" style="text-align: left;" id="form2" onsubmit="return temp(event.keyCode);">
	<div style="width: 500px; display: inline-block;">
    <div class="form-group">
      <label for="exampleSelect1">대륙</label>
      <select class="form-control" id="continent" name="continent">
        <option>남태평양</option>
        <option>대한민국</option>
        <option>동남아시아</option>
        <option>미주</option>
        <option>아시아</option>
        <option>유럽</option>
      </select>
    </div>
    <div class="form-group">
      <label for="exampleSelect2">도시</label>
		<input type="text" class="form-control" id="city" name="city" value="${dto.city}">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">여행지 명</label>
      <input type="text" class="form-control" id="title" name="title" value="${dto.title }">
    </div>
      <label for="exampleInputEmail1">경위도</label>
    <div class="form-group" style="width: auto;">
      <div style="width: 245px; display: inline-block;">
      <input type="text" class="form-control" id="longitude" name="longitude" placeholder="경도">
      </div>
      <div style="width: 245px; display: inline-block;">
      <input type="text" class="form-control" id="latitude" name="latitude" placeholder="위도">
      </div>
    </div>   
	<div class="form-group">
      <label for="exampleSelect1">태그</label>
      <select class="form-control" id="category" name="category">
        <option>가볼만한 거리</option>
        <option>가볼만한 대학가</option>
        <option>경기장/공연장(극장)</option>
        <option>공원/정원</option>
        <option>광장</option>
        <option>기타</option>
        <option>나이트라이프/클럽</option>
        <option>랜드마크</option>
        <option>박물관, 미술관</option>
        <option>사찰/사원</option>
        <option>성당/교회</option>
        <option>스파/마사지/온천</option>
        <option>시장</option>
        <option>역사유적지</option>
        <option>이색장소</option>
        <option>자연</option>
        <option>전경/야경</option>
        <option>전망대</option>
        <option>축제/체험</option>
        <option>테마파크</option>
      </select>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">id</label>
      <input type="text" class="form-control" id="pid" name="pid" value="${dto.userId }">
    </div>
    </div>
    
    <!-- 구글 맵 들어갈 공간 -->
    <div style="width: 500px; height: 450px;  display: inline-block; padding-left: 80px;">
    	<div style="width: 450px; height: 450px; background-color: lightgrey;">
    	
<!--     	<div> -->
<!--         <input id="pac-input" type="text" -->
<!--             placeholder="Enter a location"> -->
<!--         </div> -->
        
        <div id="map"></div>
        <div id="infowindow-content">
         <img src="" width="16" height="16" id="place-icon">
         <span id="place-name"  class="title"></span><br>
         <span id="place-address"></span>
       </div>
    	
    	</div>
    </div>
    
    <div class="form-group">
      <label for="exampleInputEmail1">주소</label>
      <input id="pac-input"  style="width: 100%;margin-left: 0px;" type="text" class="form-control" value="${dto.address }">   
      <!--  구글맵 검색 -->
    </div>
    <div class="form-group">
      <label for="exampleTextarea">소개</label>
      <textarea class="form-control" id="content" name="content" rows="2">${dto.content }</textarea>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">설명</label>
      <textarea class="form-control" id="contentElements" name="contentElements" rows="5">${dto.contentElements }</textarea>
    </div>
    
    <input type="hidden" id="mainImg" name="mainImg" value="${dto.mainImg }">
    <input type="hidden" id="userId" name="userId" value="유저아이디">
    <input type="hidden" id="findWay" name="findWay" value="notFound">
    <input type="hidden" id="no" name="no" value="${param.no }">
    <input type="hidden" id="star" name="star" value="0">
    
    <button type="button" class="btn btn-primary" id="accept">승인</button>
    <button type="button" class="btn btn-danger" id="reject">꺼절</button>
    
    </form>
    <p class="pb-1">
  </fieldset>

</div>
</div>
<%@ include file="/UserMainFooter.jsp" %>


      <script type="text/javascript">
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat:35.90775699999999,lng:127.76692200000002},
          zoom: 5
        });
        
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var types = document.getElementById('type-selector');
        var strictBounds = document.getElementById('strict-bounds-selector');

        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

        var autocomplete = new google.maps.places.Autocomplete(input);

        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', map);

        // Set the data fields to return when the user selects a place.
        autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("해당하는 위치정보가 없습니다 : '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          $('#longitude').val( place.geometry.location.lng());
          //경도
          $('#latitude').val(place.geometry.location.lat());
          //위도

        

          infowindowContent.children['place-icon'].src = place.icon;
          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = address;
          infowindow.open(map, marker);
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
      }
    </script>
   
   
   	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-jWynFZkmm5Ewdpk0b7ubq0zExpO0gpw&libraries=places&callback=initMap"
		async defer></script>


</body>
</html>