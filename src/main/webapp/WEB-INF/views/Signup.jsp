<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:     #4f46e5;
  --pri-dk:  #3730a3;
  --acc:     #0d9488;
  --acc-lt:  #5eead4;
  --ink:     #1e1b4b;
  --ink2:    #374151;
  --sub:     #6b7280;
  --muted:   #9ca3af;
  --line:    #e5e7eb;
  --bg:      #f5f3ff;
  --bg2:     #ede9fe;
  --white:   #ffffff;
  --red:     #dc2626;
  --red-bg:  #fee2e2;
  --green:   #059669;
  --r:       12px;
}
html{scroll-behavior:smooth}
body{
  font-family:'Plus Jakarta Sans',sans-serif;
  background:var(--bg);
  min-height:100vh;
  display:grid;
  grid-template-columns:1fr 1fr;
}
@media(max-width:860px){body{grid-template-columns:1fr}}

/* ════════ LEFT PANEL ════════ */
.left-panel{
  background:linear-gradient(145deg,#4f46e5 0%,#3730a3 45%,#0d9488 100%);
  position:relative;overflow:hidden;
  display:flex;flex-direction:column;justify-content:center;
  padding:60px 52px;min-height:100vh;
}
@media(max-width:860px){.left-panel{display:none}}
.lp-c1{position:absolute;top:-80px;right:-80px;width:320px;height:320px;border-radius:50%;background:rgba(255,255,255,.06)}
.lp-c2{position:absolute;bottom:-60px;left:-40px;width:240px;height:240px;border-radius:50%;background:rgba(13,148,136,.2)}
.left-panel::before{content:'';position:absolute;inset:0;background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);background-size:26px 26px;pointer-events:none;}
.lp-inner{position:relative;z-index:1}
.lp-logo{display:inline-flex;align-items:center;gap:10px;margin-bottom:52px;text-decoration:none}
.lp-logo-box{width:42px;height:42px;border-radius:11px;background:rgba(255,255,255,.2);backdrop-filter:blur(8px);border:1.5px solid rgba(255,255,255,.3);display:flex;align-items:center;justify-content:center;font-size:16px;font-weight:800;color:#fff;}
.lp-logo-txt{font-size:17px;font-weight:800;color:#fff}
.lp-logo-txt span{color:var(--acc-lt)}
.lp-h{font-size:clamp(24px,2.8vw,34px);font-weight:800;color:#fff;line-height:1.25;margin-bottom:14px}
.lp-h em{font-style:normal;color:var(--acc-lt)}
.lp-p{font-size:14.5px;color:rgba(255,255,255,.72);line-height:1.75;margin-bottom:40px}
.lp-stats{display:grid;grid-template-columns:1fr 1fr;gap:14px}
.lp-stat{background:rgba(255,255,255,.1);backdrop-filter:blur(8px);border:1px solid rgba(255,255,255,.15);border-radius:12px;padding:16px;}
.lp-stat-num{font-size:22px;font-weight:800;color:#fff;line-height:1}
.lp-stat-lbl{font-size:11.5px;color:rgba(255,255,255,.6);margin-top:3px;font-weight:600}

/* ════════ RIGHT PANEL ════════ */
.right-panel{display:flex;flex-direction:column;justify-content:center;align-items:center;padding:48px 28px;min-height:100vh;background:var(--bg);overflow-y:auto;}
.form-box{width:100%;max-width:460px}
.mobile-logo{display:none;align-items:center;justify-content:center;gap:9px;margin-bottom:20px}
@media(max-width:860px){.mobile-logo{display:flex}}
.mobile-logo-box{width:38px;height:38px;border-radius:10px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:15px;font-weight:800;color:#fff;}
.mobile-logo-txt{font-size:16px;font-weight:800;color:var(--ink)}
.mobile-logo-txt span{color:var(--pri)}

.form-top{text-align:center;margin-bottom:24px}
.form-title{font-size:22px;font-weight:800;color:var(--ink);margin-bottom:6px}
.form-sub{font-size:13.5px;color:var(--sub)}

/* ── SERVER ERROR ALERT ── */
.alert-err{
  display:flex;align-items:flex-start;gap:10px;
  background:var(--red-bg);border:1.5px solid #fca5a5;
  border-radius:10px;padding:13px 15px;
  font-size:13.5px;color:var(--red);font-weight:600;
  margin-bottom:20px;animation:shake .4s ease;
}
.alert-err svg{flex-shrink:0;margin-top:1px}
@keyframes shake{0%,100%{transform:translateX(0)}20%{transform:translateX(-6px)}40%{transform:translateX(6px)}60%{transform:translateX(-4px)}80%{transform:translateX(4px)}}

/* ── STEPS ── */
.steps{display:flex;align-items:center;justify-content:center;gap:0;margin-bottom:28px}
.step-wrap{display:flex;flex-direction:column;align-items:center}
.step-dot{
  width:32px;height:32px;border-radius:50%;
  display:flex;align-items:center;justify-content:center;
  font-size:12px;font-weight:800;
  border:2px solid var(--line);background:var(--white);color:var(--muted);
  transition:all .25s;flex-shrink:0;
}
.step-dot.active{background:var(--pri);border-color:var(--pri);color:#fff;box-shadow:0 3px 10px rgba(79,70,229,.3)}
.step-dot.done{background:var(--green);border-color:var(--green);color:#fff}
.step-lbl{font-size:11px;font-weight:600;color:var(--muted);margin-top:5px;text-align:center}
.step-line{width:48px;height:2px;background:var(--line);flex-shrink:0;transition:background .25s}
.step-line.done{background:var(--green)}

/* ── FORM STEPS ── */
.form-step{display:none}
.form-step.active{display:block;animation:fadeIn .2s ease}
@keyframes fadeIn{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:translateY(0)}}

/* ── PROFILE PIC ── */
.pic-upload-wrap{display:flex;flex-direction:column;align-items:center;margin-bottom:20px;}
.pic-ring{position:relative;width:96px;height:96px;margin-bottom:12px;}
.pic-preview{
  width:96px;height:96px;border-radius:50%;
  border:3px solid var(--line);background:var(--bg2);
  display:flex;align-items:center;justify-content:center;
  transition:border-color .2s;overflow:hidden;
}
.pic-preview img{width:100%;height:100%;object-fit:cover;border-radius:50%;display:none;}
.pic-placeholder{display:flex;flex-direction:column;align-items:center;justify-content:center;width:100%;height:100%;}
.pic-placeholder span{font-size:30px}
.pic-edit-btn{
  position:absolute;bottom:2px;right:2px;
  width:28px;height:28px;border-radius:50%;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  border:2.5px solid var(--white);
  display:flex;align-items:center;justify-content:center;cursor:pointer;
  box-shadow:0 2px 8px rgba(79,70,229,.3);transition:transform .15s;
}
.pic-edit-btn:hover{transform:scale(1.1)}
.pic-edit-btn svg{color:#fff}
input[type=file]#profilePic{display:none}
.pic-upload-lbl{font-size:12.5px;font-weight:600;color:var(--sub);margin-bottom:2px}
.pic-upload-sub{font-size:11px;color:var(--muted)}
.pic-name{font-size:11.5px;color:var(--pri);font-weight:600;margin-top:4px;display:none;background:var(--bg2);padding:3px 10px;border-radius:20px;}

/* ── FIELDS ── */
.field{margin-bottom:16px}
.field label{display:block;font-size:12.5px;font-weight:700;color:var(--ink2);margin-bottom:6px;}
.field label .req{color:var(--red)}
.field-row{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.input-wrap{position:relative}
.input-wrap>svg:first-of-type{position:absolute;left:12px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none;flex-shrink:0;}
input[type=text],input[type=email],input[type=password],input[type=tel]{
  width:100%;padding:10px 14px 10px 38px;
  border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px;color:var(--ink);background:var(--white);outline:none;
  transition:border-color .18s,box-shadow .18s;
}
input:focus{border-color:var(--pri);box-shadow:0 0 0 3px rgba(79,70,229,.1)}
input.input-error{border-color:var(--red);box-shadow:0 0 0 3px rgba(220,38,38,.08)}
input.input-ok{border-color:#10b981;box-shadow:0 0 0 3px rgba(16,185,129,.08)}

/* ── INLINE ERROR ── */
.err-msg{
  display:flex;align-items:center;gap:5px;
  font-size:11.5px;color:var(--red);margin-top:5px;
  opacity:0;max-height:0;overflow:hidden;
  transition:opacity .2s,max-height .2s;
}
.err-msg.show{opacity:1;max-height:40px}
.err-msg svg{flex-shrink:0}

/* ── GENDER RADIOS ── */
.radio-group{display:flex;gap:10px;flex-wrap:wrap}
.radio-opt{
  flex:1;min-width:80px;border:1.5px solid var(--line);border-radius:10px;
  padding:10px;text-align:center;cursor:pointer;
  transition:border-color .18s,background .18s;
}
.radio-opt:hover{border-color:var(--pri);background:var(--bg2)}
.radio-opt input{display:none}
.radio-opt.selected{border-color:var(--pri);background:var(--bg2)}
.radio-opt .ro-icon{font-size:20px;margin-bottom:4px}
.radio-opt .ro-lbl{font-size:12px;font-weight:700;color:var(--ink2)}
.gender-error-wrap{margin-top:6px}

/* ── PW STRENGTH ── */
.pw-strength{margin-top:6px}
.pw-bars{display:flex;gap:4px;margin-bottom:4px}
.pw-bar{flex:1;height:3px;border-radius:2px;background:var(--line);transition:background .2s}
.pw-label{font-size:11px;color:var(--muted);font-weight:600}
.pw-toggle{position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;cursor:pointer;color:var(--muted);padding:2px;transition:color .15s;}
.pw-toggle:hover{color:var(--pri)}

/* ── BUTTONS ── */
.btn-pri{
  width:100%;padding:12px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  color:#fff;font-family:'Plus Jakarta Sans',sans-serif;
  font-size:14px;font-weight:800;border:none;border-radius:var(--r);cursor:pointer;
  box-shadow:0 4px 14px rgba(79,70,229,.28);
  transition:opacity .16s,transform .16s;
  display:flex;align-items:center;justify-content:center;gap:8px;
}
.btn-pri:hover{opacity:.92;transform:translateY(-1px)}
.btn-pri:disabled{opacity:.6;cursor:not-allowed;transform:none}
.btn-sec{
  width:100%;padding:11px;background:var(--white);color:var(--ink2);
  font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:700;
  border:1.5px solid var(--line);border-radius:var(--r);cursor:pointer;
  transition:border-color .16s,color .16s;
  display:flex;align-items:center;justify-content:center;gap:8px;
}
.btn-sec:hover{border-color:var(--pri);color:var(--pri)}
.btn-row{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-top:6px}

/* ── STEP SUMMARY BOX (shows filled values) ── */
.step-summary{
  background:var(--bg2);border:1.5px solid rgba(79,70,229,.15);
  border-radius:10px;padding:12px 14px;margin-bottom:16px;
  font-size:12.5px;color:var(--ink2);display:none;
}
.step-summary.show{display:block}
.step-summary strong{color:var(--pri);font-weight:700}

/* ── LOGIN LINK ── */
.login-link{text-align:center;font-size:13px;color:var(--sub);margin-top:22px}
.login-link a{color:var(--pri);font-weight:700;text-decoration:none}
.login-link a:hover{text-decoration:underline}
</style>
</head>
<body>

<!-- ════════ LEFT PANEL ════════ -->
<div class="left-panel">
  <div class="lp-c1"></div><div class="lp-c2"></div>
  <div class="lp-inner">
    <a href="Home" class="lp-logo">
      <div class="lp-logo-box">CN</div>
      <span class="lp-logo-txt">CodeNova <span>SOU</span></span>
    </a>
    <h1 class="lp-h">Join the <em>Ultimate</em><br>Hackathon Platform 🚀</h1>
    <p class="lp-p">Create your account and get access to hackathons, design challenges, and coding competitions at Silver Oak University.</p>
    <div class="lp-stats">
      <div class="lp-stat"><div class="lp-stat-num">50+</div><div class="lp-stat-lbl">Events Hosted</div></div>
      <div class="lp-stat"><div class="lp-stat-num">2K+</div><div class="lp-stat-lbl">Participants</div></div>
      <div class="lp-stat"><div class="lp-stat-num">₹5L+</div><div class="lp-stat-lbl">Prize Pool</div></div>
      <div class="lp-stat"><div class="lp-stat-num">30+</div><div class="lp-stat-lbl">Organisations</div></div>
    </div>
  </div>
</div>

<!-- ════════ RIGHT PANEL ════════ -->
<div class="right-panel">
  <div class="form-box">

    <div class="mobile-logo">
      <div class="mobile-logo-box">CN</div>
      <span class="mobile-logo-txt">CodeNova <span>SOU</span></span>
    </div>

    <div class="form-top">
      <div class="form-title">Create Account 📝</div>
      <div class="form-sub">Fill in your details to get started</div>
    </div>

    <%-- ✅ FIX: Server-side validation error display (e.g. email already registered) --%>
    <%
      String serverError = (String) request.getAttribute("signupError");
    %>
    <% if (serverError != null && !serverError.isEmpty()) { %>
    <div class="alert-err">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/>
      </svg>
      <span><%= serverError %></span>
    </div>
    <% } %>

    <!-- Steps indicator -->
    <div class="steps">
      <div class="step-wrap"><div class="step-dot active" id="dot1">1</div><div class="step-lbl">Personal</div></div>
      <div class="step-line" id="line1"></div>
      <div class="step-wrap"><div class="step-dot" id="dot2">2</div><div class="step-lbl">Contact</div></div>
      <div class="step-line" id="line2"></div>
      <div class="step-wrap"><div class="step-dot" id="dot3">3</div><div class="step-lbl">Security</div></div>
    </div>

    <form action="usersignup" method="post" enctype="multipart/form-data" id="signupForm" novalidate>

      <!-- ══ STEP 1: Personal ══ -->
      <div class="form-step active" id="step1">

        <!-- Profile Picture -->
        <div class="pic-upload-wrap">
          <div class="pic-ring">
            <div class="pic-preview" id="picPreview">
              <div class="pic-placeholder"><span>🧑</span></div>
              <img id="picImg" src="" alt="Profile Preview"/>
            </div>
            <label for="profilePic" class="pic-edit-btn" title="Upload photo">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                <path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/>
                <circle cx="12" cy="13" r="4"/>
              </svg>
            </label>
          </div>
          <div class="pic-upload-lbl">Profile Photo</div>
          <div class="pic-upload-sub">JPG, PNG — max 2MB (optional)</div>
          <div class="pic-name" id="picName"></div>
          <input type="file" id="profilePic" name="picFile" accept="image/*">
        </div>

        <!-- Name Row -->
        <div class="field-row">
          <div class="field">
            <label for="firstName">First Name <span class="req">*</span></label>
            <div class="input-wrap">
              <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
              <input type="text" name="firstName" id="firstName" placeholder="Rahul" autocomplete="given-name">
            </div>
            <div class="err-msg" id="err-firstName">
              <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
              <span>First name is required</span>
            </div>
          </div>
          <div class="field">
            <label for="lastName">Last Name <span class="req">*</span></label>
            <div class="input-wrap">
              <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
              <input type="text" name="lastName" id="lastName" placeholder="Sharma" autocomplete="family-name">
            </div>
            <div class="err-msg" id="err-lastName">
              <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
              <span>Last name is required</span>
            </div>
          </div>
        </div>

        <!-- Gender -->
        <div class="field">
          <label>Gender <span class="req">*</span></label>
          <div class="radio-group">
            <label class="radio-opt" id="ro-male">
              <input type="radio" name="gender" value="Male">
              <div class="ro-icon">👨</div><div class="ro-lbl">Male</div>
            </label>
            <label class="radio-opt" id="ro-female">
              <input type="radio" name="gender" value="Female">
              <div class="ro-icon">👩</div><div class="ro-lbl">Female</div>
            </label>
            <label class="radio-opt" id="ro-other">
              <input type="radio" name="gender" value="Other">
              <div class="ro-icon">🧑</div><div class="ro-lbl">Other</div>
            </label>
          </div>
          <div class="err-msg" id="err-gender">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <span>Please select your gender</span>
          </div>
        </div>

        <div style="margin-top:8px">
          <button type="button" class="btn-pri" onclick="goStep(2)">
            Continue
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
          </button>
        </div>
      </div>

      <!-- ══ STEP 2: Contact ══ -->
      <div class="form-step" id="step2">

        <!-- Summary of step 1 -->
        <div class="step-summary show" id="summary1">
          👤 <strong id="summaryName">—</strong> &nbsp;|&nbsp; <span id="summaryGender">—</span>
        </div>

        <div class="field">
          <label for="email">Email Address <span class="req">*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/></svg>
            <input type="email" name="email" id="email" placeholder="rahul@example.com" autocomplete="email">
          </div>
          <div class="err-msg" id="err-email">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <span id="err-email-txt">Please enter a valid email address</span>
          </div>
        </div>

        <div class="field">
          <label for="mobileNumber">Mobile Number <span class="req">*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 13 19.79 19.79 0 0 1 1.62 4.33 2 2 0 0 1 3.6 2.18h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 9.91a16 16 0 0 0 6.06 6.06l1.31-1.31a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
            <input type="tel" name="mobileNumber" id="mobileNumber" placeholder="9876543210" maxlength="10" autocomplete="tel">
          </div>
          <div class="err-msg" id="err-mobile">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <span id="err-mobile-txt">Please enter a valid 10-digit number</span>
          </div>
        </div>

        <div class="btn-row">
          <button type="button" class="btn-sec" onclick="goStep(1)">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
            Back
          </button>
          <button type="button" class="btn-pri" onclick="goStep(3)">
            Continue
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M5 12h14M12 5l7 7-7 7"/></svg>
          </button>
        </div>
      </div>

      <!-- ══ STEP 3: Security ══ -->
      <div class="form-step" id="step3">

        <!-- Summary of step 1 & 2 -->
        <div class="step-summary show" id="summary2">
          ✉️ <strong id="summaryEmail">—</strong> &nbsp;|&nbsp; 📱 <span id="summaryMobile">—</span>
        </div>

        <div class="field">
          <label for="password">Password <span class="req">*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
            <input type="password" name="password" id="password" placeholder="Min. 8 characters" oninput="checkStrength(this.value)" autocomplete="new-password">
            <button type="button" class="pw-toggle" onclick="togglePw('password','eyeIcon1')" aria-label="Toggle password">
              <svg id="eyeIcon1" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
            </button>
          </div>
          <div class="pw-strength">
            <div class="pw-bars">
              <div class="pw-bar" id="bar1"></div><div class="pw-bar" id="bar2"></div>
              <div class="pw-bar" id="bar3"></div><div class="pw-bar" id="bar4"></div>
            </div>
            <div class="pw-label" id="pwLabel">Enter a password</div>
          </div>
          <div class="err-msg" id="err-password">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <span id="err-password-txt">Password must be at least 8 characters</span>
          </div>
        </div>

        <div class="field">
          <label for="confirmPassword">Confirm Password <span class="req">*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
            <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Re-enter password" autocomplete="new-password">
            <button type="button" class="pw-toggle" onclick="togglePw('confirmPassword','eyeIcon2')" aria-label="Toggle confirm password">
              <svg id="eyeIcon2" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
            </button>
          </div>
          <div class="err-msg" id="err-confirm">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <span id="err-confirm-txt">Passwords do not match</span>
          </div>
        </div>

        <div class="btn-row">
          <button type="button" class="btn-sec" onclick="goStep(2)">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
            Back
          </button>
          <button type="submit" class="btn-pri" id="submitBtn">
            Create Account ✓
          </button>
        </div>
      </div>

    </form>

    <div class="login-link">
      Already have an account? <a href="login">Login here</a>
    </div>

  </div>
</div>

<script>
var currentStep = 1;

/* ════════ HELPER FUNCTIONS ════════ */
function showErr(inputId, errId, msg) {
  var inp = document.getElementById(inputId);
  if (inp) { inp.classList.add('input-error'); inp.classList.remove('input-ok'); }
  var err = document.getElementById(errId);
  if (!err) return;
  var span = err.querySelector('span');
  if (span && msg) span.textContent = msg;
  err.classList.add('show');
}
function clearErr(inputId, errId) {
  var inp = document.getElementById(inputId);
  if (inp) { inp.classList.remove('input-error'); inp.classList.add('input-ok'); }
  var err = document.getElementById(errId);
  if (err) err.classList.remove('show');
}
function resetField(inputId, errId) {
  var inp = document.getElementById(inputId);
  if (inp) inp.classList.remove('input-error','input-ok');
  var err = document.getElementById(errId);
  if (err) err.classList.remove('show');
}

/* ════════ STEP NAVIGATION ════════ */
function goStep(n) {
  if (n > currentStep && !validateStep(currentStep)) return;
  document.getElementById('step' + currentStep).classList.remove('active');
  updateDots(n);
  currentStep = n;
  document.getElementById('step' + n).classList.add('active');

  /* Update summaries when moving forward */
  if (n === 2) updateSummary1();
  if (n === 3) updateSummary2();
}

function updateDots(to) {
  for (var i = 1; i <= 3; i++) {
    var d = document.getElementById('dot' + i);
    d.classList.remove('active','done');
    if      (i < to)   d.classList.add('done');
    else if (i === to) d.classList.add('active');
  }
  for (var j = 1; j <= 2; j++)
    document.getElementById('line' + j).classList.toggle('done', j < to);
}

function updateSummary1() {
  var fn = document.getElementById('firstName').value.trim();
  var ln = document.getElementById('lastName').value.trim();
  var gc = document.querySelector('input[name="gender"]:checked');
  document.getElementById('summaryName').textContent    = (fn + ' ' + ln).trim() || '—';
  document.getElementById('summaryGender').textContent  = gc ? gc.value : '—';
}
function updateSummary2() {
  var em = document.getElementById('email').value.trim();
  var mb = document.getElementById('mobileNumber').value.trim();
  document.getElementById('summaryEmail').textContent  = em  || '—';
  document.getElementById('summaryMobile').textContent = mb  || '—';
}

/* ════════ PER-STEP VALIDATION ════════ */
function validateStep(step) {
  if (step === 1) {
    var ok = true;
    var fn = document.getElementById('firstName').value.trim();
    var ln = document.getElementById('lastName').value.trim();
    if (!fn) { showErr('firstName','err-firstName','First name is required'); ok = false; }
    else       clearErr('firstName','err-firstName');
    if (!ln) { showErr('lastName','err-lastName','Last name is required'); ok = false; }
    else       clearErr('lastName','err-lastName');
    var gc = document.querySelector('input[name="gender"]:checked');
    if (!gc) {
      document.getElementById('err-gender').classList.add('show');
      ok = false;
    } else {
      document.getElementById('err-gender').classList.remove('show');
    }
    return ok;
  }

  if (step === 2) {
    var ok = true;
    var emailVal  = document.getElementById('email').value.trim();
    var mobileVal = document.getElementById('mobileNumber').value.trim();

    if (!emailVal) {
      showErr('email','err-email','Email address is required'); ok = false;
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailVal)) {
      showErr('email','err-email','Please enter a valid email address'); ok = false;
    } else {
      clearErr('email','err-email');
    }

    if (!mobileVal) {
      showErr('mobileNumber','err-mobile','Mobile number is required'); ok = false;
    } else if (!/^[6-9][0-9]{9}$/.test(mobileVal)) {
      showErr('mobileNumber','err-mobile','Enter a valid 10-digit Indian mobile number'); ok = false;
    } else {
      clearErr('mobileNumber','err-mobile');
    }

    return ok;
  }

  return true;
}

function validateStep3() {
  var ok  = true;
  var pw  = document.getElementById('password').value;
  var cpw = document.getElementById('confirmPassword').value;

  if (!pw) {
    showErr('password','err-password','Password is required');
    ok = false;
  } else if (pw.length < 8) {
    showErr('password','err-password','Password must be at least 8 characters');
    ok = false;
  } else {
    clearErr('password','err-password');
  }

  if (!cpw) {
    showErr('confirmPassword','err-confirm','Please confirm your password');
    ok = false;
  } else if (pw !== cpw) {
    showErr('confirmPassword','err-confirm','Passwords do not match');
    ok = false;
  } else if (pw === cpw && cpw.length > 0) {
    clearErr('confirmPassword','err-confirm');
  }

  return ok;
}

/* ════════ FORM SUBMIT — validates all steps ════════ */
document.getElementById('signupForm').addEventListener('submit', function(e) {
  /* Force-validate all steps before final submit */
  if (!validateStep(1) || !validateStep(2) || !validateStep3()) {
    e.preventDefault();
    return;
  }
  /* Show loading state */
  var btn = document.getElementById('submitBtn');
  btn.disabled = true;
  btn.textContent = 'Creating account…';
});

/* ════════ REAL-TIME VALIDATION (blur) ════════ */
document.getElementById('firstName').addEventListener('blur', function() {
  if (!this.value.trim()) showErr('firstName','err-firstName','First name is required');
  else clearErr('firstName','err-firstName');
});
document.getElementById('lastName').addEventListener('blur', function() {
  if (!this.value.trim()) showErr('lastName','err-lastName','Last name is required');
  else clearErr('lastName','err-lastName');
});
document.getElementById('email').addEventListener('blur', function() {
  if (!this.value.trim()) { resetField('email','err-email'); return; }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.value)) showErr('email','err-email','Please enter a valid email address');
  else clearErr('email','err-email');
});
document.getElementById('mobileNumber').addEventListener('blur', function() {
  if (!this.value.trim()) { resetField('mobileNumber','err-mobile'); return; }
  if (!/^[6-9][0-9]{9}$/.test(this.value)) showErr('mobileNumber','err-mobile','Enter a valid 10-digit Indian mobile number');
  else clearErr('mobileNumber','err-mobile');
});
document.getElementById('confirmPassword').addEventListener('input', function() {
  var pw = document.getElementById('password').value;
  if (!this.value) { resetField('confirmPassword','err-confirm'); return; }
  if (this.value !== pw) showErr('confirmPassword','err-confirm','Passwords do not match');
  else clearErr('confirmPassword','err-confirm');
});

/* Clear errors on input */
['firstName','lastName','email','mobileNumber','password'].forEach(function(id) {
  var el = document.getElementById(id);
  if (el) el.addEventListener('input', function() {
    this.classList.remove('input-error','input-ok');
  });
});

/* ════════ ONLY DIGITS in mobile ════════ */
document.getElementById('mobileNumber').addEventListener('keypress', function(e) {
  if (!/[0-9]/.test(String.fromCharCode(e.which))) e.preventDefault();
});

/* ════════ GENDER CARDS ════════ */
document.querySelectorAll('.radio-opt').forEach(function(opt) {
  opt.addEventListener('click', function() {
    document.querySelectorAll('.radio-opt').forEach(function(o){ o.classList.remove('selected'); });
    this.classList.add('selected');
    this.querySelector('input').checked = true;
    document.getElementById('err-gender').classList.remove('show');
  });
});

/* ════════ PROFILE PICTURE PREVIEW ════════ */
document.getElementById('profilePic').addEventListener('change', function() {
  var file = this.files[0];
  if (!file) return;
  if (file.size > 2 * 1024 * 1024) {
    alert('File size must be under 2MB. Please choose a smaller image.');
    this.value = ''; return;
  }
  var reader = new FileReader();
  reader.onload = function(e) {
    var img         = document.getElementById('picImg');
    var placeholder = document.querySelector('.pic-placeholder');
    var preview     = document.getElementById('picPreview');
    img.src = e.target.result;
    img.style.display = 'block';
    placeholder.style.display = 'none';
    preview.style.borderColor = 'var(--pri)';
    preview.style.boxShadow   = '0 0 0 3px rgba(79,70,229,.15)';
  };
  reader.readAsDataURL(file);
  var nameEl = document.getElementById('picName');
  nameEl.textContent = file.name.length > 22 ? file.name.substring(0,22)+'…' : file.name;
  nameEl.style.display = 'block';
});

/* ════════ PASSWORD STRENGTH ════════ */
function checkStrength(pw) {
  var score = 0;
  if (pw.length >= 8)            score++;
  if (/[A-Z]/.test(pw))          score++;
  if (/[0-9]/.test(pw))          score++;
  if (/[^A-Za-z0-9]/.test(pw))   score++;
  var colors = ['#ef4444','#f59e0b','#3b82f6','#10b981'];
  var labels = ['Weak','Fair','Good','Strong'];
  for (var i = 1; i <= 4; i++)
    document.getElementById('bar'+i).style.background = i <= score ? colors[score-1] : 'var(--line)';
  var lbl = document.getElementById('pwLabel');
  lbl.textContent = score > 0 ? labels[score-1] : 'Enter a password';
  lbl.style.color = score > 0 ? colors[score-1] : 'var(--muted)';

  /* Clear password error once user reaches min length */
  if (pw.length >= 8) clearErr('password','err-password');
}

/* ════════ PASSWORD TOGGLE ════════ */
function togglePw(inputId, iconId) {
  var inp  = document.getElementById(inputId);
  var show = inp.type === 'password';
  inp.type = show ? 'text' : 'password';
  document.getElementById(iconId).innerHTML = show
    ? '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/><path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"/><line x1="1" y1="1" x2="23" y2="23"/>'
    : '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
}
</script>
</body>
</html>
