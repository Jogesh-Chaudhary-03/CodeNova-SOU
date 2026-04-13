<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Judge Dashboard – CodeNova SOU</title>
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
  --nav-w:240px;--r:12px;
}
html{scroll-behavior:smooth}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh;display:flex}

/* SIDEBAR */
.sidebar{width:var(--nav-w);flex-shrink:0;position:fixed;top:0;left:0;height:100vh;z-index:100;overflow-y:auto;background:linear-gradient(180deg,#064e3b 0%,#065f46 50%,#0d9488 100%);display:flex;flex-direction:column}
.sidebar::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.04) 1px,transparent 1px);background-size:22px 22px;pointer-events:none}
.sb-in{position:relative;z-index:1;display:flex;flex-direction:column;height:100%}
.sb-brand{display:flex;align-items:center;gap:10px;padding:20px;border-bottom:1px solid rgba(255,255,255,.1)}
.sb-logo{width:36px;height:36px;border-radius:9px;background:rgba(255,255,255,.18);display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;color:#fff;flex-shrink:0}
.sb-brand-txt{font-size:14px;font-weight:800;color:#fff}
.sb-brand-txt span{color:var(--acc-lt)}
.sb-admin{display:flex;align-items:center;gap:10px;padding:14px 20px;border-bottom:1px solid rgba(255,255,255,.08);background:rgba(255,255,255,.05)}
.sb-av{width:36px;height:36px;border-radius:50%;border:2px solid rgba(255,255,255,.25);flex-shrink:0;background:rgba(255,255,255,.15);display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;color:#fff;overflow:hidden}
.sb-av img{width:100%;height:100%;object-fit:cover}
.sb-aname{font-size:12.5px;font-weight:700;color:#fff}
.sb-arole{font-size:10.5px;color:rgba(255,255,255,.5);margin-top:1px}
.sb-nav{flex:1;padding:10px}
.sb-lbl{font-size:10px;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:rgba(255,255,255,.35);padding:10px 8px 4px}
.sb-btn{display:flex;align-items:center;gap:9px;padding:9px 11px;border-radius:9px;font-size:13px;font-weight:600;color:rgba(255,255,255,.65);text-decoration:none;cursor:pointer;border:none;background:none;width:100%;text-align:left;transition:background .15s,color .15s;margin-bottom:2px}
.sb-btn:hover{background:rgba(255,255,255,.1);color:#fff}
.sb-btn.active{background:rgba(255,255,255,.18);color:#fff;font-weight:700}
.sb-btn svg{flex-shrink:0;opacity:.8}
.sb-btn.active svg,.sb-btn:hover svg{opacity:1}
.sb-btn.danger{color:rgba(239,68,68,.75)}
.sb-btn.danger:hover{background:rgba(239,68,68,.15);color:#f87171}
.sb-footer{margin-top:auto;padding:14px}

/* MAIN */
.main{margin-left:var(--nav-w);flex:1;display:flex;flex-direction:column;min-height:100vh}
@media(max-width:900px){.main{margin-left:0}}

/* TOPBAR */
.topbar{height:62px;background:var(--white);border-bottom:1.5px solid var(--line);display:flex;align-items:center;gap:16px;padding:0 28px;position:sticky;top:0;z-index:50;box-shadow:0 2px 8px rgba(5,150,105,.06)}
.tb-menu{display:none;background:none;border:none;cursor:pointer;flex-direction:column;gap:5px;padding:4px}
.tb-menu span{display:block;width:20px;height:2px;background:var(--ink);border-radius:2px}
@media(max-width:900px){.tb-menu{display:flex}}
.tb-title{font-size:16px;font-weight:800;color:var(--ink)}
.tb-badge{display:inline-flex;align-items:center;gap:5px;background:var(--amber-bg);border:1px solid #fcd34d;color:var(--amber);font-size:12px;font-weight:700;padding:3px 10px;border-radius:20px;margin-left:8px}
.tb-right{margin-left:auto;display:flex;align-items:center;gap:10px}
.tb-home{display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:700;color:var(--sub);text-decoration:none;padding:6px 13px;border-radius:9px;border:1.5px solid var(--line);transition:color .15s,border-color .15s}
.tb-home:hover{color:var(--green);border-color:var(--green)}

/* CONTENT */
.content{padding:24px;flex:1}

/* SECTIONS */
.sec{display:none}.sec.active{display:block;animation:fadeIn .2s ease}
@keyframes fadeIn{from{opacity:0;transform:translateY(6px)}to{opacity:1;transform:translateY(0)}}
.pg-title{display:flex;align-items:center;gap:10px;font-size:17px;font-weight:800;color:var(--ink);margin-bottom:20px}
.pg-icon{width:36px;height:36px;border-radius:10px;background:linear-gradient(135deg,var(--green),var(--acc));display:flex;align-items:center;justify-content:center;font-size:18px;box-shadow:0 3px 10px rgba(5,150,105,.25)}

/* STATS */
.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:14px;margin-bottom:22px}
@media(max-width:900px){.stats{grid-template-columns:repeat(2,1fr)}}
.sc{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:18px;display:flex;align-items:center;gap:13px;box-shadow:0 2px 6px rgba(5,150,105,.04);transition:transform .18s,box-shadow .18s}
.sc:hover{transform:translateY(-2px);box-shadow:0 6px 20px rgba(5,150,105,.1)}
.sc-icon{width:44px;height:44px;border-radius:11px;display:flex;align-items:center;justify-content:center;font-size:20px;flex-shrink:0}
.sc-icon.g{background:var(--green-bg)}
.sc-icon.a{background:var(--amber-bg)}
.sc-icon.r{background:var(--red-bg)}
.sc-icon.b{background:var(--bg2)}
.sc-num{font-size:24px;font-weight:800;color:var(--ink);line-height:1}
.sc-lbl{font-size:11.5px;color:var(--muted);margin-top:3px;font-weight:600}

/* TABLE CARD */
.tc{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 6px rgba(79,70,229,.04);margin-bottom:18px}
.tc-hd{padding:14px 18px;border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;gap:10px;flex-wrap:wrap}
.tc-ttl{display:flex;align-items:center;gap:8px;font-size:13.5px;font-weight:800;color:var(--ink)}
.tc-ico{width:28px;height:28px;border-radius:7px;background:var(--green-bg);display:flex;align-items:center;justify-content:center;font-size:14px}
.tc-cnt{display:inline-flex;align-items:center;justify-content:center;min-width:22px;height:22px;border-radius:20px;background:var(--green);color:#fff;font-size:11px;font-weight:800;padding:0 6px}
.srch{display:flex;align-items:center;gap:6px;background:var(--bg);border:1.5px solid var(--line);border-radius:8px;padding:6px 10px;font-size:13px;color:var(--muted)}
.srch input{background:none;border:none;outline:none;font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;color:var(--ink);width:160px}
table{width:100%;border-collapse:collapse}
thead tr{background:var(--bg);border-bottom:2px solid var(--line)}
th{padding:10px 14px;text-align:left;font-size:11px;font-weight:700;color:var(--sub);letter-spacing:.05em;text-transform:uppercase;white-space:nowrap}
tbody tr{border-bottom:1px solid var(--line);transition:background .12s}
tbody tr:last-child{border-bottom:none}
tbody tr:hover{background:#fafafa}
td{padding:12px 14px;font-size:13px;color:var(--ink2);vertical-align:middle}
.empty-r td{text-align:center;padding:36px;color:var(--muted);font-size:13.5px}

/* TABLE ELEMENTS */
.file-chip{display:inline-flex;align-items:center;gap:5px;background:var(--bg2);border:1px solid #c7d2fe;border-radius:7px;padding:4px 10px;font-size:12px;font-weight:700;color:var(--pri);text-decoration:none;white-space:nowrap;transition:background .14s}
.file-chip:hover{background:#c7d2fe}
.ft-badge{display:inline-block;font-size:10.5px;font-weight:800;padding:2px 7px;border-radius:5px;text-transform:uppercase;letter-spacing:.04em}
.ft-pdf{background:#fee2e2;color:#dc2626}
.ft-zip,.ft-rar{background:#fef3c7;color:#d97706}
.ft-docx,.ft-txt{background:#dbeafe;color:#1d4ed8}
.ft-pptx{background:#fce7f3;color:#be185d}
.ft-mp4{background:#d1fae5;color:#059669}
.ft-other{background:var(--bg2);color:var(--sub)}

/* STATUS BADGES */
.badge{display:inline-flex;align-items:center;gap:4px;font-size:11.5px;font-weight:700;padding:3px 10px;border-radius:20px}
.bd-pending {background:var(--amber-bg);color:var(--amber)}
.bd-reviewed{background:var(--bg2);color:var(--pri)}
.bd-approved{background:var(--green-bg);color:var(--green)}
.bd-rejected{background:var(--red-bg);color:var(--red)}

/* ACTION BUTTONS */
.ab{display:inline-flex;align-items:center;gap:4px;font-size:12px;font-weight:700;padding:5px 12px;border-radius:7px;text-decoration:none;cursor:pointer;border:none;transition:opacity .14s,transform .14s;white-space:nowrap}
.ab:hover{opacity:.85;transform:translateY(-1px)}
.ab-review{background:linear-gradient(135deg,var(--green),var(--acc));color:#fff;box-shadow:0 2px 8px rgba(5,150,105,.2)}
.ab-view{background:var(--bg2);color:var(--pri)}
.ab-wrap{display:flex;gap:6px;flex-wrap:wrap}

/* REVIEW MODAL */
.modal-overlay{display:none;position:fixed;inset:0;background:rgba(0,0,0,.45);z-index:500;align-items:center;justify-content:center}
.modal-overlay.open{display:flex}
.modal{background:var(--white);border-radius:16px;padding:28px;max-width:460px;width:90%;box-shadow:0 20px 60px rgba(0,0,0,.2);animation:fadeIn .2s ease}
.modal-title{font-size:17px;font-weight:800;color:var(--ink);margin-bottom:4px}
.modal-sub{font-size:13px;color:var(--muted);margin-bottom:20px}
.modal-field{margin-bottom:14px}
.modal-field label{display:block;font-size:12px;font-weight:700;color:var(--ink2);margin-bottom:5px}
.modal-field input[type=number],
.modal-field select,
.modal-field textarea{
  width:100%;padding:9px 12px;border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;color:var(--ink);
  background:var(--white);outline:none;transition:border-color .18s;
}
.modal-field textarea{resize:vertical;min-height:70px}
.modal-field input:focus,.modal-field select:focus,.modal-field textarea:focus{border-color:var(--green)}
.score-display{font-size:20px;font-weight:800;color:var(--green);text-align:center;margin-bottom:4px}
.score-note{font-size:11px;color:var(--muted);text-align:center;margin-bottom:10px}
.modal-btns{display:flex;gap:10px;justify-content:flex-end;margin-top:6px}
.modal-cancel{padding:9px 20px;border:1.5px solid var(--line);border-radius:9px;background:var(--white);color:var(--ink2);font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:700;cursor:pointer}
.modal-save{padding:9px 22px;border:none;border-radius:9px;background:linear-gradient(135deg,var(--green),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:800;cursor:pointer;box-shadow:0 3px 10px rgba(5,150,105,.3)}

/* EVENT GROUP */
.ev-group{margin-bottom:22px}
.ev-group-hdr{display:flex;align-items:center;gap:10px;padding:12px 16px;background:var(--bg);border:1.5px solid var(--line);border-radius:10px 10px 0 0;border-bottom:none}
.ev-group-img{width:38px;height:38px;border-radius:8px;object-fit:cover;flex-shrink:0;border:1px solid var(--line)}
.ev-group-img-ph{width:38px;height:38px;border-radius:8px;background:linear-gradient(135deg,var(--green-bg),#ccfbf1);display:flex;align-items:center;justify-content:center;font-size:18px;flex-shrink:0}
.ev-group-title{font-size:14px;font-weight:800;color:var(--ink)}
.ev-group-org{font-size:11.5px;color:var(--muted)}
.ev-group-cnt{margin-left:auto;font-size:11.5px;font-weight:700;color:var(--sub)}
.ev-group .tc{border-radius:0 0 10px 10px;border-top:none;margin-bottom:0}
</style>
</head>
<body>

<!-- SIDEBAR -->
<nav class="sidebar" id="sidebar">
  <div class="sb-in">
    <div class="sb-brand">
      <div class="sb-logo">CN</div>
      <div class="sb-brand-txt">CodeNova <span>SOU</span></div>
    </div>
    <div class="sb-admin">
      <div class="sb-av">
        <c:choose>
          <c:when test="${not empty judge.profilePic}"><img src="${judge.profilePic}" alt=""/></c:when>
          <c:otherwise>${fn:substring(judge.firstName,0,1)}${fn:substring(judge.lastName,0,1)}</c:otherwise>
        </c:choose>
      </div>
      <div>
        <div class="sb-aname">${judge.firstName} ${judge.lastName}</div>
        <div class="sb-arole">Judge</div>
      </div>
    </div>
    <div class="sb-nav">
      <div class="sb-lbl">Judge Panel</div>
      <button class="sb-btn active" onclick="showSec('overview','Overview')">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg>
        Overview
      </button>
      <button class="sb-btn" onclick="showSec('submissions','All Submissions')">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
        All Submissions
        <span style="margin-left:auto;background:var(--amber);color:#fff;font-size:10px;font-weight:800;padding:2px 7px;border-radius:20px">${pending}</span>
      </button>
      <button class="sb-btn" onclick="showSec('byevent','By Event')">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
        By Event
      </button>
      <div class="sb-lbl">Account</div>
      <a href="/logout" class="sb-btn danger">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
        Logout
      </a>
    </div>
  </div>
</nav>

<!-- MAIN -->
<div class="main">
  <div class="topbar">
    <button class="tb-menu" id="mobMenu" onclick="document.getElementById('sidebar').classList.toggle('mob-open')">
      <span></span><span></span><span></span>
    </button>
    <div class="tb-title" id="tbTitle">Overview</div>
    <c:if test="${pending > 0}">
      <span class="tb-badge">⚠️ ${pending} Pending</span>
    </c:if>
    <div class="tb-right">
      <a href="/Home" class="tb-home">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>
        View Site
      </a>
    </div>
  </div>

  <div class="content">

    <!-- ══ OVERVIEW ══ -->
    <div class="sec active" id="sec-overview">
      <div class="pg-title"><div class="pg-icon">📊</div> Judge Overview</div>

      <div class="stats">
        <div class="sc"><div class="sc-icon g">📤</div><div><div class="sc-num">${totalSubs}</div><div class="sc-lbl">Total Submissions</div></div></div>
        <div class="sc"><div class="sc-icon a">⏳</div><div><div class="sc-num">${pending}</div><div class="sc-lbl">Pending Review</div></div></div>
        <div class="sc"><div class="sc-icon g">✅</div><div><div class="sc-num">${approved}</div><div class="sc-lbl">Approved</div></div></div>
        <div class="sc"><div class="sc-icon r">❌</div><div><div class="sc-num">${rejected}</div><div class="sc-lbl">Rejected</div></div></div>
      </div>

      <!-- Recent pending -->
      <div class="tc">
        <div class="tc-hd">
          <div class="tc-ttl"><div class="tc-ico">⏳</div> Pending Reviews <span class="tc-cnt">${pending}</span></div>
          <button class="ab ab-view" onclick="showSec('submissions','All Submissions')">View All →</button>
        </div>
        <div style="overflow-x:auto">
        <table>
          <thead><tr><th>Submitted By</th><th>Event</th><th>File</th><th>Type</th><th>Date</th><th>Action</th></tr></thead>
          <tbody>
            <c:set var="shown" value="0"/>
            <c:forEach var="sub" items="${allSubs}">
              <c:if test="${sub.status == 'PENDING' and shown < 5}">
                <c:set var="shown" value="${shown + 1}"/>
                <tr>
                  <td style="font-weight:700">${sub.submittedBy}<br><span style="font-size:11px;color:var(--muted)">${not empty sub.teamName ? sub.teamName : ''}</span></td>
                  <td>
                    <c:forEach var="ev" items="${allEvents}">
                      <c:if test="${ev.eventId == sub.eventId}">${ev.eventTitle}</c:if>
                    </c:forEach>
                  </td>
                  <td><a href="${sub.fileUrl}" target="_blank" class="file-chip">
                    <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                    ${fn:length(sub.fileName) > 20 ? fn:substring(sub.fileName,0,20).concat('...') : sub.fileName}
                  </a></td>
                  <td><span class="ft-badge ft-${fn:toLowerCase(sub.fileType)}">${sub.fileType}</span></td>
                  <td style="font-size:12px;color:var(--muted)">${sub.submittedAt}</td>
                  <td><button class="ab ab-review" onclick="openReview(${sub.submissionId},'${sub.submittedBy}',${not empty sub.score ? sub.score : 0},'${sub.status}')">Review</button></td>
                </tr>
              </c:if>
            </c:forEach>
            <c:if test="${shown == 0}">
              <tr class="empty-r"><td colspan="6">🎉 All submissions reviewed!</td></tr>
            </c:if>
          </tbody>
        </table>
        </div>
      </div>
    </div>

    <!-- ══ ALL SUBMISSIONS ══ -->
    <div class="sec" id="sec-submissions">
      <div class="pg-title"><div class="pg-icon">📤</div> All Submissions</div>
      <div class="tc">
        <div class="tc-hd">
          <div class="tc-ttl"><div class="tc-ico">📋</div> Submissions <span class="tc-cnt">${totalSubs}</span></div>
          <div class="srch">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
            <input type="text" placeholder="Search..." oninput="filterTbl(this,'subTbl')"/>
          </div>
        </div>
        <div style="overflow-x:auto">
        <table id="subTbl">
          <thead><tr><th>#</th><th>Submitted By</th><th>Event</th><th>Team</th><th>File</th><th>Type</th><th>Description</th><th>Date</th><th>Status</th><th>Score</th><th>Action</th></tr></thead>
          <tbody>
            <c:choose>
              <c:when test="${not empty allSubs}">
                <c:forEach var="sub" items="${allSubs}" varStatus="s">
                <tr>
                  <td style="color:var(--muted);font-size:12px">${s.index+1}</td>
                  <td style="font-weight:700;white-space:nowrap">${sub.submittedBy}</td>
                  <td>
                    <c:forEach var="ev" items="${allEvents}">
                      <c:if test="${ev.eventId == sub.eventId}">
                        <span style="font-size:12.5px">${ev.eventTitle}</span>
                      </c:if>
                    </c:forEach>
                  </td>
                  <td style="font-size:12.5px;color:var(--sub)">${sub.teamName}</td>
                  <td>
                    <a href="${sub.fileUrl}" target="_blank" class="file-chip">
                      <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                      Download
                    </a>
                  </td>
                  <td><span class="ft-badge ft-${fn:toLowerCase(sub.fileType)}">${sub.fileType}</span></td>
                  <td style="font-size:12px;color:var(--sub);max-width:150px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap" title="${sub.description}">${sub.description}</td>
                  <td style="font-size:12px;color:var(--muted);white-space:nowrap">${sub.submittedAt}</td>
                  <td>
                    <c:choose>
                      <c:when test="${sub.status=='APPROVED'}"><span class="badge bd-approved">✓ Approved</span></c:when>
                      <c:when test="${sub.status=='REJECTED'}"><span class="badge bd-rejected">✗ Rejected</span></c:when>
                      <c:when test="${sub.status=='REVIEWED'}"><span class="badge bd-reviewed">Reviewed</span></c:when>
                      <c:otherwise><span class="badge bd-pending">⏳ Pending</span></c:otherwise>
                    </c:choose>
                  </td>
                  <td style="font-weight:800;color:var(--green)">${not empty sub.score ? sub.score.concat('/100') : '—'}</td>
                  <td>
                    <button class="ab ab-review" onclick="openReview(${sub.submissionId},'${sub.submittedBy}',${not empty sub.score ? sub.score : 0},'${sub.status}')">
                      Review
                    </button>
                  </td>
                </tr>
                </c:forEach>
              </c:when>
              <c:otherwise><tr class="empty-r"><td colspan="11">📭 No submissions yet</td></tr></c:otherwise>
            </c:choose>
          </tbody>
        </table>
        </div>
      </div>
    </div>

    <!-- ══ BY EVENT ══ -->
    <div class="sec" id="sec-byevent">
      <div class="pg-title"><div class="pg-icon">📅</div> Submissions by Event</div>
      <c:choose>
        <c:when test="${not empty eventData}">
          <c:forEach var="ed" items="${eventData}">
          <div class="ev-group">
            <div class="ev-group-hdr">
              <c:choose>
                <c:when test="${not empty ed.event.eventImage}"><img src="${ed.event.eventImage}" class="ev-group-img" alt=""/></c:when>
                <c:otherwise><div class="ev-group-img-ph">🏆</div></c:otherwise>
              </c:choose>
              <div>
                <div class="ev-group-title">${ed.event.eventTitle}</div>
                <div class="ev-group-org">${ed.event.organizationName}</div>
              </div>
              <div class="ev-group-cnt">
                ${ed.count} submission(s) &nbsp;·&nbsp;
                <span style="color:var(--amber)">${ed.pendingCount} pending</span>
              </div>
            </div>
            <div class="tc">
              <div style="overflow-x:auto">
              <table>
                <thead><tr><th>#</th><th>Submitted By</th><th>Team</th><th>File</th><th>Type</th><th>Date</th><th>Status</th><th>Score</th><th>Action</th></tr></thead>
                <tbody>
                  <c:forEach var="sub" items="${ed.submissions}" varStatus="s">
                  <tr>
                    <td style="color:var(--muted);font-size:12px">${s.index+1}</td>
                    <td style="font-weight:700">${sub.submittedBy}</td>
                    <td style="font-size:12.5px;color:var(--sub)">${sub.teamName}</td>
                    <td>
                      <a href="${sub.fileUrl}" target="_blank" class="file-chip">
                        <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                        Download
                      </a>
                    </td>
                    <td><span class="ft-badge ft-${fn:toLowerCase(sub.fileType)}">${sub.fileType}</span></td>
                    <td style="font-size:12px;color:var(--muted)">${sub.submittedAt}</td>
                    <td>
                      <c:choose>
                        <c:when test="${sub.status=='APPROVED'}"><span class="badge bd-approved">✓ Approved</span></c:when>
                        <c:when test="${sub.status=='REJECTED'}"><span class="badge bd-rejected">✗ Rejected</span></c:when>
                        <c:when test="${sub.status=='REVIEWED'}"><span class="badge bd-reviewed">Reviewed</span></c:when>
                        <c:otherwise><span class="badge bd-pending">⏳ Pending</span></c:otherwise>
                      </c:choose>
                    </td>
                    <td style="font-weight:800;color:var(--green)">${not empty sub.score ? sub.score.concat('/100') : '—'}</td>
                    <td><button class="ab ab-review" onclick="openReview(${sub.submissionId},'${sub.submittedBy}',${not empty sub.score ? sub.score : 0},'${sub.status}')">Review</button></td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
              </div>
            </div>
          </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div style="text-align:center;padding:60px 20px;color:var(--muted)">
            <div style="font-size:48px;margin-bottom:12px">📭</div>
            <div style="font-size:16px;font-weight:700;color:var(--ink);margin-bottom:6px">No submissions yet</div>
            <div style="font-size:13.5px">Submissions will appear here once participants upload their work.</div>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

  </div><!-- /content -->
</div><!-- /main -->

<!-- REVIEW MODAL -->
<div class="modal-overlay" id="reviewModal">
  <div class="modal">
    <div class="modal-title">📝 Review Submission</div>
    <div class="modal-sub" id="modalSubtitle">Reviewing submission</div>
    <form action="/judge/review" method="post" id="reviewForm">
      <input type="hidden" name="submissionId" id="modalSubId"/>
      <div class="modal-field">
        <label>Score (0–100)</label>
        <div class="score-display" id="scoreDisplay">50</div>
        <div class="score-note">Drag slider to set score</div>
        <input type="range" min="0" max="100" value="50" id="scoreRange"
               oninput="document.getElementById('scoreDisplay').textContent=this.value;document.getElementById('scoreHidden').value=this.value"
               style="width:100%;accent-color:var(--green)"/>
        <input type="hidden" name="score" id="scoreHidden" value="50"/>
      </div>
      <div class="modal-field">
        <label>Status</label>
        <select name="status" id="modalStatus">
          <option value="REVIEWED">Reviewed</option>
          <option value="APPROVED">Approved ✓</option>
          <option value="REJECTED">Rejected ✗</option>
        </select>
      </div>
      <div class="modal-field">
        <label>Feedback / Comments</label>
        <textarea name="feedback" id="modalFeedback" placeholder="Write your feedback for the participant..."></textarea>
      </div>
      <div class="modal-btns">
        <button type="button" class="modal-cancel" onclick="closeReview()">Cancel</button>
        <button type="submit" class="modal-save">Save Review</button>
      </div>
    </form>
  </div>
</div>

<script>
function showSec(name, title) {
  document.querySelectorAll('.sec').forEach(function(s){ s.classList.remove('active') });
  document.querySelectorAll('.sb-btn').forEach(function(b){ b.classList.remove('active') });
  document.getElementById('sec-' + name).classList.add('active');
  document.getElementById('tbTitle').textContent = title;
  document.querySelectorAll('.sb-btn').forEach(function(b){
    var oc = b.getAttribute('onclick') || '';
    if (oc.includes("'" + name + "'")) b.classList.add('active');
  });
}

function filterTbl(input, tableId) {
  var q = input.value.toLowerCase();
  document.querySelectorAll('#' + tableId + ' tbody tr').forEach(function(r){
    r.style.display = r.textContent.toLowerCase().includes(q) ? '' : 'none';
  });
}

function openReview(id, name, score, status) {
  document.getElementById('modalSubId').value   = id;
  document.getElementById('modalSubtitle').textContent = 'Reviewing: ' + name;
  document.getElementById('scoreRange').value   = score || 50;
  document.getElementById('scoreHidden').value  = score || 50;
  document.getElementById('scoreDisplay').textContent = score || 50;
  document.getElementById('modalStatus').value  = status || 'REVIEWED';
  document.getElementById('reviewModal').classList.add('open');
}
function closeReview() {
  document.getElementById('reviewModal').classList.remove('open');
}
document.getElementById('reviewModal').addEventListener('click', function(e){
  if (e.target === this) closeReview();
});

var d = new Date();
if (window.innerWidth <= 900)
  document.getElementById('mobMenu').style.display = 'flex';
</script>
</body>
</html>
