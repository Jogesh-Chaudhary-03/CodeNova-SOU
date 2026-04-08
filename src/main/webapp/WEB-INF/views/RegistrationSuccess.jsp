<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Successful – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{--pri:#4f46e5;--acc:#0d9488;--acc-lt:#5eead4;--ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;--line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#fff;--green:#059669;--green-bg:#d1fae5;--red:#dc2626;--r:12px}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:32px 20px}
.wrap{width:100%;max-width:500px}
.bounce{font-size:44px;text-align:center;margin-bottom:14px;animation:bounce .6s ease infinite alternate}
@keyframes bounce{from{transform:translateY(0)}to{transform:translateY(-8px)}}
.card{background:var(--white);border:2px solid #6ee7b7;border-radius:18px;padding:30px;text-align:center;box-shadow:0 8px 32px rgba(5,150,105,.1);margin-bottom:14px}
.sc-icon{width:68px;height:68px;border-radius:50%;margin:0 auto 14px;background:linear-gradient(135deg,var(--green),#10b981);display:flex;align-items:center;justify-content:center;font-size:30px;box-shadow:0 6px 20px rgba(5,150,105,.28)}
.sc-title{font-size:21px;font-weight:800;color:var(--ink);margin-bottom:5px}
.sc-sub{font-size:13.5px;color:var(--sub);line-height:1.65;margin-bottom:20px}
.det-box{background:var(--bg);border:1.5px solid var(--line);border-radius:11px;padding:14px;text-align:left;margin-bottom:16px}
.det-row{display:flex;justify-content:space-between;align-items:flex-start;padding:8px 0;border-bottom:1px solid var(--line);font-size:13.5px;gap:10px}
.det-row:last-child{border-bottom:none}
.det-row .k{color:var(--muted);font-weight:600;flex-shrink:0}
.det-row .v{font-weight:700;color:var(--ink2);text-align:right}
.members-box{background:var(--bg2);border:1.5px solid #c7d2fe;border-radius:11px;padding:13px;text-align:left;margin-bottom:16px}
.mb-ttl{font-size:11.5px;font-weight:700;letter-spacing:.06em;text-transform:uppercase;color:var(--sub);margin-bottom:10px}
.mi{display:flex;align-items:center;gap:8px;padding:6px 0;border-bottom:1px solid #c7d2fe;font-size:13px}
.mi:last-child{border-bottom:none}
.mi-dot{width:8px;height:8px;border-radius:50%;background:var(--pri);flex-shrink:0}
.mi-name{font-weight:700;color:var(--ink2)}
.mi-email{font-size:11.5px;color:var(--muted);margin-top:1px}
.btns{display:flex;gap:10px;justify-content:center;flex-wrap:wrap}
.btn-pri{display:inline-flex;align-items:center;gap:7px;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:800;padding:11px 22px;border-radius:10px;text-decoration:none;box-shadow:0 4px 14px rgba(79,70,229,.25);transition:opacity .15s,transform .15s}
.btn-pri:hover{opacity:.92;transform:translateY(-1px)}
.btn-sec{display:inline-flex;align-items:center;gap:7px;background:var(--white);color:var(--ink2);font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:700;padding:10px 20px;border-radius:10px;text-decoration:none;border:1.5px solid var(--line);transition:border-color .15s,color .15s}
.btn-sec:hover{border-color:var(--pri);color:var(--pri)}
</style>
</head>
<body>
<div class="wrap">
  <div class="bounce">🎉</div>
  <div class="card">
    <div class="sc-icon">✓</div>
    <div class="sc-title">Registration Successful!</div>
    <div class="sc-sub">You have successfully registered for <strong>${event.eventTitle}</strong>. Best of luck! 🚀</div>

    <div class="det-box">
      <div class="det-row"><span class="k">Event</span><span class="v">${event.eventTitle}</span></div>
      <div class="det-row"><span class="k">Organisation</span><span class="v">${event.organizationName}</span></div>
      <div class="det-row"><span class="k">Type</span><span class="v">${participant.participationType}</span></div>
      <c:if test="${participant.participationType == 'Team'}">
        <div class="det-row"><span class="k">Team Name</span><span class="v">${participant.teamName}</span></div>
        <div class="det-row"><span class="k">Team Leader</span><span class="v">${participant.teamLeader}</span></div>
      </c:if>
      <c:if test="${not empty event.lastDate}">
        <div class="det-row"><span class="k">Event Deadline</span><span class="v" style="color:var(--red)">${event.lastDate}</span></div>
      </c:if>
    </div>

    <c:if test="${not empty members}">
    <div class="members-box">
      <div class="mb-ttl">Team Members (${fn:length(members)})</div>
      <c:forEach var="m" items="${members}">
        <div class="mi">
          <div class="mi-dot"></div>
          <div>
            <div class="mi-name">${m.memberName}</div>
            <c:if test="${not empty m.memberEmail}"><div class="mi-email">${m.memberEmail}</div></c:if>
          </div>
        </div>
      </c:forEach>
    </div>
    </c:if>

    <div class="btns">
      <a href="/listEventDetails/${event.eventId}" class="btn-pri">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
        View Event
      </a>
      <a href="/Home" class="btn-sec">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>
        Go Home
      </a>
    </div>
  </div>
</div>
</body>
</html>
