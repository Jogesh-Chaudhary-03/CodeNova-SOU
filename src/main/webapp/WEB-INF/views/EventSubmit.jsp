<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Submit Work – ${event.eventTitle}</title>
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
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:100;background:rgba(255,255,255,.97);backdrop-filter:blur(12px);border-bottom:1.5px solid var(--line);box-shadow:0 2px 8px rgba(79,70,229,.06)}
.nb{max-width:1000px;margin:0 auto;padding:0 24px;display:flex;align-items:center;height:60px;gap:16px}
.nb-brand{display:flex;align-items:center;gap:9px;text-decoration:none}
.nb-logo{width:34px;height:34px;border-radius:8px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;color:#fff}
.nb-txt{font-size:14px;font-weight:800;color:var(--ink)}
.nb-txt span{color:var(--pri)}
.nb-back{margin-left:auto;display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:700;color:var(--sub);text-decoration:none;padding:6px 13px;border-radius:8px;border:1.5px solid var(--line);transition:color .15s,border-color .15s}
.nb-back:hover{color:var(--pri);border-color:var(--pri)}

/* HERO */
.hero{background:linear-gradient(135deg,#059669 0%,#0d9488 60%,#4f46e5 100%);padding:28px 0 32px;position:relative;overflow:hidden}
.hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px}
.hi{max-width:1000px;margin:0 auto;padding:0 24px;position:relative;z-index:1}
.h-chip{display:inline-flex;align-items:center;background:rgba(255,255,255,.15);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:11px;font-weight:700;letter-spacing:.06em;padding:3px 11px;border-radius:20px;text-transform:uppercase;margin-bottom:9px}
.h-title{font-size:clamp(16px,2.4vw,24px);font-weight:800;color:#fff;margin-bottom:6px}
.h-meta{display:flex;flex-wrap:wrap;gap:8px}
.h-tag{display:inline-flex;align-items:center;gap:5px;background:rgba(255,255,255,.12);border:1px solid rgba(255,255,255,.2);color:rgba(255,255,255,.88);font-size:12px;font-weight:600;padding:4px 11px;border-radius:20px}

/* MAIN */
.wrap{max-width:1000px;margin:26px auto;padding:0 24px;display:grid;grid-template-columns:1fr 280px;gap:20px;align-items:start}
@media(max-width:760px){.wrap{grid-template-columns:1fr}.sb{order:-1}}

/* ALREADY SUBMITTED */
.already-box{background:var(--white);border:2px solid #6ee7b7;border-radius:var(--r);padding:28px;text-align:center;box-shadow:0 4px 16px rgba(5,150,105,.1)}
.al-icon{font-size:48px;margin-bottom:12px}
.al-title{font-size:18px;font-weight:800;color:var(--ink);margin-bottom:6px}
.al-sub{font-size:13.5px;color:var(--sub);margin-bottom:16px}
.sub-info{background:var(--bg);border:1.5px solid var(--line);border-radius:10px;padding:14px;text-align:left;margin-bottom:16px}
.si-row{display:flex;justify-content:space-between;padding:7px 0;border-bottom:1px solid var(--line);font-size:13px}
.si-row:last-child{border-bottom:none}
.si-row .k{color:var(--muted);font-weight:600}
.si-row .v{font-weight:700;color:var(--ink2)}
.file-badge{display:inline-flex;align-items:center;gap:6px;background:var(--bg2);border:1.5px solid #c7d2fe;border-radius:8px;padding:6px 13px;font-size:13px;font-weight:700;color:var(--pri);text-decoration:none;transition:background .15s}
.file-badge:hover{background:#c7d2fe}
.status-badge{display:inline-flex;align-items:center;gap:5px;font-size:12px;font-weight:700;padding:4px 12px;border-radius:20px}
.status-badge.PENDING  {background:var(--amber-bg);color:var(--amber)}
.status-badge.REVIEWED {background:var(--bg2);color:var(--pri)}
.status-badge.APPROVED {background:var(--green-bg);color:var(--green)}
.status-badge.REJECTED {background:var(--red-bg);color:var(--red)}

/* FORM CARD */
.fc{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 10px rgba(79,70,229,.05)}
.fc-head{padding:15px 20px;border-bottom:1px solid var(--line);background:linear-gradient(90deg,#f0fdf4,#fff);display:flex;align-items:center;gap:9px}
.fc-ico{width:32px;height:32px;border-radius:8px;background:linear-gradient(135deg,var(--green),#10b981);display:flex;align-items:center;justify-content:center;font-size:15px;box-shadow:0 3px 10px rgba(5,150,105,.25)}
.fc-title{font-size:14px;font-weight:800;color:var(--ink)}
.fc-sub{font-size:11.5px;color:var(--muted);margin-top:1px}
.fc-body{padding:22px}

/* ERROR ALERT */
.err-alert{background:var(--red-bg);border:1.5px solid #fca5a5;border-radius:10px;padding:12px 16px;font-size:13px;color:var(--red);font-weight:600;margin-bottom:16px;display:flex;align-items:center;gap:8px}

/* FIELDS */
.field{margin-bottom:16px}
.field label{display:block;font-size:12.5px;font-weight:700;color:var(--ink2);margin-bottom:6px}
.field label span{color:var(--red)}
.field .hint{font-size:11px;color:var(--muted);margin-top:4px}

/* FILE DROP ZONE */
.drop-zone{
  border:2px dashed var(--line);border-radius:12px;
  padding:32px 20px;text-align:center;cursor:pointer;
  transition:border-color .2s,background .2s;
  position:relative;
}
.drop-zone:hover,.drop-zone.drag-over{border-color:var(--green);background:var(--green-bg)}
.drop-zone input[type=file]{position:absolute;inset:0;opacity:0;cursor:pointer;width:100%;height:100%}
.dz-icon{font-size:40px;margin-bottom:10px}
.dz-title{font-size:14px;font-weight:700;color:var(--ink2);margin-bottom:4px}
.dz-sub{font-size:12px;color:var(--muted)}
.dz-types{display:flex;flex-wrap:wrap;gap:6px;justify-content:center;margin-top:12px}
.dz-type{background:var(--bg2);border:1px solid #c7d2fe;color:var(--pri-dk);font-size:10.5px;font-weight:700;padding:2px 9px;border-radius:20px;text-transform:uppercase;letter-spacing:.04em}

.file-selected{
  display:none;align-items:center;gap:12px;
  background:var(--green-bg);border:1.5px solid #6ee7b7;
  border-radius:10px;padding:12px 16px;margin-top:12px;
}
.fs-icon{font-size:28px;flex-shrink:0}
.fs-name{font-size:13.5px;font-weight:700;color:var(--ink2)}
.fs-size{font-size:11.5px;color:var(--muted);margin-top:2px}
.fs-remove{margin-left:auto;background:none;border:none;cursor:pointer;color:var(--red);font-size:18px}

textarea{
  width:100%;padding:10px 14px;border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;color:var(--ink);
  background:var(--white);outline:none;resize:vertical;min-height:80px;
  transition:border-color .18s,box-shadow .18s;
}
textarea:focus{border-color:var(--green);box-shadow:0 0 0 3px rgba(5,150,105,.1)}

/* SUBMIT BTN */
.sub-btn{width:100%;padding:13px;background:linear-gradient(135deg,var(--green),#0d9488);color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:14.5px;font-weight:800;border:none;border-radius:var(--r);cursor:pointer;box-shadow:0 4px 14px rgba(5,150,105,.3);transition:opacity .15s,transform .15s;display:flex;align-items:center;justify-content:center;gap:8px;margin-top:4px}
.sub-btn:hover{opacity:.92;transform:translateY(-1px)}

/* SIDEBAR */
.eic{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 8px rgba(79,70,229,.04);margin-bottom:14px}
.eic-head{background:linear-gradient(135deg,var(--green),#0d9488);padding:14px}
.eic-img{width:100%;height:90px;object-fit:cover;border-radius:7px;margin-bottom:9px;display:block}
.eic-img-ph{width:100%;height:80px;background:rgba(255,255,255,.15);border-radius:7px;display:flex;align-items:center;justify-content:center;font-size:32px;margin-bottom:9px}
.eic-title{font-size:13.5px;font-weight:800;color:#fff;margin-bottom:2px}
.eic-org{font-size:11.5px;color:rgba(255,255,255,.7)}
.eic-body{padding:13px}
.eic-row{display:flex;justify-content:space-between;align-items:center;padding:7px 0;border-bottom:1px solid var(--line);font-size:12.5px}
.eic-row:last-child{border-bottom:none}
.eic-row .k{color:var(--muted);font-weight:600}
.eic-row .v{font-weight:700;color:var(--ink2)}

.tips-card{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:14px;box-shadow:0 2px 8px rgba(79,70,229,.04)}
.tips-title{font-size:12px;font-weight:700;color:var(--sub);text-transform:uppercase;letter-spacing:.05em;margin-bottom:10px}
.tip-item{display:flex;align-items:flex-start;gap:8px;padding:6px 0;font-size:12.5px;color:var(--ink2);border-bottom:1px solid var(--line)}
.tip-item:last-child{border-bottom:none}
.tip-dot{width:6px;height:6px;border-radius:50%;background:var(--green);flex-shrink:0;margin-top:5px}
</style>
</head>
<body>

<nav class="navbar">
  <div class="nb">
    <a href="/Home" class="nb-brand">
      <div class="nb-logo">CN</div>
      <span class="nb-txt">CodeNova <span>SOU</span></span>
    </a>
    <a href="/listEventDetails/${event.eventId}" class="nb-back">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
      Back to Event
    </a>
  </div>
</nav>

<div class="hero">
  <div class="hi">
    <div class="h-chip">📤 Submit Work</div>
    <div class="h-title">${event.eventTitle}</div>
    <div class="h-meta">
      <span class="h-tag">🏢 ${event.organizationName}</span>
      <c:if test="${not empty event.lastDate}"><span class="h-tag">📅 Deadline: ${event.lastDate}</span></c:if>
      <c:if test="${not empty event.participationType}"><span class="h-tag">👥 ${event.participationType}</span></c:if>
    </div>
  </div>
</div>

<div class="wrap">
  <div>

    <!-- Error (not registered) -->
    <c:if test="${not empty error}">
      <div class="err-alert">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
        ${error} <a href="/registerEvent/${event.eventId}" style="color:var(--pri);margin-left:6px;font-weight:800">Register Now →</a>
      </div>
    </c:if>

    <!-- Already submitted -->
    <c:if test="${not empty existing}">
      <div class="already-box">
        <div class="al-icon">📤</div>
        <div class="al-title">Work Already Submitted!</div>
        <div class="al-sub">You have already submitted your work for this event.</div>
        <div class="sub-info">
          <div class="si-row"><span class="k">File</span><span class="v">${existing.fileName}</span></div>
          <div class="si-row"><span class="k">Submitted</span><span class="v">${existing.submittedAt}</span></div>
          <div class="si-row">
            <span class="k">Status</span>
            <span class="status-badge ${existing.status}">${existing.status}</span>
          </div>
          <c:if test="${not empty existing.score}">
            <div class="si-row"><span class="k">Score</span><span class="v" style="color:var(--green)">${existing.score}/100</span></div>
          </c:if>
          <c:if test="${not empty existing.feedback}">
            <div class="si-row"><span class="k">Feedback</span><span class="v">${existing.feedback}</span></div>
          </c:if>
        </div>
        <a href="${existing.fileUrl}" target="_blank" class="file-badge">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Download / View Submission
        </a>
      </div>
    </c:if>

    <!-- Submit Form (if not already submitted and registered) -->
    <c:if test="${empty existing and empty error}">
    <div class="fc">
      <div class="fc-head">
        <div class="fc-ico">📤</div>
        <div>
          <div class="fc-title">Submit Your Work</div>
          <div class="fc-sub">Upload your project file for review</div>
        </div>
      </div>
      <div class="fc-body">
        <form action="/submitWork" method="post" enctype="multipart/form-data" id="subForm" novalidate>
          <input type="hidden" name="eventId" value="${event.eventId}"/>

          <!-- Team info if team event -->
          <c:if test="${participant.participationType == 'Team'}">
            <div style="background:var(--bg2);border:1.5px solid #c7d2fe;border-radius:9px;padding:11px 14px;margin-bottom:16px;font-size:13px;color:var(--pri)">
              👥 Submitting as team: <strong>${participant.teamName}</strong>
            </div>
          </c:if>

          <div class="field">
            <label>Upload File <span>*</span></label>
            <div class="drop-zone" id="dropZone">
              <input type="file" name="submissionFile" id="fileInput" accept=".pdf,.zip,.rar,.docx,.pptx,.txt,.mp4,.png,.jpg" required onchange="fileSelected(this)"/>
              <div class="dz-icon">☁️</div>
              <div class="dz-title">Drag & drop or click to upload</div>
              <div class="dz-sub">Maximum file size: 100MB</div>
              <div class="dz-types">
                <span class="dz-type">PDF</span>
                <span class="dz-type">ZIP</span>
                <span class="dz-type">RAR</span>
                <span class="dz-type">DOCX</span>
                <span class="dz-type">PPTX</span>
                <span class="dz-type">MP4</span>
              </div>
            </div>
            <div class="file-selected" id="fileSelected">
              <span class="fs-icon" id="fsIcon">📄</span>
              <div>
                <div class="fs-name" id="fsName">—</div>
                <div class="fs-size" id="fsSize">—</div>
              </div>
              <button type="button" class="fs-remove" onclick="clearFile()" title="Remove">✕</button>
            </div>
          </div>

          <div class="field">
            <label>Project Description / Notes</label>
            <textarea name="description" placeholder="Briefly describe your project, approach, technologies used..." rows="4"></textarea>
            <div class="hint">This will help judges understand your work better</div>
          </div>

          <button type="submit" class="sub-btn" id="submitBtn">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
            Submit Work
          </button>
        </form>
      </div>
    </div>
    </c:if>

  </div>

  <!-- SIDEBAR -->
  <div class="sb">
    <div class="eic">
      <div class="eic-head">
        <c:choose>
          <c:when test="${not empty event.eventImage}"><img src="${event.eventImage}" class="eic-img" alt=""/></c:when>
          <c:otherwise><div class="eic-img-ph">🏆</div></c:otherwise>
        </c:choose>
        <div class="eic-title">${event.eventTitle}</div>
        <div class="eic-org">${event.organizationName}</div>
      </div>
      <div class="eic-body">
        <c:if test="${not empty participant}">
          <div class="eic-row"><span class="k">Registered As</span><span class="v">${participant.participationType}</span></div>
          <c:if test="${not empty participant.teamName}">
            <div class="eic-row"><span class="k">Team</span><span class="v">${participant.teamName}</span></div>
          </c:if>
        </c:if>
        <c:if test="${not empty event.lastDate}">
          <div class="eic-row"><span class="k">Event Deadline</span><span class="v" style="color:var(--red)">${event.lastDate}</span></div>
        </c:if>
      </div>
    </div>

    <div class="tips-card">
      <div class="tips-title">📌 Submission Tips</div>
      <div class="tip-item"><div class="tip-dot"></div>Make sure your file is complete before submitting</div>
      <div class="tip-item"><div class="tip-dot"></div>ZIP all project files for easier review</div>
      <div class="tip-item"><div class="tip-dot"></div>Include a README in your submission</div>
      <div class="tip-item"><div class="tip-dot"></div>Add a brief description to help judges</div>
      <div class="tip-item"><div class="tip-dot"></div>You can only submit once — make it count!</div>
    </div>
  </div>
</div>

<script>
var selectedFile = null;

function fileSelected(input) {
  var file = input.files[0];
  if (!file) return;
  selectedFile = file;
  var icons = {pdf:'📄',zip:'🗜️',rar:'🗜️',docx:'📝',pptx:'📊',mp4:'🎥',png:'🖼️',jpg:'🖼️'};
  var ext = file.name.split('.').pop().toLowerCase();
  document.getElementById('fsIcon').textContent = icons[ext] || '📁';
  document.getElementById('fsName').textContent = file.name;
  document.getElementById('fsSize').textContent = (file.size / 1024 / 1024).toFixed(2) + ' MB';
  document.getElementById('fileSelected').style.display = 'flex';
}

function clearFile() {
  document.getElementById('fileInput').value = '';
  document.getElementById('fileSelected').style.display = 'none';
  selectedFile = null;
}

// Drag and drop
var dz = document.getElementById('dropZone');
if (dz) {
  dz.addEventListener('dragover', function(e){ e.preventDefault(); dz.classList.add('drag-over'); });
  dz.addEventListener('dragleave', function(){ dz.classList.remove('drag-over'); });
  dz.addEventListener('drop', function(e){
    e.preventDefault(); dz.classList.remove('drag-over');
    var files = e.dataTransfer.files;
    if (files.length) {
      document.getElementById('fileInput').files = files;
      fileSelected(document.getElementById('fileInput'));
    }
  });
}

// Submit loading state
var form = document.getElementById('subForm');
if (form) {
  form.addEventListener('submit', function(){
    var btn = document.getElementById('submitBtn');
    btn.disabled = true;
    btn.innerHTML = '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="animation:spin 1s linear infinite"><path d="M21 12a9 9 0 1 1-6.219-8.56"/></svg> Uploading...';
  });
}
</script>
<style>@keyframes spin{from{transform:rotate(0deg)}to{transform:rotate(360deg)}}</style>
</body>
</html>
