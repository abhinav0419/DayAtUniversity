<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Direction for class</title>
<style>
html, body, #map-canvas {
	height: 100%;
	margin: 0px;
	padding: 0px
}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script>
	var startingCity;
	var startingstate;
	var firstwaypointcity;
	var firstwaypointstate;
	var seconwaypointcity;
	var secondwaypointstate;
	var latit;
	var lon;
	var dummystart;
	var latlng123;
	var capt = "${buildings[0]}" + "," + "${cities[0]}" + "," + "${states[0]}";

	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'address' : capt
	}, function(results, status) {
		var location = results[0].geometry.location;
		latit = location.lat();
		lon = location.lng();

		var rendererOptions = {
			draggable : true
		};
		var directionsDisplay = new google.maps.DirectionsRenderer(
				rendererOptions);
		var directionsService = new google.maps.DirectionsService();
		var map;

		var markerposition = new google.maps.LatLng(latit, lon);

		function initialize() {
			geocoder = new google.maps.Geocoder();
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var pos = new google.maps.LatLng(position.coords.latitude,
							position.coords.longitude);
					lat = position.coords.latitude;
					lng = position.coords.longitude;
					latlng123 = new google.maps.LatLng(lat, lng);
					geocoder.geocode({
						'latLng' : latlng123
					}, function(results, status) {
						dummystart = results[0].formatted_address;
						console.log(dummystart+ "demo");
					});

				
			
	console.log(pos);
			var mapOptions = {
				zoom : 12,
				center : markerposition
			};
			map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
			directionsDisplay.setMap(map);

			google.maps.event
					.addListener(directionsDisplay, 'directions_changed',
							function() {
								computeTotalDistance(directionsDisplay
										.getDirections());
							});

			calcRoute(pos);
				})
		}
			
		function calcRoute(pos) {

			locationOne = "${buildings[1]}" + "," + "${cities[1]}" + ","
					+ " ${states[1]}";
			locationTwo = "${buildings[2]}" + "," + "${cities[2]}" + ","
					+ "${states[2]}";

			console.log(markerposition + "marker position");

			console.log(capt + "capt value on marker");
			<c:choose> 
			  <c:when test="${empty locationOnMap[1]}">
			  var request = {
						origin : pos,
						destination : capt,
						travelMode : google.maps.TravelMode.DRIVING
					};
			  </c:when>
			 
			  <c:otherwise>
			  var request = {
						origin : pos,
						destination : capt,
						waypoints : [ {
							location : locationOne
						} ],
						travelMode : google.maps.TravelMode.DRIVING
					};			  </c:otherwise>
			</c:choose>
		
			<c:if test="${not empty locationOnMap[2]}">
			var request = {
				origin : pos,
				destination : capt,
				waypoints : [ {
					location : locationOne
				}, {
					location : locationTwo
				} ],
				travelMode : google.maps.TravelMode.DRIVING
			};
			</c:if>

			directionsService.route(request, function(response, status) {
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(response);
				}
			});

		}

		function computeTotalDistance(result) {
			var total = 0;
			var myroute = result.routes[0];
			for (var i = 0; i < myroute.legs.length; i++) {
				total += myroute.legs[i].distance.value;
			}
			total = total / 1000.0;

		}
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	})

	function weather(str) {
		console.log(str);
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : str
		}, function(results, status) {
			var location = results[0].geometry.location;
			latit = location.lat();
			lon = location.lng();
			var apiKey = '31b7ed68bc12616247a0f3e272fbb089';
			var url = 'https://api.forecast.io/forecast/';
			var data;

			$.getJSON(url + apiKey + "/" + latit + "," + lon + "?callback=?",
					function(data) {

						$('#weather').html(
								'Minutely summary is' + str.toUpperCase()
										+ ' is ' + data.minutely.summary
										+ 'Hourly summary is'
										+ data.hourly.summary
										+ ' Daily summary is: '
										+ data.daily.summary);
						$('#myModal').modal('show');

					});
		})
	}
</script>

</head>
<body>
	<table class="table-bordered table-hover "
		style="float: left; margin-top: 10px; text-align: center">

		<tr class="headers" style="font-weight: bold">
			<td>Time</td>
			<td>Courses</td>
			<td>Location</td>
			<td>Weather</td>


		</tr>
		<c:forEach items="${buildings}" var="list" varStatus="counter">
			<tr>
				<td><c:out value="${timing[counter.count-1]}" /></td>

				<td><c:out value="${courses[counter.count-1]}" /></td>

				<td><c:out value="${list}" />
				<td>
					<button
						onclick="weather('<c:out value="${cities[counter.count-1]}" />')">Weather
						Check</button>
				</td>

			</tr>
		</c:forEach>
	</table>
	<div id="map-canvas" style="top: 5px; width: 100%; height: 100%"></div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Weather Summary</h4>
				</div>
				<div class="modal-body" id="weather"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>