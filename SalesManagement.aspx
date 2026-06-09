<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" 
    CodeFile="SalesManagement.aspx.cs" Inherits="SalesManagement" Title="Sales Management"
    ContentType="text/html; charset=utf-8" ResponseEncoding="UTF-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@700;900&display=swap" rel="stylesheet">
    <style type="text/css">
        /* ── Main layout ── */
        .sm-wrapper { max-width:1100px; margin:24px auto; font-family:"Segoe UI",Arial,sans-serif; }
        .sm-header  { background:#8B0000; color:#fff; border-radius:8px 8px 0 0; padding:14px 22px;
            display:flex; align-items:center; gap:10px; font-size:17px; font-weight:600; }
        .sm-header span.icon { font-size:22px; }
        .sm-card    { background:#fff; border:1px solid #ddd; border-top:none; border-radius:0 0 8px 8px;
            padding:20px 24px 16px; box-shadow:0 2px 8px rgba(0,0,0,.06); }
        .sm-filter-grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
            gap:14px 20px; margin-bottom:18px; }
        .sm-field label { display:block; font-size:12px; font-weight:600; color:#555; margin-bottom:4px;
            text-transform:uppercase; letter-spacing:.4px; }
        .sm-field input[type=text], .sm-field select { width:100%; padding:7px 10px; border:1px solid #ccc;
            border-radius:5px; font-size:13px; color:#333; box-sizing:border-box; transition:border-color .2s; }
        .sm-field input[type=text]:focus, .sm-field select:focus { border-color:#8B0000; outline:none;
            box-shadow:0 0 0 3px rgba(139,0,0,.1); }
        .days-range { display:flex; align-items:center; gap:8px; }
        .days-range input[type=text] { width:80px !important; }
        .days-range span { font-size:13px; color:#888; white-space:nowrap; }
        .gender-group { display:flex; gap:12px; padding-top:4px; }
        .gender-group label { font-size:13px; font-weight:400 !important; text-transform:none !important;
            letter-spacing:0 !important; color:#333 !important; display:flex; align-items:center;
            gap:4px; cursor:pointer; }
        .sm-check-row { display:flex; align-items:center; gap:7px; font-size:13px; color:#444; padding-top:22px; }
        .sm-actions { display:flex; gap:10px; flex-wrap:wrap; border-top:1px solid #f0f0f0;
            padding-top:16px; margin-top:4px; }
        .btn-primary   { background:#8B0000; color:#fff; border:none; padding:8px 22px; border-radius:5px;
            font-size:13px; font-weight:600; cursor:pointer; }
        .btn-primary:hover { background:#a00000; }
        .btn-secondary { background:#fff; color:#555; border:1px solid #ccc; padding:8px 18px;
            border-radius:5px; font-size:13px; cursor:pointer; }
        .btn-secondary:hover { background:#f5f5f5; }
        .btn-export    { background:#1a6e38; color:#fff; border:none; padding:8px 18px; border-radius:5px;
            font-size:13px; font-weight:600; cursor:pointer; }
        .btn-export:hover { background:#155e2f; }
        /* ── Stats ── */
        .sm-stats  { display:flex; gap:14px; flex-wrap:wrap; margin:18px 0 10px; }
        .stat-box  { flex:1; min-width:130px; background:#fafafa; border:1px solid #e8e8e8;
            border-radius:7px; padding:12px 18px; text-align:center; }
        .stat-number       { font-size:26px; font-weight:700; color:#8B0000; }
        .stat-number.amber { color:#c47a00; }
        .stat-number.blue  { color:#1565c0; }
        .stat-label { font-size:11px; color:#888; margin-top:2px; }
        .sm-legend { font-size:11px; color:#777; margin-bottom:8px; display:flex; gap:14px; flex-wrap:wrap; }
        .legend-dot { display:inline-block; width:12px; height:12px; border-radius:2px;
            margin-right:4px; vertical-align:middle; }
        .sm-error { color:#a00000; font-size:13px; font-weight:600; margin:6px 0; min-height:18px; }
        /* ── Grid ── */
        .sm-grid-wrap { overflow-x:auto; margin-top:6px; }
        .sm-grid-wrap table { width:100%; border-collapse:collapse; font-size:13px; }
        .sm-grid-wrap th { background:#2b2b2b !important; color:#fff !important; padding:10px;
            font-weight:600; white-space:nowrap; }
        .sm-grid-wrap td { padding:8px 10px; border-bottom:1px solid #f0f0f0; vertical-align:middle; }
        .sm-grid-wrap tr:hover td { background:#fdf5f5 !important; }
        .row-absent-high td { background:#ffe5e5 !important; }
        .row-absent-med  td { background:#fff8e1 !important; }
        .btn-done { background:#FF9800; color:#fff; border:none; padding:4px 12px; border-radius:4px;
            font-size:12px; font-weight:600; cursor:pointer; white-space:nowrap; }
        .btn-done:hover { background:#e68900; }
        .btn-card { background:#1565c0; color:#fff; border:none; padding:4px 10px; border-radius:4px;
            font-size:12px; font-weight:600; cursor:pointer; white-space:nowrap; display:inline-block; }
        .btn-card:hover { background:#0d47a1; color:#fff; }
        .sm-empty { padding:30px; text-align:center; color:#888; font-size:14px; }
        .sm-grid-wrap td[colspan] a, .sm-grid-wrap td[colspan] span { padding:3px 10px;
            border:1px solid #ddd; border-radius:4px; margin:0 2px; font-size:12px;
            color:#8B0000; text-decoration:none; }
        /* ── Password gate ── */
        .sm-pwd-overlay { display:flex; align-items:center; justify-content:center;
            min-height:400px; padding:40px 20px; }
        .sm-pwd-box { background:#fff; border:1px solid #ddd; border-radius:10px; padding:40px 36px;
            text-align:center; max-width:360px; width:100%; box-shadow:0 4px 16px rgba(0,0,0,.08); }
        .sm-pwd-icon  { font-size:40px; margin-bottom:12px; }
        .sm-pwd-title { font-size:20px; font-weight:700; color:#222; margin-bottom:6px; }
        .sm-pwd-sub   { font-size:13px; color:#777; margin-bottom:24px; line-height:1.5; }
        .sm-pwd-input { width:100%; padding:10px 12px; border:1px solid #ccc; border-radius:6px;
            font-size:15px; box-sizing:border-box; margin-bottom:14px; text-align:center; letter-spacing:2px; }
        .sm-pwd-input:focus { border-color:#8B0000; outline:none; box-shadow:0 0 0 3px rgba(139,0,0,.1); }
        .sm-pwd-btn { background:#8B0000; color:#fff; border:none; padding:10px 32px;
            border-radius:6px; font-size:14px; font-weight:600; cursor:pointer; width:100%; }
        .sm-pwd-btn:hover { background:#a00000; }
        .sm-pwd-error { display:block; margin-top:10px; color:#a00000; font-size:13px; font-weight:600; }
        /* ── Card Modal ── */
        #cardModal { display:none; position:fixed; inset:0; z-index:9999; background:rgba(0,0,0,.75);
            backdrop-filter:blur(4px); overflow-y:auto; padding:30px 16px; }
        #cardModal.open { display:flex; align-items:flex-start; justify-content:center; }
        .cm-box { background:#fff; border-radius:14px; width:100%; max-width:960px;
            box-shadow:0 20px 60px rgba(0,0,0,.4); overflow:hidden; }
        .cm-header { background:#111; color:#FFD700; padding:16px 22px; display:flex;
            align-items:center; justify-content:space-between; font-family:'Cairo',sans-serif;
            font-size:16px; font-weight:700; }
        .cm-close { background:none; border:none; color:#aaa; font-size:22px; cursor:pointer; line-height:1; }
        .cm-close:hover { color:#fff; }
        .cm-preview { padding:20px; background:#1a1a1a; }
        /* ── GYM CARD ── */
        .gym-card { width:100%; aspect-ratio:16/9; border-radius:18px; overflow:hidden;
            position:relative; display:flex; flex-direction:column; padding:4% 5%;
            background:linear-gradient(135deg,#d4a800 0%,#f5cc00 30%,#c89000 65%,#9a6e00 100%);
            font-family:'Cairo','Segoe UI',sans-serif;
            box-shadow:0 0 0 1.5px rgba(255,220,0,.5) inset, 0 8px 40px rgba(0,0,0,.55); }
        /* mesh texture overlay */
        .gym-card::before { content:''; position:absolute; inset:0; pointer-events:none; z-index:0;
            background-image:
                repeating-linear-gradient(45deg,rgba(0,0,0,.035) 0,rgba(0,0,0,.035) 1px,transparent 1px,transparent 9px),
                repeating-linear-gradient(-45deg,rgba(0,0,0,.035) 0,rgba(0,0,0,.035) 1px,transparent 1px,transparent 9px); }
        /* top+bottom edge glow */
        .gym-card::after { content:''; position:absolute; top:0; left:0; right:0; height:2px;
            background:linear-gradient(90deg,transparent,rgba(255,230,0,.8),rgba(255,210,0,1),rgba(255,230,0,.8),transparent);
            z-index:3; pointer-events:none; }
        .gc-bg { position:absolute; inset:0; background-size:cover; background-position:center top;
            mix-blend-mode:multiply; opacity:0.22; pointer-events:none; z-index:1; }
        .gc-overlay { position:absolute; inset:0; z-index:1;
            background:
                radial-gradient(ellipse at 78% 45%,rgba(0,0,0,.3) 0%,transparent 55%),
                radial-gradient(ellipse at 15% 75%,rgba(0,0,0,.2) 0%,transparent 50%),
                linear-gradient(to bottom,rgba(255,220,0,.06) 0%,rgba(0,0,0,.15) 100%);
            pointer-events:none; }
        .gc-top { display:flex; justify-content:flex-end; align-items:flex-start;
            position:relative; z-index:2; }
        .gc-logo { font-size:clamp(14px,3vw,34px); font-weight:900; color:#0d0800;
            letter-spacing:2px;
            text-shadow:1px 1px 0 rgba(255,210,0,.5),-1px -1px 0 rgba(0,0,0,.35),0 3px 8px rgba(0,0,0,.3); }
        /* badge hidden by default in new design — kept for compatibility */
        .gc-badge { display:none !important; }
        .gc-center { flex:1; display:flex; flex-direction:column; align-items:center;
            justify-content:center; text-align:center; position:relative; z-index:2; gap:3px; }
        .gc-title { font-size:clamp(22px,5.5vw,66px); font-weight:900; color:#0d0800; line-height:1.05;
            letter-spacing:2px;
            text-shadow:2px 2px 0 rgba(255,200,0,.35),-1px -1px 0 rgba(0,0,0,.45),0 4px 14px rgba(0,0,0,.3); }
        .gc-expiry { font-size:clamp(9px,1.5vw,17px); font-weight:700; color:rgba(15,8,0,.65); direction:rtl; }
        .gc-client { font-size:clamp(10px,1.8vw,21px); font-weight:700; color:rgba(10,5,0,.55); direction:rtl; }
        /* gc-bottom */
        .gc-bottom { display:flex; gap:2%; position:relative; z-index:2; margin-top:1%; }
        .gc-pill { flex:1; border-radius:12px; display:flex; flex-direction:column;
            align-items:center; justify-content:center; padding:4% 3%; gap:1px;
            background:rgba(0,0,0,.74);
            border:1px solid rgba(210,160,0,.45);
            box-shadow:0 0 0 0.5px rgba(255,200,0,.15) inset, 0 4px 18px rgba(0,0,0,.5), 0 0 10px rgba(160,110,0,.12);
            position:relative; overflow:hidden; }
        .gc-pill::before { content:''; position:absolute; inset:0; pointer-events:none;
            background:radial-gradient(ellipse at 50% 8%,rgba(255,200,0,.07) 0%,transparent 65%),
                repeating-linear-gradient(45deg,rgba(255,200,0,.015) 0,rgba(255,200,0,.015) 1px,transparent 1px,transparent 7px); }
        .gc-pill-dur { font-size:clamp(9px,1.8vw,22px); font-weight:900; line-height:1.2;
            text-align:center; direction:rtl;
            background:linear-gradient(180deg,#ffd700 0%,#c08a00 55%,#f0c800 100%);
            -webkit-background-clip:text; -webkit-text-fill-color:transparent; background-clip:text;
            filter:drop-shadow(0 1px 3px rgba(0,0,0,.6)); }
        .gc-pill-old { font-size:clamp(7px,1.1vw,13px); font-weight:700;
            color:rgba(190,145,0,.6);
            text-decoration:line-through; text-decoration-color:rgba(190,130,0,.6);
            line-height:1.2; direction:rtl; }
        .gc-pill-new { font-size:clamp(12px,2.8vw,36px); font-weight:900; line-height:1.1;
            direction:rtl;
            background:linear-gradient(180deg,#ffffff 0%,#ffe082 45%,#d4a800 100%);
            -webkit-background-clip:text; -webkit-text-fill-color:transparent; background-clip:text;
            filter:drop-shadow(0 0 7px rgba(255,210,0,.35)) drop-shadow(0 2px 4px rgba(0,0,0,.55)); }
        /* Features line inside pill */
        .gc-pill-feat { font-size:clamp(6px,1vw,12px); font-weight:700;
            color:rgba(240,195,50,.88); line-height:1.3; text-align:center; direction:rtl;
            margin-top:3px; border-top:0.5px solid rgba(210,160,0,.28); padding-top:3px; width:100%; }
        /* ── Controls ── */
        .cm-info-row { padding:14px 22px; background:#fff; display:flex; gap:14px;
            flex-wrap:wrap; border-bottom:1px solid #f0f0f0; }
        .cm-info-row .cm-ctrl-group { flex:1; min-width:160px; }
        /* Offer count selector */
        .cm-offer-count { padding:10px 22px; background:#f8f8f8; border-bottom:1px solid #eee;
            display:flex; align-items:center; gap:12px; }
        .cm-offer-count label { font-size:12px; font-weight:700; color:#555; text-transform:uppercase; }
        .cm-offer-count button { padding:6px 14px; border-radius:5px; border:2px solid #ccc;
            background:#fff; font-size:13px; font-weight:700; cursor:pointer; color:#555; transition:.15s; }
        .cm-offer-count button.active { border-color:#FFD700; background:#111; color:#FFD700; }
        /* Offers grid — columns change dynamically */
        .cm-controls { padding:18px 22px 22px; background:#f8f8f8; display:grid; gap:14px 18px; }
        .cm-ctrl-group { background:#fff; border:1px solid #e0e0e0; border-radius:8px; padding:12px 14px; }
        .cm-ctrl-group-title { font-size:11px; font-weight:700; color:#FFD700; background:#111;
            display:inline-block; padding:2px 8px; border-radius:4px; margin-bottom:10px; letter-spacing:.5px; }
        .cm-ctrl-group label { display:block; font-size:11px; color:#777; margin-bottom:3px; margin-top:8px; }
        .cm-ctrl-group input[type=text] { width:100%; padding:6px 8px; border:1px solid #ddd;
            border-radius:5px; font-size:13px; font-family:inherit; box-sizing:border-box; transition:border-color .2s; }
        .cm-ctrl-group input[type=text]:focus { border-color:#FFD700; outline:none;
            box-shadow:0 0 0 3px rgba(255,215,0,.2); }
        .cm-footer { padding:14px 22px; background:#fff; border-top:1px solid #eee;
            display:flex; gap:10px; align-items:center; flex-wrap:wrap; }
        .btn-dl-card   { background:#FFD700; color:#111; border:none; padding:9px 22px;
            border-radius:6px; font-size:14px; font-weight:700; cursor:pointer; font-family:inherit; }
        .btn-dl-card:hover { opacity:.88; }
        .btn-dl-cancel { background:#fff; color:#555; border:1px solid #ccc; padding:9px 18px;
            border-radius:6px; font-size:13px; cursor:pointer; font-family:inherit; }
        .btn-dl-cancel:hover { background:#f5f5f5; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <!-- ═══════════════════════════════════════════════════════════ CARD MODAL -->
    <div id="cardModal">
      <div class="cm-box">
        <div class="cm-header">
          <span>&#127924; Offer Card</span>
          <button type="button" class="cm-close" onclick="closeCardModal()">&times;</button>
        </div>

        <!-- Row 1: gym name / main title / badge text / client / expiry / gender -->
        <div class="cm-info-row">
          <div class="cm-ctrl-group">
            <div class="cm-ctrl-group-title">GYM NAME</div>
            <input type="text" id="cmGymName" value="MY GYM" oninput="refreshCard()">
          </div>
          <div class="cm-ctrl-group">
            <div class="cm-ctrl-group-title">MAIN TITLE</div>
            <input type="text" id="cmTitle" oninput="refreshCard()">
          </div>
          <!-- FIX #4: editable badge text (was hardcoded "عرض خاص") -->
          <div class="cm-ctrl-group">
            <div class="cm-ctrl-group-title">BADGE TEXT</div>
            <input type="text" id="cmBadge" value="&#1593;&#1585;&#1590; &#1582;&#1575;&#1589;" oninput="refreshCard()">
          </div>
          <div class="cm-ctrl-group">
            <div class="cm-ctrl-group-title">CLIENT NAME</div>
            <input type="text" id="cmClient" value="" oninput="refreshCard()">
          </div>
          <!-- FIX #5: "Client" instead of عميل/عميلة -->
          <div class="cm-ctrl-group">
            <div class="cm-ctrl-group-title">GENDER</div>
            <div style="display:flex;gap:8px;padding-top:6px;">
              <button type="button" id="btnMale"   onclick="setGender(0)"
                style="flex:1;padding:6px;border-radius:5px;font-weight:700;font-size:13px;cursor:pointer;border:2px solid #1565c0;background:#1565c0;color:#fff;">
                &#9794; Male
              </button>
              <button type="button" id="btnFemale" onclick="setGender(1)"
                style="flex:1;padding:6px;border-radius:5px;font-weight:700;font-size:13px;cursor:pointer;border:2px solid #ccc;background:#fff;color:#888;">
                &#9792; Female
              </button>
            </div>
          </div>
          <div class="cm-ctrl-group">
            <div class="cm-ctrl-group-title">EXPIRY DATE</div>
            <input type="text" id="cmExpiry" oninput="refreshCard()">
          </div>
        </div>

        <!-- CARD PREVIEW -->
        <div class="cm-preview">
          <div class="gym-card" id="gymCard">
            <div class="gc-bg" id="gcBgEl"></div>
            <div class="gc-overlay"></div>
            <div class="gc-top">
              <div class="gc-logo" id="gcLogo">MY GYM</div>
            </div>
            <div class="gc-center">
              <div class="gc-title"  id="gcTitle"></div>
              <div class="gc-expiry" id="gcExpiry"></div>
              <div class="gc-client" id="gcClient"></div>
            </div>
            <!-- Pills injected dynamically by JS -->
            <div class="gc-bottom" id="gcBottom"></div>
            <div style="position:relative;z-index:2;text-align:left;margin-top:1%;direction:ltr;">
              <span style="font-size:clamp(7px,1vw,11px);letter-spacing:3px;font-weight:700;color:rgba(10,6,0,.38);font-family:'Cairo',sans-serif;">PREMIUM OFFERS</span>
            </div>
          </div>
        </div>

        <!-- FIX #2: Offer count selector (1-4) -->
        <div class="cm-offer-count">
          <label>Number of offers:</label>
          <button type="button" id="ocBtn1" class="active" onclick="setOfferCount(1)">1</button>
          <button type="button" id="ocBtn2"               onclick="setOfferCount(2)">2</button>
          <button type="button" id="ocBtn3"               onclick="setOfferCount(3)">3</button>
          <button type="button" id="ocBtn4"               onclick="setOfferCount(4)">4</button>
        </div>

        <!-- FIX #2 + #3: Dynamic offer controls, max 4 -->
        <div class="cm-controls" id="cmControls">
          <!-- Rendered by JS: setOfferCount() -->
        </div>

        <div class="cm-footer">
          <button type="button" class="btn-dl-card" onclick="downloadCard(); return false;">
            &#128229; Open Card (Save Image)
          </button>
          <button type="button" class="btn-dl-cancel"
            onclick="saveSettings(); this.textContent='&#10003; Saved!'; var b=this; setTimeout(function(){b.textContent='&#128190; Save Settings';},1500);">
            &#128190; Save Settings
          </button>
          <button type="button" class="btn-dl-cancel" onclick="closeCardModal()">Close</button>
          <span style="font-size:11px;color:#aaa;margin-left:auto;">&#128204; Settings auto-saved to browser</span>
        </div>
      </div>
    </div>

    <!-- PASSWORD GATE -->
    <asp:Panel ID="PanelPassword" runat="server" Visible="false">
      <div class="sm-pwd-overlay">
        <div class="sm-pwd-box">
          <div class="sm-pwd-icon">&#128274;</div>
          <div class="sm-pwd-title">Sales Management</div>
          <div class="sm-pwd-sub">This page is protected. Enter the password to continue.</div>
          <asp:TextBox ID="TextBoxPwd" runat="server" TextMode="Password"
            CssClass="sm-pwd-input" placeholder="Enter password" />
          <asp:Button ID="ButtonUnlock" runat="server" Text="Unlock"
            CssClass="sm-pwd-btn" OnClick="ButtonUnlock_Click" />
          <asp:Label ID="LabelPwdError" runat="server" CssClass="sm-pwd-error" />
        </div>
      </div>
    </asp:Panel>

    <!-- MAIN CONTENT -->
    <asp:Panel ID="PanelMain" runat="server" Visible="false">
    <div class="sm-wrapper">

      <div class="sm-header">
        <span class="icon">&#128200;</span>
        Sales Management &mdash; Expired Subscriptions
      </div>

      <div class="sm-card">
        <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />
        <div class="sm-filter-grid">

          <div class="sm-field">
            <label>Expired since (days)</label>
            <div class="days-range">
              <asp:TextBox ID="TextBoxDays"    runat="server" Text="14" />
              <span>to</span>
              <asp:TextBox ID="TextBoxDaysMax" runat="server" Text="" placeholder="max"
                ToolTip="Leave empty for no upper limit" />
            </div>
          </div>

          <div class="sm-field">
            <label>Sort order</label>
            <asp:DropDownList ID="DropDownSort" runat="server">
              <asp:ListItem Text="Most expired first (DESC)" Value="DESC" Selected="True" />
              <asp:ListItem Text="Least expired first (ASC)" Value="ASC" />
            </asp:DropDownList>
          </div>

          <div class="sm-field">
            <label>Name</label>
            <asp:TextBox ID="TextBoxName" runat="server" />
          </div>

          <div class="sm-field">
            <label>Mobile</label>
            <asp:TextBox ID="TextBoxMobile" runat="server" />
          </div>

          <div class="sm-field">
            <label>Gender</label>
            <div class="gender-group">
              <asp:RadioButtonList ID="RadioButtonListGender" runat="server"
                RepeatDirection="Horizontal" CssClass="gender-group">
                <asp:ListItem Text="All"    Value="-1" Selected="True" />
                <asp:ListItem Text="Male"   Value="0" />
                <asp:ListItem Text="Female" Value="1" />
              </asp:RadioButtonList>
            </div>
          </div>

          <div class="sm-field">
            <label>&nbsp;</label>
            <div class="sm-check-row">
              <asp:CheckBox ID="CheckBoxShowContacted" runat="server" />
              <span>Show already contacted</span>
            </div>
          </div>

        </div>

        <div class="sm-actions">
          <asp:Button ID="ButtonSearch"    runat="server" Text="Search"     CssClass="btn-primary"   OnClick="ButtonSearch_Click" />
          <asp:Button ID="ButtonReset"     runat="server" Text="Reset"      CssClass="btn-secondary" OnClick="ButtonReset_Click" />
          <asp:Button ID="ButtonExportCSV" runat="server" Text="Export CSV" CssClass="btn-export"    OnClick="ButtonExportCSV_Click" />
        </div>
      </div>

      <asp:Panel ID="PanelStats" runat="server" Visible="false">
        <div class="sm-stats">
          <div class="stat-box">
            <div class="stat-number"><asp:Label ID="LabelTotalCount"    runat="server" Text="0" /></div>
            <div class="stat-label">Total Expired</div>
          </div>
          <div class="stat-box">
            <div class="stat-number amber"><asp:Label ID="LabelContactedCount" runat="server" Text="0" /></div>
            <div class="stat-label">Contacted</div>
          </div>
          <div class="stat-box">
            <div class="stat-number blue"><asp:Label ID="LabelAvgAbsent" runat="server" Text="0" /></div>
            <div class="stat-label">Avg Days Since Expiry</div>
          </div>
        </div>
        <div class="sm-legend">
          <span><span class="legend-dot" style="background:#fff8e1;border:1px solid #ccc;"></span>30&ndash;59 days</span>
          <span><span class="legend-dot" style="background:#ffe5e5;border:1px solid #ccc;"></span>60+ days</span>
        </div>
      </asp:Panel>

      <asp:Label ID="LabelError" runat="server" CssClass="sm-error" />

      <div class="sm-grid-wrap">
        <asp:GridView ID="GridView1" runat="server"
            BorderStyle="None" GridLines="None" Width="100%"
            AutoGenerateColumns="False" AllowPaging="True" PageSize="30"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowDataBound="GridView1_RowDataBound"
            OnRowCommand="GridView1_RowCommand">
          <Columns>
            <asp:BoundField DataField="TraineeID"       HeaderText="ID"           ItemStyle-Width="50px" />
            <asp:BoundField DataField="Name"            HeaderText="Name"         ItemStyle-Width="180px" />
            <asp:BoundField DataField="Mobile"          HeaderText="Mobile"       ItemStyle-Width="130px" />
            <asp:BoundField DataField="Package"         HeaderText="Package"      ItemStyle-Width="140px" />
            <asp:BoundField DataField="EndDate"         HeaderText="Expiry Date"
                DataFormatString="{0:yyyy-MM-dd}"       ItemStyle-Width="120px" />
            <asp:BoundField DataField="DaysSinceExpiry" HeaderText="Days Expired" ItemStyle-Width="100px" />
            <asp:TemplateField HeaderText="Actions">
              <ItemTemplate>
                <asp:LinkButton ID="BtnMarkContacted" runat="server"
                    CommandName="MarkContacted"
                    CommandArgument='<%# Eval("TraineeID") %>'
                    OnClientClick="return confirm('Mark this trainee as contacted?');"
                    CssClass="btn-done">
                    &#10003; Contacted
                </asp:LinkButton>
                &nbsp;
                <button type="button" class="btn-card"
                    onclick='openCardModalWithData("<%# HttpUtility.JavaScriptStringEncode(Eval("Name").ToString()) %>","<%# HttpUtility.JavaScriptStringEncode(Eval("EndDate").ToString()) %>")'>
                    &#127924; Card
                </button>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ContactedLabel" HeaderText="Status" ItemStyle-Width="70px" />
          </Columns>
          <PagerSettings FirstPageText="&laquo; First" LastPageText="Last &raquo;"
              NextPageText="Next &rsaquo;" PreviousPageText="&lsaquo; Prev"
              Mode="NextPreviousFirstLast" />
          <RowStyle BackColor="#ffffff" />
          <AlternatingRowStyle BackColor="#fafafa" />
          <HeaderStyle BackColor="#2b2b2b" ForeColor="White" Font-Bold="True" />
          <PagerStyle BackColor="#f5f5f5" ForeColor="#555" HorizontalAlign="Left" />
          <EmptyDataTemplate>
            <div class="sm-empty">No expired subscriptions found matching the selected filters.</div>
          </EmptyDataTemplate>
        </asp:GridView>
      </div>

    </div>
    </asp:Panel>

    <script type="text/javascript">
    // ── State ────────────────────────────────────────────────────────────────
    var _offerCount = 3;
    var _gender     = 0;
    var LS_KEY      = 'gymCardSettings_v2';

    var AR = {
        expiresOn : '\u064a\u0646\u062a\u0647\u064a: ',
        forClient : '\u0644\u0644\u0639\u0645\u064a\u0644: {NAME} :Client'
    };

    // ── Build offer controls (FIX #2 + #3) ──────────────────────────────────
    function buildControls() {
        var html = '';
        var cols = _offerCount <= 2 ? _offerCount : (_offerCount === 4 ? 4 : 3);
        document.getElementById('cmControls').style.gridTemplateColumns =
            'repeat(' + cols + ', 1fr)';

        for (var i = 1; i <= _offerCount; i++) {
            // Restore saved values if any
            var cd = getSaved('cd' + i) || '';
            var co = getSaved('co' + i) || '';
            var cn = getSaved('cn' + i) || '';
            var cf = getSaved('cf' + i) || '';   // FIX #3: features field

            html += '<div class="cm-ctrl-group" id="offerGroup' + i + '">'
                  + '<div class="cm-ctrl-group-title">OFFER ' + i + '</div>'
                  + '<label>Duration</label>'
                  + '<input type="text" id="cd' + i + '" value="' + esc(cd) + '" oninput="refreshCard()">'
                  + '<label>Old Price (leave empty to hide)</label>'
                  + '<input type="text" id="co' + i + '" value="' + esc(co) + '" oninput="refreshCard()">'
                  + '<label>New Price</label>'
                  + '<input type="text" id="cn' + i + '" value="' + esc(cn) + '" oninput="refreshCard()">'
                  + '<label>Features (e.g. 1 Freeze, 2 Invitations) &mdash; leave empty to hide</label>'
                  + '<input type="text" id="cf' + i + '" value="' + esc(cf) + '" placeholder="optional" oninput="refreshCard()">'
                  + '</div>';
        }
        document.getElementById('cmControls').innerHTML = html;
        refreshCard();
    }

    function esc(s) {
        if (!s) return '';
        return s.replace(/&/g,'&amp;').replace(/"/g,'&quot;');
    }

    function setOfferCount(n) {
        _offerCount = n;
        for (var i = 1; i <= 4; i++) {
            var b = document.getElementById('ocBtn' + i);
            if (b) b.className = (i === n) ? 'active' : '';
        }
        buildControls();
    }

    // ── Refresh card preview ─────────────────────────────────────────────────
    function v(id) {
        var el = document.getElementById(id);
        return el ? el.value : '';
    }

    function refreshCard() {
        document.getElementById('gcLogo').textContent  = v('cmGymName') || 'MY GYM';
        document.getElementById('gcTitle').textContent = v('cmTitle');

        // Badge hidden in new design
        document.getElementById('gcBadge') && (document.getElementById('gcBadge').style.display = 'none');

        var exp = v('cmExpiry');
        document.getElementById('gcExpiry').textContent = exp ? AR.expiresOn + exp : '';
        var cli = v('cmClient');
        document.getElementById('gcClient').textContent = cli ? AR.forClient.replace('{NAME}', cli) : '';

        // Build pills
        var bottom = document.getElementById('gcBottom');
        var html   = '';
        for (var i = 1; i <= _offerCount; i++) {
            var dur  = v('cd' + i);
            var old  = v('co' + i);
            var np   = v('cn' + i);
            var feat = v('cf' + i);   // FIX #3

            var oldHtml  = old  ? '<div class="gc-pill-old">'  + old  + '</div>' : '';
            var featHtml = feat ? '<div class="gc-pill-feat">'  + feat + '</div>' : '';

            html += '<div class="gc-pill">'
                  + '<div class="gc-pill-dur">'  + (dur  || '') + '</div>'
                  + oldHtml
                  + '<div class="gc-pill-new">'  + (np   || '') + '</div>'
                  + featHtml
                  + '</div>';
        }
        bottom.innerHTML = html;
    }

    // ── Gender ───────────────────────────────────────────────────────────────
    function setGender(val) {
        _gender = val;
        var btnM = document.getElementById('btnMale');
        var btnF = document.getElementById('btnFemale');
        if (val === 1) {
            btnF.style.cssText = 'flex:1;padding:6px;border-radius:5px;font-weight:700;font-size:13px;cursor:pointer;border:2px solid #c2185b;background:#c2185b;color:#fff;';
            btnM.style.cssText = 'flex:1;padding:6px;border-radius:5px;font-weight:700;font-size:13px;cursor:pointer;border:2px solid #ccc;background:#fff;color:#888;';
            var bgEl = document.getElementById('gcBgEl');
            if (bgEl) bgEl.style.backgroundImage = "url('images/GirlFit.jpg')";
        } else {
            btnM.style.cssText = 'flex:1;padding:6px;border-radius:5px;font-weight:700;font-size:13px;cursor:pointer;border:2px solid #1565c0;background:#1565c0;color:#fff;';
            btnF.style.cssText = 'flex:1;padding:6px;border-radius:5px;font-weight:700;font-size:13px;cursor:pointer;border:2px solid #ccc;background:#fff;color:#888;';
            var bgEl = document.getElementById('gcBgEl');
            if (bgEl) bgEl.style.backgroundImage = "url('images/Chris.jpg')";
        }
        refreshCard();
    }

    // ── Modal open / close ───────────────────────────────────────────────────
    function openCardModalWithData(clientName, expiryDate) {
        loadSettings();
        document.getElementById('cmClient').value = clientName || '';
        if (!document.getElementById('cmTitle').value)
            document.getElementById('cmTitle').value = 'Old Clients Offers';
        // Auto-fill expiry if passed
        if (expiryDate) {
            var d = new Date(expiryDate);
            if (!isNaN(d.getTime())) {
                var formatted = d.getFullYear() + '-'
                    + String(d.getMonth()+1).padStart(2,'0') + '-'
                    + String(d.getDate()).padStart(2,'0');
                document.getElementById('cmExpiry').value = formatted;
            }
        }
        document.getElementById('cardModal').classList.add('open');
        setGender(0);
        buildControls();
    }
    function openCardModal(n) { openCardModalWithData(n, ''); }

    function closeCardModal() {
        document.getElementById('cardModal').classList.remove('open');
    }
    document.getElementById('cardModal').addEventListener('click', function(e) {
        if (e.target === this) closeCardModal();
    });

    // ── localStorage ─────────────────────────────────────────────────────────
    function getSaved(id) {
        try {
            var raw = localStorage.getItem(LS_KEY);
            if (!raw) return '';
            var data = JSON.parse(raw);
            return data[id] || '';
        } catch(e) { return ''; }
    }

    function saveSettings() {
        var data = {};
        var fields = ['cmGymName','cmTitle','cmBadge','cmExpiry',
                      'cd1','co1','cn1','cf1',
                      'cd2','co2','cn2','cf2',
                      'cd3','co3','cn3','cf3',
                      'cd4','co4','cn4','cf4'];
        fields.forEach(function(id) {
            var el = document.getElementById(id);
            if (el) data[id] = el.value;
        });
        data['_offerCount'] = _offerCount;
        try { localStorage.setItem(LS_KEY, JSON.stringify(data)); } catch(e) {}
    }

    function loadSettings() {
        try {
            var raw = localStorage.getItem(LS_KEY);
            if (!raw) { buildControls(); return; }
            var data = JSON.parse(raw);
            // Restore offer count
            if (data['_offerCount']) setOfferCount(parseInt(data['_offerCount']));
            else buildControls();
            // Restore top fields
            ['cmGymName','cmTitle','cmBadge','cmExpiry'].forEach(function(id) {
                var el = document.getElementById(id);
                if (el && data[id] !== undefined) el.value = data[id];
            });
            refreshCard();
        } catch(e) { buildControls(); }
    }

    // ── Download card ────────────────────────────────────────────────────────
    function downloadCard() {
        var btn = document.querySelector('.btn-dl-card');
        btn.disabled = true;
        btn.textContent = 'Generating...';
        var card = document.getElementById('gymCard');
        html2canvas(card, { scale:3, backgroundColor:'#d4a800', logging:false,
            useCORS:false, allowTaint:true }).then(function(canvas) {
            var clientName = v('cmClient') || 'card';
            var win = window.open('', '_blank');
            if (win) {
                win.document.title = 'gym-offer-' + clientName;
                win.document.body.style.cssText = 'margin:0;background:#111;display:flex;align-items:center;justify-content:center;min-height:100vh;flex-direction:column;';
                var img = win.document.createElement('img');
                img.src = canvas.toDataURL('image/png');
                img.style.cssText = 'max-width:100%;display:block;';
                win.document.body.appendChild(img);
                var hint = win.document.createElement('p');
                hint.style.cssText = 'color:#aaa;font-family:Arial;font-size:13px;text-align:center;margin-top:10px;';
                hint.textContent = 'Right-click the image and choose "Save image as..." to download';
                win.document.body.appendChild(hint);
            } else { alert('Please allow popups for this site.'); }
        }).catch(function(err) {
            alert('Error: ' + err.message);
        }).finally(function() {
            btn.disabled = false;
            btn.textContent = '\uD83D\uDCE5 Open Card (Save Image)';
        });
    }
    </script>

</asp:Content>
