<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Live Leaderboard – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:#4f46e5;--pri-dk:#3730a3;--pri-lt:#818cf8;
  --acc:#0d9488;--acc-lt:#5eead4;
  --gold:#f59e0b;--silver:#94a3b8;--bronze:#c2826a;
  --ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;
  --line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#ffffff;
  --r:14px;
}
html{scroll-behavior:smooth}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh}

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

/* HERO BANNER */
.lb-hero{
  background:linear-gradient(135deg,#4f46e5 0%,#3730a3 40%,#0d9488 100%);
  position:relative;overflow:hidden;padding:52px 0 60px;
}
.lb-hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px;pointer-events:none}
.lb-hero::after{content:'';position:absolute;top:-100px;right:-100px;width:400px;height:400px;border-radius:50%;background:rgba(255,255,255,.05);pointer-events:none}
.lb-hero-inner{max-width:1160px;margin:0 auto;padding:0 28px;position:relative;z-index:1;text-align:center}
.lb-hero-badge{display:inline-flex;align-items:center;gap:7px;background:rgba(255,255,255,.15);backdrop-filter:blur(8px);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:12px;font-weight:700;letter-spacing:.07em;text-transform:uppercase;padding:5px 14px;border-radius:20px;margin-bottom:14px}
.lb-hero-badge .dot{width:7px;height:7px;border-radius:50%;background:#4ade80;box-shadow:0 0 6px #4ade80;animation:pulse 1.5s infinite}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.4}}
.lb-h1{font-size:clamp(26px,4vw,44px);font-weight:800;color:#fff;margin-bottom:10px}
.lb-h1 em{font-style:normal;color:var(--acc-lt)}
.lb-sub{font-size:15px;color:rgba(255,255,255,.72);margin-bottom:28px}

/* event filter tabs */
.lb-tabs{display:flex;gap:8px;justify-content:center;flex-wrap:wrap}
.lb-tab{background:rgba(255,255,255,.12);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,.2);color:rgba(255,255,255,.8);font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;font-weight:600;padding:8px 18px;border-radius:10px;cursor:pointer;transition:all .18s}
.lb-tab:hover,.lb-tab.active{background:rgba(255,255,255,.25);border-color:rgba(255,255,255,.5);color:#fff;font-weight:700}

/* MAIN CONTENT */
.lb-wrap{max-width:900px;margin:0 auto;padding:40px 28px 60px}

/* PODIUM */
.podium-section{margin-bottom:40px}
.podium-title{font-size:13px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.08em;margin-bottom:20px;text-align:center}
.podium{display:flex;align-items:flex-end;justify-content:center;gap:12px}
.podium-card{
  flex:1;max-width:200px;border-radius:16px;
  display:flex;flex-direction:column;align-items:center;
  padding:24px 16px 20px;position:relative;
  border:2px solid transparent;
  transition:transform .2s,box-shadow .2s;
  cursor:default;
}
.podium-card:hover{transform:translateY(-4px)}
.podium-card.first{background:linear-gradient(160deg,#fef3c7,#fffbeb);border-color:#f59e0b;box-shadow:0 8px 28px rgba(245,158,11,.2);order:2;padding-top:36px}
.podium-card.second{background:linear-gradient(160deg,#f1f5f9,#f8fafc);border-color:#94a3b8;box-shadow:0 6px 20px rgba(148,163,184,.15);order:1}
.podium-card.third{background:linear-gradient(160deg,#fdf4f0,#fef9f7);border-color:#c2826a;box-shadow:0 6px 20px rgba(194,130,106,.15);order:3}

.podium-crown{position:absolute;top:-18px;font-size:28px;filter:drop-shadow(0 2px 4px rgba(0,0,0,.15))}
.podium-rank{font-size:11px;font-weight:800;letter-spacing:.1em;text-transform:uppercase;margin-bottom:10px;padding:3px 10px;border-radius:20px}
.podium-card.first .podium-rank{color:#92400e;background:#fde68a}
.podium-card.second .podium-rank{color:#475569;background:#e2e8f0}
.podium-card.third .podium-rank{color:#7c2d12;background:#fed7aa}

.podium-avatar{width:60px;height:60px;border-radius:50%;object-fit:cover;border:3px solid;margin-bottom:10px}
.podium-card.first .podium-avatar{border-color:var(--gold)}
.podium-card.second .podium-avatar{border-color:var(--silver)}
.podium-card.third .podium-avatar{border-color:var(--bronze)}
.podium-avatar-ph{width:60px;height:60px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:22px;font-weight:800;color:#fff;margin-bottom:10px;border:3px solid}
.podium-card.first .podium-avatar-ph{background:linear-gradient(135deg,var(--gold),#ef4444);border-color:var(--gold)}
.podium-card.second .podium-avatar-ph{background:linear-gradient(135deg,var(--silver),#64748b);border-color:var(--silver)}
.podium-card.third .podium-avatar-ph{background:linear-gradient(135deg,var(--bronze),#dc2626);border-color:var(--bronze)}

.podium-name{font-size:13.5px;font-weight:800;color:var(--ink);text-align:center;margin-bottom:3px}
.podium-team{font-size:11.5px;color:var(--sub);text-align:center;margin-bottom:8px}
.podium-score{font-size:22px;font-weight:800;color:var(--pri)}
.podium-score-lbl{font-size:10.5px;color:var(--muted);font-weight:600}

/* RANKINGS TABLE */
.rank-section{}
.rank-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:16px;flex-wrap:wrap;gap:10px}
.rank-title{font-size:16px;font-weight:800;color:var(--ink)}
.rank-count{font-size:12px;color:var(--muted);background:var(--bg2);border:1px solid #c7d2fe;padding:4px 12px;border-radius:20px;font-weight:600}

.rank-table{background:var(--white);border-radius:var(--r);border:1.5px solid var(--line);overflow:hidden;box-shadow:0 4px 16px rgba(79,70,229,.06)}
.rank-row{display:grid;grid-template-columns:56px 1fr 110px 90px;align-items:center;padding:14px 20px;border-bottom:1px solid var(--line);transition:background .15s}
.rank-row:last-child{border-bottom:none}
.rank-row:hover{background:var(--bg)}
.rank-row.header-row{background:var(--bg2);font-size:11px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.07em;padding:10px 20px}
.rank-row.me{background:linear-gradient(90deg,var(--bg2),var(--white));border-left:3px solid var(--pri)}

.rank-pos{font-size:14px;font-weight:800;color:var(--ink2)}
.rank-pos.gold{color:var(--gold)}
.rank-pos.silver{color:var(--silver)}
.rank-pos.bronze{color:var(--bronze)}
.rank-medal{font-size:18px}

.rank-user{display:flex;align-items:center;gap:10px}
.rank-avt{width:36px;height:36px;border-radius:50%;object-fit:cover;border:2px solid var(--line)}
.rank-avt-ph{width:36px;height:36px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:700;color:#fff;border:2px solid #c7d2fe}
.rank-name{font-size:13.5px;font-weight:700;color:var(--ink)}
.rank-team{font-size:11.5px;color:var(--sub)}

.rank-event{font-size:12px;color:var(--sub);font-weight:600}
.rank-score-cell{text-align:right}
.rank-score{font-size:16px;font-weight:800;color:var(--pri)}
.rank-score-bar{height:4px;border-radius:4px;background:linear-gradient(90deg,var(--pri),var(--acc));margin-top:4px;transition:width .6s}

/* empty state */
.empty-lb{text-align:center;padding:60px 20px}
.empty-lb .ei{font-size:52px;margin-bottom:14px}
.empty-lb .et{font-size:16px;font-weight:700;color:var(--ink);margin-bottom:6px}
.empty-lb .es{font-size:13px;color:var(--muted)}

/* FOOTER */
.footer{background:linear-gradient(135deg,var(--pri-dk),#1e1b4b);padding:28px 0}
.footer-inner{max-width:1160px;margin:0 auto;padding:0 28px;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:14px}
.footer-brand{display:flex;align-items:center;gap:10px}
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
      <a href="leaderboard" class="nav-link active">Leaderboard</a>
    </div>
    <div class="nav-actions">
      <%
        Object loggedUser = session.getAttribute("loggedUser");
        if (loggedUser != null) {
          com.Entity.UserEntity u = (com.Entity.UserEntity) loggedUser;
          String pic = u.getProfilePic();
          String fname = u.getFirstName() != null ? u.getFirstName() : "";
          String lname = u.getLastName()  != null ? u.getLastName()  : "";
          String initials = (fname.length()>0 ? String.valueOf(fname.charAt(0)):"")
                          + (lname.length()>0 ? String.valueOf(lname.charAt(0)):"");
      %>
        <% if (pic != null && !pic.isEmpty()) { %>
          <img src="<%= pic %>" style="width:36px;height:36px;border-radius:50%;object-fit:cover;border:2px solid var(--pri-lt);cursor:pointer" alt="Profile"/>
        <% } else { %>
          <div style="width:36px;height:36px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;color:#fff;border:2px solid var(--pri-lt)"><%= initials.toUpperCase() %></div>
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
<div class="lb-hero">
  <div class="lb-hero-inner">
    <div class="lb-hero-badge">
      <span class="dot"></span> Live Rankings
    </div>
    <h1 class="lb-h1">🏆 Live <em>Leaderboard</em></h1>
    <p class="lb-sub">Top performers ranked by judge scores across all events</p>

    <!-- Event filter tabs — dynamically built via JSTL -->
    <div class="lb-tabs">
      <button class="lb-tab active" onclick="filterEvent('all', this)">All Events</button>
      <c:forEach var="ev" items="${eventList}">
        <button class="lb-tab" onclick="filterEvent('${ev.eventId}', this)">${ev.eventTitle}</button>
      </c:forEach>
    </div>
  </div>
</div>

<!-- MAIN -->
<div class="lb-wrap">

  <!-- PODIUM: top 3 -->
  <c:if test="${not empty leaderboard}">
  <div class="podium-section">
    <div class="podium-title">Top 3 Champions</div>
    <div class="podium">

      <%-- 2nd place --%>
      <c:if test="${fn:length(leaderboard) >= 2}">
        <c:set var="p2" value="${leaderboard[1]}"/>
        <div class="podium-card second">
          <div class="podium-rank">2nd</div>
          <c:choose>
            <c:when test="${not empty p2.profilePic}">
              <img src="${p2.profilePic}" class="podium-avatar"/>
            </c:when>
            <c:otherwise>
              <div class="podium-avatar-ph">${fn:substring(p2.userName,0,1)}</div>
            </c:otherwise>
          </c:choose>
          <div class="podium-name">${p2.userName}</div>
          <div class="podium-team">${p2.teamName}</div>
          <div class="podium-score">${p2.totalScore}</div>
          <div class="podium-score-lbl">points</div>
        </div>
      </c:if>

      <%-- 1st place --%>
      <c:if test="${fn:length(leaderboard) >= 1}">
        <c:set var="p1" value="${leaderboard[0]}"/>
        <div class="podium-card first">
          <div class="podium-crown">👑</div>
          <div class="podium-rank">1st</div>
          <c:choose>
            <c:when test="${not empty p1.profilePic}">
              <img src="${p1.profilePic}" class="podium-avatar"/>
            </c:when>
            <c:otherwise>
              <div class="podium-avatar-ph">${fn:substring(p1.userName,0,1)}</div>
            </c:otherwise>
          </c:choose>
          <div class="podium-name">${p1.userName}</div>
          <div class="podium-team">${p1.teamName}</div>
          <div class="podium-score">${p1.totalScore}</div>
          <div class="podium-score-lbl">points</div>
        </div>
      </c:if>

      <%-- 3rd place --%>
      <c:if test="${fn:length(leaderboard) >= 3}">
        <c:set var="p3" value="${leaderboard[2]}"/>
        <div class="podium-card third">
          <div class="podium-rank">3rd</div>
          <c:choose>
            <c:when test="${not empty p3.profilePic}">
              <img src="${p3.profilePic}" class="podium-avatar"/>
            </c:when>
            <c:otherwise>
              <div class="podium-avatar-ph">${fn:substring(p3.userName,0,1)}</div>
            </c:otherwise>
          </c:choose>
          <div class="podium-name">${p3.userName}</div>
          <div class="podium-team">${p3.teamName}</div>
          <div class="podium-score">${p3.totalScore}</div>
          <div class="podium-score-lbl">points</div>
        </div>
      </c:if>

    </div>
  </div>
  </c:if>

  <!-- FULL RANKINGS TABLE -->
  <div class="rank-section">
    <div class="rank-header">
      <div class="rank-title">Full Rankings</div>
      <div class="rank-count">${fn:length(leaderboard)} participants</div>
    </div>

    <c:choose>
      <c:when test="${not empty leaderboard}">
        <div class="rank-table">
          <div class="rank-row header-row">
            <div>Rank</div>
            <div>Participant</div>
            <div>Event</div>
            <div style="text-align:right">Score</div>
          </div>
          <c:forEach var="entry" items="${leaderboard}" varStatus="st">
            <c:set var="loggedId" value=""/>
            <%
              Object lu = session.getAttribute("loggedUser");
              if(lu != null){ pageContext.setAttribute("loggedId", ((com.Entity.UserEntity)lu).getId()); }
            %>
            <div class="rank-row ${entry.userId == loggedId ? 'me' : ''}">
              <div class="rank-pos ${st.index==0?'gold':st.index==1?'silver':st.index==2?'bronze':''}">
                <c:choose>
                  <c:when test="${st.index==0}"><span class="rank-medal">🥇</span></c:when>
                  <c:when test="${st.index==1}"><span class="rank-medal">🥈</span></c:when>
                  <c:when test="${st.index==2}"><span class="rank-medal">🥉</span></c:when>
                  <c:otherwise>#${st.index+1}</c:otherwise>
                </c:choose>
              </div>
              <div class="rank-user">
                <c:choose>
                  <c:when test="${not empty entry.profilePic}">
                    <img src="${entry.profilePic}" class="rank-avt"/>
                  </c:when>
                  <c:otherwise>
                    <div class="rank-avt-ph">${fn:substring(entry.userName,0,1)}</div>
                  </c:otherwise>
                </c:choose>
                <div>
                  <div class="rank-name">${entry.userName}</div>
                  <div class="rank-team">${entry.teamName}</div>
                </div>
              </div>
              <div class="rank-event">${entry.eventTitle}</div>
              <div class="rank-score-cell">
                <div class="rank-score">${entry.totalScore}</div>
                <div class="rank-score-bar" style="width:${entry.totalScore}%"></div>
              </div>
            </div>
          </c:forEach>
        </div>
      </c:when>
      <c:otherwise>
        <div class="empty-lb">
          <div class="ei">🏆</div>
          <div class="et">No scores yet</div>
          <div class="es">Rankings will appear once judges review submissions.</div>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

</div>

<!-- FOOTER -->
<footer class="footer">
  <div class="footer-inner">
    <div class="footer-brand">
      <div class="nav-logo" style="width:36px;height:36px;font-size:14px">CN</div>
      <span style="font-size:15px;font-weight:800;color:#fff">CodeNova <span style="color:var(--acc-lt)">SOU</span></span>
    </div>
    <p class="footer-copy">© 2026 CodeNova SOU · Silver Oak University</p>
  </div>
</footer>

<script>
function filterEvent(eventId, btn) {
  // Tab highlight
  document.querySelectorAll('.lb-tab').forEach(t => t.classList.remove('active'));
  btn.classList.add('active');
  // Redirect with filter param
  if (eventId === 'all') {
    window.location.href = 'leaderboard';
  } else {
    window.location.href = 'leaderboard?eventId=' + eventId;
  }
}
</script>
</body>
</html>
