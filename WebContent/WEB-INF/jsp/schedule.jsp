<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<link href="resource/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/css/business-casual.css" rel="stylesheet">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script>
	$(document)
			.ready(
					function() {
						$("#canc").click(function() {
							location.reload();
						});
						
						
						$("#mon").click(function() {
							$("#t1").show();
							$(".hid").show();
							$("#tue").prop("disabled", true);
							$("#wed").prop("disabled", true);
							$("#thu").prop("disabled", true);
							$("#fri").prop("disabled", true);
						});
						$("#tue").click(function() {
							$("#t1").show();
							$(".hid").show();
							$("#mon").prop("disabled", true);
							$("#wed").prop("disabled", true);
							$("#thu").prop("disabled", true);
							$("#fri").prop("disabled", true);
						});
						$("#wed").click(function() {
							$("#t1").show();
							$(".hid").show();
							$("#mon").prop("disabled", true);
							$("#tue").prop("disabled", true);
							$("#thu").prop("disabled", true);
							$("#fri").prop("disabled", true);
						});
						$("#thu").click(function() {
							$("#t1").show();
							$(".hid").show();
							$("#tue").prop("disabled", true);
							$("#wed").prop("disabled", true);
							$("#mon").prop("disabled", true);
							$("#fri").prop("disabled", true);
						});
						$("#fri").click(function() {
							$("#t1").show();
							$(".hid").show();
							$("#tue").prop("disabled", true);
							$("#wed").prop("disabled", true);
							$("#thu").prop("disabled", true);
							$("#mon").prop("disabled", true);
						});
						var cnt = 2;
		
	                             });
</script>
</head>
<body>

	<div class="brand"></div>
	<div class="address-bar">Day At My University</div>

	<!-- Navigation -->
	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
			<a class="navbar-brand" href="#">Net Boss Intern</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="currentLocate">Current Location</a></li>

				<li><a href="javascript: void(0)">schedule</a></li>


			</ul>
		</div>

	</div>

	</nav>

	<div style="float: left; display: inline-block;" class="div1">
		<button class="btn btn-default btn-block" id="mon">Monday</button>
		<br>
		<button class="btn 
btn-default btn-block" id="tue">Tuesday</button>
		<br>
		<button class="btn btn-default btn-block" id="wed">Wednesday</button>
		<br>
		<button class="btn btn-default btn-block" id="thu">Thursday</button>
		<br>
		<button class="btn btn-default btn-block" id="fri">Friday</button>
	</div>
	<div style="float: right; display: inline-block; margin-right: 102px;"
		class="div2">

		<form:form action="second" commandName="getSchedule" method="post">

			<table id="t1" border="1" style="display: none">
				<tr style="font-weight:bold;color:white;background-color:black">
					<td align="center">Time</td>
					<td align="center">Course Name</td>
					<td align="center">Building Name</td>
					<td align="center">City</td>
					<td align="center">State</td>
					<td align="center">Country</td>
				</tr>
				<tr>
					<td><form:input type="text" id="time1" path="time1"></form:input></td>
					<td><form:input type="text" id="course" path="course"></form:input></td>
					<td><form:input type="text" id="mon1" path="bld"></form:input></td>
					<td><form:input type="text" id="tue1" path="city"></form:input></td>
					<td><form:input type="text" id="wed1" path="state"></form:input></td>
					<td><form:input type="text" id="thu1" path="country"></form:input></td>
				</tr>
				<tr>
					<td><form:input type="text" id="time1" path="time1"></form:input></td>
					<td><form:input type="text" id="course" path="course"></form:input></td>
					<td><form:input type="text" id="mon1" path="bld"></form:input></td>
					<td><form:input type="text" id="tue1" path="city"></form:input></td>
					<td><form:input type="text" id="wed1" path="state"></form:input></td>
					<td><form:input type="text" id="thu1" path="country"></form:input></td>
				</tr>
				<tr>
					<td><form:input type="text" id="time1" path="time1"></form:input></td>
					<td><form:input type="text" id="course" path="course"></form:input></td>
					<td><form:input type="text" id="mon1" path="bld"></form:input></td>
					<td><form:input type="text" id="tue1" path="city"></form:input></td>
					<td><form:input type="text" id="wed1" path="state"></form:input></td>
					<td><form:input type="text" id="thu1" path="country"></form:input></td>
					<td>
				</tr>
			</table>

			<button id='subm' type="submit" class="hid" style="display: none">Submit</button>
			 &nbsp;&nbsp; <button id='canc' type="button" class="hid"
				style="display: none">Cancel</button>
		</form:form>
	</div>
</body>
</html>