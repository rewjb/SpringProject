<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>   
<%@ include file="/UserMainHeader.jsp"%>


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Draggable Directions</title>
    <style>
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
        float: left;
        width: 63%;
        height: 100%;
      }
      #right-panel {
        float: right;
        width: 34%;
        height: 100%;
      }
      .panel {
        height: 100%;
        overflow: auto;
      }
    </style>
  </head>
  <body>
  <button onclick="temp();"> ddddddddddddddddddddddddddddddddddddddddasd</button>
  <a data-target="#GoogleMap" data-toggle="modal">sadasd</a>
    <!-- 구글 맵이 들어있는 모달 -->
<div class="modal fade" id="GoogleMap" role="dialog" aria-hidden="true" style="z-index: 9000" >
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document" style="z-index: 1">
    <div class="modal-content">
      <div class="modal-body ">
      
      
      <!-- 구글 지도  -->
        <div style="display: inline-block;float: left;">
		<div id="map" style="width: 500px; height: 500px;border: 1px"></div>
		<div id="infowindow-content">
			<img src="" width="16" height="16" id="place-icon"> <span
				id="place-name" class="title"></span><br> <span
				id="place-address"></span>
		</div>
	</div>
      <!-- /.구글 지도  -->
    <!-- 구글 경로 -->
	<div id="right-panel"
		style="float: left; overflow: scroll; width: 265px; height: 500px;overflow-x: hidden">
		<p>	거리 : <span id="total"></span></p>
	</div>
    <!-- /.구글 경로 -->
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="GoogleMap_exit" data-dismiss="modal" >취소</button>
        <button type="button" class="btn btn-primary" onclick="GoogleMap_confirm(this)">선택</button>
      </div>
    </div>
  </div>
</div>
<!-- /.구글 맵이 들어있는 모달 -->
    
    
    <script type="text/javascript">
    
      var directionsService ;
      var directionsDisplay ;
      
      function temp() {
    	  displayRoute('Adelaide, SA', 'Broken Hill, NSW', directionsService,
    	            directionsDisplay);
	}
      
      function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: -24.345, lng: 134.46}  // Australia.
        });
         directionsService = new google.maps.DirectionsService;
         directionsDisplay = new google.maps.DirectionsRenderer({
          draggable: false,
          map: map,
          panel: document.getElementById('right-panel')
        });
        directionsDisplay.addListener('directions_changed', function() {
          computeTotalDistance(directionsDisplay.getDirections());
        });

        displayRoute('Perth, WA', 'Sydney, NSW', directionsService,
            directionsDisplay);
      }
      
      function displayRoute(origin, destination, service, display) {
          service.route({
            origin: origin,
            destination: destination,
            travelMode: 'DRIVING',
            avoidTolls: true
          }, function(response, status) {
            if (status === 'OK') {
              display.setDirections(response);
            } else {
              alert('Could not display directions due to: ' + status);
            }
          });
        }

      function computeTotalDistance(result) {
        var total = 0;
        var myroute = result.routes[0];
        for (var i = 0; i < myroute.legs.length; i++) {
          total += myroute.legs[i].distance.value;
        }
        total = total / 1000;
        document.getElementById('total').innerHTML = total + ' km';
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-jWynFZkmm5Ewdpk0b7ubq0zExpO0gpw&libraries=places&callback=initMap">
    </script>
  </body>
</html>


</body> 
</html>
