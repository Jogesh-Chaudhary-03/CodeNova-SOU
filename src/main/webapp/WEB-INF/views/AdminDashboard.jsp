<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - CodeNova SOU</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f4f6f9;
    }

    .sidebar {
        height: 100vh;
        background-color: #212529;
        padding-top: 20px;
    }

    .sidebar a {
        color: white;
        padding: 12px 20px;
        display: block;
        text-decoration: none;
    }

    .sidebar a:hover {
        background-color: #343a40;
    }

    .dashboard-card {
        border-radius: 15px;
        transition: 0.3s;
    }

    .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    .topbar {
        background-color: white;
        padding: 15px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
</style>

</head>
<body>

<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h4 class="text-center text-white mb-4">Admin Panel</h4>
            <a href="#">Dashboard</a>
            <a href="createHackathon.jsp">Create Hackathon</a>
            <a href="#">Manage Users</a>
            <a href="#">Manage Teams</a>
            <a href="#">Leaderboard</a>
            <a href="logout">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10">

            <!-- Topbar -->
            <div class="topbar d-flex justify-content-between align-items-center">
                <h4>Welcome, Admin 👋</h4>
                <span>CodeNova SOU</span>
            </div>

            <!-- Dashboard Content -->
            <div class="container mt-4">

                <div class="row">

                    <div class="col-md-4 mb-4">
                        <div class="card dashboard-card p-4 text-center">
                            <h5>Total Users</h5>
                            <h2>120</h2>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card dashboard-card p-4 text-center">
                            <h5>Total Teams</h5>
                            <h2>35</h2>
                        </div>
                    </div>

                    <div class="col-md-4 mb-4">
                        <div class="card dashboard-card p-4 text-center">
                            <h5>Active Hackathons</h5>
                            <h2>2</h2>
                        </div>
                    </div>

                </div>

                <!-- Quick Actions -->
                <div class="card mt-4 p-4">
                    <h5 class="mb-3">Quick Actions</h5>
                    <a href="createHackathon.jsp" class="btn btn-primary me-2">Create New Hackathon</a>
                    <a href="#" class="btn btn-success me-2">View Registrations</a>
                    <a href="#" class="btn btn-warning">Update Leaderboard</a>
                </div>

            </div>

        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
