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

.lp-logo{
  display:inline-flex;align-items:center;gap:10px;
  margin-bottom:52px;text-decoration:none;
}
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

/* feature checklist */
.lp-features{display:flex;flex-direction:column;gap:14px}
.lp-feat{
  display:flex;align-items:center;gap:13px;
  background:rgba(255,255,255,.1);backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.15);
  border-radius:12px;padding:14px 16px;
}
.lp-feat-icon{
  width:36px;height:36px;border-radius:9px;flex-shrink:0;
  background:rgba(255,255,255,.15);
  display:flex;align-items:center;justify-content:center;font-size:18px;
}
.lp-feat-txt{font-size:13.5px;font-weight:600;color:rgba(255,255,255,.9)}
.lp-feat-sub{font-size:12px;color:rgba(255,255,255,.55);margin-top:1px}

/* ════════ RIGHT PANEL ════════ */
.right-panel{
  display:flex;flex-direction:column;justify-content:center;align-items:center;
  padding:48px 28px;min-height:100vh;background:var(--bg);
}
.form-box{width:100%;max-width:420px}

/* mobile logo */
.mobile-logo{
  display:none;align-items:center;justify-content:center;gap:9px;
  margin-bottom:24px;
}
@media(max-width:860px){.mobile-logo{display:flex}}
.mobile-logo-box{
  width:38px;height:38px;border-radius:10px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;
  font-size:15px;font-weight:800;color:#fff;
}
.mobile-logo-txt{font-size:16px;font-weight:800;color:var(--ink)}
.mobile-logo-txt span{color:var(--pri)}

.form-top{text-align:center;margin-bottom:28px}
.form-icon{
  width:60px;height:60px;border-radius:16px;margin:0 auto 14px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;font-size:26px;
  box-shadow:0 6px 20px rgba(79,70,229,.28);
}
.form-title{font-size:22px;font-weight:800;color:var(--ink);margin-bottom:5px}
.form-sub{font-size:13.5px;color:var(--sub)}

/* error alert */
.alert-err{
  display:flex;align-items:center;gap:10px;
  background:var(--red-bg);border:1.5px solid #fca5a5;
  border-radius:10px;padding:12px 14px;
  font-size:13.5px;color:var(--red);font-weight:600;
  margin-bottom:20px;
}
.alert-err svg{flex-shrink:0;color:var(--red)}

/* field */
.field{margin-bottom:16px}
.field label{
  display:block;font-size:12.5px;font-weight:700;
  color:var(--ink2);margin-bottom:6px;
}
.input-wrap{position:relative}
.input-wrap>svg:first-child{
  position:absolute;left:12px;top:50%;transform:translateY(-50%);
  color:var(--muted);pointer-events:none;
}
input[type=email],
input[type=password],
input[type=text]{
  width:100%;
  padding:11px 14px 11px 38px;
  border:1.5px solid var(--line);
  border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px;color:var(--ink);
  background:var(--white);outline:none;
  transition:border-color .18s,box-shadow .18s;
}
input:focus{
  border-color:var(--pri);
  box-shadow:0 0 0 3px rgba(79,70,229,.1);
}
input.error{border-color:var(--red);box-shadow:0 0 0 3px rgba(220,38,38,.08)}
.err-msg{font-size:11.5px;color:var(--red);margin-top:4px;display:none}
.err-msg.show{display:block}

/* pw toggle */
.pw-toggle{
  position:absolute;right:12px;top:50%;transform:translateY(-50%);
  background:none;border:none;cursor:pointer;color:var(--muted);padding:2px;
  transition:color .15s;
}
.pw-toggle:hover{color:var(--pri)}

/* forgot link row */
.forgot-row{
  display:flex;justify-content:flex-end;margin-top:-8px;margin-bottom:16px;
}
.forgot-link{
  font-size:12.5px;font-weight:600;color:var(--pri);
  text-decoration:none;
}
.forgot-link:hover{text-decoration:underline}

/* submit button */
.btn-pri{
  width:100%;padding:12px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  color:#fff;font-family:'Plus Jakarta Sans',sans-serif;
  font-size:14px;font-weight:800;
  border:none;border-radius:var(--r);cursor:pointer;
  box-shadow:0 4px 14px rgba(79,70,229,.28);
  transition:opacity .16s,transform .16s;
  display:flex;align-items:center;justify-content:center;gap:8px;
}
.btn-pri:hover{opacity:.92;transform:translateY(-1px)}

