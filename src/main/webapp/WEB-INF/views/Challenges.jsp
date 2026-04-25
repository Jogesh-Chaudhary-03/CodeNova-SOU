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
<title>Exciting Challenges – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:#4f46e5;--pri-dk:#3730a3;--pri-lt:#818cf8;
  --acc:#0d9488;--acc-lt:#5eead4;
  --ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;
  --line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#ffffff;
  --green:#059669;--green-bg:#d1fae5;
  --red:#dc2626;--red-bg:#fee2e2;
  --amber:#d97706;--amber-bg:#fef3c7;
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
.ch-hero{
  background:linear-gradient(135deg,#4f46e5 0%,#3730a3 40%,#0d9488 100%);
  position:relative;overflow:hidden;padding:60px 0 72px;
}
.ch-hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px;pointer-events:none}
.ch-hero-cr{position:absolute;top:-80px;right:-80px;width:360px;height:360px;border-radius:50%;background:rgba(255,255,255,.05);pointer-events:none}
.ch-hero-cr2{position:absolute;bottom:-60px;left:5%;width:200px;height:200px;border-radius:50%;background:rgba(13,148,136,.2);pointer-events:none}
.ch-hero-inner{max-width:1160px;margin:0 auto;padding:0 28px;position:relative;z-index:1}
.ch-hero-eyebrow{display:inline-flex;align-items:center;gap:7px;background:rgba(255,255,255,.14);backdrop-filter:blur(8px);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:12px;font-weight:700;letter-spacing:.07em;text-transform:uppercase;padding:5px 14px;border-radius:20px;margin-bottom:16px}
.ch-h1{font-size:clamp(28px,4vw,46px);font-weight:800;color:#fff;line-height:1.18;margin-bottom:14px}
.ch-h1 em{font-style:normal;color:var(--acc-lt)}
.ch-sub{font-size:15px;color:rgba(255,255,255,.72);max-width:520px;line-height:1.7;margin-bottom:28px}

/* Filter bar */
.ch-filters{display:flex;gap:8px;flex-wrap:wrap}
.ch-filter-btn{background:rgba(255,255,255,.12);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,.2);color:rgba(255,255,255,.8);font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;font-weight:600;padding:8px 16px;border-radius:10px;cursor:pointer;transition:all .18s}
.ch-filter-btn:hover,.ch-filter-btn.active{background:rgba(255,255,255,.25);border-color:rgba(255,255,255,.5);color:#fff;font-weight:700}

/* STATS ROW */
.stats-row{max-width:1160px;margin:-28px auto 0;padding:0 28px;position:relative;z-index:10}
.stats-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
@media(max-width:760px){.stats-grid{grid-template-columns:repeat(2,1fr)}}
.stat-card{background:var(--white);border:1.5px solid var(--line);border-radius:14px;padding:18px 20px;display:flex;align-items:center;gap:14px;box-shadow:0 4px 16px rgba(79,70,229,.07);transition:transform .2s,box-shadow .2s}
.stat-card:hover{transform:translateY(-3px);box-shadow:0 8px 24px rgba(79,70,229,.12)}
.stat-icon{width:44px;height:44px;border-radius:12px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:20px;flex-shrink:0;box-shadow:0 4px 10px rgba(79,70,229,.25)}
.stat-val{font-size:22px;font-weight:800;color:var(--ink)}
.stat-lbl{font-size:11.5px;color:var(--muted);font-weight:600;margin-top:2px}

/* MAIN CONTENT */
.ch-main{max-width:1160px;margin:40px auto 60px;padding:0 28px}

/* SEARCH + SORT BAR */
.ch-toolbar{display:flex;align-items:center;gap:12px;margin-bottom:28px;flex-wrap:wrap}
.ch-search{flex:1;min-width:220px;position:relative}
.ch-search input{width:100%;padding:10px 16px 10px 40px;border:1.5px solid var(--line);border-radius:10px;font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;color:var(--ink);background:var(--white);outline:none;transition:border-color .18s}
.ch-search input:focus{border-color:var(--pri)}
.ch-search-ic{position:absolute;left:12px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none}
.ch-sort{display:flex;gap:6px;flex-wrap:wrap}
.sort-btn{background:var(--white);border:1.5px solid var(--line);color:var(--sub);font-family:'Plus Jakarta Sans',sans-serif;font-size:12.5px;font-weight:600;padding:8px 14px;border-radius:8px;cursor:pointer;transition:all .16s}
.sort-btn:hover,.sort-btn.active{background:var(--bg2);border-color:#c7d2fe;color:var(--pri)}
.result-count{font-size:13px;color:var(--muted);font-weight:600;white-space:nowrap;margin-left:auto}

/* CHALLENGE CARDS GRID */
.ch-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:20px}
@media(max-width:900px){.ch-grid{grid-template-columns:repeat(2,1fr)}}
@media(max-width:580px){.ch-grid{grid-template-columns:1fr}}

/* CARD */
.ch-card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;display:flex;flex-direction:column;box-shadow:0 2px 8px rgba(79,70,229,.04);transition:transform .22s,box-shadow .22s,border-color .22s;cursor:pointer;text-decoration:none;color:inherit}
.ch-card:hover{transform:translateY(-6px);box-shadow:0 14px 36px rgba(79,70,229,.14);border-color:#c7d2fe}
.ch-card-img{width:100%;height:150px;object-fit:cover;display:block;transition:transform .3s}
.ch-card:hover .ch-card-img{transform:scale(1.04)}
.ch-card-img-ph{width:100%;height:150px;background:linear-gradient(135deg,var(--bg2),#c7d2fe);display:flex;align-items:center;justify-content:center;font-size:48px}
.ch-card-body{padding:16px;flex:1;display:flex;flex-direction:column}
.ch-card-badges{display:flex;gap:6px;flex-wrap:wrap;margin-bottom:10px}
.ch-badge{font-size:10.5px;font-weight:700;padding:3px 8px;border-radius:20px}
.ch-badge.type{background:var(--bg2);color:var(--pri);border:1px solid #c7d2fe}
.ch-badge.loc{background:#f0fdf4;color:var(--green);border:1px solid #bbf7d0}
.ch-badge.days.green{background:var(--green-bg);color:var(--green)}
.ch-badge.days.amber{background:var(--amber-bg);color:var(--amber)}
.ch-badge.days.red{background:var(--red-bg);color:var(--red)}
.ch-badge.days.done{background:#f1f5f9;color:var(--muted)}
.ch-card-title{font-size:14.5px;font-weight:800;color:var(--ink);line-height:1.35;margin-bottom:4px}
.ch-card-org{font-size:12.5px;font-weight:700;color:var(--pri);margin-bottom:8px}
.ch-card-tags{display:flex;gap:5px;flex-wrap:nowrap;overflow:hidden;margin-bottom:12px}
.ch-tag{background:var(--bg);color:var(--ink2);border:1px solid var(--line);padding:2px 8px;font-size:11px;font-weight:600;border-radius:20px;white-space:nowrap}
.ch-card-footer{margin-top:auto;padding-top:12px;border-top:1px solid var(--line);display:flex;align-items:center;justify-content:space-between}
.ch-deadline{font-size:11.5px;color:var(--muted)}
.ch-view-btn{display:inline-flex;align-items:center;gap:4px;font-size:12px;font-weight:700;color:var(--pri);background:var(--bg2);border:1px solid #c7d2fe;padding:5px 12px;border-radius:20px;transition:background .16s,color .16s;text-decoration:none}
.ch-card:hover .ch-view-btn{background:var(--pri);color:#fff;border-color:var(--pri)}

/* PRIZE HIGHLIGHT STRIP */
.prize-strip{background:linear-gradient(135deg,var(--pri),var(--acc));border-radius:var(--r);padding:28px 32px;margin-bottom:36px;display:flex;align-items:center;gap:24px;flex-wrap:wrap;overflow:hidden;position:relative}
.prize-strip::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.08) 1px,transparent 1px);background-size:20px 20px}
.prize-strip-icon{font-size:48px;flex-shrink:0;position:relative;z-index:1}
.prize-strip-text{position:relative;z-index:1;flex:1}
.prize-strip-title{font-size:18px;font-weight:800;color:#fff;margin-bottom:4px}
.prize-strip-sub{font-size:13.5px;color:rgba(255,255,255,.75);line-height:1.6}
.prize-strip-btn{position:relative;z-index:1;flex-shrink:0;display:inline-flex;align-items:center;gap:6px;background:#fff;color:var(--pri);font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:800;padding:11px 22px;border-radius:10px;text-decoration:none;box-shadow:0 4px 14px rgba(0,0,0,.15);transition:transform .18s}
.prize-strip-btn:hover{transform:translateY(-2px)}

/* no events */
.no-ch{grid-column:1/-1;text-align:center;padding:60px 20px}
.no-ch .ni{font-size:52px;margin-bottom:14px}
.no-ch .nt{font-size:16px;font-weight:700;color:var(--ink);margin-bottom:6px}
.no-ch .ns{font-size:13px;color:var(--muted)}

/* FOOTER */
.footer{background:linear-gradient(135deg,var(--pri-dk),#1e1b4b);padding:28px 0;margin-top:0}
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
      <a href="listEvent" class="nav-link">All Events</a>
      <a href="challenges" class="nav-link active">Challenges</a>
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
          <img src="<%= pic %>" style="width:36px;height:36px;border-radius:50%;object-fit:cover;border:2px solid var(--pri-lt)" alt=""/>
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
<div class="ch-hero">
  <div class="ch-hero-cr"></div>
  <div class="ch-hero-cr2"></div>
  <div class="ch-hero-inner">
    <div class="ch-hero-eyebrow">💡 Open Challenges</div>
    <h1 class="ch-h1">Exciting <em>Challenges</em><br>Await You</h1>
    <p class="ch-sub">Solve real-world problems, build innovative solutions, and compete with the brightest minds at Silver Oak University.</p>
    <div class="ch-filters">
      <button class="ch-filter-btn active" onclick="filterType('all',this)">All</button>
      <button class="ch-filter-btn" onclick="filterType('Individual',this)">👤 Individual</button>
      <button class="ch-filter-btn" onclick="filterType('Team',this)">👥 Team</button>
      <button class="ch-filter-btn" onclick="filterType('Online',this)">🌐 Online</button>
      <button class="ch-filter-btn" onclick="filterType('Offline',this)">📍 Offline</button>
    </div>
  </div>
</div>

<!-- STATS ROW -->
<div class="stats-row">
  <div class="stats-grid">
    <div class="stat-card">
      <div class="stat-icon">🎯</div>
      <div>
        <div class="stat-val" id="totalCount">0</div>
        <div class="stat-lbl">Total Challenges</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon">⏳</div>
      <div>
        <div class="stat-val" id="activeCount">0</div>
        <div class="stat-lbl">Active Now</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon">👥</div>
      <div>
        <div class="stat-val" id="teamCount">0</div>
        <div class="stat-lbl">Team Events</div>
      </div>
    </div>
    <div class="stat-card">
      <div class="stat-icon">🌐</div>
      <div>
        <div class="stat-val" id="onlineCount">0</div>
        <div class="stat-lbl">Online Events</div>
      </div>
    </div>
  </div>
</div>

<!-- MAIN -->
<div class="ch-main" style="margin-top:52px">

  <!-- PRIZE STRIP -->
  <div class="prize-strip">
    <div class="prize-strip-icon">🏆</div>
    <div class="prize-strip-text">
      <div class="prize-strip-title">Compete for Amazing Prizes!</div>
      <div class="prize-strip-sub">Cash awards, internship opportunities, certificates of excellence & much more waiting for top performers.</div>
    </div>
    <a href="listEvent" class="prize-strip-btn">
      Explore All Events
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
    </a>
  </div>

  <!-- TOOLBAR -->
  <div class="ch-toolbar">
    <div class="ch-search">
      <svg class="ch-search-ic" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
      <input type="text" id="searchInput" placeholder="Search challenges by title, skills..." oninput="applyFilters()"/>
    </div>
    <div class="ch-sort">
      <button class="sort-btn active" onclick="sortCards('newest',this)">Newest</button>
      <button class="sort-btn" onclick="sortCards('deadline',this)">Deadline</button>
    </div>
    <div class="result-count" id="resultCount"></div>
  </div>

  <!-- GRID -->
  <div class="ch-grid" id="challGrid">
    <c:choose>
      <c:when test="${not empty eventList}">
        <c:forEach var="event" items="${eventList}">
          <%
            AddEventEntity ev = (AddEventEntity) pageContext.getAttribute("event");
            LocalDate today = LocalDate.now();
            LocalDate ld = ev.getLastDate();
            long dLeft = 0;
            String dClass = "done";
            String dLabel = "Completed";
            if (ld != null) {
              dLeft = ChronoUnit.DAYS.between(today, ld);
              if      (dLeft > 7)  { dClass = "green";  dLabel = dLeft + " days left"; }
              else if (dLeft > 3)  { dClass = "amber";  dLabel = dLeft + " days left"; }
              else if (dLeft >= 0) { dClass = "red";    dLabel = dLeft + " days left"; }
              else                 { dClass = "done";   dLabel = "Completed"; }
            }
            String evType = ev.getParticipationType() != null ? ev.getParticipationType() : "";
            String evLoc  = ev.getLocation() != null ? ev.getLocation() : "";
            String evTags = ev.getSkillTags() != null ? ev.getSkillTags() : "";
          %>
          <a href="listEventDetails/${event.eventId}" class="ch-card"
             data-type="<%= evType %>"
             data-loc="<%= evLoc %>"
             data-title="${fn:toLowerCase(event.eventTitle)}"
             data-tags="${fn:toLowerCase(event.skillTags)}"
             data-days="<%= dLeft %>"
             data-posted="${event.postedDate}">

            <c:choose>
              <c:when test="${not empty event.eventImage}">
                <img src="${event.eventImage}" class="ch-card-img" alt="${event.eventTitle}"/>
              </c:when>
              <c:otherwise>
                <div class="ch-card-img-ph">💡</div>
              </c:otherwise>
            </c:choose>

            <div class="ch-card-body">
              <div class="ch-card-badges">
                <span class="ch-badge type">${event.participationType}</span>
                <span class="ch-badge loc">${event.location}</span>
                <span class="ch-badge days <%= dClass %>">⏰ <%= dLabel %></span>
              </div>
              <div class="ch-card-title">${event.eventTitle}</div>
              <div class="ch-card-org">${event.organizationName}</div>
              <c:if test="${not empty event.skillTags}">
                <div class="ch-card-tags">
                  <c:set var="tc" value="0"/>
                  <c:forTokens items="${event.skillTags}" delims="," var="tag">
                    <c:set var="tc" value="${tc+1}"/>
                    <c:if test="${tc<=3}"><span class="ch-tag">${fn:trim(tag)}</span></c:if>
                  </c:forTokens>
                  <c:if test="${tc>3}"><span class="ch-tag">+${tc-3}</span></c:if>
                </div>
              </c:if>
              <div class="ch-card-footer">
                <span class="ch-deadline">Deadline: ${event.lastDate}</span>
                <span class="ch-view-btn">
                  View Challenge
                  <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
                </span>
              </div>
            </div>
          </a>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="no-ch">
          <div class="ni">💡</div>
          <div class="nt">No challenges yet</div>
          <div class="ns">New challenges are coming soon. Stay tuned!</div>
        </div>
      </c:otherwise>
    </c:choose>
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

<script>
var allCards = Array.from(document.querySelectorAll('.ch-card'));
var currentType = 'all';
var currentSearch = '';
var currentSort = 'newest';

// Count stats on load
document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('totalCount').textContent  = allCards.length;
  document.getElementById('activeCount').textContent = allCards.filter(c => parseInt(c.dataset.days||'-1') >= 0).length;
  document.getElementById('teamCount').textContent   = allCards.filter(c => c.dataset.type === 'Team').length;
  document.getElementById('onlineCount').textContent = allCards.filter(c => c.dataset.loc === 'Online').length;
  updateCount(allCards.length);
});

function filterType(type, btn) {
  currentType = type;
  document.querySelectorAll('.ch-filter-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
  applyFilters();
}

function sortCards(method, btn) {
  currentSort = method;
  document.querySelectorAll('.sort-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
  applyFilters();
}

function applyFilters() {
  currentSearch = document.getElementById('searchInput').value.toLowerCase();
  var grid = document.getElementById('challGrid');
  var filtered = allCards.filter(function(c){
    var typeMatch = currentType === 'all'
      || c.dataset.type === currentType
      || c.dataset.loc === currentType;
    var searchMatch = !currentSearch
      || c.dataset.title.includes(currentSearch)
      || c.dataset.tags.includes(currentSearch);
    return typeMatch && searchMatch;
  });

  // Sort
  filtered.sort(function(a, b){
    if (currentSort === 'deadline') {
      return parseInt(a.dataset.days||999) - parseInt(b.dataset.days||999);
    }
    // newest — by posted date desc
    return (b.dataset.posted || '').localeCompare(a.dataset.posted || '');
  });

  // Re-render
  allCards.forEach(c => { c.style.display = 'none'; });
  filtered.forEach(c => {
    c.style.display = '';
    grid.appendChild(c);
  });
  updateCount(filtered.length);
}

function updateCount(n) {
  document.getElementById('resultCount').textContent = n + ' challenge' + (n===1?'':'s') + ' found';
}
</script>
</body>
</html>
