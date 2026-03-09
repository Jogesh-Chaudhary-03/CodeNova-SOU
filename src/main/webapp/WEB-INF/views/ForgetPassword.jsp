<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password - CodeNova SOU</title>

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #007BFF, #6610f2);
}

/* Center Card */
.container {
    width: 400px;
    margin: 120px auto;
    background: #ffffff;
    padding: 35px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

/* Heading */
h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #333;
}

/* Labels */
label {
    font-weight: 600;
    color: #333;
}

/* Input */
input[type=email] {
    width: 100%;
    padding: 12px;
    margin: 10px 0 20px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

/* Button */
button {
    width: 100%;
    padding: 12px;
    background: #007BFF;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: #0056b3;
}

/* Link */
.link {
    text-align: center;
    margin-top: 18px;
}

.link a {
    text-decoration: none;
    color: #007BFF;
    font-weight: bold;
}

.link a:hover {
    text-decoration: underline;
}
</style>

</head>
<body>

<div class="container">
    <h2>Forgot Password</h2>

    <form action="resetPassword" method="post">
        <label>Enter Registered Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <button type="submit">Send Reset Link</button>
    </form>

    <div class="link">
        <p>Back to <a href="login">Login</a></p>
    </div>
</div>

</body>
</html>