/* divider */
.or-divider{
  display:flex;align-items:center;gap:12px;
  margin:20px 0;font-size:12px;color:var(--muted);font-weight:600;
}
.or-divider::before,.or-divider::after{content:'';flex:1;height:1px;background:var(--line)}

/* signup link */
.signup-link{
  text-align:center;font-size:13px;color:var(--sub);margin-top:20px;
}
.signup-link a{color:var(--pri);font-weight:700;text-decoration:none}
.signup-link a:hover{text-decoration:underline}

/* back to home */
.back-home{
  display:flex;align-items:center;justify-content:center;gap:5px;
  margin-top:16px;font-size:12.5px;color:var(--muted);
  text-decoration:none;transition:color .15s;
}
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
        <div>
          <div class="lp-feat-txt">Compete in Events</div>
          <div class="lp-feat-sub">Hackathons, design & coding contests</div>
        </div>
      </div>
      <div class="lp-feat">
        <div class="lp-feat-icon">👥</div>
        <div>
          <div class="lp-feat-txt">Manage Your Team</div>
          <div class="lp-feat-sub">Create teams and collaborate easily</div>
        </div>
      </div>
      <div class="lp-feat">
        <div class="lp-feat-icon">📊</div>
        <div>
          <div class="lp-feat-txt">Track Progress</div>
          <div class="lp-feat-sub">Live leaderboard and real-time updates</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ════════ RIGHT PANEL ════════ -->
<div class="right-panel">
  <div class="form-box">

    <!-- Mobile logo -->
    <div class="mobile-logo">
      <div class="mobile-logo-box">CN</div>
      <span class="mobile-logo-txt">CodeNova <span>SOU</span></span>
    </div>

    <div class="form-top">
      <div class="form-icon">🔐</div>
      <div class="form-title">Welcome Back</div>
      <div class="form-sub">Sign in to your CodeNova account</div>
    </div>

    <%-- Server-side error message --%>
    <%
      String error = (String) request.getAttribute("error");
      if (error != null && !error.isEmpty()) {
    %>
    <div class="alert-err">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/>
      </svg>
      <%= error %>
    </div>
    <% } %>

    <form action="authenticate" method="post" id="loginForm" novalidate>

      <div class="field">
        <label>Email Address</label>
        <div class="input-wrap">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/>
          </svg>
          <input type="email" name="email" id="email" placeholder="rahul@example.com" required>
        </div>
        <div class="err-msg" id="err-email">Please enter a valid email address</div>
      </div>

      <div class="field">
        <label>Password</label>
        <div class="input-wrap">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/>
          </svg>
          <input type="password" name="password" id="password" placeholder="Enter your password" required>
          <button type="button" class="pw-toggle" onclick="togglePw()">
            <svg id="eyeIcon" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>
            </svg>
          </button>
        </div>
        <div class="err-msg" id="err-password">Please enter your password</div>
      </div>

      <div class="forgot-row">
        <a href="forgetpassword" class="forgot-link">Forgot Password?</a>
      </div>

      <button type="submit" class="btn-pri">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
          <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/>
          <polyline points="10 17 15 12 10 7"/>
          <line x1="15" y1="12" x2="3" y2="12"/>
        </svg>
        Login to Account
      </button>

    </form>

    <div class="signup-link">
      Don't have an account? <a href="signup">Sign Up Free</a>
    </div>

    <a href="home" class="back-home">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
      Back to Home
    </a>

  </div>
</div>

<script>
// Password visibility toggle
function togglePw() {
  var inp  = document.getElementById('password');
  var show = inp.type === 'password';
  inp.type = show ? 'text' : 'password';
  document.getElementById('eyeIcon').innerHTML = show
    ? '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/><path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"/><line x1="1" y1="1" x2="23" y2="23"/>'
    : '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
}

// Client-side validation
document.getElementById('loginForm').addEventListener('submit', function(e) {
  var ok = true;

  var email = document.getElementById('email');
  var errE  = document.getElementById('err-email');
  var validEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value);
  email.classList.toggle('error', !validEmail);
  errE.classList.toggle('show', !validEmail);
  if (!validEmail) ok = false;

  var pw   = document.getElementById('password');
  var errP = document.getElementById('err-password');
  var validPw = pw.value.length > 0;
  pw.classList.toggle('error', !validPw);
  errP.classList.toggle('show', !validPw);
  if (!validPw) ok = false;

  if (!ok) e.preventDefault();
});

// Clear error on input
['email','password'].forEach(function(id){
  document.getElementById(id).addEventListener('input', function(){
    this.classList.remove('error');
    var err = document.getElementById('err-' + id);
    if (err) err.classList.remove('show');
  });
});
</script>
</body>
</html>
