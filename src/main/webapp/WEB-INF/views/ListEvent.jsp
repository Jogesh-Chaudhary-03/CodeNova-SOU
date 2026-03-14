<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
<%@ page import="com.Entity.AddEventEntity"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>All Events</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fa;
	font-family: Arial, Helvetica, sans-serif;
}

/* clickable card */
.card-link {
	text-decoration: none;
	color: inherit;
	display: block;
	height: 100%;
}

/* event card */
.event-card {
	background: white;
	border-radius: 14px;
	padding: 20px;
	padding-right: 110px;
	min-height: 240px;
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: all .25s ease;
	border: 1px solid #f0f0f0;
}

.event-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
}

/* event logo */
.event-logo {
	position: absolute;
	top: 18px;
	right: 18px;
	width: 70px;
	height: 70px;
	object-fit: contain;
	background: white;
	border-radius: 10px;
	padding: 6px;
	border: 1px solid #eee;
}

/* event title */
.event-card h5 {
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 6px;
}

/* meta text */
.meta {
	font-size: 14px;
	color: #555;
	margin-bottom: 4px;
}

/* tags container */
.tags-container {
	display: flex;
	gap: 6px;
	flex-wrap: nowrap;
	overflow: hidden;
	margin-top: 6px;
}

/* tag style */
.tag {
	background: #eef2ff;
	color: #4f46e5;
	padding: 4px 10px;
	font-size: 12px;
	border-radius: 20px;
	white-space: nowrap;
	font-weight: 500;
}

/* bottom row */
.bottom-row {
	margin-top: auto;
	font-size: 14px;
	color: #555;
}

.bottom-row span {
	font-weight: 600;
	color: #1a7f37;
}
</style>

</head>

<body>

	<div class="container mt-4">

		<h3 class="mb-4">All Events</h3>

		<div class="row">

			<c:forEach var="event" items="${eventList}">

				<%
				AddEventEntity e = (AddEventEntity) pageContext.getAttribute("event");

				LocalDate today = LocalDate.now();
				LocalDate lastDate = e.getLastDate();

				long daysLeft = ChronoUnit.DAYS.between(today, lastDate);
				%>

				<div class="col-md-6 mb-4">

					<a href="eventDetails?eventId=${event.eventId}" class="card-link">

						<div class="event-card">

							<img src="${event.eventImage}" class="event-logo">

							<h5>${event.eventTitle}</h5>

							<p class="meta mb-1">
								<b>${event.organizationName}</b>
							</p>

							<p class="meta mb-1">${event.participationType}</p>

							<p class="meta mb-2">📍 ${event.location}</p>

							<div class="tags-container">

								<c:set var="tagCount" value="0" />

								<c:forTokens items="${event.skillTags}" delims="," var="tag">

									<c:set var="tagCount" value="${tagCount + 1}" />

									<c:if test="${tagCount <= 3}">
										<span class="tag">${tag}</span>
									</c:if>

								</c:forTokens>

								<c:if test="${tagCount > 3}">
									<span class="tag">+${tagCount-3} more</span>
								</c:if>

							</div>

							<div class="bottom-row">

								<p class="meta mb-0">

									Posted: ${event.postedDate} <span class="text-success ms-2">

										<%=daysLeft%> Days Left

									</span>

								</p>

							</div>

						</div>

					</a>

				</div>

			</c:forEach>

		</div>

	</div>

</body>

</html>
