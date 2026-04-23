<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:#4f46e5;--pri-dk:#3730a3;--acc:#0d9488;--acc-lt:#5eead4;
  --ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;
  --line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#fff;
  --green:#059669;--green-bg:#d1fae5;
  --red:#dc2626;--red-bg:#fee2e2;
  --amber:#d97706;--amber-bg:#fef3c7;
  --r:12px;--nav-w:240px;
}
html{scroll-behavior:smooth}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh;display:flex}

/* SIDEBAR */
.sidebar{
  width:var(--nav-w);flex-shrink:0;position:fixed;top:0;left:0;
  height:100vh;z-index:100;overflow-y:auto;
  background:linear-gradient(180deg,#1e1b4b 0%,#312e81 55%,#0d9488 100%);
  display:flex;flex-direction:column;
}
.sidebar::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.04) 1px,transparent 1px);background-size:22px 22px;pointer-events:none}
.sb-in{position:relative;z-index:1;display:flex;flex-direction:column;height:100%}

.sb-brand{display:flex;align-items:center;gap:10px;padding:20px;border-bottom:1px solid rgba(255,255,255,.1)}
.sb-logo{width:36px;height:36px;border-radius:9px;background:rgba(255,255,255,.18);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,.25);display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;color:#fff;flex-shrink:0}
.sb-brand-txt{font-size:14px;font-weight:800;color:#fff}
.sb-brand-txt span{color:var(--acc-lt)}

.sb-admin{display:flex;align-items:center;gap:10px;padding:14px 20px;border-bottom:1px solid rgba(255,255,255,.08);background:rgba(255,255,255,.05)}
.sb-av{width:36px;height:36px;border-radius:50%;border:2px solid rgba(255,255,255,.25);flex-shrink:0;background:rgba(255,255,255,.15);display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;color:#fff;overflow:hidden}
.sb-av img{width:100%;height:100%;object-fit:cover}
.sb-aname{font-size:12.5px;font-weight:700;color:#fff}
.sb-arole{font-size:10.5px;color:rgba(255,255,255,.45);margin-top:1px}

.sb-nav{flex:1;padding:10px}
.sb-lbl{font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:rgba(255,255,255,.3);padding:10px 8px 4px}
.sb-btn{display:flex;align-items:center;gap:9px;padding:9px 11px;border-radius:9px;font-size:13px;font-weight:600;color:rgba(255,255,255,.6);text-decoration:none;cursor:pointer;border:none;background:none;width:100%;text-align:left;transition:background .15s,color .15s;margin-bottom:2px}
.sb-btn:hover{background:rgba(255,255,255,.1);color:#fff}
.sb-btn.active{background:rgba(255,255,255,.15);color:#fff;font-weight:700}
.sb-btn svg{flex-shrink:0;opacity:.8}
.sb-btn.active svg{opacity:1}
.sb-cnt{margin-left:auto;background:rgba(255,255,255,.15);font-size:10px;font-weight:800;padding:1px 7px;border-radius:20px;color:#fff}

.sb-foot{padding:12px;border-top:1px solid rgba(255,255,255,.1)}
.sb-logout{display:flex;align-items:center;gap:9px;padding:9px 11px;border-radius:9px;font-size:13px;font-weight:600;color:rgba(255,255,255,.45);text-decoration:none;transition:background .15s,color .15s}
.sb-logout:hover{background:rgba(220,38,38,.2);color:#fca5a5}

/* MAIN */
.main{margin-left:var(--nav-w);flex:1;display:flex;flex-direction:column;min-height:100vh}

.topbar{background:var(--white);border-bottom:1.5px solid var(--line);padding:0 28px;height:58px;display:flex;align-items:center;justify-content:space-between;position:sticky;top:0;z-index:50;box-shadow:0 2px 8px rgba(79,70,229,.06)}
.tb-title{font-size:15px;font-weight:800;color:var(--ink)}
.tb-right{display:flex;align-items:center;gap:12px}
.tb-date{font-size:12px;color:var(--muted)}
.add-btn{display:inline-flex;align-items:center;gap:6px;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:12.5px;font-weight:700;padding:7px 16px;border-radius:9px;text-decoration:none;box-shadow:0 3px 10px rgba(79,70,229,.25);transition:opacity .15s,transform .15s}
.add-btn:hover{opacity:.9;transform:translateY(-1px)}

.content{padding:24px 28px;flex:1}

/* SECTIONS */
.sec{display:none}
.sec.active{display:block;animation:fadeUp .2s ease}
@keyframes fadeUp{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:translateY(0)}}

.pg-title{font-size:19px;font-weight:800;color:var(--ink);margin-bottom:20px;display:flex;align-items:center;gap:10px}
.pg-icon{width:36px;height:36px;border-radius:10px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:17px;box-shadow:0 4px 12px rgba(79,70,229,.25)}

/* STATS */
.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:24px}
@media(max-width:860px){.stats{grid-template-columns:repeat(2,1fr)}}
.sc{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:18px;display:flex;align-items:center;gap:13px;box-shadow:0 2px 8px rgba(79,70,229,.04);transition:transform .2s,box-shadow .2s}
.sc:hover{transform:translateY(-2px);box-shadow:0 6px 20px rgba(79,70,229,.1)}
.sc-icon{width:44px;height:44px;border-radius:11px;display:flex;align-items:center;justify-content:center;font-size:21px;flex-shrink:0}
.sc-icon.b{background:var(--bg2)} .sc-icon.g{background:var(--green-bg)} .sc-icon.a{background:var(--amber-bg)} .sc-icon.r{background:var(--red-bg)}
.sc-num{font-size:26px;font-weight:800;color:var(--ink);line-height:1}
.sc-lbl{font-size:12px;color:var(--muted);margin-top:2px;font-weight:600}

/* TABLE CARD */
.tc{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 8px rgba(79,70,229,.04);margin-bottom:20px}
.tc-hd{padding:14px 18px;border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;gap:12px;flex-wrap:wrap;background:linear-gradient(90deg,#faf9ff,#fff)}
.tc-ttl{font-size:13.5px;font-weight:800;color:var(--ink);display:flex;align-items:center;gap:8px}
.tc-ico{width:24px;height:24px;border-radius:6px;background:var(--bg2);display:flex;align-items:center;justify-content:center;font-size:12px}
.tc-cnt{font-size:11.5px;font-weight:700;color:var(--pri);background:var(--bg2);border:1px solid #c7d2fe;padding:2px 9px;border-radius:20px}
.tc-actions{display:flex;align-items:center;gap:10px}

.srch{position:relative}
.srch svg{position:absolute;left:10px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none}
.srch input{padding:7px 12px 7px 30px;border:1.5px solid var(--line);border-radius:8px;font-family:'Plus Jakarta Sans',sans-serif;font-size:12.5px;color:var(--ink);background:var(--bg);outline:none;width:190px;transition:border-color .18s}
.srch input:focus{border-color:var(--pri)}

table{width:100%;border-collapse:collapse}
th{padding:10px 16px;text-align:left;font-size:10.5px;font-weight:700;letter-spacing:.06em;text-transform:uppercase;color:var(--muted);background:var(--bg);border-bottom:1px solid var(--line)}
td{padding:12px 16px;font-size:13px;color:var(--ink2);border-bottom:1px solid var(--line);vertical-align:middle}
tr:last-child td{border-bottom:none}
tr:hover td{background:#fafbff}

.ev-cell{display:flex;align-items:center;gap:10px}
.ev-img{width:36px;height:36px;border-radius:8px;object-fit:cover;border:1px solid var(--line)}
.ev-ph{width:36px;height:36px;border-radius:8px;background:linear-gradient(135deg,var(--bg2),#c7d2fe);display:flex;align-items:center;justify-content:center;font-size:16px}
.ev-name{font-size:13px;font-weight:700;color:var(--ink)}
.ev-org{font-size:11px;color:var(--muted)}

.u-cell{display:flex;align-items:center;gap:9px}
.u-av{width:32px;height:32px;border-radius:50%;object-fit:cover;border:1.5px solid var(--line)}
.u-avph{width:32px;height:32px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:800;color:#fff}
.u-name{font-size:13px;font-weight:700;color:var(--ink)}
.u-mail{font-size:11px;color:var(--muted)}

.badge{display:inline-flex;align-items:center;font-size:11px;font-weight:700;padding:3px 9px;border-radius:20px}
.bd-online{background:#dbeafe;color:#1d4ed8} .bd-offline{background:var(--amber-bg);color:var(--amber)}
.bd-team{background:var(--bg2);color:var(--pri)} .bd-indiv{background:var(--green-bg);color:var(--green)}
.bd-active{background:var(--green-bg);color:var(--green)} .bd-blocked{background:var(--red-bg);color:var(--red)}
.bd-admin{background:#fdf2f8;color:#9d174d} .bd-judge{background:var(--amber-bg);color:var(--amber)} .bd-part{background:var(--bg2);color:var(--pri)}

.ab{display:inline-flex;align-items:center;gap:4px;font-size:11.5px;font-weight:700;padding:5px 11px;border-radius:7px;text-decoration:none;transition:opacity .15s,transform .15s;border:none;cursor:pointer}
.ab:hover{opacity:.85;transform:translateY(-1px)}
.ab-view{background:var(--bg2);color:var(--pri)}
.ab-edit{background:var(--amber-bg);color:var(--amber)}
.ab-del{background:var(--red-bg);color:var(--red)}
.ab-block{background:var(--red-bg);color:var(--red)}
.ab-unblock{background:var(--green-bg);color:var(--green)}
.ab-wrap{display:flex;gap:6px;flex-wrap:wrap}

.empty-r td{text-align:center;padding:36px;color:var(--muted);font-size:13.5px}

/* ── CHARTS ── */
.charts-row{display:grid;grid-template-columns:280px 1fr;gap:16px;margin-bottom:20px}
@media(max-width:900px){.charts-row{grid-template-columns:1fr}}
.chart-card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:18px;box-shadow:0 2px 8px rgba(79,70,229,.04)}
.chart-hdr{display:flex;align-items:center;gap:9px;margin-bottom:14px;padding-bottom:12px;border-bottom:1px solid var(--line)}
.chart-icon{width:32px;height:32px;border-radius:8px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:15px;flex-shrink:0}
.chart-title{font-size:13.5px;font-weight:800;color:var(--ink)}
.chart-sub{font-size:11px;color:var(--muted);margin-top:1px}
.chart-wrap{display:flex;justify-content:center;align-items:center;padding:10px 0}
.chart-legend{display:flex;gap:16px;justify-content:center;flex-wrap:wrap;margin-top:8px}
.cl-item{display:flex;align-items:center;gap:6px;font-size:12px;font-weight:600;color:var(--sub)}
.cl-dot{width:10px;height:10px;border-radius:50%;flex-shrink:0}

@media(max-width:768px){
  .sidebar{transform:translateX(-100%);transition:transform .25s}
  .sidebar.mob-open{transform:translateX(0)}
  .main{margin-left:0}
  .content{padding:16px}
  .topbar{padding:0 16px}
  .stats{grid-template-columns:1fr 1fr}
}
</style>
</head>
<body>

<!-- ══ SIDEBAR ══ -->
<div class="sidebar" id="sidebar">
<div class="sb-in">

  <div class="sb-brand">
    <div class="sb-logo">CN</div>
    <div class="sb-brand-txt">CodeNova <span>SOU</span></div>
  </div>

  <div class="sb-admin">
    <div class="sb-av">
      <c:choose>
        <c:when test="${not empty admin.profilePic}"><img src="${admin.profilePic}" alt=""/></c:when>
        <c:otherwise>${fn:substring(admin.firstName,0,1)}${fn:substring(admin.lastName,0,1)}</c:otherwise>
      </c:choose>
    </div>
    <div>
      <div class="sb-aname">${admin.firstName} ${admin.lastName}</div>
      <div class="sb-arole">Administrator</div>
    </div>
  </div>

  <div class="sb-nav">
    <div class="sb-lbl">Main</div>
    <button class="sb-btn active" onclick="showSec('overview','Dashboard Overview')">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg>
      Overview
    </button>

    <div class="sb-lbl">Manage</div>
    <button class="sb-btn" onclick="showSec('events','Manage Events')">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
      Events <span class="sb-cnt">${totalEvents}</span>
    </button>
    <button class="sb-btn" onclick="showSec('users','Manage Users')">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
      Users <span class="sb-cnt">${totalUsers}</span>
    </button>

    <div class="sb-lbl">Quick</div>
    <a href="addEvent" class="sb-btn">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/></svg>
      Add Event
    </a>
    <a href="/home" class="sb-btn">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
      View Site
    </a>
  </div>

  <div class="sb-foot">
    <a href="/logout" class="sb-logout">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
      Logout
    </a>
  </div>

</div>
</div>

<!-- ══ MAIN ══ -->
<div class="main">

  <div class="topbar">
    <div style="display:flex;align-items:center;gap:12px">
      <button id="mobMenu" onclick="document.getElementById('sidebar').classList.toggle('mob-open')"
        style="background:none;border:none;cursor:pointer;color:var(--ink);display:none">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
      </button>
      <div class="tb-title" id="tbTitle">Dashboard Overview</div>
    </div>
    <div class="tb-right">
      <span class="tb-date" id="tbDate"></span>
      <a href="addEvent" class="add-btn">
        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        Add Event
      </a>
    </div>
  </div>

  <div class="content">

    <!-- ── OVERVIEW ── -->
    <div class="sec active" id="sec-overview">
      <div class="pg-title"><div class="pg-icon">📊</div> Dashboard Overview</div>

      <div class="stats">
        <div class="sc"><div class="sc-icon b">🎯</div><div><div class="sc-num">${totalEvents}</div><div class="sc-lbl">Total Events</div></div></div>
        <div class="sc"><div class="sc-icon g">👥</div><div><div class="sc-num">${totalUsers}</div><div class="sc-lbl">Total Users</div></div></div>
        <div class="sc"><div class="sc-icon g">✅</div><div><div class="sc-num">${activeUsers}</div><div class="sc-lbl">Active Users</div></div></div>
        <div class="sc"><div class="sc-icon r">🚫</div><div><div class="sc-num">${blockedUsers}</div><div class="sc-lbl">Blocked Users</div></div></div>
      </div>

      <!-- ── CHARTS ── -->
      <div class="charts-row">
        <!-- Chart 1: User Status Doughnut -->
        <div class="chart-card">
          <div class="chart-hdr">
            <div class="chart-icon">👥</div>
            <div>
              <div class="chart-title">User Status</div>
              <div class="chart-sub">Active vs Blocked users</div>
            </div>
          </div>
          <div class="chart-wrap">
            <canvas id="userChart" width="260" height="260"></canvas>
          </div>
          <div class="chart-legend">
            <div class="cl-item"><span class="cl-dot" style="background:#059669"></span>Active (${activeUsers})</div>
            <div class="cl-item"><span class="cl-dot" style="background:#dc2626"></span>Blocked (${blockedUsers})</div>
          </div>
        </div>

        <!-- Chart 2: Event Type Bar -->
        <div class="chart-card">
          <div class="chart-hdr">
            <div class="chart-icon">📅</div>
            <div>
              <div class="chart-title">Event Types</div>
              <div class="chart-sub">Individual vs Team events</div>
            </div>
          </div>
          <div class="chart-wrap">
            <canvas id="eventChart" width="380" height="260"></canvas>
          </div>
          <div class="chart-legend">
            <div class="cl-item"><span class="cl-dot" style="background:#4f46e5"></span>Individual</div>
            <div class="cl-item"><span class="cl-dot" style="background:#0d9488"></span>Team</div>
          </div>
        </div>
      </div>

      <%-- Pass data for charts --%>
      <script>
        var totalEventsData  = ${totalEvents};
        var activeUsersData  = ${activeUsers};
        var blockedUsersData = ${blockedUsers};
        var indivEvents = 0;
        var teamEvents  = 0;
        var onlineEv    = 0;
        var offlineEv   = 0;
      </script>
      <c:forEach var="ev" items="${eventList}">
        <script>
          if ('${ev.participationType}' === 'Individual') indivEvents++;
          else if ('${ev.participationType}' === 'Team')  teamEvents++;
          if ('${ev.location}' === 'Online') onlineEv++;
          else offlineEv++;
        </script>
      </c:forEach>

      <!-- Recent Events -->
      <div class="tc">
        <div class="tc-hd">
          <div class="tc-ttl"><div class="tc-ico">📅</div> Recent Events</div>
          <button class="ab ab-view" onclick="showSec('events','Manage Events')">View All →</button>
        </div>
        <div style="overflow-x:auto">
        <table>
          <thead><tr><th>Event</th><th>Type</th><th>Location</th><th>Deadline</th><th>Actions</th></tr></thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty eventList}">
                <c:forEach items="${eventList}" var="ev" end="4">
                <tr>
                  <td><div class="ev-cell">
                    <c:choose>
                      <c:when test="${not empty ev.eventImage}"><img src="${ev.eventImage}" class="ev-img" alt=""/></c:when>
                      <c:otherwise><div class="ev-ph">🏆</div></c:otherwise>
                    </c:choose>
                    <div><div class="ev-name">${ev.eventTitle}</div><div class="ev-org">${ev.organizationName}</div></div>
                  </div></td>
                  <td><c:choose><c:when test="${ev.participationType=='Team'}"><span class="badge bd-team">Team</span></c:when><c:otherwise><span class="badge bd-indiv">Individual</span></c:otherwise></c:choose></td>
                  <td><c:choose><c:when test="${ev.location=='Online'}"><span class="badge bd-online">Online</span></c:when><c:otherwise><span class="badge bd-offline">${ev.location}</span></c:otherwise></c:choose></td>
                  <td style="font-size:12px;color:var(--muted)">${ev.lastDate}</td>
                  <td><div class="ab-wrap">
                    <a href="/listEventDetails/${ev.eventId}" class="ab ab-view">View</a>
                    <a href="/admin/editEvent/${ev.eventId}" class="ab ab-edit">Edit</a>
                    <a href="/admin/deleteEvent/${ev.eventId}" class="ab ab-del" onclick="return confirm('Delete this event?')">Delete</a>
                  </div></td>
                </tr>
                </c:forEach>
              </c:when>
              <c:otherwise><tr class="empty-r"><td colspan="5">📭 No events yet. <a href="addEvent" style="color:var(--pri)">Add one</a></td></tr></c:otherwise>
            </c:choose>
          </tbody>
        </table>
        </div>
      </div>

      <!-- Recent Users -->
      <div class="tc">
        <div class="tc-hd">
          <div class="tc-ttl"><div class="tc-ico">👤</div> Recent Users</div>
          <button class="ab ab-view" onclick="showSec('users','Manage Users')">View All →</button>
        </div>
        <div style="overflow-x:auto">
        <table>
          <thead><tr><th>User</th><th>Role</th><th>Status</th><th>Joined</th><th>Actions</th></tr></thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty userList}">
                <c:forEach items="${userList}" var="u" end="4">
                <tr>
                  <td><div class="u-cell">
                    <c:choose>
                      <c:when test="${not empty u.profilePic}"><img src="${u.profilePic}" class="u-av" alt=""/></c:when>
                      <c:otherwise><div class="u-avph">${fn:substring(u.firstName,0,1)}${fn:substring(u.lastName,0,1)}</div></c:otherwise>
                    </c:choose>
                    <div><div class="u-name">${u.firstName} ${u.lastName}</div><div class="u-mail">${u.email}</div></div>
                  </div></td>
                  <td><c:choose><c:when test="${u.role=='Admin'}"><span class="badge bd-admin">Admin</span></c:when><c:when test="${u.role=='Judge'}"><span class="badge bd-judge">Judge</span></c:when><c:otherwise><span class="badge bd-part">Participant</span></c:otherwise></c:choose></td>
                  <td><c:choose><c:when test="${u.active}"><span class="badge bd-active">Active</span></c:when><c:otherwise><span class="badge bd-blocked">Blocked</span></c:otherwise></c:choose></td>
                  <td style="font-size:12px;color:var(--muted)">${u.createdAt}</td>
                  <td><div class="ab-wrap">
                    <a href="/admin/viewUser/${u.id}" class="ab ab-view">View</a>
                    <c:choose>
                      <c:when test="${u.active}"><a href="/admin/blockUser/${u.id}" class="ab ab-block" onclick="return confirm('Block ${u.firstName}?')">Block</a></c:when>
                      <c:otherwise><a href="/admin/unblockUser/${u.id}" class="ab ab-unblock">Unblock</a></c:otherwise>
                    </c:choose>
                  </div></td>
                </tr>
                </c:forEach>
              </c:when>
              <c:otherwise><tr class="empty-r"><td colspan="5">👤 No users yet</td></tr></c:otherwise>
            </c:choose>
          </tbody>
        </table>
        </div>
      </div>
    </div>

    <!-- ── ALL EVENTS ── -->
    <div class="sec" id="sec-events">
      <div class="pg-title"><div class="pg-icon">📅</div> Manage Events</div>
      <div class="tc">
        <div class="tc-hd">
          <div class="tc-ttl"><div class="tc-ico">🎯</div> All Events <span class="tc-cnt">${totalEvents}</span></div>
          <div class="tc-actions">
            <div class="srch">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
              <input type="text" placeholder="Search..." oninput="filterTbl(this,'evTbl')">
            </div>
            <a href="addEvent" class="add-btn">+ Add</a>
          </div>
        </div>
        <div style="overflow-x:auto">
        <table id="evTbl">
          <thead><tr><th>#</th><th>Event</th><th>Type</th><th>Location</th><th>Posted</th><th>Deadline</th><th>Actions</th></tr></thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty eventList}">
                <c:forEach items="${eventList}" var="ev" varStatus="s">
                <tr>
                  <td style="color:var(--muted);font-size:12px">${s.index+1}</td>
                  <td><div class="ev-cell">
                    <c:choose>
                      <c:when test="${not empty ev.eventImage}"><img src="${ev.eventImage}" class="ev-img" alt=""/></c:when>
                      <c:otherwise><div class="ev-ph">🏆</div></c:otherwise>
                    </c:choose>
                    <div><div class="ev-name">${ev.eventTitle}</div><div class="ev-org">${ev.organizationName}</div></div>
                  </div></td>
                  <td><c:choose><c:when test="${ev.participationType=='Team'}"><span class="badge bd-team">Team</span></c:when><c:otherwise><span class="badge bd-indiv">Individual</span></c:otherwise></c:choose></td>
                  <td><c:choose><c:when test="${ev.location=='Online'}"><span class="badge bd-online">Online</span></c:when><c:otherwise><span class="badge bd-offline">${ev.location}</span></c:otherwise></c:choose></td>
                  <td style="font-size:12px;color:var(--muted)">${ev.postedDate}</td>
                  <td style="font-size:12px;color:var(--muted)">${ev.lastDate}</td>
                  <td><div class="ab-wrap">
                    <a href="/listEventDetails/${ev.eventId}" class="ab ab-view">View</a>
                    <a href="/admin/editEvent/${ev.eventId}" class="ab ab-edit">Edit</a>
                    <a href="/admin/deleteEvent/${ev.eventId}" class="ab ab-del" onclick="return confirm('Delete this event?')">Delete</a>
                  </div></td>
                </tr>
                </c:forEach>
              </c:when>
              <c:otherwise><tr class="empty-r"><td colspan="7">📭 No events. <a href="addEvent" style="color:var(--pri)">Add one</a></td></tr></c:otherwise>
            </c:choose>
          </tbody>
        </table>
        </div>
      </div>
    </div>

    <!-- ── ALL USERS ── -->
    <div class="sec" id="sec-users">
      <div class="pg-title"><div class="pg-icon">👥</div> Manage Users</div>
      <div class="tc">
        <div class="tc-hd">
          <div class="tc-ttl"><div class="tc-ico">👤</div> All Users <span class="tc-cnt">${totalUsers}</span></div>
          <div class="srch">
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
            <input type="text" placeholder="Search..." oninput="filterTbl(this,'uTbl')">
          </div>
        </div>
        <div style="overflow-x:auto">
        <table id="uTbl">
          <thead><tr><th>#</th><th>User</th><th>Mobile</th><th>Gender</th><th>Role</th><th>Status</th><th>Joined</th><th>Actions</th></tr></thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty userList}">
                <c:forEach items="${userList}" var="u" varStatus="s">
                <tr>
                  <td style="color:var(--muted);font-size:12px">${s.index+1}</td>
                  <td><div class="u-cell">
                    <c:choose>
                      <c:when test="${not empty u.profilePic}"><img src="${u.profilePic}" class="u-av" alt=""/></c:when>
                      <c:otherwise><div class="u-avph">${fn:substring(u.firstName,0,1)}${fn:substring(u.lastName,0,1)}</div></c:otherwise>
                    </c:choose>
                    <div><div class="u-name">${u.firstName} ${u.lastName}</div><div class="u-mail">${u.email}</div></div>
                  </div></td>
                  <td style="font-size:12.5px;color:var(--sub)">${u.mobileNumber}</td>
                  <td style="font-size:12.5px;color:var(--sub)">${u.gender}</td>
                  <td><c:choose><c:when test="${u.role=='Admin'}"><span class="badge bd-admin">Admin</span></c:when><c:when test="${u.role=='Judge'}"><span class="badge bd-judge">Judge</span></c:when><c:otherwise><span class="badge bd-part">Participant</span></c:otherwise></c:choose></td>
                  <td><c:choose><c:when test="${u.active}"><span class="badge bd-active">Active</span></c:when><c:otherwise><span class="badge bd-blocked">Blocked</span></c:otherwise></c:choose></td>
                  <td style="font-size:12px;color:var(--muted)">${u.createdAt}</td>
                  <td><div class="ab-wrap">
                    <a href="/admin/viewUser/${u.id}" class="ab ab-view">View</a>
                    <c:choose>
                      <c:when test="${u.active}"><a href="/admin/blockUser/${u.id}" class="ab ab-block" onclick="return confirm('Block ${u.firstName}?')">Block</a></c:when>
                      <c:otherwise><a href="/admin/unblockUser/${u.id}" class="ab ab-unblock">Unblock</a></c:otherwise>
                    </c:choose>
                  </div></td>
                </tr>
                </c:forEach>
              </c:when>
              <c:otherwise><tr class="empty-r"><td colspan="8">👤 No users yet</td></tr></c:otherwise>
            </c:choose>
          </tbody>
        </table>
        </div>
      </div>
    </div>

  </div><!-- /content -->
</div><!-- /main -->

<script>
// Section switch
function showSec(name, title) {
  document.querySelectorAll('.sec').forEach(function(s){ s.classList.remove('active') });
  document.querySelectorAll('.sb-btn').forEach(function(b){ b.classList.remove('active') });
  document.getElementById('sec-' + name).classList.add('active');
  document.getElementById('tbTitle').textContent = title;
  // Highlight sidebar button
  document.querySelectorAll('.sb-btn').forEach(function(b){
    var oc = b.getAttribute('onclick') || '';
    if (oc.includes("'" + name + "'")) b.classList.add('active');
  });
}

// Table search
function filterTbl(input, tableId) {
  var q = input.value.toLowerCase();
  document.querySelectorAll('#' + tableId + ' tbody tr').forEach(function(r){
    r.style.display = r.textContent.toLowerCase().includes(q) ? '' : 'none';
  });
}

// Topbar date
var d = new Date();
document.getElementById('tbDate').textContent =
  d.toLocaleDateString('en-IN',{weekday:'short',day:'numeric',month:'short',year:'numeric'});

// Mobile
if (window.innerWidth <= 768)
  document.getElementById('mobMenu').style.display = 'block';
</script>

<!-- Chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js"></script>
<script>
// ── Chart 1: User Status Doughnut ──
(function(){
  var ctx = document.getElementById('userChart');
  if (!ctx) return;
  new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ['Active', 'Blocked'],
      datasets: [{
        data: [activeUsersData, blockedUsersData],
        backgroundColor: ['#059669', '#dc2626'],
        borderColor: ['#d1fae5', '#fee2e2'],
        borderWidth: 3,
        hoverOffset: 6
      }]
    },
    options: {
      responsive: false,
      cutout: '68%',
      plugins: {
        legend: { display: false },
        tooltip: {
          callbacks: {
            label: function(ctx) {
              return ' ' + ctx.label + ': ' + ctx.raw;
            }
          }
        }
      }
    }
  });
})();

// ── Chart 2: Event Type Bar ──
(function(){
  var ctx = document.getElementById('eventChart');
  if (!ctx) return;
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Individual', 'Team', 'Online', 'Offline'],
      datasets: [{
        label: 'Events',
        data: [indivEvents, teamEvents, onlineEv, offlineEv],
        backgroundColor: [
          'rgba(79,70,229,.8)',
          'rgba(13,148,136,.8)',
          'rgba(245,158,11,.8)',
          'rgba(107,114,128,.8)'
        ],
        borderColor: [
          '#4f46e5','#0d9488','#f59e0b','#6b7280'
        ],
        borderWidth: 1.5,
        borderRadius: 8,
        borderSkipped: false
      }]
    },
    options: {
      responsive: false,
      plugins: {
        legend: { display: false },
        tooltip: {
          callbacks: {
            label: function(ctx) { return ' Count: ' + ctx.raw; }
          }
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            stepSize: 1,
            font: { family: 'Plus Jakarta Sans', size: 11 },
            color: '#9ca3af'
          },
          grid: { color: '#f3f4f6' }
        },
        x: {
          ticks: {
            font: { family: 'Plus Jakarta Sans', size: 11 },
            color: '#6b7280'
          },
          grid: { display: false }
        }
      }
    }
  });
})();
</script>
</body>
</html>
