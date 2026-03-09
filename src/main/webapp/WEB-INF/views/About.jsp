<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About - CodeNova SOU</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
    }

    .about-hero {
        background: linear-gradient(135deg, #6610f2, #007BFF);
        color: white;
        padding: 80px 0;
        text-align: center;
    }

    .section-padding {
        padding: 70px 0;
    }

    .card-custom {
        border: none;
        border-radius: 15px;
        transition: 0.3s;
    }

    .card-custom:hover {
        transform: translateY(-8px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }

    .highlight-box {
        background-color: #f8f9fa;
        padding: 25px;
        border-radius: 15px;
    }
</style>

</head>
<body>

<!-- Header Include -->
<jsp:include page="Header.jsp" />

<!-- Hero Section -->
<section class="about-hero">
    <div class="container">
        <h1>About CodeNova SOU</h1>
        <p class="lead mt-3">
            Empowering Innovation Through Hackathons
        </p>
    </div>
</section>

<!-- About Description -->
<section class="section-padding text-center">
    <div class="container">
        <h2 class="mb-4">What is CodeNova?</h2>
        <p class="lead">
            CodeNova SOU is the official hackathon platform designed to bring together
            developers, designers, and innovators to collaborate and create impactful solutions.
            It provides students with opportunities to showcase their technical skills,
            creativity, and teamwork.
        </p>
    </div>
</section>

<!-- Mission & Vision -->
<section class="section-padding bg-light">
    <div class="container">
        <div class="row text-center">

            <div class="col-md-6 mb-4">
                <div class="card card-custom p-4">
                    <h4>🎯 Our Mission</h4>
                    <p>
                        To foster innovation, collaboration, and problem-solving skills
                        among students by providing a competitive and creative hackathon environment.
                    </p>
                </div>
            </div>

            <div class="col-md-6 mb-4">
                <div class="card card-custom p-4">
                    <h4>🌟 Our Vision</h4>
                    <p>
                        To become the leading university hackathon platform that nurtures
                        talent and transforms ideas into impactful technological solutions.
                    </p>
                </div>
            </div>

        </div>
    </div>
</section>

<!-- Why Participate -->
<section class="section-padding text-center">
    <div class="container">
        <h2 class="mb-5">Why Participate?</h2>

        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="highlight-box">
                    <h5>🚀 Skill Enhancement</h5>
                    <p>Improve coding, design, and teamwork skills.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="highlight-box">
                    <h5>🤝 Networking</h5>
                    <p>Connect with fellow innovators and mentors.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="highlight-box">
                    <h5>🏆 Recognition</h5>
                    <p>Win exciting prizes and gain recognition.</p>
                </div>
            </div>
        </div>

    </div>
</section>

<!-- Event Highlights -->
<section class="section-padding bg-light text-center">
    <div class="container">
        <h2 class="mb-4">Event Highlights</h2>

        <ul class="list-group list-group-flush">
            <li class="list-group-item">✔ 24–48 Hour Coding Challenge</li>
            <li class="list-group-item">✔ Real-World Problem Statements</li>
            <li class="list-group-item">✔ Expert Mentorship</li>
            <li class="list-group-item">✔ Live Leaderboard & Judging</li>
        </ul>

    </div>
</section>

<!-- Footer Include -->
<jsp:include page="Footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
