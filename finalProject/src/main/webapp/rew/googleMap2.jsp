<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Place Autocomplete</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
 * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
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
	z-index: 1;
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
}

#pac-input:focus {
	border-color: #4d90fe;
}

#title {
	color: #fff;
	background-color: #4d90fe;
	font-size: 25px;
	font-weight: 500;
	padding: 6px 12px;
}
</style>


<style>
#right-panel {
	font-family: 'Roboto', 'sans-serif';
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

<%@ include file="/UserMainHeader.jsp" %>



<a data-toggle="modal" data-target="#Project_save">저장</a>


      
        <div style="display: inline-block;float: left;">
		<div class="pac-card" id="pac-card">
			<div>
				<div id="title" style="text-align: center;">검색</div>
			</div>
			<div id="pac-container">
				<input id="pac-input" type="text" style="width: 150px;"Enteralocation">
			</div>
		</div>
		<div id="map" style="width: 500px; height: 500px;border: 1px"></div>
		<div id="infowindow-content">
			<img src="" width="16" height="16" id="place-icon"> <span
				id="place-name" class="title"></span><br> <span
				id="place-address"></span>
		</div>
	</div>


	<div id="right-panel"
		style="float: left; overflow: scroll; width: 265px; height: 500px">
		<p>대중교통</p>
		<p>
			거리 : <span id="total"></span>
		</p>
	</div>
    




	
	

	<script>
		// This example requires the Places library. Include the libraries=places
		// parameter when you first load the API. For example:
		// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

		function initMap() {
			var center = {lat : 37.598472, lng : 126.9134033};
			
			var map = new google.maps.Map(document.getElementById('map'), {
				center : center , 
				zoom : 17
			});
			
			var marker = new google.maps.Marker({
		          position: center,
		          map: map
		        });
			
			
			var card = document.getElementById('pac-card');
			var input = document.getElementById('pac-input');
			var types = document.getElementById('type-selector');
			var strictBounds = document
					.getElementById('strict-bounds-selector');

			map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

			var autocomplete = new google.maps.places.Autocomplete(input);
			autocomplete.setTypes([]);

			// Bind the map's bounds (viewport) property to the autocomplete object,
			// so that the autocomplete requests use the current map bounds for the
			// bounds option in the request.
			autocomplete.bindTo('bounds', map);

			// Set the data fields to return when the user selects a place.
			autocomplete.setFields([ 'address_components', 'geometry', 'icon',
					'name' ]);

			var infowindow = new google.maps.InfoWindow();
			var infowindowContent = document
					.getElementById('infowindow-content');
			infowindow.setContent(infowindowContent);
			var marker = new google.maps.Marker({
				map : map,
				anchorPoint : new google.maps.Point(0, -29)
			});

			autocomplete.addListener('place_changed',function() {
								infowindow.close();
								marker.setVisible(false);
								var place = autocomplete.getPlace();
								if (!place.geometry) {
									// User entered the name of a Place that was not suggested and
									// pressed the Enter key, or the Place Details request failed.
									window
											.alert("No details available for input: '"
													+ place.name + "'");
									return;
								}

								// If the place has a geometry, then present it on a map.
							
								marker.setPosition(place.geometry.location);
								marker.setVisible(true);

								var address = '';
								if (place.address_components) {
									address = [
											(place.address_components[0]
													&& place.address_components[0].short_name || ''),
											(place.address_components[1]
													&& place.address_components[1].short_name || ''),
											(place.address_components[2]
													&& place.address_components[2].short_name || '') ]
											.join(' ');
								}

								infowindowContent.children['place-icon'].src = place.icon;
								infowindowContent.children['place-name'].textContent = place.name;
								infowindowContent.children['place-address'].textContent = address;
								infowindow.open(map, marker);
								
								var end = {lat : place.geometry.location.lat() , lng :  place.geometry.location.lng()  };
								  displayRoute(center, end, directionsService, directionsDisplay);
							});
			// Sets a listener on a radio button to change the filter type on Places
			// Autocomplete.
			
			  var directionsService = new google.maps.DirectionsService;
			  var directionsDisplay = new google.maps.DirectionsRenderer({
			    draggable: false,
			    map: map,
			    panel: document.getElementById('right-panel')
			  });
              
			  

		//	  directionsDisplay.addListener('directions_changed', function() {
		//	    computeTotalDistance(directionsDisplay.getDirections());
		//	  });

		}
		
		function displayRoute(origin, destination, service, display) {
			  service.route({
			    origin: origin,
			    destination: destination,
			  //  waypoints: [{location: 'Adelaide, SA'}, {location: 'Broken Hill, NSW'}],
			    travelMode: 'TRANSIT',
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB-jWynFZkmm5Ewdpk0b7ubq0zExpO0gpw&libraries=places&callback=initMap"
		async defer></script>
</body>
</html>