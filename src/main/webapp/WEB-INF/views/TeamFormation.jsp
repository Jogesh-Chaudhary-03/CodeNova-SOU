<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Team Formation – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:#4f46e5;--pri-dk:#3730a3;--pri-lt:#818cf8;
  --acc:#0d9488;--acc-lt:#5eead4;
  --ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;
  --line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#ffffff;
  --green:#059669;--green-bg:#d1fae5;
  --r:14px;
}
html{scroll-behavior:smooth}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink)}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:300;background:rgba(255,255,255,.97);backdrop-filter:blur(12px);border-bottom:1.5px solid var(--line);box-shadow:0 2px 12px rgba(79,70,229,.07)}
.navbar-inner{max-width:1160px;margin:0 auto;padding:0 28px;display:flex;align-items:center;gap:24px;height:62px}
.nav-brand{display:flex;align-items:center;gap:10px;text-decoration:none;flex-shrink:0}
.nav-logo{width:38px;height:38px;border-radius:10px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:15px;font-weight:800;color:#fff;box-shadow:0 3px 10px rgba(79,70,229,.3)}
.nav-brand-txt{font-size:16px;font-weight:800;color:var(--ink)}
.nav-brand-txt span{color:var(--pri)}
.nav-links{display:flex;align-items:center;gap:4px;margin-left:8px}
.nav-link{font-size:13.5px;font-weight:600;color:var(--sub);text-decoration:none;padding:7px 13px;border-radius:8px;transition:background .16s,color .16s}
.nav-link:hover,.nav-link.active{background:var(--bg2);color:var(--pri);font-weight:700}
.nav-actions{margin-left:auto;display:flex;align-items:center;gap:10px}
.nav-btn{display:inline-flex;align-items:center;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;font-weight:700;padding:8px 20px;border-radius:9px;text-decoration:none;box-shadow:0 3px 10px rgba(79,70,229,.25);transition:opacity .16s,transform .16s}
.nav-btn:hover{opacity:.9;transform:translateY(-1px)}
.nav-btn-outline{display:inline-flex;align-items:center;background:transparent;border:1.5px solid var(--line);color:var(--ink2);font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;font-weight:700;padding:7px 18px;border-radius:9px;text-decoration:none;transition:border-color .16s,color .16s}
.nav-btn-outline:hover{border-color:var(--pri);color:var(--pri);background:var(--bg2)}

/* HERO */
.tf-hero{background:linear-gradient(135deg,#4f46e5 0%,#3730a3 40%,#0d9488 100%);position:relative;overflow:hidden;padding:60px 0 72px}
.tf-hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px;pointer-events:none}
.tf-cr1{position:absolute;top:-80px;right:-80px;width:340px;height:340px;border-radius:50%;background:rgba(255,255,255,.05);pointer-events:none}
.tf-cr2{position:absolute;bottom:-60px;left:4%;width:200px;height:200px;border-radius:50%;background:rgba(13,148,136,.18);pointer-events:none}
.tf-hero-inner{max-width:1160px;margin:0 auto;padding:0 28px;position:relative;z-index:1;display:grid;grid-template-columns:1fr 1fr;gap:48px;align-items:center}
@media(max-width:860px){.tf-hero-inner{grid-template-columns:1fr}}
.tf-eyebrow{display:inline-flex;align-items:center;gap:7px;background:rgba(255,255,255,.14);backdrop-filter:blur(8px);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:12px;font-weight:700;letter-spacing:.07em;text-transform:uppercase;padding:5px 14px;border-radius:20px;margin-bottom:16px}
.tf-h1{font-size:clamp(28px,4vw,44px);font-weight:800;color:#fff;line-height:1.18;margin-bottom:14px}
.tf-h1 em{font-style:normal;color:var(--acc-lt)}
.tf-sub{font-size:15px;color:rgba(255,255,255,.72);line-height:1.7;margin-bottom:24px;max-width:440px}
.tf-hero-btns{display:flex;gap:10px;flex-wrap:wrap}
.btn-hero-pri{display:inline-flex;align-items:center;gap:6px;background:#fff;color:var(--pri);font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:800;padding:11px 24px;border-radius:10px;text-decoration:none;box-shadow:0 4px 18px rgba(0,0,0,.18);transition:transform .18s}
.btn-hero-pri:hover{transform:translateY(-2px)}
.btn-hero-sec{display:inline-flex;align-items:center;gap:6px;background:rgba(255,255,255,.14);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,.3);color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:700;padding:11px 24px;border-radius:10px;text-decoration:none;transition:background .18s,transform .18s}
.btn-hero-sec:hover{background:rgba(255,255,255,.22);transform:translateY(-2px)}

/* hero right side — team viz */
.tf-hero-visual{display:flex;flex-direction:column;gap:10px}
.tf-team-preview{background:rgba(255,255,255,.12);backdrop-filter:blur(16px);border:1.5px solid rgba(255,255,255,.2);border-radius:16px;padding:18px 20px}
.tf-team-label{font-size:11px;font-weight:700;color:rgba(255,255,255,.6);text-transform:uppercase;letter-spacing:.08em;margin-bottom:12px}
.tf-members-row{display:flex;gap:8px;align-items:center;flex-wrap:wrap}
.tf-member-chip{display:flex;align-items:center;gap:7px;background:rgba(255,255,255,.15);border:1px solid rgba(255,255,255,.2);border-radius:20px;padding:5px 12px 5px 5px}
.tf-member-av{width:26px;height:26px;border-radius:50%;background:linear-gradient(135deg,var(--gold,#f59e0b),#ef4444);display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:800;color:#fff}
.tf-member-av.teal{background:linear-gradient(135deg,var(--acc),var(--pri))}
.tf-member-av.green{background:linear-gradient(135deg,#059669,#0d9488)}
.tf-member-name{font-size:12px;font-weight:700;color:#fff}
.tf-member-role{font-size:10.5px;color:rgba(255,255,255,.6)}
.tf-add-chip{display:flex;align-items:center;gap:5px;background:rgba(255,255,255,.08);border:1.5px dashed rgba(255,255,255,.3);border-radius:20px;padding:5px 12px;font-size:12px;font-weight:700;color:rgba(255,255,255,.55);cursor:pointer}

/* MAIN CONTENT */
.tf-main{max-width:1160px;margin:40px auto 60px;padding:0 28px}

/* HOW IT WORKS */
.how-section{margin-bottom:48px}
.how-title{font-size:20px;font-weight:800;color:var(--ink);margin-bottom:6px}
.how-sub{font-size:13.5px;color:var(--muted);margin-bottom:24px}
.how-steps{display:grid;grid-template-columns:repeat(4,1fr);gap:16px}
@media(max-width:760px){.how-steps{grid-template-columns:repeat(2,1fr)}}
@media(max-width:480px){.how-steps{grid-template-columns:1fr}}
.how-step{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:22px 18px;position:relative;transition:border-color .2s,box-shadow .2s,transform .2s}
.how-step:hover{border-color:#c7d2fe;box-shadow:0 8px 24px rgba(79,70,229,.1);transform:translateY(-3px)}
.how-step-num{position:absolute;top:-12px;left:18px;width:28px;height:28px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:800;color:#fff;box-shadow:0 3px 8px rgba(79,70,229,.3)}
.how-step-icon{font-size:28px;margin-bottom:10px;margin-top:6px}
.how-step-title{font-size:14px;font-weight:800;color:var(--ink);margin-bottom:5px}
.how-step-desc{font-size:12.5px;color:var(--sub);line-height:1.6}

/* EVENTS SECTION (team events) */
.events-section{margin-bottom:48px}
.sec-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:20px;flex-wrap:wrap;gap:10px}
.sec-title-wrap{display:flex;align-items:center;gap:12px}
.sec-icon{width:40px;height:40px;border-radius:12px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:20px;box-shadow:0 4px 12px rgba(79,70,229,.25)}
.sec-title{font-size:18px;font-weight:800;color:var(--ink)}
.sec-sub{font-size:12.5px;color:var(--muted);margin-top:2px}
.view-all-btn{display:inline-flex;align-items:center;gap:5px;background:var(--bg2);color:var(--pri);border:1.5px solid #c7d2fe;border-radius:10px;font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;font-weight:700;padding:8px 16px;text-decoration:none;transition:background .16s,color .16s}
.view-all-btn:hover{background:var(--pri);color:#fff;border-color:var(--pri)}

/* team event cards */
.te-grid{display:grid;grid-template-columns:repeat(2,1fr);gap:18px}
@media(max-width:620px){.te-grid{grid-template-columns:1fr}}
.te-card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:20px;display:flex;gap:16px;transition:transform .22s,box-shadow .22s,border-color .22s;text-decoration:none;color:inherit}
.te-card:hover{transform:translateY(-5px);box-shadow:0 12px 30px rgba(79,70,229,.12);border-color:#c7d2fe}
.te-img{width:70px;height:70px;border-radius:12px;object-fit:cover;flex-shrink:0;border:1.5px solid var(--line)}
.te-img-ph{width:70px;height:70px;border-radius:12px;flex-shrink:0;background:linear-gradient(135deg,var(--bg2),#c7d2fe);display:flex;align-items:center;justify-content:center;font-size:30px;border:1.5px solid #c7d2fe}
.te-info{flex:1;min-width:0}
.te-title{font-size:14px;font-weight:800;color:var(--ink);margin-bottom:3px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.te-org{font-size:12px;font-weight:700;color:var(--pri);margin-bottom:8px}
.te-meta{display:flex;flex-wrap:wrap;gap:6px}
.te-chip{font-size:11px;font-weight:600;padding:3px 8px;border-radius:20px}
.te-chip.type{background:var(--bg2);color:var(--pri);border:1px solid #c7d2fe}
.te-chip.size{background:var(--green-bg);color:var(--green);border:1px solid #bbf7d0}
.te-chip.loc{background:#f0fdf4;color:var(--green);border:1px solid #bbf7d0}
.te-deadline{font-size:11px;color:var(--muted);margin-top:8px}

/* MY TEAMS SECTION */
.my-teams-section{margin-bottom:48px}
.my-teams-empty{background:var(--white);border:2px dashed #c7d2fe;border-radius:var(--r);padding:48px 28px;text-align:center}
.my-teams-empty .me-icon{font-size:52px;margin-bottom:14px}
.my-teams-empty .me-title{font-size:16px;font-weight:800;color:var(--ink);margin-bottom:6px}
.my-teams-empty .me-sub{font-size:13px;color:var(--muted);margin-bottom:20px}
.me-register-btn{display:inline-flex;align-items:center;gap:6px;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:700;padding:11px 22px;border-radius:10px;text-decoration:none;box-shadow:0 4px 14px rgba(79,70,229,.25);transition:transform .18s,box-shadow .18s}
.me-register-btn:hover{transform:translateY(-2px);box-shadow:0 8px 22px rgba(79,70,229,.3)}

/* my team card */
.my-teams-grid{display:grid;grid-template-columns:repeat(2,1fr);gap:18px}
@media(max-width:620px){.my-teams-grid{grid-template-columns:1fr}}
.my-team-card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:20px;transition:border-color .2s,box-shadow .2s}
.my-team-card:hover{border-color:#c7d2fe;box-shadow:0 6px 20px rgba(79,70,229,.1)}
.mt-header{display:flex;align-items:flex-start;justify-content:space-between;margin-bottom:14px}
.mt-name{font-size:15px;font-weight:800;color:var(--ink)}
.mt-event{font-size:12px;color:var(--pri);font-weight:600;margin-top:2px}
.mt-leader-badge{font-size:10.5px;font-weight:700;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;padding:3px 10px;border-radius:20px}
.mt-members-title{font-size:11px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.07em;margin-bottom:10px}
.mt-members-list{display:flex;flex-direction:column;gap:8px}
.mt-member{display:flex;align-items:center;gap:10px}
.mt-av{width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:700;color:#fff;flex-shrink:0}
.mt-mname{font-size:13px;font-weight:700;color:var(--ink)}
.mt-memail{font-size:11px;color:var(--muted)}
.mt-footer{margin-top:14px;padding-top:12px;border-top:1px solid var(--line);display:flex;justify-content:space-between;align-items:center}
.mt-count{font-size:12px;color:var(--muted);font-weight:600}
.mt-view-btn{display:inline-flex;align-items:center;gap:4px;font-size:12px;font-weight:700;color:var(--pri);background:var(--bg2);border:1px solid #c7d2fe;padding:5px 12px;border-radius:20px;text-decoration:none;transition:background .16s,color .16s}
.mt-view-btn:hover{background:var(--pri);color:#fff;border-color:var(--pri)}

/* TIPS SECTION */
.tips-section{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:28px 32px;margin-bottom:48px}
.tips-title{font-size:17px;font-weight:800;color:var(--ink);margin-bottom:18px;display:flex;align-items:center;gap:8px}
.tips-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}
@media(max-width:720px){.tips-grid{grid-template-columns:1fr}}
.tip-card{background:var(--bg);border:1.5px solid var(--line);border-radius:12px;padding:16px}
.tip-icon{font-size:24px;margin-bottom:8px}
.tip-title{font-size:13.5px;font-weight:800;color:var(--ink);margin-bottom:5px}
.tip-desc{font-size:12.5px;color:var(--sub);line-height:1.6}

/* FOOTER */
.footer{background:linear-gradient(135deg,var(--pri-dk),#1e1b4b);padding:28px 0}
.footer-inner{max-width:1160px;margin:0 auto;padding:0 28px;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:14px}
.footer-copy{font-size:12.5px;color:rgba(255,255,255,.45)}
</style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
  <div class="navbar-inner">
    <a href="Home" class="nav-brand">
      <div class="nav-logo">CN</div>
      <span class="nav-brand-txt">CodeNova <span>SOU</span></span>
    </a>
    <div class="nav-links">
      <a href="Home" class="nav-link">Home</a>
      <a href="listEvent" class="nav-link">Events</a>
      <a href="challenges" class="nav-link">Challenges</a>
      <a href="teams" class="nav-link active">Teams</a>
      <a href="leaderboard" class="nav-link">Leaderboard</a>
    </div>
    <div class="nav-actions">
      <%
        Object loggedUser = session.getAttribute("loggedUser");
        if (loggedUser != null) {
          com.Entity.UserEntity u = (com.Entity.UserEntity) loggedUser;
          String pic = u.getProfilePic();
          String fname = u.getFirstName() != null ? u.getFirstName() : "";
          String lname = u.getLastName() != null ? u.getLastName() : "";
          String initials = (fname.length()>0?String.valueOf(fname.charAt(0)):"")+(lname.length()>0?String.valueOf(lname.charAt(0)):"");
      %>
        <% if (pic != null && !pic.isEmpty()) { %>
          <img src="<%= pic %>" style="width:36px;height:36px;border-radius:50%;object-fit:cover;border:2px solid var(--pri-lt)" alt="Profile"/>
        <% } else { %>
          <div style="width:36px;height:36px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;color:#fff"><%= initials.toUpperCase() %></div>
        <% } %>
        <a href="logout" class="nav-btn-outline">Logout</a>
      <% } else { %>
        <a href="login" class="nav-btn-outline">Login</a>
        <a href="signup" class="nav-btn">Register</a>
      <% } %>
    </div>
  </div>
</nav>

<!-- HERO -->
<div class="tf-hero">
  <div class="tf-cr1"></div><div class="tf-cr2"></div>
  <div class="tf-hero-inner">
    <div>
      <div class="tf-eyebrow">👥 Team Formation</div>
      <h1 class="tf-h1">Build Your <em>Dream Team</em><br>Win Together</h1>
      <p class="tf-sub">Find teammates who complement your skills. Register as a team for hackathons and coding competitions at CodeNova SOU.</p>
      <div class="tf-hero-btns">
        <a href="listEvent" class="btn-hero-pri">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
          Browse Team Events
        </a>
        <a href="#my-teams" class="btn-hero-sec">
          My Teams
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
        </a>
      </div>
    </div>

    <!-- Right: Live team preview -->
    <div class="tf-hero-visual">
      <div class="tf-team-preview">
        <div class="tf-team-label">🔥 Sample Team — CodeCrafters</div>
        <div class="tf-members-row">
          <div class="tf-member-chip">
            <div class="tf-member-av">AK</div>
            <div>
              <div class="tf-member-name">Arjun K.</div>
              <div class="tf-member-role">Leader</div>
            </div>
          </div>
          <div class="tf-member-chip">
            <div class="tf-member-av teal">PS</div>
            <div>
              <div class="tf-member-name">Priya S.</div>
              <div class="tf-member-role">Dev</div>
            </div>
          </div>
          <div class="tf-member-chip">
            <div class="tf-member-av green">RV</div>
            <div>
              <div class="tf-member-name">Rahul V.</div>
              <div class="tf-member-role">Design</div>
            </div>
          </div>
          <div class="tf-add-chip">+ Add</div>
        </div>
      </div>
      <div class="tf-team-preview" style="background:rgba(255,255,255,.08)">
        <div class="tf-team-label">📊 Team Stats</div>
        <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:10px;margin-top:4px">
          <div style="text-align:center">
            <div style="font-size:22px;font-weight:800;color:#fff">${not empty teamEvents ? fn:length(teamEvents) : '0'}</div>
            <div style="font-size:10.5px;color:rgba(255,255,255,.55);font-weight:600;margin-top:2px">Team Events</div>
          </div>
          <div style="text-align:center;border-left:1px solid rgba(255,255,255,.15);border-right:1px solid rgba(255,255,255,.15)">
            <div style="font-size:22px;font-weight:800;color:var(--acc-lt)">${not empty myTeams ? fn:length(myTeams) : '0'}</div>
            <div style="font-size:10.5px;color:rgba(255,255,255,.55);font-weight:600;margin-top:2px">My Teams</div>
          </div>
          <div style="text-align:center">
            <div style="font-size:22px;font-weight:800;color:#fbbf24">4</div>
            <div style="font-size:10.5px;color:rgba(255,255,255,.55);font-weight:600;margin-top:2px">Max Size</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- MAIN -->
<div class="tf-main">

  <!-- HOW IT WORKS -->
  <div class="how-section">
    <div class="how-title">How Team Formation Works</div>
    <div class="how-sub">4 simple steps to compete with your dream team</div>
    <div class="how-steps">
      <div class="how-step">
        <div class="how-step-num">1</div>
        <div class="how-step-icon">🔍</div>
        <div class="how-step-title">Find Team Events</div>
        <div class="how-step-desc">Browse events that allow team participation and check the min/max team size.</div>
      </div>
      <div class="how-step">
        <div class="how-step-num">2</div>
        <div class="how-step-icon">🤝</div>
        <div class="how-step-title">Connect & Discuss</div>
        <div class="how-step-desc">Talk with your batchmates and decide roles — developer, designer, PM, etc.</div>
      </div>
      <div class="how-step">
        <div class="how-step-num">3</div>
        <div class="how-step-icon">📝</div>
        <div class="how-step-title">Register as Team</div>
        <div class="how-step-desc">One member registers as team leader and adds all member names and emails.</div>
      </div>
      <div class="how-step">
        <div class="how-step-num">4</div>
        <div class="how-step-icon">🏆</div>
        <div class="how-step-title">Compete & Win</div>
        <div class="how-step-desc">Submit your work before the deadline and wait for judge scores. Top team wins!</div>
      </div>
    </div>
  </div>

  <!-- TEAM EVENTS -->
  <div class="events-section">
    <div class="sec-header">
      <div class="sec-title-wrap">
        <div class="sec-icon">👥</div>
        <div>
          <div class="sec-title">Open Team Events</div>
          <div class="sec-sub">Events that require team participation</div>
        </div>
      </div>
      <a href="listEvent" class="view-all-btn">
        View All Events
        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
      </a>
    </div>

    <c:choose>
      <c:when test="${not empty teamEvents}">
        <div class="te-grid">
          <c:forEach var="ev" items="${teamEvents}">
            <a href="listEventDetails/${ev.eventId}" class="te-card">
              <c:choose>
                <c:when test="${not empty ev.eventImage}">
                  <img src="${ev.eventImage}" class="te-img" alt="${ev.eventTitle}"/>
                </c:when>
                <c:otherwise>
                  <div class="te-img-ph">🏆</div>
                </c:otherwise>
              </c:choose>
              <div class="te-info">
                <div class="te-title">${ev.eventTitle}</div>
                <div class="te-org">${ev.organizationName}</div>
                <div class="te-meta">
                  <span class="te-chip type">Team</span>
                  <c:if test="${not empty ev.location}"><span class="te-chip loc">${ev.location}</span></c:if>
                  <c:if test="${ev.minTeamSize != null and ev.maxTeamSize != null}">
                    <span class="te-chip size">${ev.minTeamSize}–${ev.maxTeamSize} members</span>
                  </c:if>
                </div>
                <div class="te-deadline">Deadline: ${ev.lastDate}</div>
              </div>
            </a>
          </c:forEach>
        </div>
      </c:when>
      <c:otherwise>
        <div style="text-align:center;padding:40px 20px;background:var(--white);border:1.5px solid var(--line);border-radius:var(--r)">
          <div style="font-size:44px;margin-bottom:12px">👥</div>
          <div style="font-size:15px;font-weight:700;color:var(--ink);margin-bottom:6px">No team events yet</div>
          <div style="font-size:13px;color:var(--muted)">Team events will appear here when published.</div>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

  <!-- MY TEAMS -->
  <div class="my-teams-section" id="my-teams">
    <div class="sec-header">
      <div class="sec-title-wrap">
        <div class="sec-icon">⭐</div>
        <div>
          <div class="sec-title">My Teams</div>
          <div class="sec-sub">Teams you are part of</div>
        </div>
      </div>
    </div>

    <c:choose>
      <c:when test="${not empty myTeams}">
        <div class="my-teams-grid">
          <c:forEach var="team" items="${myTeams}">
            <div class="my-team-card">
              <div class="mt-header">
                <div>
                  <div class="mt-name">${team.teamName}</div>
                  <div class="mt-event">Event ID: ${team.eventId}</div>
                </div>
                <c:if test="${not empty loggedUser}">
                  <% com.Entity.UserEntity lu = (com.Entity.UserEntity)session.getAttribute("loggedUser"); %>
                  <c:if test="${team.teamLeader == lu.email or team.teamLeader == lu.firstName}">
                    <span class="mt-leader-badge">👑 Leader</span>
                  </c:if>
                </c:if>
              </div>

              <div class="mt-members-title">Team Members</div>
              <div class="mt-members-list">
                <c:if test="${not empty teamMembersMap}">
                  <c:forEach var="m" items="${teamMembersMap[team.participantId]}">
                    <div class="mt-member">
                      <div class="mt-av">${fn:substring(m.memberName,0,1)}</div>
                      <div>
                        <div class="mt-mname">${m.memberName}</div>
                        <div class="mt-memail">${m.memberEmail}</div>
                      </div>
                    </div>
                  </c:forEach>
                </c:if>
              </div>

              <div class="mt-footer">
                <span class="mt-count">Leader: ${team.teamLeader}</span>
                <a href="listEventDetails/${team.eventId}" class="mt-view-btn">
                  View Event
                  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                </a>
              </div>
            </div>
          </c:forEach>
        </div>
      </c:when>
      <c:otherwise>
        <%
          Object lu2 = session.getAttribute("loggedUser");
        %>
        <div class="my-teams-empty">
          <div class="me-icon">👥</div>
          <div class="me-title"><%= lu2 != null ? "You haven't joined any team yet" : "Login to see your teams" %></div>
          <div class="me-sub"><%= lu2 != null ? "Register for a team event to form or join a team." : "Login to view and manage your teams." %></div>
          <% if (lu2 != null) { %>
            <a href="listEvent" class="me-register-btn">
              Browse Team Events
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
            </a>
          <% } else { %>
            <a href="login" class="me-register-btn">Login Now</a>
          <% } %>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

  <!-- TIPS -->
  <div class="tips-section">
    <div class="tips-title">💡 Team Tips for Success</div>
    <div class="tips-grid">
      <div class="tip-card">
        <div class="tip-icon">⚡</div>
        <div class="tip-title">Divide Roles Early</div>
        <div class="tip-desc">Assign frontend, backend, design, and presentation roles before the hackathon starts.</div>
      </div>
      <div class="tip-card">
        <div class="tip-icon">🗣️</div>
        <div class="tip-title">Communicate Constantly</div>
        <div class="tip-desc">Use WhatsApp, Discord, or Slack to keep every member updated throughout the event.</div>
      </div>
      <div class="tip-card">
        <div class="tip-icon">📋</div>
        <div class="tip-title">Plan Before Coding</div>
        <div class="tip-desc">Spend the first 30 minutes on planning — a clear plan saves hours of confusion later.</div>
      </div>
    </div>
  </div>

</div>

<!-- FOOTER -->
<footer class="footer">
  <div class="footer-inner">
    <div style="display:flex;align-items:center;gap:10px">
      <div class="nav-logo" style="width:36px;height:36px;font-size:14px">CN</div>
      <span style="font-size:15px;font-weight:800;color:#fff">CodeNova <span style="color:var(--acc-lt)">SOU</span></span>
    </div>
    <p class="footer-copy">© 2026 CodeNova SOU · Silver Oak University</p>
  </div>
</footer>

</body>
</html>
