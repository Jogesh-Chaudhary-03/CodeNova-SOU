<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<title>Event Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fa;
	font-family: Arial;
}

.section-card {
	background: white;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 20px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.section-title {
	font-weight: 600;
	margin-bottom: 10px;
}

h3 {
	margin-bottom: 20px;
}
</style>

</head>

<body>

	<div class="container mt-4">
		<h3 class="text-center">Event Details</h3>

		<c:forEach var="event" items="${event}">

			<!-- About Event -->
			<div class="section-card">
				<div class="section-title">About Event</div>
				<p>
					<c:out value="${event.aboutEvent}" />
				</p>
			</div>

			<!-- Eligibility -->
			<div class="section-card">
				<div class="section-title">Eligibility</div>
				<p>
					<c:out value="${event.eligibility}" />
				</p>
			</div>

			<!-- Rules -->
			<div class="section-card">
				<div class="section-title">General Rules</div>
				<p>
					<c:out value="${event.rules}" />
				</p>
			</div>

			<!-- Event Format -->
			<div class="section-card">
				<div class="section-title">Event Format</div>
				<p>
					<c:out value="${event.eventFormat}" />
				</p>
			</div>

			<!-- Perks -->
			<div class="section-card">
				<div class="section-title">Perks & Benefits</div>
				<p>
					<c:out value="${event.eventPerks}" />
				</p>
			</div>

			<!-- Prize -->
			<div class="section-card">
				<div class="section-title">Prize Pool</div>
				<h5>
					<c:out value="${event.prizePool}" />
				</h5>
			</div>

			<!-- Contact -->
			<div class="section-card">
				<div class="section-title">Contact Organiser</div>
				<p>
					Email:
					<c:out value="${event.contactEmail}" />
				</p>
				<p>
					Phone:
					<c:out value="${event.contactPhone}" />
				</p>
			</div>

		</c:forEach>

	</div>

</body>
</html>