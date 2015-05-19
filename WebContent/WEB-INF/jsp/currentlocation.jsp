<!DOCTYPE html>
<html>

<head>
<title>LOCATION</title>
<meta charset="utf-8">
<style>
html, body, #map-canvas {
	height: 100%;
	margin: 10px;
	padding: 0px
}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
<script>
	var map;
	var latlng;
	var geocoder;
	var marker;
	var lat;
	var lng;
	var infowindow = new google.maps.InfoWindow();
	function initialize() {
		geocoder = new google.maps.Geocoder();
		 if(navigator.geolocation) {
			    navigator.geolocation.getCurrentPosition(function(position) {
			      var pos = new google.maps.LatLng(position.coords.latitude,
			                                       position.coords.longitude);
			       lat=position.coords.latitude;
				   lng=position.coords.longitude;
			      latlng = new google.maps.LatLng(lat, lng);
		  var mapOptions = {
			zoom:24,
		     maxZoom:28,
		    center: latlng,
		    mapTypeId: 'roadmap'
		  }
		  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
		
		 
		  
		 
		 
		  console.log(latlng);
		  geocoder.geocode({'latLng': latlng}, function(results, status) {
		    if (status == google.maps.GeocoderStatus.OK) {
		      if (results[1]) {
		        map.setZoom(11);
		        marker = new google.maps.Marker({
		            position: latlng,
		            map: map
		        });
		        google.maps.event.addListener(marker, 'click', function() {
		        	infowindow.setContent(results[1].formatted_address);
			        infowindow.open(map, marker);
				});
		        
		      } else {
		        alert('No results found');
		      }
		    } else {
		      alert('Geocoder failed due to: ' + status);
		    }
		  });
		  
			    })
		}
	
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
	<div id="map-canvas"></div>
</body>
</html>