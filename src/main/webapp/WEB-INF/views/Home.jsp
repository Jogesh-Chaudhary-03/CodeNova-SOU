<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - CodeNova SOU</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
    }

    /* Hero Section */
    .hero {
        background: linear-gradient(135deg, #007BFF, #6610f2);
        color: white;
        padding: 100px 0;
        text-align: center;
    }

    .hero h1 {
        font-size: 3rem;
        font-weight: 700;
    }

    .hero p {
        font-size: 1.2rem;
        margin-top: 20px;
    }

    .btn-custom {
        background-color: white;
        color: #007BFF;
        font-weight: 500;
        border-radius: 30px;
        padding: 10px 30px;
    }

    .btn-custom:hover {
        background-color: black;
    }

    /* Section spacing */
    .section-padding {
        padding: 70px 0;
    }

    /* Feature cards */
    .feature-card {
        border: none;
        border-radius: 15px;
        transition: 0.3s;
    }

    .feature-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }
</style>

</head>
<body>

<!-- Header Include -->
<jsp:include page="Header.jsp" />

<!-- Hero Section -->
<section class="hero">
    <div class="container">
        <h1>Ignite Ideas, Code the Future 🚀</h1>
        <p>Welcome to CodeNova SOU – The Ultimate Hackathon Platform of Silver Oak University.</p>
        <a href="signup" class="btn btn-custom mt-4">Register Now</a>
    </div>
</section>

<!-- About Section -->
<section class="section-padding text-center">
    <div class="container">
        <h2 class="mb-4">About CodeNova</h2>
        <p class="lead">
            CodeNova SOU is a dynamic hackathon platform designed to bring together
            innovative minds, creative thinkers, and tech enthusiasts to build
            groundbreaking solutions.
        </p>
    </div>
</section>

<!-- Features Section -->
<section class="section-padding bg-light">
    <div class="container">
        <div class="row text-center">

            <div class="col-md-4 mb-4">
                <div class="card feature-card p-4">
                    <h4>👥 Team Formation</h4>
                    <p>Create or join teams and collaborate efficiently.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card feature-card p-4">
                    <h4>📊 Live Leaderboard</h4>
                    <p>Track rankings and competition progress in real-time.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card feature-card p-4">
                    <h4>💡 Exciting Challenges</h4>
                    <p>Solve real-world problems and showcase innovation.</p>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- Call to Action -->
<section class="section-padding text-center">
    <div class="container">
        <h2>Ready to Build Something Amazing?</h2>
        <a href="signup" class="btn btn-primary btn-lg mt-3">
            Join the Hackathon
        </a>
    </div>
</section>

<!-- Footer Include -->
<jsp:include page="Footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
