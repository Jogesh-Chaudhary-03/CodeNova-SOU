<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login – CodeNova SOU</title>
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
.lp-features{display:flex;flex-direction:column;gap:14px}
.lp-feat{
  display:flex;align-items:center;gap:13px;
  background:rgba(255,255,255,.1);backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.15);
  border-radius:12px;padding:14px 16px;
}
.lp-feat-icon{width:36px;height:36px;border-radius:9px;flex-shrink:0;background:rgba(255,255,255,.15);display:flex;align-items:center;justify-content:center;font-size:18px;}
.lp-feat-txt{font-size:13.5px;font-weight:600;color:rgba(255,255,255,.9)}
.lp-feat-sub{font-size:12px;color:rgba(255,255,255,.55);margin-top:1px}

/* ════════ RIGHT PANEL ════════ */
.right-panel{
  display:flex;flex-direction:column;justify-content:center;align-items:center;
  padding:48px 28px;min-height:100vh;background:var(--bg);
}
.form-box{width:100%;max-width:420px}
.mobile-logo{display:none;align-items:center;justify-content:center;gap:9px;margin-bottom:24px;}
@media(max-width:860px){.mobile-logo{display:flex}}
.mobile-logo-box{width:38px;height:38px;border-radius:10px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:15px;font-weight:800;color:#fff;}
.mobile-logo-txt{font-size:16px;font-weight:800;color:var(--ink)}
.mobile-logo-txt span{color:var(--pri)}

.form-top{text-align:center;margin-bottom:28px}
.form-icon{width:60px;height:60px;border-radius:16px;margin:0 auto 14px;background:linear-gradient(135deg,var(--pri),var(--acc));display:flex;align-items:center;justify-content:center;font-size:26px;box-shadow:0 6px 20px rgba(79,70,229,.28);}
.form-title{font-size:22px;font-weight:800;color:var(--ink);margin-bottom:5px}
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
@keyframes shake{
  0%,100%{transform:translateX(0)}
  20%{transform:translateX(-6px)}
  40%{transform:translateX(6px)}
  60%{transform:translateX(-4px)}
  80%{transform:translateX(4px)}
}

/* ── SUCCESS ALERT ── */
.alert-ok{
  display:flex;align-items:center;gap:10px;
  background:#d1fae5;border:1.5px solid #6ee7b7;
  border-radius:10px;padding:13px 15px;
  font-size:13.5px;color:var(--green);font-weight:600;
  margin-bottom:20px;
}

/* ── FIELD ── */
.field{margin-bottom:16px}
.field label{display:block;font-size:12.5px;font-weight:700;color:var(--ink2);margin-bottom:6px;}
.input-wrap{position:relative}
.input-wrap>svg:first-of-type{position:absolute;left:12px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none;}
input[type=email],
input[type=password],
input[type=text]{
  width:100%;padding:11px 14px 11px 38px;
  border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px;color:var(--ink);
  background:var(--white);outline:none;
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

/* ── PW TOGGLE ── */
.pw-toggle{position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;cursor:pointer;color:var(--muted);padding:2px;transition:color .15s;}
.pw-toggle:hover{color:var(--pri)}

/* ── FORGOT ── */
.forgot-row{display:flex;justify-content:flex-end;margin-top:-8px;margin-bottom:16px;}
.forgot-link{font-size:12.5px;font-weight:600;color:var(--pri);text-decoration:none;}
.forgot-link:hover{text-decoration:underline}

/* ── BUTTON ── */
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

/* ── DIVIDER ── */
.or-divider{display:flex;align-items:center;gap:12px;margin:20px 0;font-size:12px;color:var(--muted);font-weight:600;}
.or-divider::before,.or-divider::after{content:'';flex:1;height:1px;background:var(--line)}

/* ── SIGNUP LINK ── */
.signup-link{text-align:center;font-size:13px;color:var(--sub);margin-top:20px;}
.signup-link a{color:var(--pri);font-weight:700;text-decoration:none}
.signup-link a:hover{text-decoration:underline}
.back-home{display:flex;align-items:center;justify-content:center;gap:5px;margin-top:16px;font-size:12.5px;color:var(--muted);text-decoration:none;transition:color .15s;}
.back-home:hover{color:var(--pri)}
</style>
</head>
<body>

<!-- ════════ LEFT PANEL ════════ -->
<div class="left-panel">
  <div class="lp-c1"></div>
  <div class="lp-c2"></div>
  <div class="lp-inner">
    <a href="Home" class="lp-logo">
      <div class="lp-logo-box">CN</div>
      <span class="lp-logo-txt">CodeNova <span>SOU</span></span>
    </a>
    <h1 class="lp-h">Welcome <em>Back</em> 👋<br>to CodeNova SOU</h1>
    <p class="lp-p">Log in to access hackathons, track your team, and compete in exciting challenges at Silver Oak University.</p>
    <div class="lp-features">
      <div class="lp-feat">
        <div class="lp-feat-icon">🏆</div>
        <div><div class="lp-feat-txt">Compete in Events</div><div class="lp-feat-sub">Hackathons, design & coding contests</div></div>
      </div>
      <div class="lp-feat">
        <div class="lp-feat-icon">👥</div>
        <div><div class="lp-feat-txt">Manage Your Team</div><div class="lp-feat-sub">Create teams and collaborate easily</div></div>
      </div>
      <div class="lp-feat">
        <div class="lp-feat-icon">📊</div>
        <div><div class="lp-feat-txt">Track Progress</div><div class="lp-feat-sub">Live leaderboard and real-time updates</div></div>
      </div>
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
      <div class="form-icon">🔐</div>
      <div class="form-title">Welcome Back</div>
      <div class="form-sub">Sign in to your CodeNova account</div>
    </div>

    <%-- ✅ FIX 1: Server-side error/success message display --%>
    <%
      String serverError   = (String) request.getAttribute("error");
      String serverSuccess = (String) request.getAttribute("success");
    %>

    <% if (serverError != null && !serverError.isEmpty()) { %>
    <div class="alert-err" id="serverAlert">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/>
      </svg>
      <span><%= serverError %></span>
    </div>
    <% } %>

    <% if (serverSuccess != null && !serverSuccess.isEmpty()) { %>
    <div class="alert-ok">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
      </svg>
      <span><%= serverSuccess %></span>
    </div>
    <% } %>

    <%-- ✅ FIX 2: Form action changed from "authenticate" to "userlogin"
         (userlogin sets model.addAttribute("error",...) so errors display correctly) --%>
    <form action="userlogin" method="post" id="loginForm" novalidate>

      <div class="field">
        <label for="email">Email Address</label>
        <div class="input-wrap">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/>
          </svg>
          <input type="email" name="email" id="email"
                 placeholder="rahul@example.com"
                 value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                 autocomplete="email">
        </div>
        <div class="err-msg" id="err-email">
          <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
          <span id="err-email-txt">Please enter a valid email address</span>
        </div>
      </div>

      <div class="field">
        <label for="password">Password</label>
        <div class="input-wrap">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/>
          </svg>
          <input type="password" name="password" id="password"
                 placeholder="Enter your password"
                 autocomplete="current-password">
          <button type="button" class="pw-toggle" onclick="togglePw()" aria-label="Toggle password">
            <svg id="eyeIcon" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>
            </svg>
          </button>
        </div>
        <div class="err-msg" id="err-password">
          <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
          <span id="err-password-txt">Please enter your password</span>
        </div>
      </div>

      <div class="forgot-row">
        <a href="forgetpassword" class="forgot-link">Forgot Password?</a>
      </div>

      <button type="submit" class="btn-pri" id="loginBtn">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
          <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/>
          <polyline points="10 17 15 12 10 7"/>
          <line x1="15" y1="12" x2="3" y2="12"/>
        </svg>
        <span id="btnTxt">Login to Account</span>
      </button>

    </form>

    <div class="signup-link">
      Don't have an account? <a href="signup">Sign Up Free</a>
    </div>

    <a href="Home" class="back-home">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
      Back to Home
    </a>

  </div>
</div>

<script>
/* ── Password Toggle ── */
function togglePw() {
  var inp  = document.getElementById('password');
  var show = inp.type === 'password';
  inp.type = show ? 'text' : 'password';
  document.getElementById('eyeIcon').innerHTML = show
    ? '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/><path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"/><line x1="1" y1="1" x2="23" y2="23"/>'
    : '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
}

/* ── Helpers ── */
function showErr(inputId, errId, msg) {
  var inp = document.getElementById(inputId);
  var err = document.getElementById(errId);
  var txt = document.getElementById(errId + '-txt');
  inp.classList.add('input-error');
  inp.classList.remove('input-ok');
  if (txt && msg) txt.textContent = msg;
  err.classList.add('show');
}
function clearErr(inputId, errId) {
  var inp = document.getElementById(inputId);
  var err = document.getElementById(errId);
  inp.classList.remove('input-error');
  inp.classList.add('input-ok');
  err.classList.remove('show');
}
function resetField(inputId, errId) {
  var inp = document.getElementById(inputId);
  var err = document.getElementById(errId);
  inp.classList.remove('input-error','input-ok');
  err.classList.remove('show');
}

/* ── Real-time validation on blur ── */
document.getElementById('email').addEventListener('blur', function() {
  if (this.value === '') { resetField('email','err-email'); return; }
  var ok = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.value);
  ok ? clearErr('email','err-email') : showErr('email','err-email','Please enter a valid email address');
});

document.getElementById('password').addEventListener('blur', function() {
  if (this.value === '') { resetField('password','err-password'); return; }
  this.value.length > 0 ? clearErr('password','err-password') : showErr('password','err-password','Please enter your password');
});

/* ── Clear errors on typing ── */
['email','password'].forEach(function(id) {
  document.getElementById(id).addEventListener('input', function() {
    resetField(id, 'err-' + id);
    // Hide server alert when user starts typing again
    var sa = document.getElementById('serverAlert');
    if (sa) sa.style.display = 'none';
  });
});

/* ── Form submit validation ── */
document.getElementById('loginForm').addEventListener('submit', function(e) {
  var ok = true;

  /* Email */
  var emailVal = document.getElementById('email').value.trim();
  if (!emailVal) {
    showErr('email', 'err-email', 'Email address is required');
    ok = false;
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailVal)) {
    showErr('email', 'err-email', 'Please enter a valid email address');
    ok = false;
  } else {
    clearErr('email', 'err-email');
  }

  /* Password */
  var pwVal = document.getElementById('password').value;
  if (!pwVal) {
    showErr('password', 'err-password', 'Password is required');
    ok = false;
  } else {
    clearErr('password', 'err-password');
  }

  if (!ok) {
    e.preventDefault();
    return;
  }

  /* Show loading state */
  var btn = document.getElementById('loginBtn');
  var txt = document.getElementById('btnTxt');
  btn.disabled = true;
  txt.textContent = 'Signing in…';
});
</script>
</body>
</html>
