<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - CodeNova SOU</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #007BFF, #6610f2);
    }

    .login-card {
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
        <div class="col-md-5">

            <div class="card login-card shadow">

                <h3 class="text-center mb-4">🔐 Login</h3>

                <!-- Error Message -->
                <%
                    String error = (String) request.getAttribute("error");
                    if(error != null){
                %>
                    <div class="alert alert-danger text-center">
                        <%= error %>
                    </div>
                <%
                    }
                %>

                <form action="userlogin" method="post">

                    <div class="mb-3">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>

                    <div class="text-end mb-3">
                        <a href="forgetpassword">Forgot Password?</a>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-custom w-100">
                            Login
                        </button>
                    </div>

                    <p class="text-center mt-3">
                        Don't have an account?
                        <a href="signup">Sign Up</a>
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
