<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Add Event</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fa;
}

.container {
	max-width: 900px;
}

.section {
	background: white;
	padding: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
</style>

</head>

<body>

	<div class="container mt-4">

		<h3 class="text-center mb-4">Add Event</h3>

		<form action="saveEvent" method="post" enctype="multipart/form-data">

			<!-- BASIC EVENT INFO -->

			<div class="section">

				<h5>Basic Event Information</h5>

				<div class="mb-2">
					<label>Event Title</label> <input type="text" name="eventTitle"
						class="form-control">
				</div>

				<div class="mb-2">
					<label>Organization Name</label> <input type="text"
						name="organizationName" class="form-control">
				</div>

				<div class="mb-2">
					<label>Participation Type</label> <select name="participationType"
						class="form-control">
						<option value="-1">Select</option>
						<option value="Individual">Individual</option>
						<option value="Team">Team</option>
					</select>

				</div>

				<div class="mb-2">
					<label>Location</label> <input type="text" name="location"
						class="form-control">
				</div>

				<div class="mb-2">
					<label>Skill Tags</label> <input type="text" name="skillTags"
						class="form-control">
				</div>

				<div class="mb-2">
					<label>Posted Date</label> <input type="date" name="postedDate"
						class="form-control">
				</div>

				<div class="mb-2">
					<label>Last Date</label> <input type="date" name="lastDate"
						class="form-control">
				</div>

				<div class="mb-2">
					<label>Event Image</label> <input type="file" name="eventFile"
						class="form-control">
				</div>

			</div>


			<!-- EVENT DETAILS -->

			<div class="section">

				<h5>Event Details</h5>

				<textarea name="aboutEvent" class="form-control mb-2"
					placeholder="About Event"></textarea>

				<textarea name="eligibility" class="form-control mb-2"
					placeholder="Eligibility"></textarea>

				<textarea name="rules" class="form-control mb-2" placeholder="Rules"></textarea>

				<input type="text" name="eventFormat" class="form-control mb-2"
					placeholder="Event Format">

				<textarea name="eventPerks" class="form-control mb-2"
					placeholder="Event Perks"></textarea>

				<input type="text" name="prizePool" class="form-control mb-2"
					placeholder="Prize Pool"> <input type="email"
					name="contactEmail" class="form-control mb-2"
					placeholder="Contact Email"> <input type="text"
					name="contactPhone" class="form-control mb-2"
					placeholder="Contact Phone">

			</div>


			<!-- EVENT ROUNDS -->

			<div class="section">

				<h5>Event Rounds</h5>

				<div id="roundContainer">

					<div class="round-item mb-2">

						<input type="text" name="roundName" class="form-control mb-1"
							placeholder="Round Name">

						<textarea name="roundDescription" class="form-control"
							placeholder="Round Description"></textarea>

					</div>

				</div>

				<button type="button" onclick="addRound()"
					class="btn btn-sm btn-secondary mt-2">Add Round</button>

			</div>


			<!-- FAQ -->

			<div class="section">

				<h5>Event FAQ</h5>

				<div id="faqContainer">

					<div class="faq-item mb-2">

						<input type="text" name="question" class="form-control mb-1"
							placeholder="Question">

						<textarea name="answer" class="form-control" placeholder="Answer"></textarea>

					</div>

				</div>

				<button type="button" onclick="addFAQ()"
					class="btn btn-sm btn-secondary mt-2">Add FAQ</button>

			</div>


			<div class="text-center">

				<button class="btn btn-primary px-5">Save Event</button>

			</div>

		</form>

	</div>



	<script>
		function addRound() {

			var container = document.getElementById("roundContainer");

			var div = document.createElement("div");
			div.className = "round-item mb-2";

			div.innerHTML = '<input type="text" name="roundName" class="form-control mb-1" placeholder="Round Name">'
					+ '<textarea name="roundDescription" class="form-control" placeholder="Round Description"></textarea>';

			container.appendChild(div);

		}

		function addFAQ() {

			var container = document.getElementById("faqContainer");

			var div = document.createElement("div");
			div.className = "faq-item mb-2";

			div.innerHTML = '<input type="text" name="question" class="form-control mb-1" placeholder="Question">'
					+ '<textarea name="answer" class="form-control" placeholder="Answer"></textarea>';

			container.appendChild(div);

		}
	</script>

</body>
</html>