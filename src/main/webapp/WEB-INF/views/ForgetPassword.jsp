<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password – CodeNova SOU</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --pri:    #4f46e5;
  --pri-dk: #3730a3;
  --acc:    #0d9488;
  --acc-lt: #5eead4;
  --ink:    #1e1b4b;
  --ink2:   #374151;
  --sub:    #6b7280;
  --muted:  #9ca3af;
  --line:   #e5e7eb;
  --bg:     #f5f3ff;
  --bg2:    #ede9fe;
  --white:  #ffffff;
  --red:    #dc2626;
  --red-bg: #fee2e2;
  --green:      #059669;
  --green-bg:   #d1fae5;
  --green-line: #6ee7b7;
  --r:      12px;
}
html{scroll-behavior:smooth}
body{
  font-family:'Plus Jakarta Sans',sans-serif;
  background:var(--bg);min-height:100vh;
  display:grid;grid-template-columns:1fr 1fr;
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
.lp-h{font-size:clamp(22px,2.6vw,32px);font-weight:800;color:#fff;line-height:1.25;margin-bottom:14px}
.lp-h em{font-style:normal;color:var(--acc-lt)}
.lp-p{font-size:14.5px;color:rgba(255,255,255,.72);line-height:1.75;margin-bottom:40px}

/* steps guide */
.how-steps{display:flex;flex-direction:column;gap:0}
.how-step{
  display:flex;align-items:flex-start;gap:14px;
  padding:16px 0;
  border-bottom:1px solid rgba(255,255,255,.1);
}
.how-step:last-child{border-bottom:none}
.how-num{
  width:32px;height:32px;border-radius:50%;flex-shrink:0;
  background:rgba(255,255,255,.15);border:1.5px solid rgba(255,255,255,.3);
  display:flex;align-items:center;justify-content:center;
  font-size:13px;font-weight:800;color:#fff;
}
.how-txt{font-size:13.5px;font-weight:600;color:rgba(255,255,255,.9)}
.how-sub{font-size:12px;color:rgba(255,255,255,.55);margin-top:2px}

/* ════════ RIGHT PANEL ════════ */
.right-panel{
  display:flex;flex-direction:column;justify-content:center;align-items:center;
  padding:48px 28px;min-height:100vh;background:var(--bg);
}
.form-box{width:100%;max-width:420px}

/* mobile logo */
.mobile-logo{display:none;align-items:center;justify-content:center;gap:9px;margin-bottom:24px}
@media(max-width:860px){.mobile-logo{display:flex}}
.mobile-logo-box{
  width:38px;height:38px;border-radius:10px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;
  font-size:15px;font-weight:800;color:#fff;
}
.mobile-logo-txt{font-size:16px;font-weight:800;color:var(--ink)}
.mobile-logo-txt span{color:var(--pri)}

/* form top */
.form-top{text-align:center;margin-bottom:28px}
.form-icon{
  width:64px;height:64px;border-radius:18px;margin:0 auto 14px;
  background:linear-gradient(135deg,var(--pri),var(--acc));
  display:flex;align-items:center;justify-content:center;font-size:28px;
  box-shadow:0 6px 20px rgba(79,70,229,.28);
}
.form-title{font-size:22px;font-weight:800;color:var(--ink);margin-bottom:5px}
.form-sub{font-size:13.5px;color:var(--sub);line-height:1.6}

/* info box */
.info-box{
  display:flex;align-items:flex-start;gap:10px;
  background:var(--bg2);border:1.5px solid #c7d2fe;
  border-radius:10px;padding:12px 14px;
  font-size:13px;color:var(--pri);
  margin-bottom:22px;line-height:1.6;
}
.info-box svg{flex-shrink:0;margin-top:1px;color:var(--pri)}

/* field */
.field{margin-bottom:18px}
.field label{display:block;font-size:12.5px;font-weight:700;color:var(--ink2);margin-bottom:6px}
.field label span{color:var(--red)}
.input-wrap{position:relative}
.input-wrap svg{position:absolute;left:12px;top:50%;transform:translateY(-50%);color:var(--muted);pointer-events:none}
input[type=email]{
  width:100%;padding:11px 14px 11px 38px;
  border:1.5px solid var(--line);border-radius:var(--r);
  font-family:'Plus Jakarta Sans',sans-serif;
  font-size:13.5px;color:var(--ink);
  background:var(--white);outline:none;
  transition:border-color .18s,box-shadow .18s;
}
input[type=email]:focus{border-color:var(--pri);box-shadow:0 0 0 3px rgba(79,70,229,.1)}
input.error{border-color:var(--red);box-shadow:0 0 0 3px rgba(220,38,38,.08)}
.err-msg{font-size:11.5px;color:var(--red);margin-top:4px;display:none}
.err-msg.show{display:block}

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
.btn-pri:disabled{opacity:.6;cursor:not-allowed;transform:none}

/* success state */
.success-box{
  display:none;text-align:center;padding:8px 0 4px;
  animation:fadeIn .3s ease;
}
.success-icon-wrap{
  width:68px;height:68px;border-radius:50%;margin:0 auto 16px;
  background:linear-gradient(135deg,var(--green),#10b981);
  display:flex;align-items:center;justify-content:center;font-size:30px;
  box-shadow:0 6px 20px rgba(5,150,105,.28);
}
.success-title{font-size:20px;font-weight:800;color:var(--ink);margin-bottom:6px}
.success-sub{font-size:13.5px;color:var(--sub);line-height:1.7;margin-bottom:22px}
.success-alert{
  display:flex;align-items:center;gap:10px;
  background:var(--green-bg);border:1.5px solid var(--green-line);
  border-radius:10px;padding:12px 14px;
  font-size:13px;color:var(--green);font-weight:600;
  margin-bottom:20px;text-align:left;
}
.success-alert svg{flex-shrink:0}

/* back links */
.back-row{
  display:flex;align-items:center;justify-content:center;gap:6px;
  margin-top:20px;font-size:13px;color:var(--sub);
}
.back-row a{color:var(--pri);font-weight:700;text-decoration:none}
.back-row a:hover{text-decoration:underline}
.back-home{
  display:flex;align-items:center;justify-content:center;gap:5px;
  margin-top:12px;font-size:12.5px;color:var(--muted);
  text-decoration:none;transition:color .15s;
}
.back-home:hover{color:var(--pri)}

@keyframes fadeIn{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:translateY(0)}}
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
    <h1 class="lp-h">Reset Your<br><em>Password</em> 🔑</h1>
    <p class="lp-p">Don't worry — it happens to the best of us. Follow these simple steps to regain access to your account.</p>
    <div class="how-steps">
      <div class="how-step">
        <div class="how-num">1</div>
        <div>
          <div class="how-txt">Enter your email address</div>
          <div class="how-sub">Use the email you registered with</div>
        </div>
      </div>
      <div class="how-step">
        <div class="how-num">2</div>
        <div>
          <div class="how-txt">Check your inbox</div>
          <div class="how-sub">We'll send a secure reset link</div>
        </div>
      </div>
      <div class="how-step">
        <div class="how-num">3</div>
        <div>
          <div class="how-txt">Set a new password</div>
          <div class="how-sub">Click the link and create a strong password</div>
        </div>
      </div>
      <div class="how-step">
        <div class="how-num">4</div>
        <div>
          <div class="how-txt">Login &amp; continue</div>
          <div class="how-sub">You're back in — good as new!</div>
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

    <!-- FORM STATE -->
    <div id="formState">
      <div class="form-top">
        <div class="form-icon">🔑</div>
        <div class="form-title">Forgot Password?</div>
        <div class="form-sub">Enter your registered email and we'll send you a link to reset your password.</div>
      </div>

      <div class="info-box">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/>
        </svg>
        Make sure to check your spam/junk folder if you don't see the email within a few minutes.
      </div>

      <form action="resetPassword" method="post" id="fpForm" novalidate>
        <div class="field">
          <label>Registered Email Address <span>*</span></label>
          <div class="input-wrap">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-10 7L2 7"/>
            </svg>
            <input type="email" name="email" id="email" placeholder="rahul@example.com" required>
          </div>
          <div class="err-msg" id="err-email">Please enter a valid email address</div>
        </div>

        <button type="submit" class="btn-pri" id="submitBtn">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
            <line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/>
          </svg>
          Send Reset Link
        </button>
      </form>

      <div class="back-row">
        Remember your password? <a href="login">Back to Login</a>
      </div>
      <a href="Home" class="back-home">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Back to Home
      </a>
    </div>

    <!-- SUCCESS STATE -->
    <div class="success-box" id="successState">
      <div class="success-icon-wrap">✉️</div>
      <div class="success-title">Email Sent!</div>
      <div class="success-sub">We've sent a password reset link to your email. Please check your inbox and follow the instructions.</div>
      <div class="success-alert">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
        </svg>
        Reset link sent! Check your spam folder if you don't see it.
      </div>
      <a href="login" class="btn-pri" style="text-decoration:none;display:inline-flex;width:auto;padding:11px 28px;margin:0 auto">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
          <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/>
        </svg>
        Go to Login
      </a>
    </div>

  </div>
</div>

<script>
document.getElementById('fpForm').addEventListener('submit', function(e) {
  var emailEl = document.getElementById('email');
  var errEl   = document.getElementById('err-email');
  var valid   = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailEl.value);

  emailEl.classList.toggle('error', !valid);
  errEl.classList.toggle('show', !valid);

  if (!valid) {
    e.preventDefault();
    return;
  }

  // Show loading state on button
  var btn = document.getElementById('submitBtn');
  btn.disabled = true;
  btn.innerHTML = '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="animation:spin 1s linear infinite"><path d="M21 12a9 9 0 1 1-6.219-8.56"/></svg> Sending...';

  // Uncomment below if you want to show success UI on client side
  // (remove if server handles redirect)
  /*
  e.preventDefault();
  setTimeout(function(){
    document.getElementById('formState').style.display   = 'none';
    document.getElementById('successState').style.display = 'block';
  }, 1200);
  */
});

// Clear error on type
document.getElementById('email').addEventListener('input', function(){
  this.classList.remove('error');
  document.getElementById('err-email').classList.remove('show');
});
</script>

<style>
@keyframes spin{from{transform:rotate(0deg)}to{transform:rotate(360deg)}}
</style>
</body>
</html>
