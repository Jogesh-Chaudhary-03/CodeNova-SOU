<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Explore Events</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* ===== BODY ===== */
body{
    background: #F1F5F9;
    font-family: 'Segoe UI', sans-serif;
}

/* ===== SECTION TITLE ===== */
.page-title{
    font-weight:700;
    color:#1E293B;
}

/* ===== EVENT CARD ===== */
.event-card{
    background: #ffffff;
    border-radius:20px;
    border:none;
    overflow:hidden;
    transition:0.3s ease;
    box-shadow:0 8px 20px rgba(0,0,0,0.05);
}

.event-card:hover{
    transform:translateY(-8px);
    box-shadow:0 15px 35px rgba(99,102,241,0.25);
}

/* ===== BANNER ===== */
.banner{
    height:180px;
    overflow:hidden;
}

.banner img{
    width:100%;
    height:100%;
    object-fit:cover;
}

/* ===== LOGO ===== */
.logo{
    width:70px;
    height:70px;
    border-radius:50%;
    border:4px solid #fff;
    margin-top:-35px;
    background:#fff;
    overflow:hidden;
}

.logo img{
    width:100%;
    height:100%;
    object-fit:cover;
}

/* ===== TITLE ===== */
.event-title{
    font-weight:600;
    color:#1E293B;
}

/* ===== DESCRIPTION ===== */
.event-desc{
    color:#64748B;
    font-size:14px;
}

/* ===== STATUS BADGE ===== */
.status-badge{
    padding:6px 14px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}

.status-active{
    background:#DCFCE7;
    color:#16A34A;
}

.status-upcoming{
    background:#FEF3C7;
    color:#D97706;
}

.status-completed{
    background:#E2E8F0;
    color:#475569;
}

/* ===== PRIZE SECTION ===== */
.prize{
    background: linear-gradient(to right, #6366F1, #8B5CF6);
    color:white;
    padding:12px;
    font-weight:600;
    font-size:15px;
}

/* ===== ICON ROW ===== */
.icon-row{
    font-size:14px;
    color:#475569;
}

/* ===== PAGINATION ===== */
.page-link{
    color:#6366F1;
}
.page-item.active .page-link{
    background:#6366F1;
    border-color:#6366F1;
}

</style>
</head>

<body>

<div class="container py-5">

    <h3 class="text-center page-title mb-5">🚀 Explore Hackathons</h3>

    <div class="row">

        <c:forEach var="e" items="${eventList}">

            <div class="col-lg-4 col-md-6 mb-4">

                <div class="card event-card">

                    <!-- Banner -->
                    <div class="banner">
                        <img src="${e.bannerImage}">
                    </div>

                    <div class="card-body text-center">

                        <!-- Logo -->
                        <div class="logo mx-auto">
                            <img src="${e.logoImage}">
                        </div>

                        <h5 class="event-title mt-3">
                            ${e.title}
                        </h5>

                        <p class="event-desc">
                            ${e.shortDescription}
                        </p>

                        <!-- Icons -->
                        <div class="d-flex justify-content-between px-4 icon-row mb-3">
                            <span>👥 ${e.participantsCount}</span>
                            <span>❤️ ${e.likesCount}</span>
                        </div>

                        <!-- Status -->
                        <c:choose>
                            <c:when test="${e.status == 'ACTIVE'}">
                                <span class="status-badge status-active">
                                    Active
                                </span>
                            </c:when>

                            <c:when test="${e.status == 'UPCOMING'}">
                                <span class="status-badge status-upcoming">
                                    Upcoming
                                </span>
                            </c:when>

                            <c:otherwise>
                                <span class="status-badge status-completed">
                                    Completed
                                </span>
                            </c:otherwise>
                        </c:choose>

                    </div>

                    <!-- Prize -->
                    <div class="prize text-center">
                        Prize: ${e.prizeAmount} ${e.currency}
                    </div>

                </div>

            </div>

        </c:forEach>

    </div>

</div>

</body>
</html>