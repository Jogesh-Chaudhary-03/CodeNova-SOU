<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Event – ${event.eventTitle}</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:#4f46e5;--acc:#0d9488;--acc-lt:#5eead4;
  --ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;
  --line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#fff;
  --green:#059669;--green-bg:#d1fae5;--red:#dc2626;--red-bg:#fee2e2;
  --amber:#d97706;--amber-bg:#fef3c7;--r:12px;
}
html{scroll-behavior:smooth}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:100;background:rgba(255,255,255,.97);backdrop-filter:blur(12px);border-bottom:1.5px solid var(--line);box-shadow:0 2px 8px rgba(79,70,229,.06)}
.nb{max-width:960px;margin:0 auto;padding:0 24px;display:flex;align-items:center;height:60px;gap:16px}
.nb-brand{display:flex;align-items:center;gap:9px;text-decoration:none}
.nb-logo{width:34px;height:34px;border-radius:8px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;color:#fff}
.nb-txt{font-size:14.5px;font-weight:800;color:var(--ink)}
.nb-txt span{color:var(--pri)}
.nb-back{margin-left:auto;display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:700;color:var(--sub);text-decoration:none;padding:6px 13px;border-radius:8px;border:1.5px solid var(--line);transition:color .15s,border-color .15s}
.nb-back:hover{color:var(--pri);border-color:var(--pri)}

/* PAGE HEADER */
.page-hdr{background:linear-gradient(135deg,#f59e0b 0%,#d97706 50%,#4f46e5 100%);padding:28px 0 32px;position:relative;overflow:hidden}
.page-hdr::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px}
.ph-c{position:absolute;top:-60px;right:-60px;width:220px;height:220px;border-radius:50%;background:rgba(255,255,255,.05)}
.phi{max-width:960px;margin:0 auto;padding:0 24px;position:relative;z-index:1}
.ph-label{display:inline-flex;align-items:center;gap:6px;background:rgba(255,255,255,.15);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:11px;font-weight:700;letter-spacing:.06em;padding:3px 11px;border-radius:20px;text-transform:uppercase;margin-bottom:9px}
.ph-title{font-size:22px;font-weight:800;color:#fff;margin-bottom:4px}
.ph-sub{font-size:13.5px;color:rgba(255,255,255,.75)}

/* MAIN */
.main{max-width:960px;margin:28px auto 60px;padding:0 24px}

/* CARD */
.card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 10px rgba(79,70,229,.05);margin-bottom:16px}
.card-head{padding:16px 22px;border-bottom:1px solid var(--line);background:linear-gradient(90deg,#faf9ff,#fff);display:flex;align-items:center;gap:10px}
.ch-icon{width:34px;height:34px;border-radius:9px;background:linear-gradient(135deg,var(--amber),#d97706);display:flex;align-items:center;justify-content:center;font-size:16px;box-shadow:0 3px 10px rgba(245,158,11,.3);flex-shrink:0}
.ch-title{font-size:14.5px;font-weight:800;color:var(--ink)}
.ch-sub{font-size:11.5px;color:var(--muted);margin-top:1px}
.card-body{padding:22px}

/* FIELDS */
.field{margin-bottom:16px}
.field label{display:block;font-size:12.5px;font-weight:700;color:var(--ink2);margin-bottom:6px}
.field label span{color:var(--red)}
.field .hint{font-size:11px;color:var(--muted);margin-top:4px}
.frow{display:grid;grid-template-columns:1fr 1fr;gap:16px}
@media(max-width:600px){.frow{grid-template-columns:1fr}}
.iw{position:relative}
.iw svg{position:absolute;left:11px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none}
.iw-ta svg{top:14px;transform:none}
input[type=text],input[type=email],input[type=number],
input[type=date],select,textarea{
  width:100%;border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;color:var(--ink);
  background:var(--white);outline:none;
  transition:border-color .18s,box-shadow .18s;
}
input[type=text],input[type=email],input[type=number],
input[type=date],select{padding:10px 13px 10px 36px}
textarea{padding:10px 13px 10px 36px;resize:vertical;min-height:90px}
input:focus,select:focus,textarea:focus{border-color:var(--pri);box-shadow:0 0 0 3px rgba(79,70,229,.1)}
input[type=file]{padding:10px 13px;border:1.5px dashed var(--line);cursor:pointer}
input[type=file]:hover{border-color:var(--pri)}

/* current image preview */
.curr-img{width:100%;max-height:150px;object-fit:cover;border-radius:10px;border:1.5px solid var(--line);margin-bottom:10px;display:block}

/* prize inputs */
.prize-row{display:grid;grid-template-columns:1fr 1fr 1fr;gap:10px}
@media(max-width:500px){.prize-row{grid-template-columns:1fr}}

/* submit area */
.form-actions{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-top:6px}
.btn-cancel{display:inline-flex;align-items:center;gap:7px;background:var(--white);color:var(--ink2);font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:700;padding:11px 22px;border-radius:var(--r);border:1.5px solid var(--line);cursor:pointer;text-decoration:none;transition:border-color .15s,color .15s}
.btn-cancel:hover{border-color:var(--red);color:var(--red)}
.btn-save{display:inline-flex;align-items:center;gap:7px;background:linear-gradient(135deg,var(--amber),#d97706);color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:800;padding:11px 28px;border-radius:var(--r);border:none;cursor:pointer;box-shadow:0 4px 14px rgba(245,158,11,.3);transition:opacity .15s,transform .15s}
.btn-save:hover{opacity:.92;transform:translateY(-1px)}

/* info alert */
.info-alert{display:flex;align-items:center;gap:10px;background:var(--amber-bg);border:1.5px solid #fcd34d;border-radius:10px;padding:12px 16px;font-size:13px;color:var(--amber);font-weight:600;margin-bottom:20px}
</style>
</head>
<body>

<nav class="navbar">
  <div class="nb">
    <a href="/admin-dashboard" class="nb-brand">
      <div class="nb-logo">CN</div>
      <span class="nb-txt">CodeNova <span>SOU</span></span>
    </a>
    <a href="/admin-dashboard" class="nb-back">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
      Dashboard
    </a>
  </div>
</nav>

<div class="page-hdr">
  <div class="ph-c"></div>
  <div class="phi">
    <div class="ph-label">✏️ Edit Event</div>
    <div class="ph-title">Edit: ${event.eventTitle}</div>
    <div class="ph-sub">Update event information — rounds and FAQs can be managed separately</div>
  </div>
</div>

<div class="main">

  <div class="info-alert">
    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
    Only basic info and event details can be edited here. To change rounds/FAQs, delete and re-add the event.
  </div>

  <form action="/admin/updateEvent" method="post" enctype="multipart/form-data" id="editForm">
    <input type="hidden" name="eventId" value="${event.eventId}"/>

    <!-- BASIC INFO -->
    <div class="card">
      <div class="card-head">
        <div class="ch-icon">🎯</div>
        <div><div class="ch-title">Basic Information</div><div class="ch-sub">Core event details</div></div>
      </div>
      <div class="card-body">

        <div class="frow">
          <div class="field">
            <label>Event Title <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
              <input type="text" name="eventTitle" value="${event.eventTitle}" required/>
            </div>
          </div>
          <div class="field">
            <label>Organization Name <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
              <input type="text" name="organizationName" value="${event.organizationName}" required/>
            </div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Participation Type <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
              <select name="participationType" required>
                <option value="Individual" ${event.participationType == 'Individual' ? 'selected' : ''}>Individual</option>
                <option value="Team"       ${event.participationType == 'Team'       ? 'selected' : ''}>Team</option>
              </select>
            </div>
          </div>
          <div class="field">
            <label>Location <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
              <input type="text" name="location" value="${event.location}" required/>
            </div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Skill Tags</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"/><line x1="7" y1="7" x2="7.01" y2="7"/></svg>
              <input type="text" name="skillTags" value="${event.skillTags}" placeholder="Python, ML, Design"/>
            </div>
          </div>
          <div class="field">
            <label>Prize Pool (1st, 2nd, 3rd)</label>
            <c:set var="prizes" value="${fn:split(eventDetail.prizePool, ',')}"/>
            <div class="prize-row">
              <div class="iw">
                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
                <input type="text" id="ep1" placeholder="🥇 1st" value="${not empty prizes[0] ? fn:trim(prizes[0]) : ''}" oninput="combinePrize()"/>
              </div>
              <div class="iw">
                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
                <input type="text" id="ep2" placeholder="🥈 2nd" value="${not empty prizes[1] ? fn:trim(prizes[1]) : ''}" oninput="combinePrize()"/>
              </div>
              <div class="iw">
                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
                <input type="text" id="ep3" placeholder="🥉 3rd" value="${not empty prizes[2] ? fn:trim(prizes[2]) : ''}" oninput="combinePrize()"/>
              </div>
            </div>
            <input type="hidden" name="prizePool" id="editPrizeHidden" value="${eventDetail.prizePool}"/>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Posted Date <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
              <input type="date" name="postedDate" value="${event.postedDate}" required/>
            </div>
          </div>
          <div class="field">
            <label>Registration Deadline <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
              <input type="date" name="lastDate" value="${event.lastDate}" required/>
            </div>
          </div>
        </div>

        <div class="field">
          <label>Event Banner Image</label>
          <c:if test="${not empty event.eventImage}">
            <img src="${event.eventImage}" class="curr-img" alt="Current banner"/>
            <div class="hint" style="margin-bottom:8px">Current image shown above. Upload a new one to replace it.</div>
          </c:if>
          <input type="file" name="eventFile" accept="image/*"/>
          <div class="hint">Leave empty to keep current image</div>
        </div>

      </div>
    </div>

    <!-- EVENT DETAILS -->
    <div class="card">
      <div class="card-head">
        <div class="ch-icon" style="background:linear-gradient(135deg,var(--pri),var(--acc))">📋</div>
        <div><div class="ch-title">Event Details</div><div class="ch-sub">Description, rules, perks and contact</div></div>
      </div>
      <div class="card-body">

        <div class="field">
          <label>About Event</label>
          <div class="iw iw-ta">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <textarea name="aboutEvent" rows="5">${eventDetail.aboutEvent}</textarea>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Eligibility</label>
            <div class="iw iw-ta">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
              <textarea name="eligibility" rows="3">${eventDetail.eligibility}</textarea>
            </div>
          </div>
          <div class="field">
            <label>Rules &amp; Guidelines</label>
            <div class="iw iw-ta">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
              <textarea name="rules" rows="3">${eventDetail.rules}</textarea>
            </div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Event Format</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
              <input type="text" name="eventFormat" value="${eventDetail.eventFormat}" placeholder="e.g. 48-hour hackathon"/>
            </div>
          </div>
          <div class="field">
            <label>Event Perks</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 12 20 22 4 22 4 12"/><rect x="2" y="7" width="20" height="5"/></svg>
              <input type="text" name="eventPerks" value="${eventDetail.eventPerks}" placeholder="Certificate, Goodies, Mentorship"/>
            </div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Contact Email</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/></svg>
              <input type="email" name="contactEmail" value="${eventDetail.contactEmail}" placeholder="organiser@example.com"/>
            </div>
          </div>
          <div class="field">
            <label>Contact Phone</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 13 19.79 19.79 0 0 1 1.62 4.33 2 2 0 0 1 3.6 2.18h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 9.91a16 16 0 0 0 6.06 6.06l1.31-1.31a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
              <input type="text" name="contactPhone" value="${eventDetail.contactPhone}" placeholder="+91 9876543210"/>
            </div>
          </div>
        </div>

      </div>
    </div>

    <!-- FORM ACTIONS -->
    <div class="form-actions">
      <a href="/listEventDetails/${event.eventId}" class="btn-cancel">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
        Cancel
      </a>
      <button type="submit" class="btn-save">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/><polyline points="17 21 17 13 7 13 7 21"/><polyline points="7 3 7 8 15 8"/></svg>
        Save Changes
      </button>
    </div>

  </form>
</div>

<script>
function combinePrize() {
  var p1 = (document.getElementById('ep1').value || '').trim();
  var p2 = (document.getElementById('ep2').value || '').trim();
  var p3 = (document.getElementById('ep3').value || '').trim();
  document.getElementById('editPrizeHidden').value = p1 + ',' + p2 + ',' + p3;
}
document.getElementById('editForm').addEventListener('submit', function(){ combinePrize(); });
</script>
</body>
</html>
