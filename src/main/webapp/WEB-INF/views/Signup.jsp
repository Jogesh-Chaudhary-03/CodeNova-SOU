<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up - CodeNova SOU</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #007BFF, #6610f2);
    }

    .signup-card {
        border-radius: 20px;
        padding: 30px;
    }

    .form-control {
        border-radius: 10px;
    }

    .btn-custom {
        border-radius: 25px;
        padding: 10px 25px;
    }
</style>

</head>
<body>

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card signup-card shadow">

                <h3 class="text-center mb-4">📝 Create Account</h3>

                <form action="usersignup" method="post">

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>First Name</label>
                            <input type="text" name="firstName" class="form-control" required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Last Name</label>
                            <input type="text" name="lastName" class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Mobile Number</label>
                        <input type="text" name="mobileNumber" class="form-control" pattern="[0-9]{10}" maxlength="10" required>
                    </div>

                    <div class="mb-3">
                        <label class="d-block">Gender</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" value="Male" required>
                            <label class="form-check-label">Male</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" value="Female">
                            <label class="form-check-label">Female</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" value="Other">
                            <label class="form-check-label">Other</label>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" required>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-custom">
                            Sign Up
                        </button>
                    </div>

                    <p class="text-center mt-3">
                        Already have an account?
                        <a href="login">Login</a>
                    </p>

                </form>

            </div>

        </div>
    </div>
</div>



<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
