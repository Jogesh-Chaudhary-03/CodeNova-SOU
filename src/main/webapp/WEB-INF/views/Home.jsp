<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
<%@ page import="com.Entity.AddEventEntity"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:      #4f46e5;
  --pri-dk:   #3730a3;
  --pri-lt:   #818cf8;
  --acc:      #0d9488;
  --acc-lt:   #5eead4;
  --warm:     #f59e0b;
  --ink:      #1e1b4b;
  --ink2:     #374151;
  --sub:      #6b7280;
  --muted:    #9ca3af;
  --line:     #e5e7eb;
  --bg:       #f5f3ff;
  --bg2:      #ede9fe;
  --white:    #ffffff;
  --green:    #059669;
  --green-bg: #d1fae5;
  --red:      #dc2626;
  --red-bg:   #fee2e2;
  --amber:    #d97706;
  --amber-bg: #fef3c7;
  --r:14px;
}
html{scroll-behavior:smooth}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh}

/* ══════════════════════════════════
   HERO
══════════════════════════════════ */
.hero{
  background:linear-gradient(135deg,#4f46e5 0%,#3730a3 40%,#0d9488 100%);
  position:relative;overflow:hidden;
  padding:72px 0 80px;
}
/* dot grid */
.hero::before{
  content:'';position:absolute;inset:0;
  background-image:radial-gradient(rgba(255,255,255,.12) 1px,transparent 1px);
  background-size:28px 28px;pointer-events:none;
}
/* top-right glow circle */
.hero-cr1{
  position:absolute;top:-90px;right:-90px;
  width:380px;height:380px;border-radius:50%;
  background:rgba(255,255,255,.06);pointer-events:none;
}
/* bottom-left teal blob */
.hero-cr2{
  position:absolute;bottom:-70px;left:6%;
  width:240px;height:240px;border-radius:50%;
  background:rgba(13,148,136,.22);pointer-events:none;
}
/* thin accent line top */
.hero::after{
  content:'';position:absolute;top:0;left:0;right:0;height:2px;
  background:linear-gradient(90deg,transparent,rgba(255,255,255,.4),transparent);
}

.hero-inner{
  max-width:1160px;margin:0 auto;padding:0 28px;
  position:relative;z-index:1;
  display:grid;grid-template-columns:1fr 420px;gap:48px;align-items:center;
}
@media(max-width:900px){.hero-inner{grid-template-columns:1fr;text-align:center}}

.hero-text{}
.hero-eyebrow{
  display:inline-flex;align-items:center;gap:7px;
  background:rgba(255,255,255,.14);backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.25);
  color:#fff;font-size:12px;font-weight:700;letter-spacing:.07em;text-transform:uppercase;
  padding:5px 14px;border-radius:20px;margin-bottom:18px;
}
.hero-h1{
  font-size:clamp(28px,4vw,48px);font-weight:800;color:#fff;
  line-height:1.18;margin-bottom:18px;
  text-shadow:0 3px 20px rgba(0,0,0,.15);
}
.hero-h1 em{font-style:normal;color:var(--acc-lt)}
.hero-sub{
  font-size:16px;color:rgba(255,255,255,.78);
  line-height:1.7;margin-bottom:28px;max-width:480px;
}
@media(max-width:900px){.hero-sub{margin:0 auto 28px}}

.hero-btns{display:flex;gap:12px;flex-wrap:wrap}
@media(max-width:900px){.hero-btns{justify-content:center}}
.btn-hero-pri{
  display:inline-flex;align-items:center;gap:7px;
  background:#fff;color:var(--pri);
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:14px;font-weight:800;
  padding:12px 26px;border-radius:10px;text-decoration:none;
  box-shadow:0 4px 18px rgba(0,0,0,.18);
  transition:transform .18s,box-shadow .18s;
}
.btn-hero-pri:hover{transform:translateY(-2px);box-shadow:0 8px 28px rgba(0,0,0,.22)}
.btn-hero-sec{
  display:inline-flex;align-items:center;gap:7px;
  background:rgba(255,255,255,.14);backdrop-filter:blur(8px);
  border:1.5px solid rgba(255,255,255,.3);
  color:#fff;font-family:'Plus Jakarta Sans',sans-serif;
  font-size:14px;font-weight:700;
  padding:12px 26px;border-radius:10px;text-decoration:none;
  transition:background .18s,transform .18s;
}
.btn-hero-sec:hover{background:rgba(255,255,255,.22);transform:translateY(-2px)}

