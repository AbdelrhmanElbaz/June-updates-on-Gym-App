<%@ page language="C#" autoeventwireup="true" inherits="Login1, App_Web_miccv0mn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MY-GYM — Login</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style type="text/css">

    :root {
      --bg:          #0f0f17;
      --surface:     #181824;
      --surface-2:   #1e1e2e;
      --border:      rgba(255,255,255,0.08);
      --primary:     #d4a853;
      --primary-fg:  #1a1000;
      --primary-dim: rgba(212,168,83,0.12);
      --muted:       rgba(255,255,255,0.40);
      --fg:          rgba(255,255,255,0.92);
      --fg-light:    rgba(255,255,255,0.65);
      --destructive: #e05c5c;
      --radius-sm:   6px;
      --radius-md:   10px;
      --font:        'Inter', 'Segoe UI', system-ui, sans-serif;
    }

    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    html, body {
      height: 100%;
      background: var(--bg);
      font-family: var(--font);
      color: var(--fg);
    }

    /* ── Full-page layout ── */
    #login-root {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 24px 16px;
      position: relative;
      overflow: hidden;
    }

    /* subtle radial glow behind card */
    #login-root::before {
      content: '';
      position: absolute;
      top: 50%; left: 50%;
      transform: translate(-50%, -50%);
      width: 600px; height: 600px;
      border-radius: 50%;
      background: radial-gradient(ellipse, rgba(212,168,83,0.07) 0%, transparent 70%);
      pointer-events: none;
    }

    /* ── Card ── */
    .login-card {
      position: relative;
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 18px;
      width: 100%;
      max-width: 420px;
      padding: 44px 40px 36px;
      z-index: 1;
    }

    /* top accent line */
    .login-card::before {
      content: '';
      position: absolute;
      top: 0; left: 10%; right: 10%;
      height: 2px;
      border-radius: 0 0 4px 4px;
      background: linear-gradient(90deg, transparent, var(--primary), transparent);
    }

    /* ── Logo area ── */
    .login-logo {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 14px;
      margin-bottom: 36px;
    }

    .login-logo-img {
      width: 90px;
      height: 90px;
      border-radius: 50%;
      border: 2px solid rgba(212,168,83,0.3);
      object-fit: cover;
      background: var(--surface-2);
      display: block;
    }

    .login-logo-text {
      text-align: center;
    }

    .login-logo-text h1 {
      font-size: 22px;
      font-weight: 700;
      color: var(--primary);
      letter-spacing: 0.08em;
      line-height: 1.2;
    }

    .login-logo-text h1 sup {
      font-size: 0.5em;
      color: var(--muted);
      font-weight: 400;
      vertical-align: super;
    }

    .login-logo-text p {
      font-size: 12px;
      color: var(--muted);
      margin-top: 4px;
      letter-spacing: 0.04em;
    }

    /* ── Form fields ── */
    .login-fields {
      display: flex;
      flex-direction: column;
      gap: 16px;
      margin-bottom: 24px;
    }

    .login-field {
      display: flex;
      flex-direction: column;
      gap: 6px;
    }

    .login-field label {
      font-size: 11px;
      font-weight: 600;
      color: var(--muted);
      text-transform: uppercase;
      letter-spacing: 0.07em;
    }

    .login-field input[type="text"],
    .login-field input[type="password"] {
      width: 100%;
      height: 42px;
      padding: 0 14px;
      background: var(--surface-2);
      color: var(--fg);
      border: 1px solid var(--border);
      border-radius: var(--radius-sm);
      font-family: var(--font);
      font-size: 14px;
      transition: border-color 0.2s, box-shadow 0.2s;
      outline: none;
    }

    .login-field input[type="text"]:focus,
    .login-field input[type="password"]:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 3px var(--primary-dim);
    }

    .login-field input::placeholder {
      color: var(--muted);
    }

    /* ── Submit button ── */
    .login-btn-wrap {
      margin-top: 4px;
    }

    .login-btn-wrap input[type="submit"] {
      width: 100%;
      height: 44px;
      background: var(--primary);
      color: var(--primary-fg);
      border: none;
      border-radius: var(--radius-sm);
      font-family: var(--font);
      font-size: 13px;
      font-weight: 700;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      cursor: pointer;
      transition: opacity 0.18s, transform 0.1s;
    }

    .login-btn-wrap input[type="submit"]:hover  { opacity: 0.88; }
    .login-btn-wrap input[type="submit"]:active { transform: translateY(1px); }

    /* ── Error label ── */
    .login-error {
      margin-top: 14px;
      min-height: 20px;
      text-align: center;
      font-size: 12px;
      font-weight: 600;
      color: var(--destructive);
    }

    /* ── Footer ── */
    .login-footer {
      margin-top: 32px;
      text-align: center;
      font-size: 11px;
      color: var(--muted);
      line-height: 1.7;
    }

    .login-footer span {
      display: block;
    }

    /* ── Hide old layout divs the page originally had ── */
    #upbg, #outer, #header, #headerpic,
    #headercontent, #menu, #menubottom,
    #content, #normalcontent, #footer,
    .contentarea { display: none !important; }

    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>

    <!-- hide all original layout wrappers, show only our card -->
    <div id="upbg"></div>
    <div id="outer">
        <div id="headerpic"><div id="headercontent"><h1>MY - GYM <sup>IT</sup></h1><h2>designed by Eng Haitham</h2></div></div>
        <div id="menu"></div>
        <div id="content"><div id="normalcontent"><div class="contentarea"></div></div></div>
        <div id="footer"><div class="left">© 2012 GYMApp. All rights reserved.</div><div class="right">Design by Eng Haitham</div></div>
    </div>

    <!-- ══════════════ LOGIN CARD ══════════════ -->
    <div id="login-root">
      <div class="login-card">

        <!-- Logo + title -->
        <div class="login-logo">
          <img src="Images/MyGymLogo.png" alt="MY GYM Logo" class="login-logo-img"
               onerror="this.style.display='none'" />
          <div class="login-logo-text">
            <h1>MY - GYM <sup>IT</sup></h1>
            <p>Management System</p>
          </div>
        </div>

        <!-- Fields -->
        <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />

        <div class="login-fields">
          <div class="login-field">
            <label for="ctl00_TextBoxUName">Username</label>
            <asp:TextBox ID="TextBoxUName" runat="server"
              placeholder="Enter your username" />
          </div>
          <div class="login-field">
            <label for="ctl00_TextBoxPass">Password</label>
            <asp:TextBox ID="TextBoxPass" runat="server"
              TextMode="Password"
              placeholder="Enter your password" />
          </div>
        </div>

        <!-- Submit -->
        <div class="login-btn-wrap">
          <asp:Button ID="ButtonLogIn" runat="server"
            onclick="ButtonSearch_Click"
            Text="LOGIN" />
        </div>

        <!-- Error -->
        <div class="login-error">
          <asp:Label ID="LabelEr" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
        </div>

        <!-- Footer -->
        <div class="login-footer">
          <span>© 2012 GYMApp. All rights reserved.</span>
          <span>Redesigned by Abdelrhman Elbaz</span>
        </div>

      </div>
    </div>

    </div>
    </form>
</body>
</html>
