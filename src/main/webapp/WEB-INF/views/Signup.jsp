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
.left-panel::before{
  content:'';position:absolute;inset:0;
  background-image:radial-gradient(rgba(255,255,255,.1) 1px,transparent 1px);
  background-size:26px 26px;pointer-events:none;
}
.lp-inner{position:relative;z-index:1}
.lp-logo{display:inline-flex;align-items:center;gap:10px;margin-bottom:52px;text-decoration:none}
.lp-logo-box{
  width:42px;height:42px;border-radius:11px;
  background:rgba(255,255,255,.2);backdrop-filter:blur(8px);
  border:1.5px solid rgba(255,255,255,.3);
  display:flex;align-items:center;justify-content:center;
  font-size:16px;font-weight:800;color:#fff;
}
.lp-logo-txt{font-size:17px;font-weight:800;color:#fff}
.lp-logo-txt span{color:var(--acc-lt)}
.lp-h{font-size:clamp(24px,2.8vw,34px);font-weight:800;color:#fff;line-height:1.25;margin-bottom:14px}
.lp-h em{font-style:normal;color:var(--acc-lt)}
.lp-p{font-size:14.5px;color:rgba(255,255,255,.72);line-height:1.75;margin-bottom:40px}
.lp-stats{display:grid;grid-template-columns:1fr 1fr;gap:14px}
.lp-stat{
  background:rgba(255,255,255,.1);backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.15);border-radius:12px;padding:16px;
}
.lp-stat-num{font-size:22px;font-weight:800;color:#fff;line-height:1}
.lp-stat-lbl{font-size:11.5px;color:rgba(255,255,255,.6);margin-top:3px;font-weight:600}

/* ════════ RIGHT PANEL ════════ */
.right-panel{
  display:flex;flex-direction:column;justify-content:center;align-items:center;
  padding:48px 28px;min-height:100vh;background:var(--bg);overflow-y:auto;
}
.form-box{width:100%;max-width:460px}

/* mobile logo */
.mobile-logo{display:none;align-items:center;justify-content:center;gap:9px;margin-bottom:20px}
@media(max-width:860px){.mobile-logo{display:flex}}
.mobile-logo-box{
  width:38px;height:38px;border-radius:10px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;font-size:15px;font-weight:800;color:#fff;
}
.mobile-logo-txt{font-size:16px;font-weight:800;color:var(--ink)}
.mobile-logo-txt span{color:var(--pri)}

.form-top{text-align:center;margin-bottom:28px}
.form-title{font-size:22px;font-weight:800;color:var(--ink);margin-bottom:6px}
.form-sub{font-size:13.5px;color:var(--sub)}

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

/* ── PROFILE PIC UPLOAD ── */
.pic-upload-wrap{
  display:flex;flex-direction:column;align-items:center;
  margin-bottom:20px;
}
.pic-ring{
  position:relative;
  width:96px;height:96px;
  margin-bottom:12px;
}
.pic-preview{
  width:96px;height:96px;border-radius:50%;
  object-fit:cover;
  border:3px solid var(--line);
  background:var(--bg2);
  display:flex;align-items:center;justify-content:center;
  font-size:36px;
  transition:border-color .2s;
  overflow:hidden;
}
.pic-preview img{
  width:100%;height:100%;object-fit:cover;border-radius:50%;
  display:none;
}
.pic-preview .pic-placeholder{
  display:flex;flex-direction:column;align-items:center;justify-content:center;
  width:100%;height:100%;
}
.pic-preview .pic-placeholder span{font-size:30px}
.pic-edit-btn{
  position:absolute;bottom:2px;right:2px;
  width:28px;height:28px;border-radius:50%;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  border:2.5px solid var(--white);
  display:flex;align-items:center;justify-content:center;
  cursor:pointer;
  box-shadow:0 2px 8px rgba(79,70,229,.3);
  transition:transform .15s;
}
.pic-edit-btn:hover{transform:scale(1.1)}
.pic-edit-btn svg{color:#fff}
input[type=file]#profilePic{display:none}

.pic-upload-lbl{font-size:12.5px;font-weight:600;color:var(--sub);margin-bottom:2px}
.pic-upload-sub{font-size:11px;color:var(--muted)}
.pic-name{
  font-size:11.5px;color:var(--pri);font-weight:600;
  margin-top:4px;display:none;
  background:var(--bg2);padding:3px 10px;border-radius:20px;
}

/* ── FIELDS ── */
.field{margin-bottom:16px}
.field label{display:block;font-size:12.5px;font-weight:700;color:var(--ink2);margin-bottom:6px}
.field label span{color:var(--red)}
.field-row{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.input-wrap{position:relative}
.input-wrap>svg:first-of-type{
  position:absolute;left:12px;top:50%;transform:translateY(-50%);
  color:var(--muted);pointer-events:none;flex-shrink:0;
}
input[type=text],input[type=email],input[type=password],input[type=tel]{
  width:100%;padding:10px 14px 10px 38px;
  border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px;color:var(--ink);
  background:var(--white);outline:none;
  transition:border-color .18s,box-shadow .18s;
}
input:focus{border-color:var(--pri);box-shadow:0 0 0 3px rgba(79,70,229,.1)}
input.error{border-color:var(--red);box-shadow:0 0 0 3px rgba(220,38,38,.08)}
.err-msg{font-size:11.5px;color:var(--red);margin-top:4px;display:none}
.err-msg.show{display:block}

/* ── GENDER RADIOS ── */
.radio-group{display:flex;gap:10px;flex-wrap:wrap}
.radio-opt{
  flex:1;min-width:80px;border:1.5px solid var(--line);border-radius:10px;
  padding:10px;text-align:center;cursor:pointer;
  transition:border-color .18s,background .18s;
}
.radio-opt:hover{border-color:var(--pri-lt);background:var(--bg2)}
.radio-opt input{display:none}
.radio-opt.selected{border-color:var(--pri);background:var(--bg2)}
.radio-opt .ro-icon{font-size:20px;margin-bottom:4px}
.radio-opt .ro-lbl{font-size:12px;font-weight:700;color:var(--ink2)}

/* ── PW STRENGTH ── */
.pw-strength{margin-top:6px}
.pw-bars{display:flex;gap:4px;margin-bottom:4px}
.pw-bar{flex:1;height:3px;border-radius:2px;background:var(--line);transition:background .2s}
.pw-label{font-size:11px;color:var(--muted);font-weight:600}
.pw-toggle{
  position:absolute;right:12px;top:50%;transform:translateY(-50%);
  background:none;border:none;cursor:pointer;color:var(--muted);padding:2px;transition:color .15s;
}
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
.btn-sec{
  width:100%;padding:11px;background:var(--white);color:var(--ink2);
  font-family:'Plus Jakarta Sans',sans-serif;font-size:13.5px;font-weight:700;
  border:1.5px solid var(--line);border-radius:var(--r);cursor:pointer;
  transition:border-color .16s,color .16s;
  display:flex;align-items:center;justify-content:center;gap:8px;
}
.btn-sec:hover{border-color:var(--pri);color:var(--pri)}
.btn-row{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-top:6px}

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

    <!-- Steps -->
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
              <div class="pic-placeholder">
                <span>🧑</span>
              </div>
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

        <!-- Name -->
        <div class="field-row">
          <div class="field">
            <label>First Name <span>*</span></label>
            <div class="input-wrap">
              <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
              <input type="text" name="firstName" id="firstName" placeholder="Rahul" required>
            </div>
            <div class="err-msg" id="err-firstName">Please enter your first name</div>
          </div>
          <div class="field">
            <label>Last Name <span>*</span></label>
            <div class="input-wrap">
              <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
              <input type="text" name="lastName" id="lastName" placeholder="Sharma" required>
            </div>
            <div class="err-msg" id="err-lastName">Please enter your last name</div>
          </div>
        </div>

        <!-- Gender -->
        <div class="field">
          <label>Gender <span>*</span></label>
          <div class="radio-group">
            <label class="radio-opt" id="ro-male">
              <input type="radio" name="gender" value="Male" required>
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
          <div class="err-msg" id="err-gender">Please select your gender</div>
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

        <div class="field">
          <label>Email Address <span>*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/></svg>
            <input type="email" name="email" id="email" placeholder="rahul@example.com" required>
          </div>
          <div class="err-msg" id="err-email">Please enter a valid email</div>
        </div>

        <div class="field">
          <label>Mobile Number <span>*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 13 19.79 19.79 0 0 1 1.62 4.33 2 2 0 0 1 3.6 2.18h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 9.91a16 16 0 0 0 6.06 6.06l1.31-1.31a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
            <input type="tel" name="mobileNumber" id="mobileNumber" placeholder="9876543210" pattern="[0-9]{10}" maxlength="10" required>
          </div>
          <div class="err-msg" id="err-mobile">Please enter a valid 10-digit number</div>
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

        <div class="field">
          <label>Password <span>*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
            <input type="password" name="password" id="password" placeholder="Min. 8 characters" required oninput="checkStrength(this.value)">
            <button type="button" class="pw-toggle" onclick="togglePw('password','eyeIcon1')">
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
          <div class="err-msg" id="err-password">Password must be at least 8 characters</div>
        </div>

        <div class="field">
          <label>Confirm Password <span>*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
            <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Re-enter password" required>
            <button type="button" class="pw-toggle" onclick="togglePw('confirmPassword','eyeIcon2')">
              <svg id="eyeIcon2" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
            </button>
          </div>
          <div class="err-msg" id="err-confirm">Passwords do not match</div>
        </div>

        <div class="btn-row">
          <button type="button" class="btn-sec" onclick="goStep(2)">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
            Back
          </button>
          <button type="submit" class="btn-pri" onclick="return validateStep3()">
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

/* ── Step navigation ── */
function goStep(n) {
  if (n > currentStep && !validateStep(currentStep)) return;
  document.getElementById('step' + currentStep).classList.remove('active');
  updateDots(n);
  currentStep = n;
  document.getElementById('step' + currentStep).classList.add('active');
}
function updateDots(to) {
  for (var i = 1; i <= 3; i++) {
    var d = document.getElementById('dot' + i);
    d.classList.remove('active','done');
    if      (i < to)  d.classList.add('done');
    else if (i === to) d.classList.add('active');
  }
  for (var j = 1; j <= 2; j++)
    document.getElementById('line' + j).classList.toggle('done', j < to);
}

/* ── Validation ── */
function validateStep(step) {
  if (step === 1) {
    var ok = true;
    if (!val('firstName', function(v){ return v.trim().length > 0 })) ok = false;
    if (!val('lastName',  function(v){ return v.trim().length > 0 })) ok = false;
    var gc = document.querySelector('input[name="gender"]:checked');
    var eg = document.getElementById('err-gender');
    if (!gc) { eg.classList.add('show'); ok = false; }
    else       eg.classList.remove('show');
    return ok;
  }
  if (step === 2) {
    var ok = true;
    if (!val('email',        function(v){ return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v) })) ok = false;
    if (!val('mobileNumber', function(v){ return /^[0-9]{10}$/.test(v) })) ok = false;
    return ok;
  }
  return true;
}
function validateStep3() {
  var ok  = true;
  var pw  = document.getElementById('password').value;
  var cpw = document.getElementById('confirmPassword').value;
  if (pw.length < 8) {
    document.getElementById('password').classList.add('error');
    document.getElementById('err-password').classList.add('show'); ok = false;
  } else {
    document.getElementById('password').classList.remove('error');
    document.getElementById('err-password').classList.remove('show');
  }
  if (pw !== cpw || !cpw) {
    document.getElementById('confirmPassword').classList.add('error');
    document.getElementById('err-confirm').classList.add('show'); ok = false;
  } else {
    document.getElementById('confirmPassword').classList.remove('error');
    document.getElementById('err-confirm').classList.remove('show');
  }
  return ok;
}
function val(id, test) {
  var el  = document.getElementById(id);
  var eid = 'err-' + (id === 'mobileNumber' ? 'mobile' : id);
  var err = document.getElementById(eid);
  var ok  = test(el.value);
  el.classList.toggle('error', !ok);
  if (err) err.classList.toggle('show', !ok);
  return ok;
}

/* ── Gender cards ── */
document.querySelectorAll('.radio-opt').forEach(function(opt){
  opt.addEventListener('click', function(){
    document.querySelectorAll('.radio-opt').forEach(function(o){ o.classList.remove('selected') });
    this.classList.add('selected');
    this.querySelector('input').checked = true;
    document.getElementById('err-gender').classList.remove('show');
  });
});

/* ── Profile picture preview ── */
document.getElementById('profilePic').addEventListener('change', function(){
  var file = this.files[0];
  if (!file) return;

  // size check 2MB
  if (file.size > 2 * 1024 * 1024) {
    alert('File size must be under 2MB');
    this.value = '';
    return;
  }

  var reader = new FileReader();
  reader.onload = function(e) {
    var img         = document.getElementById('picImg');
    var placeholder = document.querySelector('.pic-placeholder');
    var preview     = document.getElementById('picPreview');
    img.src         = e.target.result;
    img.style.display       = 'block';
    placeholder.style.display = 'none';
    preview.style.borderColor = 'var(--pri)';
    preview.style.boxShadow   = '0 0 0 3px rgba(79,70,229,.15)';
  };
  reader.readAsDataURL(file);

  // show filename badge
  var nameEl = document.getElementById('picName');
  nameEl.textContent = file.name.length > 22 ? file.name.substring(0,22)+'…' : file.name;
  nameEl.style.display = 'block';
});

/* ── Password strength ── */
function checkStrength(pw) {
  var score = 0;
  if (pw.length >= 8)           score++;
  if (/[A-Z]/.test(pw))         score++;
  if (/[0-9]/.test(pw))         score++;
  if (/[^A-Za-z0-9]/.test(pw)) score++;
  var colors = ['#ef4444','#f59e0b','#3b82f6','#10b981'];
  var labels = ['Weak','Fair','Good','Strong'];
  for (var i = 1; i <= 4; i++)
    document.getElementById('bar'+i).style.background = i <= score ? colors[score-1] : 'var(--line)';
  var lbl = document.getElementById('pwLabel');
  lbl.textContent = score > 0 ? labels[score-1] : 'Enter a password';
  lbl.style.color = score > 0 ? colors[score-1] : 'var(--muted)';
}

/* ── Password toggle ── */
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
