<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Event – CodeNova SOU</title>
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
html{scroll-behavior:smooth}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh}

/* ── NAVBAR ── */
.navbar{position:sticky;top:0;z-index:100;background:rgba(255,255,255,.97);backdrop-filter:blur(12px);border-bottom:1.5px solid var(--line);box-shadow:0 2px 8px rgba(79,70,229,.06)}
.nb{max-width:960px;margin:0 auto;padding:0 24px;display:flex;align-items:center;height:60px;gap:16px}
.nb-brand{display:flex;align-items:center;gap:9px;text-decoration:none}
.nb-logo{width:34px;height:34px;border-radius:8px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;color:#fff}
.nb-txt{font-size:14.5px;font-weight:800;color:var(--ink)}
.nb-txt span{color:var(--pri)}
.nb-back{margin-left:auto;display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:700;color:var(--sub);text-decoration:none;padding:6px 13px;border-radius:8px;border:1.5px solid var(--line);transition:color .15s,border-color .15s}
.nb-back:hover{color:var(--pri);border-color:var(--pri)}

/* ── PAGE HEADER ── */
.page-hdr{background:linear-gradient(135deg,#4f46e5 0%,#3730a3 45%,#0d9488 100%);padding:28px 0 32px;position:relative;overflow:hidden}
.page-hdr::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px}
.ph-c{position:absolute;top:-60px;right:-60px;width:220px;height:220px;border-radius:50%;background:rgba(255,255,255,.05)}
.phi{max-width:960px;margin:0 auto;padding:0 24px;position:relative;z-index:1}
.ph-label{display:inline-flex;align-items:center;gap:6px;background:rgba(255,255,255,.15);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:11px;font-weight:700;letter-spacing:.06em;padding:3px 11px;border-radius:20px;text-transform:uppercase;margin-bottom:9px}
.ph-title{font-size:22px;font-weight:800;color:#fff;margin-bottom:4px}
.ph-sub{font-size:13.5px;color:rgba(255,255,255,.7)}

/* ── PROGRESS STEPS ── */
.progress-bar-wrap{background:var(--white);border-bottom:1.5px solid var(--line);padding:16px 0;position:sticky;top:60px;z-index:90;box-shadow:0 2px 8px rgba(79,70,229,.05)}
.steps{max-width:960px;margin:0 auto;padding:0 24px;display:flex;align-items:center;gap:0}
.step-item{display:flex;align-items:center;flex:1}
.step-dot{width:32px;height:32px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:800;border:2px solid var(--line);background:var(--white);color:var(--muted);flex-shrink:0;transition:all .2s;cursor:pointer}
.step-dot.active{background:var(--pri);border-color:var(--pri);color:#fff;box-shadow:0 3px 10px rgba(79,70,229,.3)}
.step-dot.done{background:var(--green);border-color:var(--green);color:#fff}
.step-lbl{font-size:11.5px;font-weight:600;color:var(--muted);margin-left:8px;white-space:nowrap}
.step-lbl.active{color:var(--pri);font-weight:700}
.step-lbl.done{color:var(--green)}
.step-line{flex:1;height:2px;background:var(--line);margin:0 8px;transition:background .2s}
.step-line.done{background:var(--green)}

/* ── MAIN ── */
.main{max-width:960px;margin:28px auto 60px;padding:0 24px}

/* ── SECTION PANELS ── */
.sec-panel{display:none}
.sec-panel.active{display:block;animation:fadeIn .2s ease}
@keyframes fadeIn{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:translateY(0)}}

/* ── CARD ── */
.card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 10px rgba(79,70,229,.05);margin-bottom:16px}
.card-head{padding:16px 22px;border-bottom:1px solid var(--line);background:linear-gradient(90deg,#faf9ff,#fff);display:flex;align-items:center;gap:10px}
.ch-icon{width:34px;height:34px;border-radius:9px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:16px;box-shadow:0 3px 10px rgba(79,70,229,.22);flex-shrink:0}
.ch-title{font-size:14.5px;font-weight:800;color:var(--ink)}
.ch-sub{font-size:11.5px;color:var(--muted);margin-top:1px}
.card-body{padding:22px}

/* ── FIELDS ── */
.field{margin-bottom:16px}
.field label{display:block;font-size:12.5px;font-weight:700;color:var(--ink2);margin-bottom:6px}
.field label span{color:var(--red)}
.field .hint{font-size:11px;color:var(--muted);margin-top:4px}
.frow{display:grid;grid-template-columns:1fr 1fr;gap:16px}
.frow3{display:grid;grid-template-columns:1fr 1fr 1fr;gap:16px}
@media(max-width:600px){.frow,.frow3{grid-template-columns:1fr}}

.iw{position:relative}
.iw svg{position:absolute;left:11px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none}
.iw-ta svg{top:14px;transform:none}

input[type=text],input[type=email],input[type=number],
input[type=date],input[type=file],select,textarea{
  width:100%;
  border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;color:var(--ink);
  background:var(--white);outline:none;
  transition:border-color .18s,box-shadow .18s;
}
input[type=text],input[type=email],input[type=number],
input[type=date],select{padding:10px 13px 10px 36px}
input[type=file]{padding:10px 13px}
textarea{padding:10px 13px 10px 36px;resize:vertical;min-height:90px}
input:focus,select:focus,textarea:focus{border-color:var(--pri);box-shadow:0 0 0 3px rgba(79,70,229,.1)}

select{cursor:pointer}
input[type=date]{cursor:pointer}
input[type=file]{cursor:pointer}

/* image preview */
.img-preview{display:none;margin-top:10px}
.img-preview img{width:100%;max-height:180px;object-fit:cover;border-radius:10px;border:1.5px solid var(--line)}

/* team size box */
.team-size-box{
  background:var(--bg2);border:1.5px solid #c7d2fe;
  border-radius:10px;padding:16px;margin-bottom:16px;
  display:none;
}
.team-size-box.show{display:block}
.team-size-title{font-size:12.5px;font-weight:700;color:var(--pri-dk);margin-bottom:12px;display:flex;align-items:center;gap:6px}

/* ── DYNAMIC ROUNDS / FAQ ── */
.dynamic-list{display:flex;flex-direction:column;gap:10px;margin-bottom:12px}
.dy-item{background:var(--bg);border:1.5px solid var(--line);border-radius:10px;padding:14px;position:relative}
.dy-num{position:absolute;top:12px;left:14px;width:22px;height:22px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:800;color:#fff}
.dy-content{padding-left:32px}
.dy-remove{position:absolute;top:10px;right:10px;width:26px;height:26px;border-radius:7px;background:var(--red-bg);border:none;cursor:pointer;color:var(--red);display:flex;align-items:center;justify-content:center;transition:background .14s}
.dy-remove:hover{background:#fca5a5}
.dy-content input,.dy-content textarea{padding:9px 12px;margin-bottom:8px}
.dy-content input:last-child,.dy-content textarea:last-child{margin-bottom:0}

.add-item-btn{display:inline-flex;align-items:center;gap:6px;background:var(--bg2);color:var(--pri);border:1.5px solid #c7d2fe;border-radius:9px;font-family:'Plus Jakarta Sans',sans-serif;font-size:12.5px;font-weight:700;padding:7px 15px;cursor:pointer;transition:background .14s}
.add-item-btn:hover{background:#c7d2fe}

/* ── NAV BUTTONS ── */
.nav-btns{display:flex;justify-content:space-between;gap:12px;margin-top:8px}
.btn-back{display:inline-flex;align-items:center;gap:7px;background:var(--white);color:var(--ink2);font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:700;padding:11px 22px;border-radius:var(--r);border:1.5px solid var(--line);cursor:pointer;transition:border-color .15s,color .15s}
.btn-back:hover{border-color:var(--pri);color:var(--pri)}
.btn-next{display:inline-flex;align-items:center;gap:7px;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:800;padding:11px 24px;border-radius:var(--r);border:none;cursor:pointer;box-shadow:0 4px 14px rgba(79,70,229,.28);transition:opacity .15s,transform .15s}
.btn-next:hover{opacity:.92;transform:translateY(-1px)}
.btn-submit{display:inline-flex;align-items:center;gap:7px;background:linear-gradient(135deg,var(--green),#10b981);color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:800;padding:11px 28px;border-radius:var(--r);border:none;cursor:pointer;box-shadow:0 4px 14px rgba(5,150,105,.28);transition:opacity .15s,transform .15s}
.btn-submit:hover{opacity:.92;transform:translateY(-1px)}
</style>
</head>
<body>

<!-- NAVBAR -->
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

<!-- HEADER -->
<div class="page-hdr">
  <div class="ph-c"></div>
  <div class="phi">
    <div class="ph-label">➕ Admin Panel</div>
    <div class="ph-title">Add New Event</div>
    <div class="ph-sub">Fill in all sections to publish a new hackathon or competition</div>
  </div>
</div>

<!-- PROGRESS STEPS -->
<div class="progress-bar-wrap">
  <div class="steps">
    <div class="step-item">
      <div class="step-dot active" id="dot1" onclick="goStep(1)">1</div>
      <span class="step-lbl active" id="lbl1">Basic Info</span>
    </div>
    <div class="step-line" id="line1"></div>
    <div class="step-item">
      <div class="step-dot" id="dot2" onclick="goStep(2)">2</div>
      <span class="step-lbl" id="lbl2">Details</span>
    </div>
    <div class="step-line" id="line2"></div>
    <div class="step-item">
      <div class="step-dot" id="dot3" onclick="goStep(3)">3</div>
      <span class="step-lbl" id="lbl3">Rounds</span>
    </div>
    <div class="step-line" id="line3"></div>
    <div class="step-item">
      <div class="step-dot" id="dot4" onclick="goStep(4)">4</div>
      <span class="step-lbl" id="lbl4">FAQs</span>
    </div>
  </div>
</div>

<!-- MAIN FORM -->
<div class="main">
<form action="saveEvent" method="post" enctype="multipart/form-data" id="eventForm">

  <!-- ══ STEP 1: BASIC INFO ══ -->
  <div class="sec-panel active" id="step1">

    <div class="card">
      <div class="card-head">
        <div class="ch-icon">🎯</div>
        <div><div class="ch-title">Basic Event Information</div><div class="ch-sub">Title, organisation, type and dates</div></div>
      </div>
      <div class="card-body">

        <div class="frow">
          <div class="field">
            <label>Event Title <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
              <input type="text" name="eventTitle" placeholder="e.g. Data Science Hackathon 2026" required/>
            </div>
          </div>
          <div class="field">
            <label>Organization Name <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
              <input type="text" name="organizationName" placeholder="e.g. Silver Oak University" required/>
            </div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Participation Type <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
              <select name="participationType" id="participationType" onchange="toggleTeamSize()" required>
                <option value="">Select Type</option>
                <option value="Individual">Individual</option>
                <option value="Team">Team</option>
              </select>
            </div>
          </div>
          <div class="field">
            <label>Location <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
              <input type="text" name="location" placeholder="Online / Ahmedabad / Delhi" required/>
            </div>
          </div>
        </div>

        <!-- Team Size — shown only for Team type -->
        <div class="team-size-box" id="teamSizeBox">
          <div class="team-size-title">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
            Team Size Configuration
          </div>
          <div class="frow">
            <div class="field" style="margin-bottom:0">
              <label>Minimum Team Size</label>
              <div class="iw">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/></svg>
                <input type="number" name="minTeamSize" id="minTeamSize" placeholder="e.g. 2" min="1" max="20"/>
              </div>
            </div>
            <div class="field" style="margin-bottom:0">
              <label>Maximum Team Size</label>
              <div class="iw">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                <input type="number" name="maxTeamSize" id="maxTeamSize" placeholder="e.g. 5" min="1" max="20"/>
              </div>
              <div class="hint">Participants can form teams of this size</div>
            </div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Skill Tags</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"/><line x1="7" y1="7" x2="7.01" y2="7"/></svg>
              <input type="text" name="skillTags" placeholder="e.g. Python, ML, Frontend (comma separated)"/>
            </div>
            <div class="hint">Separate multiple tags with commas</div>
          </div>
          <div class="field">
            <label>Prize Pool (1st, 2nd, 3rd Place)</label>
            <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:10px">
              <div class="iw">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
                <input type="text" id="prize1" placeholder="🥇 1st e.g. ₹50,000" oninput="combinePrize()"/>
              </div>
              <div class="iw">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
                <input type="text" id="prize2" placeholder="🥈 2nd e.g. ₹25,000" oninput="combinePrize()"/>
              </div>
              <div class="iw">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
                <input type="text" id="prize3" placeholder="🥉 3rd e.g. ₹10,000" oninput="combinePrize()"/>
              </div>
            </div>
            <input type="hidden" name="prizePool" id="prizePoolHidden"/>
            <div class="hint">Enter amounts for each place. They will be saved as comma-separated values.</div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Posted Date <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
              <input type="date" name="postedDate" required/>
            </div>
          </div>
          <div class="field">
            <label>Registration Deadline <span>*</span></label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
              <input type="date" name="lastDate" required/>
            </div>
          </div>
        </div>

        <div class="field">
          <label>Event Banner / Image <span>*</span></label>
          <div class="iw">
            <input type="file" name="eventFile" id="eventFile" accept="image/*" onchange="previewImage(this)" required/>
          </div>
          <div class="img-preview" id="imgPreview">
            <img id="previewImg" src="" alt="Preview"/>
          </div>
          <div class="hint">Recommended: 1200×630px, JPG/PNG</div>
        </div>

      </div>
    </div>

    <div class="nav-btns">
      <div></div>
      <button type="button" class="btn-next" onclick="goStep(2)">
        Next: Event Details
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
      </button>
    </div>
  </div>

  <!-- ══ STEP 2: EVENT DETAILS ══ -->
  <div class="sec-panel" id="step2">

    <div class="card">
      <div class="card-head">
        <div class="ch-icon">📋</div>
        <div><div class="ch-title">Event Details</div><div class="ch-sub">Description, eligibility, rules and perks</div></div>
      </div>
      <div class="card-body">

        <div class="field">
          <label>About Event <span>*</span></label>
          <div class="iw iw-ta">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <textarea name="aboutEvent" rows="5" placeholder="Describe the event — its purpose, theme and what participants will build..." required></textarea>
          </div>
        </div>

        <div class="field">
          <label>Eligibility <span>*</span></label>
          <div class="iw iw-ta">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
            <textarea name="eligibility" rows="3" placeholder="e.g. Engineering Students, Postgraduate, Undergraduate (comma separated)" required></textarea>
          </div>
          <div class="hint">Separate multiple eligibility criteria with commas</div>
        </div>

        <div class="field">
          <label>Rules &amp; Guidelines</label>
          <div class="iw iw-ta">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
            <textarea name="rules" rows="4" placeholder="List the event rules and guidelines..."></textarea>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Event Format</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
              <input type="text" name="eventFormat" placeholder="e.g. 48-hour hackathon, Online sprint"/>
            </div>
          </div>
          <div class="field">
            <label>Event Perks</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 12 20 22 4 22 4 12"/><rect x="2" y="7" width="20" height="5"/><path d="M12 22V7"/><path d="M12 7H7.5a2.5 2.5 0 0 1 0-5C11 2 12 7 12 7z"/><path d="M12 7h4.5a2.5 2.5 0 0 0 0-5C13 2 12 7 12 7z"/></svg>
              <input type="text" name="eventPerks" placeholder="e.g. Certificate, Goodies, Mentorship (comma separated)"/>
            </div>
          </div>
        </div>

        <div class="frow">
          <div class="field">
            <label>Contact Email</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/></svg>
              <input type="email" name="contactEmail" placeholder="organiser@example.com"/>
            </div>
          </div>
          <div class="field">
            <label>Contact Phone</label>
            <div class="iw">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 13 19.79 19.79 0 0 1 1.62 4.33 2 2 0 0 1 3.6 2.18h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 9.91a16 16 0 0 0 6.06 6.06l1.31-1.31a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
              <input type="text" name="contactPhone" placeholder="+91 9876543210"/>
            </div>
          </div>
        </div>

      </div>
    </div>

    <div class="nav-btns">
      <button type="button" class="btn-back" onclick="goStep(1)">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Back
      </button>
      <button type="button" class="btn-next" onclick="goStep(3)">
        Next: Event Rounds
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
      </button>
    </div>
  </div>

  <!-- ══ STEP 3: ROUNDS ══ -->
  <div class="sec-panel" id="step3">

    <div class="card">
      <div class="card-head">
        <div class="ch-icon">🔄</div>
        <div><div class="ch-title">Event Rounds</div><div class="ch-sub">Add the stages/rounds of your event</div></div>
      </div>
      <div class="card-body">
        <div class="dynamic-list" id="roundList">
          <!-- Initial round -->
          <div class="dy-item" id="round1">
            <div class="dy-num">1</div>
            <div class="dy-content">
              <input type="text" name="roundName" placeholder="Round Name (e.g. Idea Submission)"/>
              <textarea name="roundDescription" rows="2" placeholder="Describe what happens in this round..."></textarea>
            </div>
          </div>
        </div>
        <button type="button" class="add-item-btn" onclick="addRound()">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Add Round
        </button>
      </div>
    </div>

    <div class="nav-btns">
      <button type="button" class="btn-back" onclick="goStep(2)">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Back
      </button>
      <button type="button" class="btn-next" onclick="goStep(4)">
        Next: FAQs
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
      </button>
    </div>
  </div>

  <!-- ══ STEP 4: FAQs ══ -->
  <div class="sec-panel" id="step4">

    <div class="card">
      <div class="card-head">
        <div class="ch-icon">💬</div>
        <div><div class="ch-title">Frequently Asked Questions</div><div class="ch-sub">Add Q&amp;As that participants commonly ask</div></div>
      </div>
      <div class="card-body">
        <div class="dynamic-list" id="faqList">
          <!-- Initial FAQ -->
          <div class="dy-item" id="faq1">
            <div class="dy-num">1</div>
            <div class="dy-content">
              <input type="text" name="question" placeholder="Question (e.g. Who can participate?)"/>
              <textarea name="answer" rows="2" placeholder="Answer..."></textarea>
            </div>
          </div>
        </div>
        <button type="button" class="add-item-btn" onclick="addFaq()">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Add FAQ
        </button>
      </div>
    </div>

    <div class="nav-btns">
      <button type="button" class="btn-back" onclick="goStep(3)">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Back
      </button>
      <button type="submit" class="btn-submit">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
        Publish Event
      </button>
    </div>
  </div>

</form>
</div>

<script>
/* ── PRIZE COMBINE ── */
function combinePrize() {
  var p1 = document.getElementById('prize1').value.trim();
  var p2 = document.getElementById('prize2').value.trim();
  var p3 = document.getElementById('prize3').value.trim();
  document.getElementById('prizePoolHidden').value = [p1,p2,p3].join(',');
}

// Combine before submit
document.getElementById('eventForm').addEventListener('submit', function(){
  combinePrize();
});

var currentStep = 1;
var roundCount  = 1;
var faqCount    = 1;

/* ── STEP NAVIGATION ── */
function goStep(n) {
  document.getElementById('step' + currentStep).classList.remove('active');
  updateDots(n);
  currentStep = n;
  document.getElementById('step' + n).classList.add('active');
  window.scrollTo({top: 0, behavior: 'smooth'});
}

function updateDots(to) {
  for (var i = 1; i <= 4; i++) {
    var dot = document.getElementById('dot' + i);
    var lbl = document.getElementById('lbl' + i);
    dot.classList.remove('active', 'done');
    lbl.classList.remove('active', 'done');
    if (i < to)       { dot.classList.add('done');   lbl.classList.add('done'); }
    else if (i === to) { dot.classList.add('active'); lbl.classList.add('active'); }
    if (i < 4) {
      var line = document.getElementById('line' + i);
      line.classList.toggle('done', i < to);
    }
  }
}

/* ── TEAM SIZE TOGGLE ── */
function toggleTeamSize() {
  var type = document.getElementById('participationType').value;
  var box  = document.getElementById('teamSizeBox');
  var minI = document.getElementById('minTeamSize');
  var maxI = document.getElementById('maxTeamSize');
  if (type === 'Team') {
    box.classList.add('show');
    minI.required = true;
    maxI.required = true;
  } else {
    box.classList.remove('show');
    minI.required = false;
    maxI.required = false;
  }
}

/* ── IMAGE PREVIEW ── */
function previewImage(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('previewImg').src = e.target.result;
      document.getElementById('imgPreview').style.display = 'block';
    };
    reader.readAsDataURL(input.files[0]);
  }
}

/* ── ADD ROUND ── */
function addRound() {
  roundCount++;
  var list = document.getElementById('roundList');
  var div  = document.createElement('div');
  div.className = 'dy-item';
  div.id = 'round' + roundCount;
  div.innerHTML =
    '<div class="dy-num">' + roundCount + '</div>' +
    '<button type="button" class="dy-remove" onclick="removeItem(\'round' + roundCount + '\',\'roundList\')">' +
      '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>' +
    '</button>' +
    '<div class="dy-content">' +
      '<input type="text" name="roundName" placeholder="Round Name"/>' +
      '<textarea name="roundDescription" rows="2" placeholder="Round description..."></textarea>' +
    '</div>';
  list.appendChild(div);
}

/* ── ADD FAQ ── */
function addFaq() {
  faqCount++;
  var list = document.getElementById('faqList');
  var div  = document.createElement('div');
  div.className = 'dy-item';
  div.id = 'faq' + faqCount;
  div.innerHTML =
    '<div class="dy-num">' + faqCount + '</div>' +
    '<button type="button" class="dy-remove" onclick="removeItem(\'faq' + faqCount + '\',\'faqList\')">' +
      '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>' +
    '</button>' +
    '<div class="dy-content">' +
      '<input type="text" name="question" placeholder="Question"/>' +
      '<textarea name="answer" rows="2" placeholder="Answer..."></textarea>' +
    '</div>';
  list.appendChild(div);
}

/* ── REMOVE ITEM ── */
function removeItem(id, listId) {
  var el = document.getElementById(id);
  if (el) {
    el.remove();
    renumberItems(listId);
  }
}

function renumberItems(listId) {
  var items = document.getElementById(listId).querySelectorAll('.dy-num');
  items.forEach(function(el, i) { el.textContent = i + 1; });
}
</script>
</body>
</html>