/* hero stats card */
.hero-stats{
  background:rgba(255,255,255,.12);backdrop-filter:blur(16px);
  border:1.5px solid rgba(255,255,255,.22);
  border-radius:20px;padding:28px;
  display:grid;grid-template-columns:1fr 1fr;gap:16px;
}
@media(max-width:900px){.hero-stats{max-width:400px;margin:0 auto}}
.stat-item{
  background:rgba(255,255,255,.1);border-radius:12px;
  padding:16px;text-align:center;
  border:1px solid rgba(255,255,255,.15);
}
.stat-num{font-size:26px;font-weight:800;color:#fff;line-height:1}
.stat-lbl{font-size:11.5px;color:rgba(255,255,255,.65);margin-top:4px;font-weight:600;letter-spacing:.04em}

/* ══════════════════════════════════
   FEATURES STRIP
══════════════════════════════════ */
.features{
  background:var(--white);
  border-bottom:1px solid var(--line);
  padding:36px 0;
}
.features-inner{
  max-width:1160px;margin:0 auto;padding:0 28px;
  display:grid;grid-template-columns:repeat(3,1fr);gap:24px;
}
@media(max-width:720px){.features-inner{grid-template-columns:1fr}}
.feat-card{
  display:flex;align-items:flex-start;gap:14px;
  padding:20px;border-radius:14px;
  border:1.5px solid var(--line);
  background:var(--bg);
  transition:border-color .2s,box-shadow .2s,transform .2s;
}
.feat-card:hover{
  border-color:#c7d2fe;
  box-shadow:0 6px 20px rgba(79,70,229,.1);
  transform:translateY(-3px);
}
.feat-icon{
  width:46px;height:46px;border-radius:12px;flex-shrink:0;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;
  font-size:22px;
  box-shadow:0 4px 12px rgba(79,70,229,.25);
}
.feat-title{font-size:14.5px;font-weight:800;color:var(--ink);margin-bottom:4px}
.feat-desc{font-size:13px;color:var(--sub);line-height:1.6}

/* ══════════════════════════════════
   EVENTS SECTION
══════════════════════════════════ */
.events-section{
  max-width:1160px;margin:48px auto 0;padding:0 28px;
}
.sec-header{
  display:flex;align-items:center;justify-content:space-between;
  margin-bottom:24px;flex-wrap:wrap;gap:12px;
}
.sec-title-wrap{display:flex;align-items:center;gap:12px}
.sec-title-icon{
  width:40px;height:40px;border-radius:12px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;font-size:20px;
  box-shadow:0 4px 12px rgba(79,70,229,.25);flex-shrink:0;
}
.sec-title{font-size:20px;font-weight:800;color:var(--ink)}
.sec-sub{font-size:13px;color:var(--muted);margin-top:2px}
.view-all-btn{
  display:inline-flex;align-items:center;gap:6px;
  background:var(--bg2);color:var(--pri);
  border:1.5px solid #c7d2fe;border-radius:10px;
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13px;font-weight:700;
  padding:9px 18px;text-decoration:none;
  transition:background .16s,color .16s;
}
.view-all-btn:hover{background:var(--pri);color:#fff;border-color:var(--pri)}

/* events grid */
.events-grid{
  display:grid;
  grid-template-columns:repeat(2,1fr);
  gap:18px;
  margin-bottom:28px;
}
@media(max-width:640px){.events-grid{grid-template-columns:1fr}}

/* ══ CARD ══ */
.card-link{text-decoration:none;color:inherit;display:block;height:100%}
.event-card{
  background:var(--white);border:1.5px solid var(--line);
  border-radius:var(--r);padding:20px;height:100%;
  display:flex;flex-direction:column;
  position:relative;overflow:hidden;
  box-shadow:0 2px 8px rgba(79,70,229,.04);
  transition:transform .22s,box-shadow .22s,border-color .22s;
}
.event-card::before{
  content:'';position:absolute;top:0;left:0;right:0;height:3px;
  background:linear-gradient(90deg,var(--pri),var(--acc));
  opacity:0;transition:opacity .22s;
}
.event-card:hover{transform:translateY(-5px);box-shadow:0 12px 32px rgba(79,70,229,.13);border-color:#c7d2fe}
.event-card:hover::before{opacity:1}

.card-top{display:flex;justify-content:space-between;align-items:flex-start;gap:12px;margin-bottom:13px}
.event-logo{width:60px;height:60px;border-radius:11px;object-fit:cover;flex-shrink:0;border:1.5px solid var(--line);background:var(--bg)}
.event-logo-ph{width:60px;height:60px;border-radius:11px;flex-shrink:0;background:linear-gradient(135deg,var(--bg2),#c7d2fe);display:flex;align-items:center;justify-content:center;font-size:26px;border:1.5px solid #c7d2fe}
.days-pill{display:inline-flex;align-items:center;gap:4px;font-size:11px;font-weight:700;padding:3px 9px;border-radius:20px;flex-shrink:0;white-space:nowrap}
.days-pill.green{background:var(--green-bg);color:var(--green)}
.days-pill.amber{background:var(--amber-bg);color:var(--amber)}
.days-pill.red  {background:var(--red-bg);  color:var(--red)}

.card-title{font-size:14.5px;font-weight:800;color:var(--ink);line-height:1.3;margin-bottom:5px}
.card-org  {font-size:12.5px;font-weight:700;color:var(--pri);margin-bottom:10px}
.card-meta {display:flex;flex-direction:column;gap:3px;margin-bottom:12px}
.meta-row  {display:flex;align-items:center;gap:6px;font-size:12px;color:var(--sub)}
.meta-row svg{flex-shrink:0;color:var(--muted)}

.tags-wrap{display:flex;gap:6px;flex-wrap:nowrap;overflow:hidden;margin-bottom:13px}
.tag{background:var(--bg2);color:var(--pri-dk);border:1px solid #c7d2fe;padding:3px 10px;font-size:11px;font-weight:600;border-radius:20px;white-space:nowrap}
.tag.more{background:var(--bg);color:var(--muted);border-color:var(--line)}

.card-footer{margin-top:auto;padding-top:12px;border-top:1px solid var(--line);display:flex;justify-content:space-between;align-items:center}
.posted-txt{font-size:11px;color:var(--muted)}
.view-btn{display:inline-flex;align-items:center;gap:4px;font-size:12px;font-weight:700;color:var(--pri);background:var(--bg2);border:1px solid #c7d2fe;padding:5px 12px;border-radius:20px;transition:background .16s,color .16s}
.event-card:hover .view-btn{background:var(--pri);color:#fff;border-color:var(--pri)}

/* empty */
.no-events{grid-column:1/-1;text-align:center;padding:60px 20px}
.no-events .ne-icon{font-size:52px;margin-bottom:14px}
.no-events .ne-title{font-size:17px;font-weight:700;color:var(--ink);margin-bottom:6px}
.no-events .ne-sub{font-size:13.5px;color:var(--muted)}

/* ══════════════════════════════════
   CTA BANNER
══════════════════════════════════ */
.cta{
  margin:48px auto 60px;max-width:1160px;padding:0 28px;
}
.cta-inner{
  background:linear-gradient(135deg,var(--pri),var(--acc));
  border-radius:20px;padding:48px 40px;
  display:flex;align-items:center;justify-content:space-between;gap:28px;
  flex-wrap:wrap;position:relative;overflow:hidden;
}
.cta-inner::before{
  content:'';position:absolute;top:-60px;right:-60px;
  width:260px;height:260px;border-radius:50%;background:rgba(255,255,255,.07);
}
.cta-inner::after{
  content:'';position:absolute;inset:0;
  background-image:radial-gradient(rgba(255,255,255,.08) 1px,transparent 1px);
  background-size:22px 22px;
}
.cta-text{position:relative;z-index:1}
.cta-h{font-size:22px;font-weight:800;color:#fff;margin-bottom:6px}
.cta-p{font-size:14px;color:rgba(255,255,255,.75);max-width:420px;line-height:1.6}
.cta-btn{
  position:relative;z-index:1;flex-shrink:0;
  display:inline-flex;align-items:center;gap:8px;
  background:#fff;color:var(--pri);
  font-family:'Plus Jakarta Sans',sans-serif;font-size:14.5px;font-weight:800;
  padding:13px 28px;border-radius:11px;text-decoration:none;
  box-shadow:0 4px 18px rgba(0,0,0,.18);
  transition:transform .18s,box-shadow .18s;
}
.cta-btn:hover{transform:translateY(-2px);box-shadow:0 8px 28px rgba(0,0,0,.22)}

/* ══════════════════════════════════
   NAVBAR
══════════════════════════════════ */
.navbar{
  position:sticky;top:0;z-index:300;
  background:rgba(255,255,255,.97);
  backdrop-filter:blur(12px);
  border-bottom:1.5px solid var(--line);
  box-shadow:0 2px 12px rgba(79,70,229,.07);
}
.navbar-inner{
  max-width:1160px;margin:0 auto;padding:0 28px;
  display:flex;align-items:center;gap:24px;height:62px;
}
.nav-brand{
  display:flex;align-items:center;gap:10px;
  text-decoration:none;flex-shrink:0;
}
.nav-logo{
  width:38px;height:38px;border-radius:10px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;
  font-size:15px;font-weight:800;color:#fff;
  box-shadow:0 3px 10px rgba(79,70,229,.3);
  flex-shrink:0;
}
.nav-brand-txt{
  font-size:16px;font-weight:800;color:var(--ink);
}
.nav-brand-txt span{color:var(--pri)}

.nav-links{
  display:flex;align-items:center;gap:4px;margin-left:8px;
}
.nav-link{
  font-size:13.5px;font-weight:600;color:var(--sub);
  text-decoration:none;padding:7px 13px;border-radius:8px;
  transition:background .16s,color .16s;
}
.nav-link:hover{background:var(--bg2);color:var(--pri)}
.nav-link.active{background:var(--bg2);color:var(--pri);font-weight:700}

.nav-actions{margin-left:auto;display:flex;align-items:center;gap:10px}
.nav-btn{
  display:inline-flex;align-items:center;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  color:#fff;font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13px;font-weight:700;
  padding:8px 20px;border-radius:9px;text-decoration:none;
  box-shadow:0 3px 10px rgba(79,70,229,.25);
  transition:opacity .16s,transform .16s;
}
.nav-btn:hover{opacity:.9;transform:translateY(-1px)}
.nav-btn-outline{
  display:inline-flex;align-items:center;
  background:transparent;
  border:1.5px solid var(--line);
  color:var(--ink2);font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13px;font-weight:700;
  padding:7px 18px;border-radius:9px;text-decoration:none;
  transition:border-color .16s,color .16s,background .16s;
}
.nav-btn-outline:hover{border-color:var(--pri);color:var(--pri);background:var(--bg2)}

/* hamburger */
.nav-toggle{
  display:none;flex-direction:column;gap:5px;
  background:none;border:none;cursor:pointer;
  padding:6px;margin-left:auto;
}
.nav-toggle span{
  display:block;width:22px;height:2px;
  background:var(--ink);border-radius:2px;
  transition:transform .2s,opacity .2s;
}

@media(max-width:700px){
  .nav-links{
    display:none;position:absolute;top:62px;left:0;right:0;
    background:#fff;border-bottom:1.5px solid var(--line);
    flex-direction:column;padding:12px 28px 16px;gap:4px;
    box-shadow:0 8px 24px rgba(0,0,0,.08);
  }
  .nav-links.open{display:flex}
  .nav-toggle{display:flex}
  .nav-actions{display:none}
}

/* ══════════════════════════════════
   FOOTER
══════════════════════════════════ */
.footer{
  background:linear-gradient(135deg,var(--pri-dk),#1e1b4b);
  padding:28px 0;margin-top:0;
}
.footer-inner{
  max-width:1160px;margin:0 auto;padding:0 28px;
  display:flex;align-items:center;justify-content:space-between;
  flex-wrap:wrap;gap:14px;
}
.footer-brand{display:flex;align-items:center;gap:10px}
.footer-copy{font-size:12.5px;color:rgba(255,255,255,.45);}

@media(max-width:600px){
  .footer-inner{flex-direction:column;text-align:center}
}

/* ══════════════════════════════════
   RESPONSIVE TWEAKS
══════════════════════════════════ */
@media(max-width:640px){
  .cta-inner{text-align:center;flex-direction:column;align-items:center}
  .sec-header{flex-direction:column;align-items:flex-start}
}
</style>
</head>
<body>

<!-- ════════ NAVBAR ════════ -->
<nav class="navbar">
  <div class="navbar-inner">
    <a href="home" class="nav-brand">
      <div class="nav-logo">CN</div>
      <span class="nav-brand-txt">CodeNova <span>SOU</span></span>
    </a>
    <div class="nav-links" id="navLinks">
      <a href="home" class="nav-link active">Home</a>
      <a href="#events-section" class="nav-link" id="navEventsLink">Events</a>
    </div>
    <div class="nav-actions">
      <a href="login" class="nav-btn-outline">Login</a>
      <a href="signup" class="nav-btn">Register</a>
    </div>
    <button class="nav-toggle" id="navToggle" aria-label="Menu">
      <span></span><span></span><span></span>
    </button>
  </div>
</nav>

<!-- ════════ HERO ════════ -->
<section class="hero">
  <div class="hero-cr1"></div>
  <div class="hero-cr2"></div>
  <div class="hero-inner">

    <!-- LEFT: Text -->
    <div class="hero-text">
      <div class="hero-eyebrow">🎓 Silver Oak University</div>
      <h1 class="hero-h1">
        Ignite Ideas,<br>
        <em>Code the Future</em> 🚀
      </h1>
      <p class="hero-sub">
        Welcome to <strong style="color:#fff">CodeNova SOU</strong> — the ultimate platform for hackathons, design challenges, and coding competitions. Build. Compete. Grow.
      </p>
      <div class="hero-btns">
        <a href="signup" class="btn-hero-pri">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><line x1="19" y1="8" x2="19" y2="14"/><line x1="22" y1="11" x2="16" y2="11"/></svg>
          Register Now
        </a>
        <a href="#events-section" class="btn-hero-sec" id="heroEventsBtn">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
          Browse Events
        </a>
      </div>
    </div>

    <!-- RIGHT: Stats card -->
    <div class="hero-stats">
      <div class="stat-item">
        <div class="stat-num">50+</div>
        <div class="stat-lbl">Events Hosted</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">2K+</div>
        <div class="stat-lbl">Participants</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">₹5L+</div>
        <div class="stat-lbl">Prize Pool</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">30+</div>
        <div class="stat-lbl">Organisations</div>
      </div>
    </div>

  </div>
</section>

<!-- ════════ FEATURES ════════ -->
<div class="features">
  <div class="features-inner">
    <div class="feat-card">
      <div class="feat-icon">👥</div>
      <div>
        <div class="feat-title">Team Formation</div>
        <div class="feat-desc">Create or join teams and collaborate with the best minds on campus.</div>
      </div>
    </div>
    <div class="feat-card">
      <div class="feat-icon">📊</div>
      <div>
        <div class="feat-title">Live Leaderboard</div>
        <div class="feat-desc">Track rankings and competition progress in real-time.</div>
      </div>
    </div>
    <div class="feat-card">
      <div class="feat-icon">💡</div>
      <div>
        <div class="feat-title">Exciting Challenges</div>
        <div class="feat-desc">Solve real-world problems and showcase your innovation to the world.</div>
      </div>
    </div>
  </div>
</div>

<!-- ════════ EVENTS SECTION ════════ -->
<div class="events-section" id="events-section">
  <div class="sec-header">
    <div class="sec-title-wrap">
      <div class="sec-title-icon">🔥</div>
      <div>
        <div class="sec-title">Latest Events</div>
        <div class="sec-sub">Click any event to view full details</div>
      </div>
    </div>
    <a href="listEvent" class="view-all-btn">
      View All Events
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
    </a>
  </div>

  <div class="events-grid">
    <c:choose>
      <c:when test="${not empty eventList}">
        <c:forEach var="event" items="${eventList}" end="5">

          <%
            AddEventEntity e = (AddEventEntity) pageContext.getAttribute("event");
            LocalDate today    = LocalDate.now();
            LocalDate lastDate = e.getLastDate();
            long daysLeft = 0;
            String pillClass = "green";
            if (lastDate != null) {
              daysLeft = ChronoUnit.DAYS.between(today, lastDate);
              if      (daysLeft <= 3) pillClass = "red";
              else if (daysLeft <= 7) pillClass = "amber";
              else                    pillClass = "green";
            }
          %>

          <div class="event-card">

              <div class="card-top">
                <c:choose>
                  <c:when test="${not empty event.eventImage}">
                    <img src="${event.eventImage}" class="event-logo" alt="${event.eventTitle}"/>
                  </c:when>
                  <c:otherwise>
                    <div class="event-logo-ph">🏆</div>
                  </c:otherwise>
                </c:choose>
                <% if (lastDate != null) { %>
                  <span class="days-pill <%= pillClass %>">⏰ <%=daysLeft%> days left</span>
                <% } %>
              </div>

              <div class="card-title">${event.eventTitle}</div>
              <div class="card-org">${event.organizationName}</div>

              <div class="card-meta">
                <c:if test="${not empty event.participationType}">
                  <div class="meta-row">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                    ${event.participationType}
                  </div>
                </c:if>
                <c:if test="${not empty event.location}">
                  <div class="meta-row">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
                    ${event.location}
                  </div>
                </c:if>
                <c:if test="${not empty event.lastDate}">
                  <div class="meta-row">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                    Deadline: ${event.lastDate}
                  </div>
                </c:if>
              </div>

              <c:if test="${not empty event.skillTags}">
                <div class="tags-wrap">
                  <c:set var="tc" value="0"/>
                  <c:forTokens items="${event.skillTags}" delims="," var="tag">
                    <c:set var="tc" value="${tc+1}"/>
                    <c:if test="${tc<=3}"><span class="tag">${fn:trim(tag)}</span></c:if>
                  </c:forTokens>
                  <c:if test="${tc>3}"><span class="tag more">+${tc-3} more</span></c:if>
                </div>
              </c:if>

              <div class="card-footer">
                <span class="posted-txt">Posted: ${event.postedDate}</span>
                <a href="listEventDetails/${event.eventId}" class="view-btn">
                  View Details
                  <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                </a>
              </div>

            </div>

        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="no-events">
          <div class="ne-icon">📭</div>
          <div class="ne-title">No events yet</div>
          <div class="ne-sub">Check back soon for upcoming events and competitions.</div>
        </div>
      </c:otherwise>
    </c:choose>
  </div>


</div>

<!-- ════════ CTA BANNER ════════ -->
<div class="cta">
  <div class="cta-inner">
    <div class="cta-text">
      <div class="cta-h">Ready to Build Something Amazing?</div>
      <p class="cta-p">Join hundreds of students competing, collaborating, and creating at CodeNova SOU. Your next big idea starts here.</p>
    </div>
    <a href="signup" class="cta-btn">
      Join the Hackathon
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
    </a>
  </div>
</div>

<!-- ════════ FOOTER ════════ -->
<footer class="footer">
  <div class="footer-inner">
    <div class="footer-brand">
      <div class="nav-logo" style="width:36px;height:36px;font-size:14px">CN</div>
      <span style="font-size:15px;font-weight:800;color:#fff">CodeNova <span style="color:var(--acc-lt)">SOU</span></span>
    </div>
    <p class="footer-copy">© 2026 CodeNova SOU · Silver Oak University · All rights reserved.</p>
  </div>
</footer>

<script>
// Hamburger toggle
document.getElementById('navToggle').addEventListener('click', function(){
  document.getElementById('navLinks').classList.toggle('open');
});

// Smooth scroll to events section for navbar "Events" and hero "Browse Events"
function scrollToEvents(e) {
  e.preventDefault();
  var target = document.getElementById('events-section');
  if (!target) return;
  var navH = document.querySelector('.navbar').offsetHeight;
  var top  = target.getBoundingClientRect().top + window.pageYOffset - navH - 12;
  window.scrollTo({ top: top, behavior: 'smooth' });
}
var navEventsLink = document.getElementById('navEventsLink');
var heroEventsBtn = document.getElementById('heroEventsBtn');
if (navEventsLink) navEventsLink.addEventListener('click', scrollToEvents);
if (heroEventsBtn) heroEventsBtn.addEventListener('click', scrollToEvents);
</script>
</body>
</html>
