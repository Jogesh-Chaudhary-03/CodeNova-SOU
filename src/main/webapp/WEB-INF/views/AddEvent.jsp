<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Event</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #f8f9fa, #e9ecef);
	font-family: 'Segoe UI', sans-serif;
}

.card {
	margin-top: 70px;
	border-radius: 15px;
	border: none;
}

.card h4 {
	font-weight: 600;
	color: #0d6efd;
}

.btn-primary {
	padding: 8px 20px;
	border-radius: 8px;
}

.btn-secondary {
	border-radius: 8px;
}
</style>
</head>

<body>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-8 col-lg-7">
			<div class="card shadow-lg">
				<div class="card-body p-4">

					<h4 class="text-center mb-4">Add New Event</h4>

					<form action="saveEvent" method="post" enctype="multipart/form-data">

						<div class="mb-3">
							<label class="form-label">Title</label>
							<input type="text" name="title" class="form-control" required>
						</div>

						<div class="mb-3">
							<label class="form-label">Short Description</label>
							<textarea name="shortDescription" class="form-control" rows="3" required></textarea>
						</div>

						<div class="mb-3">
							<label class="form-label">Banner Image</label>
							<input type="file" name="bannerFile" class="form-control" >
						</div>

				

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label">Prize Amount</label>
								<input type="number" name="prizeAmount" class="form-control" required>
							</div>

							<div class="col-md-6 mb-3">
								<label class="form-label">Currency</label>
								<input type="text" name="currency" class="form-control" placeholder="USD / INR" required>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label">Status</label>
							<select name="status" class="form-select" required>
								<option value="">Select Status</option>
								<option value="UPCOMING">Upcoming</option>
								<option value="ACTIVE">Active</option>
								<option value="COMPLETED">Completed</option>
							</select>
						</div>

						<div class="d-flex justify-content-end gap-2 mt-3">
							<a href="listEvent" class="btn btn-outline-secondary">Cancel</a>
							<button type="submit" class="btn btn-primary">
								Save Event
							</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>