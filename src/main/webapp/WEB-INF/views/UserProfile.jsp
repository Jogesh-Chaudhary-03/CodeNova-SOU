<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Profile – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:#4f46e5;--pri-dk:#3730a3;--acc:#0d9488;--acc-lt:#5eead4;
  --ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;
  --line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#fff;
  --green:#059669;--green-bg:#d1fae5;--red:#dc2626;--red-bg:#fee2e2;
  --amber:#d97706;--amber-bg:#fef3c7;--r:12px;
}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:100;background:rgba(255,255,255,.97);backdrop-filter:blur(12px);border-bottom:1.5px solid var(--line);box-shadow:0 2px 8px rgba(79,70,229,.06)}
.navbar-inner{max-width:1160px;margin:0 auto;padding:0 28px;display:flex;align-items:center;height:62px;gap:16px}
.nav-brand{display:flex;align-items:center;gap:9px;text-decoration:none}
.nav-logo{width:36px;height:36px;border-radius:9px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;color:#fff}
.nav-brand-txt{font-size:15px;font-weight:800;color:var(--ink)}
.nav-brand-txt span{color:var(--pri)}
.nav-actions{margin-left:auto;display:flex;align-items:center;gap:10px}
.nav-home{display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:700;color:var(--sub);text-decoration:none;padding:7px 14px;border-radius:9px;border:1.5px solid var(--line);transition:color .15s,border-color .15s}
.nav-home:hover{color:var(--pri);border-color:var(--pri)}
.nav-logout{display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:700;color:var(--red);text-decoration:none;padding:7px 14px;border-radius:9px;border:1.5px solid var(--red-bg);background:var(--red-bg);transition:background .15s}
.nav-logout:hover{background:#fca5a5}

/* HERO */
.profile-hero{background:linear-gradient(135deg,#4f46e5 0%,#3730a3 45%,#0d9488 100%);padding:36px 0 36px;position:relative;overflow:hidden}
.profile-hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px}
.ph-circle{position:absolute;top:-70px;right:-70px;width:260px;height:260px;border-radius:50%;background:rgba(255,255,255,.05)}
.ph-inner{max-width:1160px;margin:0 auto;padding:0 28px;position:relative;z-index:1;display:flex;align-items:center;gap:22px}
@media(max-width:600px){.ph-inner{flex-direction:column;text-align:center}}
.ph-avatar{width:80px;height:80px;border-radius:50%;object-fit:cover;border:3px solid rgba(255,255,255,.4);box-shadow:0 4px 16px rgba(0,0,0,.2);flex-shrink:0}
.ph-avatar-ph{width:80px;height:80px;border-radius:50%;background:rgba(255,255,255,.2);border:3px solid rgba(255,255,255,.4);display:flex;align-items:center;justify-content:center;font-size:28px;font-weight:800;color:#fff;flex-shrink:0}
.ph-text{}
.ph-label{display:inline-flex;align-items:center;gap:6px;background:rgba(255,255,255,.15);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:11px;font-weight:700;letter-spacing:.06em;padding:3px 11px;border-radius:20px;text-transform:uppercase;margin-bottom:8px}
.ph-name{font-size:clamp(20px,3vw,28px);font-weight:800;color:#fff;margin-bottom:4px}
.ph-email{font-size:13.5px;color:rgba(255,255,255,.7)}

/* MAIN */
.main-wrap{max-width:1160px;margin:28px auto 48px;padding:0 28px;display:grid;grid-template-columns:280px 1fr;gap:24px;align-items:start}
@media(max-width:820px){.main-wrap{grid-template-columns:1fr}}

/* PROFILE CARD */
.profile-card{background:var(--white);border:1.5px solid var(--line);border-radius:16px;overflow:hidden;box-shadow:0 4px 20px rgba(79,70,229,.08);position:sticky;top:80px}
.pc-body{padding:16px}
.pc-row{display:flex;align-items:flex-start;gap:10px;padding:10px 0;border-bottom:1px solid var(--line);font-size:13px}
.pc-row:last-child{border-bottom:none}
.pc-icon{width:30px;height:30px;border-radius:8px;background:var(--bg2);display:flex;align-items:center;justify-content:center;font-size:14px;flex-shrink:0}
.pc-lbl{font-size:11px;color:var(--muted);margin-bottom:1px}
.pc-val{font-size:13px;font-weight:600;color:var(--ink2);word-break:break-all}

/* STATS ROW */
.stats-row{display:grid;grid-template-columns:repeat(3,1fr);gap:12px;margin-bottom:22px}
.stat-mini{background:var(--white);border:1.5px solid var(--line);border-radius:12px;padding:16px;text-align:center;box-shadow:0 2px 6px rgba(79,70,229,.04)}
.sm-num{font-size:26px;font-weight:800;color:var(--ink);line-height:1}
.sm-lbl{font-size:11.5px;color:var(--muted);margin-top:4px;font-weight:600}

/* SECTION HEADER */
.sec-hdr{display:flex;align-items:center;gap:10px;margin-bottom:16px}
.sec-icon{width:34px;height:34px;border-radius:9px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:17px;box-shadow:0 3px 10px rgba(79,70,229,.2)}
.sec-title{font-size:15px;font-weight:800;color:var(--ink)}
.sec-sub{font-size:12px;color:var(--muted);margin-top:1px}

/* EVENT CARDS */
.reg-cards{display:flex;flex-direction:column;gap:14px}
.reg-card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 8px rgba(79,70,229,.04);transition:box-shadow .18s,transform .18s}
.reg-card:hover{box-shadow:0 6px 20px rgba(79,70,229,.1);transform:translateY(-2px)}
.reg-card::before{content:'';display:block;height:3px;background:linear-gradient(90deg,var(--pri),var(--acc))}
.reg-card-top{display:flex;align-items:center;gap:14px;padding:16px;border-bottom:1px solid var(--line)}
.rc-img{width:52px;height:52px;border-radius:11px;object-fit:cover;flex-shrink:0;border:1.5px solid var(--line)}
.rc-img-ph{width:52px;height:52px;border-radius:11px;background:linear-gradient(135deg,var(--bg2),#c7d2fe);display:flex;align-items:center;justify-content:center;font-size:24px;flex-shrink:0}
.rc-title{font-size:14.5px;font-weight:800;color:var(--ink);margin-bottom:3px}
.rc-org{font-size:12px;color:var(--muted)}
.rc-badges{display:flex;gap:6px;flex-wrap:wrap;margin-top:6px}
.badge{display:inline-flex;align-items:center;gap:3px;font-size:11.5px;font-weight:700;padding:2px 9px;border-radius:20px}
.badge.online{background:#ccfbf1;color:#0d9488}
.badge.offline{background:var(--bg2);color:var(--pri)}
.badge.team{background:var(--amber-bg);color:var(--amber)}
.badge.individual{background:var(--bg2);color:var(--pri)}
.badge.deadline{background:var(--red-bg);color:var(--red)}

/* TEAM SECTION */
.team-section{padding:14px 16px;background:var(--bg)}
.team-name-row{display:flex;align-items:center;gap:8px;margin-bottom:10px}
.tn-lbl{font-size:11.5px;font-weight:700;color:var(--sub);text-transform:uppercase;letter-spacing:.05em}
.tn-val{font-size:14px;font-weight:800;color:var(--pri)}
.leader-row{font-size:13px;color:var(--ink2);margin-bottom:10px;display:flex;align-items:center;gap:6px}
.members-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(170px,1fr));gap:8px}
.mc{display:flex;align-items:center;gap:8px;background:var(--white);border:1.5px solid #c7d2fe;border-radius:9px;padding:8px 11px}
.mc-dot{width:8px;height:8px;border-radius:50%;background:var(--pri);flex-shrink:0}
.mc-name{font-size:12.5px;font-weight:700;color:var(--ink2)}
.mc-email{font-size:11px;color:var(--muted);margin-top:1px}

/* ACTIONS */
.rc-actions{padding:10px 16px;display:flex;justify-content:flex-end}
.view-link{display:inline-flex;align-items:center;gap:5px;font-size:12px;font-weight:700;color:var(--pri);text-decoration:none;padding:5px 11px;background:var(--bg2);border-radius:20px;border:1px solid #c7d2fe;transition:background .15s}
.view-link:hover{background:#c7d2fe}

/* EMPTY */
.empty-box{text-align:center;padding:52px 20px;background:var(--white);border:1.5px solid var(--line);border-radius:var(--r)}
.empty-icon{font-size:48px;margin-bottom:12px}
.empty-title{font-size:16px;font-weight:700;color:var(--ink);margin-bottom:5px}
.empty-sub{font-size:13.5px;color:var(--muted);margin-bottom:18px}
.browse-btn{display:inline-flex;align-items:center;gap:6px;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:700;padding:10px 20px;border-radius:10px;text-decoration:none;box-shadow:0 4px 12px rgba(79,70,229,.22)}
</style>
</head>
<body>

<nav class="navbar">
  <div class="navbar-inner">
    <a href="/Home" class="nav-brand">
      <div class="nav-logo">CN</div>
      <span class="nav-brand-txt">CodeNova <span>SOU</span></span>
    </a>
    <div class="nav-actions">
      <a href="/Home" class="nav-home">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>
        Home
      </a>
      <a href="/logout" class="nav-logout">Logout</a>
    </div>
  </div>
</nav>

<!-- HERO -->
<div class="profile-hero">
  <div class="ph-circle"></div>
  <div class="ph-inner">
    <c:choose>
      <c:when test="${not empty user.profilePic}">
        <img src="${user.profilePic}" class="ph-avatar" alt=""/>
      </c:when>
      <c:otherwise>
        <div class="ph-avatar-ph">${fn:substring(user.firstName,0,1)}${fn:substring(user.lastName,0,1)}</div>
      </c:otherwise>
    </c:choose>
    <div class="ph-text">
      <div class="ph-label">👤 My Profile</div>
      <div class="ph-name">${user.firstName} ${user.lastName}</div>
      <div class="ph-email">${user.email}</div>
    </div>
  </div>
</div>

<!-- MAIN -->
<div class="main-wrap">

  <!-- LEFT: INFO CARD -->
  <div class="profile-card">
    <div class="pc-body">
      <div class="pc-row">
        <div class="pc-icon">📧</div>
        <div><div class="pc-lbl">Email</div><div class="pc-val">${user.email}</div></div>
      </div>
      <div class="pc-row">
        <div class="pc-icon">📱</div>
        <div><div class="pc-lbl">Mobile</div><div class="pc-val">${user.mobileNumber}</div></div>
      </div>
      <div class="pc-row">
        <div class="pc-icon">👤</div>
        <div><div class="pc-lbl">Gender</div><div class="pc-val">${user.gender}</div></div>
      </div>
      <div class="pc-row">
        <div class="pc-icon">🏷</div>
        <div><div class="pc-lbl">Role</div><div class="pc-val">${user.role}</div></div>
      </div>
      <div class="pc-row">
        <div class="pc-icon">📅</div>
        <div><div class="pc-lbl">Member Since</div><div class="pc-val">${user.createdAt}</div></div>
      </div>
      <div class="pc-row">
        <div class="pc-icon">🏆</div>
        <div><div class="pc-lbl">Events Joined</div><div class="pc-val">${fn:length(myEvents)}</div></div>
      </div>
    </div>
  </div>

  <!-- RIGHT: EVENTS -->
  <div>

    <!-- Stats -->
    <div class="stats-row">
      <div class="stat-mini">
        <div class="sm-num">${fn:length(myEvents)}</div>
        <div class="sm-lbl">Events Joined</div>
      </div>
      <div class="stat-mini">
        <c:set var="tc" value="0"/>
        <c:forEach var="ed" items="${myEvents}">
          <c:if test="${ed.participant.participationType == 'Team'}"><c:set var="tc" value="${tc+1}"/></c:if>
        </c:forEach>
        <div class="sm-num">${tc}</div>
        <div class="sm-lbl">Team Events</div>
      </div>
      <div class="stat-mini">
        <c:set var="ic" value="0"/>
        <c:forEach var="ed" items="${myEvents}">
          <c:if test="${ed.participant.participationType == 'Individual'}"><c:set var="ic" value="${ic+1}"/></c:if>
        </c:forEach>
        <div class="sm-num">${ic}</div>
        <div class="sm-lbl">Solo Events</div>
      </div>
    </div>

    <!-- Hackathon List -->
    <div class="sec-hdr">
      <div class="sec-icon">🏆</div>
      <div>
        <div class="sec-title">My Hackathons</div>
        <div class="sec-sub">Events you have registered for</div>
      </div>
    </div>

    <c:choose>
      <c:when test="${not empty myEvents}">
        <div class="reg-cards">
          <c:forEach var="ed" items="${myEvents}">
          <div class="reg-card">
            <div class="reg-card-top">
              <c:choose>
                <c:when test="${not empty ed.event.eventImage}">
                  <img src="${ed.event.eventImage}" class="rc-img" alt=""/>
                </c:when>
                <c:otherwise><div class="rc-img-ph">🏆</div></c:otherwise>
              </c:choose>
              <div style="flex:1;min-width:0">
                <div class="rc-title">${ed.event.eventTitle}</div>
                <div class="rc-org">${ed.event.organizationName}</div>
                <div class="rc-badges">
                  <span class="badge ${ed.participant.participationType == 'Team' ? 'team' : 'individual'}">
                    ${ed.participant.participationType == 'Team' ? '👥' : '🧑'} ${ed.participant.participationType}
                  </span>
                  <c:if test="${not empty ed.event.location}">
                    <span class="badge ${ed.event.location == 'Online' ? 'online' : 'offline'}">${ed.event.location}</span>
                  </c:if>
                  <c:if test="${not empty ed.event.lastDate}">
                    <span class="badge deadline">📅 ${ed.event.lastDate}</span>
                  </c:if>
                </div>
              </div>
            </div>

            <!-- Team Section -->
            <c:if test="${ed.participant.participationType == 'Team'}">
            <div class="team-section">
              <div class="team-name-row">
                <span class="tn-lbl">Team:</span>
                <span class="tn-val">${ed.participant.teamName}</span>
              </div>
              <div class="leader-row">
                👑 <strong>Leader:</strong>&nbsp;${ed.participant.teamLeader}
              </div>
              <c:if test="${not empty ed.members}">
                <div style="font-size:11.5px;font-weight:700;color:var(--sub);text-transform:uppercase;letter-spacing:.05em;margin-bottom:8px">
                  Members (${fn:length(ed.members)})
                </div>
                <div class="members-grid">
                  <c:forEach var="m" items="${ed.members}">
                    <div class="mc">
                      <div class="mc-dot"></div>
                      <div>
                        <div class="mc-name">${m.memberName}</div>
                        <c:if test="${not empty m.memberEmail}">
                          <div class="mc-email">${m.memberEmail}</div>
                        </c:if>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </c:if>
            </div>
            </c:if>

            <div class="rc-actions">
              <a href="/listEventDetails/${ed.event.eventId}" class="view-link">
                View Event
                <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
              </a>
            </div>
          </div>
          </c:forEach>
        </div>
      </c:when>
      <c:otherwise>
        <div class="empty-box">
          <div class="empty-icon">🎯</div>
          <div class="empty-title">No events joined yet</div>
          <div class="empty-sub">Explore hackathons and register to get started!</div>
          <a href="/listEvent" class="browse-btn">
            Browse Events
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
          </a>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</div>

</body>
</html>
