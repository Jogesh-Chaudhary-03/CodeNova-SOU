<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${event.eventTitle}</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  /* Educational palette — warm indigo + teal accent */
  --pri:       #4f46e5;   /* indigo */
  --pri-dk:    #3730a3;
  --pri-lt:    #818cf8;
  --acc:       #0d9488;   /* teal */
  --acc-lt:    #5eead4;
  --warm:      #f59e0b;   /* amber */

  --ink:       #1e1b4b;
  --ink2:      #312e81;
  --sub:       #6b7280;
  --muted:     #9ca3af;
  --line:      #e5e7eb;
  --bg:        #f5f3ff;   /* very light lavender */
  --bg2:       #ede9fe;
  --white:     #ffffff;

  --green:     #059669;
  --green-bg:  #d1fae5;
  --red:       #dc2626;
  --red-bg:    #fee2e2;
  --amber-bg:  #fef3c7;

  --r: 12px;
  --nav-h: 52px;
}
html { scroll-behavior: smooth }
body { font-family:'Plus Jakarta Sans',sans-serif; background:var(--bg); color:var(--ink); min-height:100vh }

/* ════════════════════════════════
   HERO — Educational style
════════════════════════════════ */
.hero {
  background: linear-gradient(135deg, #4f46e5 0%, #3730a3 40%, #0d9488 100%);
  position: relative; overflow: hidden; padding-bottom: 0;
}

/* Decorative circles */
.hero::before {
  content:'';position:absolute;top:-80px;right:-80px;
  width:340px;height:340px;border-radius:50%;
  background:rgba(255,255,255,.06);
}
.hero::after {
  content:'';position:absolute;bottom:-60px;left:10%;
  width:220px;height:220px;border-radius:50%;
  background:rgba(13,148,136,.25);
}

/* Grid dots pattern */
.hero-dots {
  position:absolute;inset:0;
  background-image:radial-gradient(rgba(255,255,255,.12) 1px,transparent 1px);
  background-size:28px 28px;
  pointer-events:none;
}

.hero-wrap { max-width:1200px; margin:0 auto; padding:28px 28px 0; position:relative; z-index:1 }

.breadcrumb {
  display:flex; align-items:center; gap:8px;
  font-size:12.5px; color:rgba(255,255,255,.55); margin-bottom:24px;
}
.breadcrumb a { color:rgba(255,255,255,.55); text-decoration:none; transition:color .15s }
.breadcrumb a:hover { color:#fff }
.breadcrumb-sep { color:rgba(255,255,255,.3) }

.hero-body { display:flex; gap:24px; align-items:flex-start; padding-bottom:28px }

/* Event image */
.event-thumb {
  width:100px; height:100px; border-radius:16px; object-fit:cover; flex-shrink:0;
  border:3px solid rgba(255,255,255,.25);
  box-shadow: 0 8px 32px rgba(0,0,0,.25), 0 0 0 1px rgba(255,255,255,.1);
}
.event-thumb-ph {
  width:100px; height:100px; border-radius:16px; flex-shrink:0;
  background:rgba(255,255,255,.15); backdrop-filter:blur(10px);
  display:flex; align-items:center; justify-content:center; font-size:42px;
  border:3px solid rgba(255,255,255,.25);
  box-shadow:0 8px 32px rgba(0,0,0,.2);
}

.hero-text { flex:1; min-width:0 }

.org-chip {
  display:inline-flex; align-items:center; gap:6px;
  background:rgba(255,255,255,.15); backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.25);
  color:#fff; font-size:11.5px; font-weight:700; letter-spacing:.05em;
  padding:4px 12px; border-radius:20px; margin-bottom:10px; text-transform:uppercase;
}

.hero-title {
  font-weight:800; font-size:clamp(18px,2.8vw,30px);
  color:#fff; line-height:1.25; margin-bottom:14px;
  text-shadow:0 2px 12px rgba(0,0,0,.15);
}

.hero-chips { display:flex; flex-wrap:wrap; gap:8px; margin-bottom:0 }
.chip {
  display:inline-flex; align-items:center; gap:5px;
  background:rgba(255,255,255,.15); backdrop-filter:blur(6px);
  border:1px solid rgba(255,255,255,.2);
  color:rgba(255,255,255,.9); font-size:12px; font-weight:600;
  padding:5px 12px; border-radius:20px;
}
.chip.teal  { background:rgba(13,148,136,.3);  border-color:rgba(94,234,212,.4);  color:#ccfbf1 }
.chip.amber { background:rgba(245,158,11,.25); border-color:rgba(252,211,77,.4);  color:#fef3c7 }
.chip.white { background:rgba(255,255,255,.15); border-color:rgba(255,255,255,.3); color:#fff }

/* ════════════════════════════════
   STICKY NAV TABS
════════════════════════════════ */
.sticky-nav {
  position: sticky; top: 0; z-index: 200;
  background: #fff;
  border-bottom: 2px solid var(--line);
  box-shadow: 0 2px 12px rgba(79,70,229,.08);
}
.tabs-bar {
  max-width:1200px; margin:0 auto; padding:0 28px;
  display:flex; overflow-x:auto; scrollbar-width:none; gap:0;
}
.tabs-bar::-webkit-scrollbar { display:none }
.tab-btn {
  background:none; border:none; border-bottom:3px solid transparent;
  margin-bottom:-2px;
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13px; font-weight:600;
  color:var(--sub); cursor:pointer;
  padding:14px 20px; white-space:nowrap;
  transition:color .18s, border-color .18s;
  display:flex; align-items:center; gap:6px;
}
.tab-btn:hover { color:var(--pri) }
.tab-btn.active { color:var(--pri); border-bottom-color:var(--pri) }

/* ════════════════════════════════
   PAGE LAYOUT
════════════════════════════════ */
.page-wrap {
  max-width:1200px; margin:28px auto; padding:0 28px;
  display:grid; grid-template-columns:1fr 300px; gap:24px; align-items:start;
}
@media(max-width:860px){
  .page-wrap { grid-template-columns:1fr }
  .sidebar { order:-1 }
}

/* ════════════════════════════════
   SECTION
════════════════════════════════ */
.sec { margin-bottom:8px }

/* Invisible anchor that sits above section, offset by nav height */
.sec-anchor {
  display:block;
  height:calc(var(--nav-h) + 16px);
  margin-top:calc(-1 * (var(--nav-h) + 16px));
  visibility:hidden; pointer-events:none;
}

.sec-hdr {
  display:flex; align-items:center; gap:10px;
  padding:20px 0 14px; margin-bottom:14px;
  border-bottom:2px solid var(--bg2);
}
.sec-hdr-icon {
  width:36px; height:36px; border-radius:10px; flex-shrink:0;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex; align-items:center; justify-content:center; font-size:18px;
  box-shadow:0 4px 12px rgba(79,70,229,.25);
}
.sec-hdr-title {
  font-size:17px; font-weight:800; color:var(--ink)
}
.sec-hdr-line { flex:1; height:1px; background:var(--line) }

/* ════════════════════════════════
   CARD
════════════════════════════════ */
.card {
  background:var(--white); border:1px solid var(--line);
  border-radius:var(--r); margin-bottom:14px; overflow:hidden;
  box-shadow:0 1px 4px rgba(0,0,0,.04);
}
.card-head {
  padding:13px 18px; border-bottom:1px solid var(--line);
  display:flex; align-items:center; gap:9px;
  font-size:13.5px; font-weight:700; color:var(--ink);
  background:linear-gradient(90deg,#faf9ff,#fff);
}
.c-icon {
  width:26px; height:26px; border-radius:7px;
  background:var(--bg2);
  display:flex; align-items:center; justify-content:center; font-size:13px; flex-shrink:0;
}
.card-body { padding:16px 18px }

/* body text */
.body-text { font-size:14px; line-height:1.85; color:#374151; white-space:pre-line }

/* eligibility */
.elig-list { display:flex; flex-direction:column }
.elig-row {
  display:flex; align-items:flex-start; gap:11px;
  padding:10px 0; border-bottom:1px solid var(--line);
  font-size:13.5px; color:#374151;
}
.elig-row:last-child { border-bottom:none }
.elig-chk {
  width:20px; height:20px; border-radius:50%;
  background:var(--green-bg); flex-shrink:0; margin-top:1px;
  display:flex; align-items:center; justify-content:center;
}
.elig-chk svg { stroke:var(--green); width:11px; height:11px }

/* tags */
.tag-wrap { display:flex; flex-wrap:wrap; gap:8px }
.stag {
  background:var(--bg2); color:var(--pri-dk);
  border:1px solid #c7d2fe;
  font-size:12.5px; font-weight:600; padding:4px 13px; border-radius:20px;
}

/* rounds timeline */
.timeline { position:relative; padding-left:22px }
.timeline::before {
  content:''; position:absolute; left:8px; top:12px; bottom:12px;
  width:2px; background:linear-gradient(to bottom,var(--pri),#c7d2fe);
  border-radius:2px;
}
.t-item { position:relative; margin-bottom:22px }
.t-item:last-child { margin-bottom:0 }
.t-dot {
  position:absolute; left:-22px; top:2px;
  width:18px; height:18px; border-radius:50%;
  background:var(--pri); border:3px solid var(--bg2);
  display:flex; align-items:center; justify-content:center;
}
.t-dot span { font-size:8px; font-weight:800; color:#fff }
.t-name { font-weight:700; font-size:14px; color:var(--ink); margin-bottom:4px }
.t-desc { font-size:13px; color:var(--sub); line-height:1.65 }

/* date cards */
.dates-grid { display:grid; grid-template-columns:1fr 1fr; gap:14px }
@media(max-width:480px){ .dates-grid { grid-template-columns:1fr } }
.d-card {
  border:1px solid var(--line); border-radius:12px; padding:14px;
  display:flex; align-items:center; gap:13px;
  transition:box-shadow .18s, transform .18s;
  background:#fff;
}
.d-card:hover { box-shadow:0 6px 20px rgba(79,70,229,.12); transform:translateY(-2px) }
.d-box {
  border-radius:10px; color:#fff; text-align:center;
  padding:10px 12px; min-width:56px; flex-shrink:0;
}
.d-box .dd { font-size:24px; font-weight:800; line-height:1 }
.d-box .mm { font-size:10px; text-transform:uppercase; letter-spacing:.07em; opacity:.9; margin-top:2px }
.d-lbl { font-size:11.5px; color:var(--muted); margin-bottom:3px }
.d-val { font-size:13px; font-weight:700; color:var(--ink) }

/* prizes */
.prize-grid { display:grid; grid-template-columns:repeat(3,1fr); gap:14px; margin-bottom:16px }
@media(max-width:480px){ .prize-grid { grid-template-columns:1fr } }
.p-card {
  border-radius:14px; padding:20px; text-align:center;
  border:1.5px solid var(--line); transition:transform .18s, box-shadow .18s;
}
.p-card:hover { transform:translateY(-4px); box-shadow:0 8px 24px rgba(0,0,0,.08) }
.p-card.gold   { background:linear-gradient(160deg,#fffbeb,#fef9c3); border-color:#fcd34d }
.p-card.silver { background:linear-gradient(160deg,#f8fafc,#f1f5f9); border-color:#cbd5e1 }
.p-card.bronze { background:linear-gradient(160deg,#fff7ed,#ffedd5); border-color:#fdba74 }
.p-medal { font-size:32px; margin-bottom:6px }
.p-pos { font-size:10.5px; font-weight:700; letter-spacing:.07em; text-transform:uppercase; color:var(--sub); margin-bottom:6px }
.p-amt { font-size:22px; font-weight:800; color:var(--ink) }
.p-note { font-size:11.5px; color:var(--muted); margin-top:3px }
.cert-note {
  font-size:13px; color:var(--sub); text-align:center; padding:12px;
  background:var(--green-bg); border-radius:8px; margin-top:4px;
}

.perks-list { list-style:none }
.perk-row {
  display:flex; align-items:flex-start; gap:11px;
  padding:10px 0; border-bottom:1px solid var(--line);
  font-size:13.5px; color:#374151;
}
.perk-row:last-child { border-bottom:none }
.perk-ico {
  width:28px; height:28px; border-radius:8px;
  background:var(--bg2);
  display:flex; align-items:center; justify-content:center; font-size:14px; flex-shrink:0;
}

/* faq */
.faq-list { display:flex; flex-direction:column; gap:8px }
.faq-item { border:1px solid var(--line); border-radius:10px; overflow:hidden }
.faq-q {
  width:100%; text-align:left; background:none; border:none; cursor:pointer;
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px; font-weight:600; color:var(--ink);
  padding:15px 18px; display:flex; justify-content:space-between; align-items:center; gap:12px;
  transition:background .14s;
}
.faq-q:hover { background:var(--bg) }
.faq-arr {
  width:24px; height:24px; border-radius:50%;
  background:var(--bg2); flex-shrink:0;
  display:flex; align-items:center; justify-content:center;
  font-size:13px; color:var(--pri); transition:transform .22s, background .18s;
}
.faq-item.open .faq-arr { transform:rotate(180deg); background:var(--pri); color:#fff }
.faq-a {
  display:none; padding:14px 18px;
  font-size:13.5px; color:var(--sub); line-height:1.8;
  border-top:1px solid var(--line);
}
.faq-item.open .faq-a { display:block }

/* ════════════════════════════════
   SIDEBAR
════════════════════════════════ */
.sidebar { position:sticky; top:calc(var(--nav-h) + 20px) }

.reg-card {
  background:linear-gradient(145deg,var(--pri),var(--acc));
  border-radius:var(--r); padding:20px; margin-bottom:16px;
  position:relative; overflow:hidden;
  box-shadow:0 8px 24px rgba(79,70,229,.28);
}
.reg-card::before {
  content:''; position:absolute; top:-40px; right:-40px;
  width:140px; height:140px; border-radius:50%;
  background:rgba(255,255,255,.08);
}
.reg-card::after {
  content:''; position:absolute; bottom:-30px; left:-20px;
  width:100px; height:100px; border-radius:50%;
  background:rgba(255,255,255,.05);
}
.rc-label { font-size:10.5px; font-weight:700; letter-spacing:.07em; text-transform:uppercase; color:rgba(255,255,255,.6); margin-bottom:3px }
.rc-org { font-size:15px; font-weight:800; color:#fff; margin-bottom:16px; line-height:1.3; position:relative; z-index:1 }
.rc-row { display:flex; justify-content:space-between; align-items:center; padding:5px 0; font-size:12.5px }
.rc-k { color:rgba(255,255,255,.6) }
.rc-v { font-weight:700; color:#fff }
.rc-btn {
  display:block; width:100%; margin-top:16px; padding:12px;
  background:#fff; color:var(--pri);
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:14px; font-weight:800;
  border:none; border-radius:9px; cursor:pointer; text-align:center; text-decoration:none;
  transition:opacity .15s, transform .15s;
  box-shadow:0 2px 10px rgba(0,0,0,.15);
  position:relative; z-index:1;
}
.rc-btn:hover { opacity:.92; transform:translateY(-1px) }

.s-card { background:var(--white); border:1px solid var(--line); border-radius:var(--r); margin-bottom:14px; box-shadow:0 1px 4px rgba(0,0,0,.04) }
.s-body { padding:16px 18px }
.s-ttl { font-size:12.5px; font-weight:700; color:var(--ink); margin-bottom:12px; display:flex; align-items:center; gap:6px }
.s-ttl svg { color:var(--pri) }

.info-row { display:flex; justify-content:space-between; align-items:center; padding:8px 0; border-bottom:1px solid var(--line); font-size:13px }
.info-row:last-child { border-bottom:none }
.info-row .k { color:var(--muted) }
.info-row .v { font-weight:700; color:var(--ink) }

.c-person { display:flex; align-items:center; gap:12px }
.c-avatar {
  width:42px; height:42px; border-radius:50%; flex-shrink:0;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex; align-items:center; justify-content:center;
  font-size:18px; font-weight:800; color:#fff;
}
.c-name { font-size:13.5px; font-weight:700; color:var(--ink) }
.c-role { font-size:11.5px; color:var(--muted); margin-top:1px }
.c-links { margin-top:12px; display:flex; flex-direction:column; gap:7px }
.c-link {
  display:flex; align-items:center; gap:8px; font-size:12.5px; color:var(--pri);
  text-decoration:none; padding:7px 10px; border-radius:8px; background:var(--bg);
  transition:background .14s; word-break:break-all;
}
.c-link:hover { background:var(--bg2) }
</style>
</head>
<body>

<!-- ══════════ HERO ══════════ -->
<div class="hero">
  <div class="hero-dots"></div>
  <div class="hero-wrap">

    <div class="breadcrumb">
      <a href="/listEvent">← All Events</a>
      <span class="breadcrumb-sep">›</span>
      <span style="color:rgba(255,255,255,.8)">${event.eventTitle}</span>
    </div>

    <div class="hero-body">
      <c:choose>
        <c:when test="${not empty event.eventImage}">
          <img src="${event.eventImage}" class="event-thumb" alt="${event.eventTitle}"/>
        </c:when>
        <c:otherwise>
          <div class="event-thumb-ph">🏆</div>
        </c:otherwise>
      </c:choose>

      <div class="hero-text">
        <span class="org-chip">🏫 ${event.organizationName}</span>
        <h1 class="hero-title">${event.eventTitle}</h1>
        <div class="hero-chips">
          <c:if test="${not empty event.participationType}">
            <span class="chip white">👥 ${event.participationType}</span>
          </c:if>
          <c:if test="${not empty event.location}">
            <span class="chip teal">📍 ${event.location}</span>
          </c:if>
          <c:if test="${not empty event.lastDate}">
            <span class="chip amber">📅 Closes ${event.lastDate}</span>
          </c:if>
          <c:if test="${not empty event.skillTags}">
            <c:forTokens items="${event.skillTags}" delims="," var="t">
              <span class="chip white">🏷 ${fn:trim(t)}</span>
            </c:forTokens>
          </c:if>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- ══════════ STICKY TABS ══════════ -->
<div class="sticky-nav" id="sticky-nav">
  <div class="tabs-bar">
    <button class="tab-btn active" data-target="sec-home">🏠 Home</button>
    <button class="tab-btn" data-target="sec-details">📋 Details</button>
    <button class="tab-btn" data-target="sec-dates">📅 Dates &amp; Deadlines</button>
    <button class="tab-btn" data-target="sec-prizes">🏆 Prizes</button>
    <button class="tab-btn" data-target="sec-faqs">💬 FAQs</button>
  </div>
</div>

<!-- ══════════ PAGE CONTENT ══════════ -->
<div class="page-wrap">

  <!-- MAIN COLUMN -->
  <div class="main-col">

    <!-- ── HOME ── -->
    <div class="sec">
      <div id="sec-home" class="sec-anchor"></div>
      <div class="sec-hdr">
        <div class="sec-hdr-icon">🏠</div>
        <span class="sec-hdr-title">Home</span>
        <div class="sec-hdr-line"></div>
      </div>

      <div class="card">
        <div class="card-head"><div class="c-icon">📖</div> About This Event</div>
        <div class="card-body"><p class="body-text">${eventDetail.aboutEvent}</p></div>
      </div>

      <div class="card">
        <div class="card-head"><div class="c-icon">✅</div> Eligibility</div>
        <div class="card-body" style="padding:6px 18px 10px">
          <div class="elig-list">
            <c:forTokens items="${eventDetail.eligibility}" delims="," var="e">
              <div class="elig-row">
                <div class="elig-chk">
                  <svg viewBox="0 0 12 12" fill="none" stroke-width="2.2"><polyline points="2,6 5,9 10,3"/></svg>
                </div>
                ${fn:trim(e)}
              </div>
            </c:forTokens>
          </div>
        </div>
      </div>

      <c:if test="${not empty event.skillTags}">
      <div class="card">
        <div class="card-head"><div class="c-icon">🏷</div> Skill Tags</div>
        <div class="card-body">
          <div class="tag-wrap">
            <c:forTokens items="${event.skillTags}" delims="," var="t">
              <span class="stag">${fn:trim(t)}</span>
            </c:forTokens>
          </div>
        </div>
      </div>
      </c:if>
    </div>

    <!-- ── DETAILS ── -->
    <div class="sec">
      <div id="sec-details" class="sec-anchor"></div>
      <div class="sec-hdr">
        <div class="sec-hdr-icon">📋</div>
        <span class="sec-hdr-title">Details</span>
        <div class="sec-hdr-line"></div>
      </div>

      <div class="card">
        <div class="card-head"><div class="c-icon">📋</div> Event Format</div>
        <div class="card-body"><p class="body-text">${eventDetail.eventFormat}</p></div>
      </div>

      <div class="card">
        <div class="card-head"><div class="c-icon">📜</div> Rules &amp; Guidelines</div>
        <div class="card-body"><p class="body-text">${eventDetail.rules}</p></div>
      </div>

      <c:if test="${not empty rounds}">
      <div class="card">
        <div class="card-head"><div class="c-icon">🔄</div> Event Rounds</div>
        <div class="card-body">
          <div class="timeline">
            <c:forEach items="${rounds}" var="r" varStatus="s">
              <div class="t-item">
                <div class="t-dot"><span>${s.index+1}</span></div>
                <div class="t-name">${r.roundName}</div>
                <div class="t-desc">${r.roundDescription}</div>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
      </c:if>
    </div>

    <!-- ── DATES ── -->
    <div class="sec">
      <div id="sec-dates" class="sec-anchor"></div>
      <div class="sec-hdr">
        <div class="sec-hdr-icon">📅</div>
        <span class="sec-hdr-title">Dates &amp; Deadlines</span>
        <div class="sec-hdr-line"></div>
      </div>

      <div class="card">
        <div class="card-head"><div class="c-icon">📅</div> Important Dates</div>
        <div class="card-body">
          <div class="dates-grid">
            <c:if test="${not empty event.postedDate}">
              <div class="d-card">
                <div class="d-box" style="background:linear-gradient(135deg,#6366f1,#8b5cf6)">
                  <div class="dd">${event.postedDate.dayOfMonth}</div>
                  <div class="mm">${fn:substring(event.postedDate.month.toString(),0,3)}</div>
                </div>
                <div>
                  <div class="d-lbl">Posted On</div>
                  <div class="d-val">${event.postedDate}</div>
                </div>
              </div>
            </c:if>
            <c:if test="${not empty event.lastDate}">
              <div class="d-card">
                <div class="d-box" style="background:linear-gradient(135deg,#ef4444,#f97316)">
                  <div class="dd">${event.lastDate.dayOfMonth}</div>
                  <div class="mm">${fn:substring(event.lastDate.month.toString(),0,3)}</div>
                </div>
                <div>
                  <div class="d-lbl">Registration Deadline</div>
                  <div class="d-val">${event.lastDate}</div>
                </div>
              </div>
            </c:if>
          </div>
        </div>
      </div>
    </div>

    <!-- ── PRIZES ── -->
    <div class="sec">
      <div id="sec-prizes" class="sec-anchor"></div>
      <div class="sec-hdr">
        <div class="sec-hdr-icon">🏆</div>
        <span class="sec-hdr-title">Prizes</span>
        <div class="sec-hdr-line"></div>
      </div>

      <c:if test="${not empty eventDetail.prizePool}">
      <div class="card">
        <div class="card-head"><div class="c-icon">💰</div> Prize Pool</div>
        <div class="card-body">
          <div class="prize-grid">
            <div class="p-card gold">
              <div class="p-medal">🥇</div>
              <div class="p-pos">1st Place</div>
              <div class="p-amt">${eventDetail.prizePool}</div>
              <div class="p-note">Cash Prize</div>
            </div>
            <div class="p-card silver">
              <div class="p-medal">🥈</div>
              <div class="p-pos">2nd Place</div>
              <div class="p-amt">—</div>
              <div class="p-note">Stay tuned</div>
            </div>
            <div class="p-card bronze">
              <div class="p-medal">🥉</div>
              <div class="p-pos">3rd Place</div>
              <div class="p-amt">—</div>
              <div class="p-note">Stay tuned</div>
            </div>
          </div>
          <p class="cert-note">🎓 Every participant receives a certificate of participation</p>
        </div>
      </div>
      </c:if>

      <c:if test="${not empty eventDetail.eventPerks}">
      <div class="card">
        <div class="card-head"><div class="c-icon">🎁</div> Perks &amp; Benefits</div>
        <div class="card-body" style="padding:6px 18px 10px">
          <ul class="perks-list">
            <c:forTokens items="${eventDetail.eventPerks}" delims="," var="p">
              <li class="perk-row">
                <div class="perk-ico">✨</div>
                <span>${fn:trim(p)}</span>
              </li>
            </c:forTokens>
          </ul>
        </div>
      </div>
      </c:if>
    </div>

    <!-- ── FAQs ── -->
    <div class="sec">
      <div id="sec-faqs" class="sec-anchor"></div>
      <div class="sec-hdr">
        <div class="sec-hdr-icon">💬</div>
        <span class="sec-hdr-title">FAQs &amp; Discussions</span>
        <div class="sec-hdr-line"></div>
      </div>

      <div class="card">
        <div class="card-head"><div class="c-icon">💬</div> Frequently Asked Questions</div>
        <div class="card-body">
          <c:choose>
            <c:when test="${not empty faqs}">
              <div class="faq-list">
                <c:forEach items="${faqs}" var="f" varStatus="s">
                  <div class="faq-item" id="fi${s.index}">
                    <button class="faq-q" onclick="toggleFaq('fi${s.index}')">
                      <span>${f.question}</span>
                      <span class="faq-arr">▾</span>
                    </button>
                    <div class="faq-a">${f.answer}</div>
                  </div>
                </c:forEach>
              </div>
            </c:when>
            <c:otherwise>
              <p style="text-align:center;color:var(--muted);font-size:14px;padding:24px 0">No FAQs added yet.</p>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>

  </div><!-- /main-col -->

  <!-- ══════════ SIDEBAR ══════════ -->
  <div class="sidebar">

    <div class="reg-card">
      <div class="rc-label">Organised by</div>
      <div class="rc-org">${event.organizationName}</div>
      <c:if test="${not empty event.participationType}">
        <div class="rc-row"><span class="rc-k">Participation</span><span class="rc-v">${event.participationType}</span></div>
      </c:if>
      <c:if test="${not empty event.location}">
        <div class="rc-row"><span class="rc-k">Location</span><span class="rc-v">${event.location}</span></div>
      </c:if>
      <c:if test="${not empty event.lastDate}">
        <div class="rc-row">
          <span class="rc-k">Deadline</span>
          <span class="rc-v" style="color:#fde68a">${event.lastDate}</span>
        </div>
      </c:if>
		<a href="/registerEvent/${event.eventId}" class="rc-btn">Register Now →</a>    </div>

    <div class="s-card">
      <div class="s-body">
        <div class="s-ttl">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
          Event Info
        </div>
        <c:if test="${not empty event.postedDate}">
          <div class="info-row"><span class="k">Posted</span><span class="v">${event.postedDate}</span></div>
        </c:if>
        <c:if test="${not empty event.lastDate}">
          <div class="info-row"><span class="k">Last Date</span><span class="v" style="color:var(--red)">${event.lastDate}</span></div>
        </c:if>
        <c:if test="${not empty eventDetail.prizePool}">
          <div class="info-row"><span class="k">Prize Pool</span><span class="v" style="color:var(--green)">${eventDetail.prizePool}</span></div>
        </c:if>
      </div>
    </div>

    <c:if test="${not empty eventDetail.contactEmail or not empty eventDetail.contactPhone}">
    <div class="s-card">
      <div class="s-body">
        <div class="s-ttl">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
          Contact Organiser
        </div>
        <div class="c-person">
          <div class="c-avatar">${fn:substring(event.organizationName,0,1)}</div>
          <div>
            <div class="c-name">${event.organizationName}</div>
            <div class="c-role">Event Organiser</div>
          </div>
        </div>
        <div class="c-links">
          <c:if test="${not empty eventDetail.contactEmail}">
            <a href="mailto:${eventDetail.contactEmail}" class="c-link">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/></svg>
              ${eventDetail.contactEmail}
            </a>
          </c:if>
          <c:if test="${not empty eventDetail.contactPhone}">
            <a href="tel:${eventDetail.contactPhone}" class="c-link">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 13 19.79 19.79 0 0 1 1.62 4.33 2 2 0 0 1 3.6 2.18h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 9.91a16 16 0 0 0 6.06 6.06l1.31-1.31a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
              ${eventDetail.contactPhone}
            </a>
          </c:if>
        </div>
      </div>
    </div>
    </c:if>

  </div><!-- /sidebar -->
</div><!-- /page-wrap -->

<script>
// ── SCROLL FIX: renamed to goToSection to avoid conflict with window.scrollTo ──
function goToSection(targetId) {
  var el = document.getElementById(targetId);
  if (!el) return;
  var navH = document.getElementById('sticky-nav').offsetHeight;
  var top = el.getBoundingClientRect().top + window.pageYOffset - navH - 8;
  window.scrollTo({ top: top, behavior: 'smooth' });
}

// Attach click handlers to tabs
document.querySelectorAll('.tab-btn').forEach(function(btn) {
  btn.addEventListener('click', function() {
    goToSection(this.getAttribute('data-target'));
  });
});

// ── ACTIVE TAB ON SCROLL using IntersectionObserver ──
var secIds = ['sec-home','sec-details','sec-dates','sec-prizes','sec-faqs'];
var tabBtns = document.querySelectorAll('.tab-btn');

var io = new IntersectionObserver(function(entries) {
  entries.forEach(function(entry) {
    if (entry.isIntersecting) {
      var idx = secIds.indexOf(entry.target.id);
      if (idx !== -1) {
        tabBtns.forEach(function(b){ b.classList.remove('active') });
        tabBtns[idx].classList.add('active');
      }
    }
  });
}, { rootMargin: '-55px 0px -70% 0px', threshold: 0 });

secIds.forEach(function(id){
  var el = document.getElementById(id);
  if (el) io.observe(el);
});

// ── FAQ ACCORDION ──
function toggleFaq(id) {
  document.getElementById(id).classList.toggle('open');
}
</script>
</body>
</html>
