<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register – ${event.eventTitle}</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:#4f46e5;--acc:#0d9488;--acc-lt:#5eead4;
  --ink:#1e1b4b;--ink2:#374151;--sub:#6b7280;--muted:#9ca3af;
  --line:#e5e7eb;--bg:#f5f3ff;--bg2:#ede9fe;--white:#fff;
  --green:#059669;--green-bg:#d1fae5;--red:#dc2626;--red-bg:#fee2e2;
  --r:12px;
}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--bg);color:var(--ink);min-height:100vh}

/* NAVBAR */
.navbar{position:sticky;top:0;z-index:100;background:rgba(255,255,255,.97);backdrop-filter:blur(12px);border-bottom:1.5px solid var(--line);box-shadow:0 2px 8px rgba(79,70,229,.06)}
.nb{max-width:1100px;margin:0 auto;padding:0 24px;display:flex;align-items:center;height:60px;gap:16px}
.nb-brand{display:flex;align-items:center;gap:9px;text-decoration:none}
.nb-logo{width:34px;height:34px;border-radius:8px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:800;color:#fff}
.nb-txt{font-size:14px;font-weight:800;color:var(--ink)}
.nb-txt span{color:var(--pri)}
.nb-back{margin-left:auto;display:inline-flex;align-items:center;gap:6px;font-size:13px;font-weight:700;color:var(--sub);text-decoration:none;padding:6px 13px;border-radius:8px;border:1.5px solid var(--line);transition:color .15s,border-color .15s}
.nb-back:hover{color:var(--pri);border-color:var(--pri)}

/* HERO */
.hero{background:linear-gradient(135deg,#4f46e5 0%,#3730a3 45%,#0d9488 100%);padding:28px 0 32px;position:relative;overflow:hidden}
.hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px}
.hi{max-width:1100px;margin:0 auto;padding:0 24px;position:relative;z-index:1}
.h-chip{display:inline-flex;align-items:center;background:rgba(255,255,255,.15);border:1px solid rgba(255,255,255,.25);color:#fff;font-size:11px;font-weight:700;letter-spacing:.06em;padding:3px 11px;border-radius:20px;text-transform:uppercase;margin-bottom:9px}
.h-title{font-size:clamp(16px,2.4vw,24px);font-weight:800;color:#fff;margin-bottom:8px}
.h-meta{display:flex;flex-wrap:wrap;gap:8px}
.h-tag{display:inline-flex;align-items:center;gap:5px;background:rgba(255,255,255,.12);border:1px solid rgba(255,255,255,.2);color:rgba(255,255,255,.88);font-size:12px;font-weight:600;padding:4px 11px;border-radius:20px}

/* LAYOUT */
.wrap{max-width:1100px;margin:26px auto;padding:0 24px;display:grid;grid-template-columns:1fr 282px;gap:20px;align-items:start}
@media(max-width:780px){.wrap{grid-template-columns:1fr}.sb{order:-1}}

/* ALREADY REGISTERED */
.already{background:var(--white);border:2px solid #6ee7b7;border-radius:var(--r);padding:36px;text-align:center;box-shadow:0 4px 16px rgba(5,150,105,.1)}
.al-icon{font-size:52px;margin-bottom:12px}
.al-title{font-size:19px;font-weight:800;color:var(--ink);margin-bottom:6px}
.al-sub{font-size:13.5px;color:var(--sub);margin-bottom:20px}
.btn-view{display:inline-flex;align-items:center;gap:6px;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:800;padding:10px 22px;border-radius:10px;text-decoration:none;box-shadow:0 4px 12px rgba(79,70,229,.25)}

/* FORM CARD */
.fc{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 10px rgba(79,70,229,.05)}
.fc-head{padding:15px 20px;border-bottom:1px solid var(--line);background:linear-gradient(90deg,#faf9ff,#fff);display:flex;align-items:center;gap:9px}
.fc-ico{width:32px;height:32px;border-radius:8px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:15px}
.fc-title{font-size:14px;font-weight:800;color:var(--ink)}
.fc-sub{font-size:11.5px;color:var(--muted);margin-top:1px}
.fc-body{padding:20px}

/* TYPE TOGGLE */
.type-row{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-bottom:18px}
.t-opt{border:2px solid var(--line);border-radius:11px;padding:13px;text-align:center;cursor:pointer;transition:all .18s}
.t-opt:hover{border-color:#818cf8;background:var(--bg2)}
.t-opt.sel{border-color:var(--pri);background:var(--bg2);box-shadow:0 0 0 3px rgba(79,70,229,.1)}
.t-opt.disabled{opacity:.5;cursor:not-allowed;pointer-events:none}
.to-icon{font-size:24px;margin-bottom:5px}
.to-title{font-size:13px;font-weight:800;color:var(--ink);margin-bottom:2px}
.to-sub{font-size:11px;color:var(--muted)}

/* DIVIDER */
.div{display:flex;align-items:center;gap:10px;margin:15px 0 12px;font-size:11px;font-weight:700;color:var(--sub);letter-spacing:.06em;text-transform:uppercase}
.div::before,.div::after{content:'';flex:1;height:1px;background:var(--line)}

/* FIELDS */
.field{margin-bottom:13px}
.field label{display:block;font-size:12px;font-weight:700;color:var(--ink2);margin-bottom:5px}
.field label span{color:var(--red)}
.frow{display:grid;grid-template-columns:1fr 1fr;gap:12px}
@media(max-width:480px){.frow{grid-template-columns:1fr}}
.iw{position:relative}
.iw svg{position:absolute;left:10px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none}
input[type=text],input[type=email]{width:100%;padding:9px 13px 9px 34px;border:1.5px solid var(--line);border-radius:var(--r);font-family:'Plus Jakarta Sans',sans-serif;font-size:13px;color:var(--ink);background:var(--white);outline:none;transition:border-color .18s,box-shadow .18s}
input:focus{border-color:var(--pri);box-shadow:0 0 0 3px rgba(79,70,229,.1)}
input[readonly]{background:var(--bg);color:var(--sub)}

/* MEMBERS */
.mlist{display:flex;flex-direction:column;gap:8px;margin-bottom:10px}
.mrow{display:grid;grid-template-columns:1fr 1fr 30px;gap:8px;align-items:center;background:var(--bg);border:1.5px solid var(--line);border-radius:9px;padding:10px}
.mrow input{padding:7px 10px;font-size:12.5px;border:1.5px solid var(--line);border-radius:7px;background:var(--white);font-family:'Plus Jakarta Sans',sans-serif;outline:none;width:100%;transition:border-color .15s}
.mrow input:focus{border-color:var(--pri)}
.rm-btn{width:28px;height:28px;border-radius:7px;background:var(--red-bg);border:none;cursor:pointer;color:var(--red);display:flex;align-items:center;justify-content:center;flex-shrink:0;transition:background .14s}
.rm-btn:hover{background:#fca5a5}
.add-mem-btn{display:inline-flex;align-items:center;gap:6px;background:var(--bg2);color:var(--pri);border:1.5px solid #c7d2fe;border-radius:8px;font-family:'Plus Jakarta Sans',sans-serif;font-size:12.5px;font-weight:700;padding:7px 14px;cursor:pointer;transition:background .14s}
.add-mem-btn:hover{background:#c7d2fe}
.mc-lbl{font-size:11.5px;color:var(--muted);margin-left:6px}

/* SUBMIT */
.sub-btn{width:100%;padding:12px;background:linear-gradient(135deg,var(--pri),var(--acc));color:#fff;font-family:'Plus Jakarta Sans',sans-serif;font-size:14px;font-weight:800;border:none;border-radius:var(--r);cursor:pointer;box-shadow:0 4px 14px rgba(79,70,229,.3);transition:opacity .15s,transform .15s;display:flex;align-items:center;justify-content:center;gap:8px;margin-top:8px}
.sub-btn:hover{opacity:.92;transform:translateY(-1px)}

/* SIDEBAR */
.eic{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);overflow:hidden;box-shadow:0 2px 8px rgba(79,70,229,.04);margin-bottom:14px}
.eic-head{background:linear-gradient(135deg,var(--pri),var(--acc));padding:14px}
.eic-img{width:100%;height:96px;object-fit:cover;border-radius:7px;margin-bottom:9px;display:block}
.eic-img-ph{width:100%;height:80px;background:rgba(255,255,255,.15);border-radius:7px;display:flex;align-items:center;justify-content:center;font-size:32px;margin-bottom:9px}
.eic-title{font-size:13.5px;font-weight:800;color:#fff;margin-bottom:2px}
.eic-org{font-size:11.5px;color:rgba(255,255,255,.7)}
.eic-body{padding:13px}
.eic-row{display:flex;justify-content:space-between;align-items:center;padding:7px 0;border-bottom:1px solid var(--line);font-size:12.5px}
.eic-row:last-child{border-bottom:none}
.eic-row .k{color:var(--muted);font-weight:600}
.eic-row .v{font-weight:700;color:var(--ink2)}
.bdg{display:inline-flex;font-size:11px;font-weight:700;padding:2px 8px;border-radius:20px}
.bdg.online{background:#ccfbf1;color:#0d9488}
.bdg.offline{background:var(--bg2);color:var(--pri)}
.bdg.team{background:#fef3c7;color:#d97706}
.bdg.ind{background:var(--bg2);color:var(--pri)}

.uc{background:var(--white);border:1.5px solid var(--line);border-radius:var(--r);padding:14px;box-shadow:0 2px 8px rgba(79,70,229,.04)}
.uc-ttl{font-size:11px;font-weight:700;color:var(--sub);margin-bottom:10px;letter-spacing:.05em;text-transform:uppercase}
.uc-p{display:flex;align-items:center;gap:10px}
.uc-av{width:38px;height:38px;border-radius:50%;object-fit:cover;border:2px solid #c7d2fe}
.uc-avph{width:38px;height:38px;border-radius:50%;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;color:#fff}
.uc-name{font-size:13px;font-weight:800;color:var(--ink)}
.uc-email{font-size:11.5px;color:var(--muted);margin-top:1px}
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
    <div class="h-chip">📝 Registration</div>
    <div class="h-title">${event.eventTitle}</div>
    <div class="h-meta">
      <span class="h-tag">🏢 ${event.organizationName}</span>
      <c:if test="${not empty event.location}"><span class="h-tag">📍 ${event.location}</span></c:if>
      <c:if test="${not empty event.participationType}"><span class="h-tag">👥 ${event.participationType}</span></c:if>
      <c:if test="${not empty event.lastDate}"><span class="h-tag">📅 Deadline: ${event.lastDate}</span></c:if>
    </div>
  </div>
</div>

<div class="wrap">
  <div>

    <!-- Already Registered -->
    <c:if test="${alreadyRegistered}">
      <div class="already">
        <div class="al-icon">✅</div>
        <div class="al-title">Already Registered!</div>
        <div class="al-sub">You have already registered for <strong>${event.eventTitle}</strong>.</div>
        <a href="/listEventDetails/${event.eventId}" class="btn-view">
          View Event
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
        </a>
      </div>
    </c:if>

    <!-- FORM -->
    <c:if test="${not alreadyRegistered}">
    <div class="fc">
      <div class="fc-head">
        <div class="fc-ico">📋</div>
        <div>
          <div class="fc-title">Event Registration</div>
          <div class="fc-sub">Fill in your details below</div>
        </div>
      </div>
      <div class="fc-body">

        <form action="/submitRegistration" method="post" id="regForm" novalidate>
          <input type="hidden" name="eventId" value="${event.eventId}"/>

          <%-- ★ SINGLE participationType hidden input — JS updates this value --%>
          <input type="hidden" name="participationType" id="participationType" value="${event.participationType}"/>

          <!-- TYPE TOGGLE -->
          <div class="type-row">
            <c:choose>
              <c:when test="${event.participationType == 'Individual'}">
                <%-- Individual only — no toggle --%>
                <div class="t-opt sel" style="grid-column:1/-1">
                  <div class="to-icon">🧑</div>
                  <div class="to-title">Individual</div>
                  <div class="to-sub">Register solo</div>
                </div>
              </c:when>
              <c:when test="${event.participationType == 'Team'}">
                <%-- Team only — no toggle --%>
                <div class="t-opt sel" style="grid-column:1/-1">
                  <div class="to-icon">👥</div>
                  <div class="to-title">Team</div>
                  <div class="to-sub">Register with a team</div>
                </div>
              </c:when>
              <c:otherwise>
                <%-- Both allowed — user can choose --%>
                <div class="t-opt sel" id="opt-ind" onclick="setType('Individual')">
                  <div class="to-icon">🧑</div>
                  <div class="to-title">Individual</div>
                  <div class="to-sub">Register solo</div>
                </div>
                <div class="t-opt" id="opt-team" onclick="setType('Team')">
                  <div class="to-icon">👥</div>
                  <div class="to-title">Team</div>
                  <div class="to-sub">Register with a team</div>
                </div>
              </c:otherwise>
            </c:choose>
          </div>

          <!-- INDIVIDUAL SECTION -->
          <div id="sec-ind">
            <div class="div">Your Information</div>
            <div class="frow">
              <div class="field">
                <label>Full Name</label>
                <div class="iw">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                  <input type="text" value="${user.firstName} ${user.lastName}" readonly/>
                </div>
              </div>
              <div class="field">
                <label>Email</label>
                <div class="iw">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/></svg>
                  <input type="email" value="${user.email}" readonly/>
                </div>
              </div>
            </div>
          </div>

          <!-- TEAM SECTION -->
          <div id="sec-team" style="display:none">
            <div class="div">Team Information</div>
            <div class="frow">
              <div class="field">
                <label>Team Name <span>*</span></label>
                <div class="iw">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                  <input type="text" name="teamName" id="teamNameInput" placeholder="e.g. Team Phoenix"/>
                </div>
              </div>
              <div class="field">
                <label>Team Leader</label>
                <div class="iw">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                  <input type="text" name="teamLeader" value="${user.firstName} ${user.lastName}" readonly/>
                </div>
              </div>
            </div>

            <div class="div">
              Team Members
              <span class="mc-lbl" id="mcLbl"></span>
            </div>
            <div class="mlist" id="membersList"></div>
            <button type="button" class="add-mem-btn" onclick="addMember()">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              Add Member
            </button>
          </div>

          <button type="submit" class="sub-btn">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
            Complete Registration
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
        <c:if test="${not empty event.location}">
          <div class="eic-row">
            <span class="k">Location</span>
            <span class="bdg ${event.location == 'Online' ? 'online' : 'offline'}">${event.location}</span>
          </div>
        </c:if>
        <c:if test="${not empty event.participationType}">
          <div class="eic-row">
            <span class="k">Type</span>
            <span class="bdg ${event.participationType == 'Team' ? 'team' : 'ind'}">${event.participationType}</span>
          </div>
        </c:if>
        <c:if test="${not empty event.lastDate}">
          <div class="eic-row">
            <span class="k">Deadline</span>
            <span class="v" style="color:var(--red)">${event.lastDate}</span>
          </div>
        </c:if>
      </div>
    </div>

    <div class="uc">
      <div class="uc-ttl">Registering As</div>
      <div class="uc-p">
        <c:choose>
          <c:when test="${not empty user.profilePic}"><img src="${user.profilePic}" class="uc-av" alt=""/></c:when>
          <c:otherwise><div class="uc-avph">${fn:substring(user.firstName,0,1)}${fn:substring(user.lastName,0,1)}</div></c:otherwise>
        </c:choose>
        <div>
          <div class="uc-name">${user.firstName} ${user.lastName}</div>
          <div class="uc-email">${user.email}</div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
var mc = 0;

// ★ SINGLE setType function — updates the ONE hidden input
function setType(type) {
  document.getElementById('participationType').value = type;

  var optInd  = document.getElementById('opt-ind');
  var optTeam = document.getElementById('opt-team');
  if (optInd)  optInd.classList.toggle('sel',  type === 'Individual');
  if (optTeam) optTeam.classList.toggle('sel', type === 'Team');

  document.getElementById('sec-ind').style.display  = type === 'Individual' ? 'block' : 'none';
  document.getElementById('sec-team').style.display = type === 'Team'       ? 'block' : 'none';
}

// Init on page load
(function() {
  var eventType = '${event.participationType}';
  if (eventType === 'Team') {
    setType('Team');
  } else {
    setType('Individual');
  }
})();

// Add team member row
function addMember() {
  mc++;
  var rowId = 'mr' + mc;
  var div   = document.createElement('div');
  div.className = 'mrow';
  div.id = rowId;
  div.innerHTML =
    '<input type="text"  name="teamMemberNames"  placeholder="Member Name" />' +
    '<input type="email" name="teamMemberEmails" placeholder="member@email.com" />' +
    '<button type="button" class="rm-btn" onclick="removeMember(\'' + rowId + '\')">' +
      '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">' +
        '<line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/>' +
      '</svg>' +
    '</button>';
  document.getElementById('membersList').appendChild(div);
  updateCount();
}

function removeMember(id) {
  var el = document.getElementById(id);
  if (el) el.remove();
  updateCount();
}

function updateCount() {
  var n = document.getElementById('membersList').children.length;
  document.getElementById('mcLbl').textContent = n > 0 ? '(' + n + ' added)' : '';
}

// Form validation
document.getElementById('regForm').addEventListener('submit', function(e) {
  var type = document.getElementById('participationType').value;
  console.log('Submitting with type:', type); // debug
  if (type === 'Team') {
    var tn = document.getElementById('teamNameInput');
    if (tn && !tn.value.trim()) {
      e.preventDefault();
      tn.style.borderColor = 'var(--red)';
      tn.focus();
    }
  }
});
</script>
</body>
</html>
