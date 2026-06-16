<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="_Default, App_Web_xfweqsz4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<meta charset="utf-8" />
<style>
/* ============================================================
   GYM DARK DESIGN SYSTEM - Attend.aspx
   All text symbols use HTML entities only (no raw Unicode)
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&family=Cairo:wght@400;500;600;700&display=swap');

:root {
  --bg:          #0f0f17;
  --surface:     #181824;
  --surface-2:   #1e1e2e;
  --border:      rgba(255,255,255,0.08);
  --border-hov:  rgba(255,255,255,0.15);
  --primary:     #d4a853;
  --primary-fg:  #1a1000;
  --primary-dim: rgba(212,168,83,0.12);
  --muted:       rgba(255,255,255,0.45);
  --fg:          rgba(255,255,255,0.92);
  --fg-light:    rgba(255,255,255,0.72);
  --destructive: #e05c5c;
  --chart-2:     #6b9bdf;
  --radius:      10px;
  --radius-sm:   6px;
  --shadow:      0 4px 24px rgba(0,0,0,0.45);
  --font:        'DM Sans','Segoe UI',system-ui,sans-serif;
  --mono:        'JetBrains Mono','Courier New',monospace;
  --font-ar:     'Cairo','Segoe UI',Tahoma,sans-serif;
}

#gymAttendPage, #gymAttendPage * { box-sizing: border-box; font-family: var(--font); }

#gymAttendPage {
  background: var(--bg);
  min-height: 100vh;
  padding: 28px 20px 48px;
  color: var(--fg);
}

/* ── Layout ── */
.gym-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  max-width: 1200px;
  margin: 0 auto;
}
.gym-col-left, .gym-col-right { display: flex; flex-direction: column; gap: 20px; }
@media (max-width: 900px) { .gym-grid { grid-template-columns: 1fr; } }

/* ── Card ── */
.gym-card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 14px;
  overflow: hidden;
  box-shadow: var(--shadow);
}
.gym-card-header {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 16px 20px;
  border-bottom: 1px solid var(--border);
}
.gym-card-icon {
  width: 28px; height: 28px;
  display: flex; align-items: center; justify-content: center;
  background: var(--primary-dim);
  border-radius: var(--radius-sm);
  color: var(--primary);
  flex-shrink: 0;
}
.gym-card-icon svg {
  width: 15px; height: 15px;
  stroke: currentColor; fill: none;
  stroke-width: 2; stroke-linecap: round; stroke-linejoin: round;
}
.gym-card-title {
  font-size: 11px; font-weight: 700;
  letter-spacing: .12em; text-transform: uppercase;
  color: var(--primary); margin: 0;
}
.gym-card-body { padding: 20px; }

/* ── Form ── */
.gym-form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
.gym-field { display: flex; flex-direction: column; gap: 5px; }
.gym-field-full { grid-column: 1 / -1; }
.gym-label {
  font-size: 11px; font-weight: 600;
  letter-spacing: .05em; text-transform: uppercase;
  color: var(--muted);
}

/* ── Inputs - ALL RTL ── */
.gym-input,
.gym-select,
.gym-textarea,
input[type="text"].gym-input,
select.gym-select,
textarea.gym-textarea {
  width: 100%;
  background: rgba(255,255,255,0.04);
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  color: var(--fg);
  font-family: var(--font-ar);
  font-size: 13px;
  padding: 0 10px;
  direction: rtl;
  text-align: right;
  transition: border-color .2s, box-shadow .2s;
  outline: none;
  -webkit-appearance: none;
}
.gym-input, .gym-select { height: 36px; }
.gym-input:focus, .gym-select:focus, .gym-textarea:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 3px rgba(212,168,83,.18);
}
.gym-input::placeholder, .gym-textarea::placeholder { color: var(--muted); }
.gym-select option { background: #1e1e2e; direction: rtl; }
.gym-textarea {
  min-height: 76px; height: auto;
  padding: 8px 10px; resize: vertical;
}

/* ── Select wrapper arrow ── */
.gym-select-wrap { position: relative; }
.gym-select-wrap::after {
  content: "";
  position: absolute; right: 10px; top: 50%;
  transform: translateY(-50%);
  width: 0; height: 0;
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 5px solid var(--muted);
  pointer-events: none;
}

/* ── Checkbox rows ── */
.gym-check-row {
  display: flex; align-items: center; gap: 8px;
  padding: 10px 12px;
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  background: rgba(255,255,255,0.03);
  cursor: pointer;
  transition: border-color .2s;
}
.gym-check-row:hover { border-color: var(--primary); }
.gym-check-row input[type=checkbox] { accent-color: var(--primary); width: 15px; height: 15px; }
.gym-check-row .gym-check-label { font-size: 12px; font-weight: 500; color: var(--fg); }

.gym-services-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 8px; margin-top: 4px; }

/* ── Button ── */
.gym-btn-row { display: flex; justify-content: center; margin-top: 20px; }
.gym-btn,
input[type=submit].gym-btn,
input[type=button].gym-btn {
  display: inline-flex; align-items: center; gap: 8px;
  height: 38px; padding: 0 28px;
  background: var(--primary); color: var(--primary-fg);
  font-family: var(--font); font-size: 12px; font-weight: 700;
  letter-spacing: .08em; text-transform: uppercase;
  border: none; border-radius: var(--radius-sm);
  cursor: pointer; transition: opacity .2s, transform .1s;
}
.gym-btn:hover { opacity: .88; }
.gym-btn:active { transform: translateY(1px); }
.gym-btn:disabled { opacity: .4; cursor: not-allowed; }

/* ── Info / Stats ── */
.gym-stat-grid {
  display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px;
}
@media (min-width: 600px) { .gym-stat-grid { grid-template-columns: repeat(4, 1fr); } }

.gym-stat-box {
  background: var(--surface-2); border: 1px solid var(--border);
  border-radius: var(--radius-sm); padding: 14px; text-align: center;
}
.gym-stat-val  { font-size: 22px; font-weight: 700; color: var(--primary); display: block; }
.gym-stat-label { font-size: 10px; text-transform: uppercase; letter-spacing: .08em; color: var(--muted); display: block; margin-top: 3px; }

.gym-date-row { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-top: 10px; }
.gym-date-box {
  background: var(--surface-2); border: 1px solid var(--border);
  border-radius: var(--radius-sm); padding: 10px 12px;
}
.gym-date-key { font-size: 10px; text-transform: uppercase; letter-spacing: .06em; color: var(--muted); display: block; }
.gym-date-val { font-family: var(--mono); font-size: 12px; color: var(--fg); display: block; margin-top: 3px; }

.gym-info-divider { height: 1px; background: var(--border); margin: 16px 0; }
.gym-info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; }
.gym-info-item { display: flex; flex-direction: column; gap: 2px; }
.gym-info-key  { font-size: 11px; color: var(--muted); text-transform: uppercase; letter-spacing: .05em; }
.gym-info-val  { font-size: 14px; font-weight: 600; color: var(--fg); }

/* ── Badge ── */
.gym-badge {
  display: inline-flex; align-items: center;
  height: 22px; padding: 0 10px; border-radius: 20px;
  font-size: 11px; font-weight: 600; letter-spacing: .04em;
}
.gym-badge-primary { background: var(--primary-dim); color: var(--primary); border: 1px solid rgba(212,168,83,.3); }
.gym-badge-blue    { background: rgba(107,155,223,.12); color: var(--chart-2); border: 1px solid rgba(107,155,223,.25); }
.gym-badge-row     { display: flex; flex-wrap: wrap; gap: 6px; margin-bottom: 16px; }

/* ── Notes alert - LIGHT TEXT ── */
.gym-notes-alert {
  background: rgba(224,92,92,.08);
  border: 1px solid rgba(224,92,92,.2);
  border-radius: var(--radius-sm);
  padding: 8px 12px;
  font-size: 13px;
  color: var(--fg-light);
  font-weight: 400;
  font-family: var(--font-ar);
  direction: rtl;
  text-align: right;
  white-space: pre-wrap;
  line-height: 1.8;
  margin-bottom: 14px;
}
.gym-notes-alert:empty { display: none; }

/* ── Trainee photo ── */
.gym-trainee-img {
  width: 100%; max-width: 280px;
  border-radius: 12px;
  border: 2px solid rgba(212,168,83,.35);
  box-shadow: var(--shadow);
  display: block; margin: 0 auto 18px;
}

/* ── Error ── */
.gym-error { font-size: 12px; color: var(--destructive); font-weight: 600; min-height: 18px; display: block; margin-top: 8px; }

/* ── Remaining Days Card ── */
.gym-remaining-card {
  position: relative;
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
  border-radius: 12px;
  padding: 12px 16px;
  border-right: 4px solid #22c55e;
  font-family: var(--font-ar);
  direction: rtl;
  text-align: right;
  font-size: 13px;
  transition: opacity .3s;
  margin-bottom: 16px;
}
.gym-remaining-card .rm-date-lbl { font-size: 11px; color: #aaa; }
.gym-remaining-card .rm-date-val { font-size: 14px; font-weight: 700; direction: ltr; text-align: left; color: #fff; font-family: var(--mono); }
.gym-remaining-card .rm-status   { font-size: 15px; font-weight: 700; text-align: center; margin-top: 8px; padding-top: 8px; border-top: 1px solid rgba(255,255,255,0.1); }
.gym-remaining-card .rm-row      { display: flex; align-items: center; gap: 10px; }
.gym-remaining-card .rm-icon     { font-size: 22px; }
.gym-remaining-card .rm-info     { flex: 1; }
.gym-remaining-close {
  position: absolute; top: -10px; left: -10px;
  background: #333; color: white; border: none; border-radius: 50%;
  width: 24px; height: 24px; cursor: pointer; font-size: 12px;
  display: flex; align-items: center; justify-content: center;
  transition: background .2s;
}
.gym-remaining-close:hover { background: #dc2626; }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<div id="gymAttendPage">
  <div class="gym-grid">

    <!-- ══ LEFT COLUMN ══ -->
    <div class="gym-col-left">

      <!-- SEARCH CARD -->
      <div class="gym-card">
        <div class="gym-card-header">
          <div class="gym-card-icon">
            <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          </div>
          <h2 class="gym-card-title">Trainee Search</h2>
        </div>
        <div class="gym-card-body">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />

          <div class="gym-form-grid">
            <div class="gym-field">
              <label class="gym-label">ID</label>
              <asp:TextBox ID="TextBoxID" runat="server" CssClass="gym-input"></asp:TextBox>
            </div>
            <div class="gym-field" style="justify-content:flex-end;">
              <label class="gym-label">&nbsp;</label>
              <div class="gym-check-row">
                <asp:CheckBox ID="CheckBoxFemale" runat="server" OnCheckedChanged="CheckBoxFemale_CheckedChanged" />
                <span class="gym-check-label">Female</span>
              </div>
            </div>
            <div class="gym-field">
              <label class="gym-label">Name</label>
              <asp:TextBox ID="TextBoxName" runat="server" CssClass="gym-input"></asp:TextBox>
            </div>
            <div class="gym-field">
              <label class="gym-label">Mobile</label>
              <asp:TextBox ID="TextBoxMobile" runat="server" CssClass="gym-input"></asp:TextBox>
            </div>
          </div>

          <div class="gym-btn-row">
            <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click"
              Text="Search" CssClass="gym-btn" />
          </div>
        </div>
      </div>

      <!-- ATTEND CARD -->
      <div class="gym-card">
        <div class="gym-card-header">
          <div class="gym-card-icon">
            <svg viewBox="0 0 24 24"><polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
          </div>
          <h2 class="gym-card-title">Trainee Attend</h2>
        </div>
        <div class="gym-card-body">
          <div class="gym-form-grid">

            <div class="gym-field gym-field-full">
              <label class="gym-label">Trainee</label>
              <div class="gym-select-wrap">
                <asp:DropDownList ID="DropDownListTrainee" runat="server"
                  AppendDataBoundItems="True" AutoPostBack="True"
                  OnSelectedIndexChanged="DropDownListTrainee_SelectedIndexChanged"
                  CssClass="gym-select">
                  <asp:ListItem Value="0">-- Choose Trainee --</asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>

            <div class="gym-field gym-field-full">
              <label class="gym-label">Services</label>
              <div class="gym-services-grid">
                <div class="gym-check-row">
                  <asp:CheckBox ID="CheckBoxNormal" runat="server" Checked="true" />
                  <span class="gym-check-label">Normal</span>
                </div>
                <div class="gym-check-row">
                  <asp:CheckBox ID="CheckBoxSauna" runat="server" />
                  <span class="gym-check-label">Sauna</span>
                </div>
                <div class="gym-check-row">
                  <asp:CheckBox ID="CheckBoxJacuzzi" runat="server" />
                  <span class="gym-check-label">Jacuzzi</span>
                </div>
                <div class="gym-check-row">
                  <asp:CheckBox ID="CheckBoxSpa" runat="server" />
                  <span class="gym-check-label">Spa</span>
                </div>
              </div>
            </div>

            <div class="gym-field">
              <label class="gym-label">Invitation / Guest</label>
              <div class="gym-check-row" style="margin-bottom:6px;">
                <asp:CheckBox ID="CheckBoxInvitation" runat="server" />
                <span class="gym-check-label">Guest Visit</span>
              </div>
              <ajaxToolkit:ComboBox ID="ComboBoxGuest" runat="server"
                CssClass="gym-input" placeholder="Guest name" />
            </div>

            <div class="gym-field">
              <label class="gym-label">Date</label>
              <asp:TextBox ID="TextBoxDate" runat="server" CssClass="gym-input"></asp:TextBox>
              <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                Format="yyyy-MM-dd" TargetControlID="TextBoxDate">
              </ajaxToolkit:CalendarExtender>
            </div>

            <div class="gym-field gym-field-full">
              <label class="gym-label">Note</label>
              <asp:TextBox ID="TextBoxNotes" runat="server"
                TextMode="MultiLine" CssClass="gym-textarea"></asp:TextBox>
            </div>

          </div>

          <div class="gym-btn-row">
            <asp:Button ID="Button1" runat="server" Text="Attend" Enabled="False"
              OnClientClick="return confirm('Are you sure you want to Attend This Trainee ?')"
              OnClick="Button1_Click" CssClass="gym-btn" />
          </div>
          <asp:Label ID="LabelError" runat="server" CssClass="gym-error"></asp:Label>
        </div>
      </div>

    </div>
    <!-- /LEFT -->

    <!-- ══ RIGHT COLUMN ══ -->
    <div class="gym-col-right">
      <div class="gym-card">
        <div class="gym-card-header">
          <div class="gym-card-icon">
            <svg viewBox="0 0 24 24"><rect x="2" y="5" width="20" height="14" rx="2"/><line x1="2" y1="10" x2="22" y2="10"/></svg>
          </div>
          <h2 class="gym-card-title">Trainee Info</h2>
        </div>
        <div class="gym-card-body" id="gymInfoBody">

          <!-- Remaining Days injected here by JS -->
          <div id="gymRemainingSlot"></div>

          <!-- Photo -->
          <asp:Image ID="Image1" runat="server"
            ImageUrl="~/traineeImg/Tulips.jpg" Visible="false"
            CssClass="gym-trainee-img" />

          <!-- Notes (auto-formatted by JS) -->
          <asp:Label ID="LabelNotes" runat="server" CssClass="gym-notes-alert"></asp:Label>

          <!-- Badges -->
          <div class="gym-badge-row">
            <span class="gym-badge gym-badge-primary">Active</span>
            <span class="gym-badge gym-badge-blue">
              <asp:Label ID="LabelPrice" runat="server"></asp:Label>
            </span>
          </div>

          <!-- Info grid -->
          <div class="gym-info-grid">
            <div class="gym-info-item">
              <span class="gym-info-key">Normal</span>
              <span class="gym-info-val"><asp:Label ID="LabelNormal" runat="server">&mdash;</asp:Label></span>
            </div>
            <div class="gym-info-item">
              <span class="gym-info-key">Invitation</span>
              <span class="gym-info-val"><asp:Label ID="LabelInv" runat="server">&mdash;</asp:Label></span>
            </div>
            <div class="gym-info-item">
              <span class="gym-info-key">Max Attend</span>
              <span class="gym-info-val"><asp:Label ID="Labelmax" runat="server">&mdash;</asp:Label></span>
            </div>
            <div class="gym-info-item">
              <span class="gym-info-key">Plan</span>
              <span class="gym-info-val"><asp:Label ID="LabelAddress0" runat="server" Text="Date :" Font-Bold="True"></asp:Label></span>
            </div>
          </div>

          <div class="gym-info-divider"></div>

          <!-- Stat boxes -->
          <div class="gym-stat-grid">
            <div class="gym-stat-box">
              <span class="gym-stat-val"><asp:Label ID="LabelNormal2" runat="server" Text="&mdash;"></asp:Label></span>
              <span class="gym-stat-label">Normal</span>
            </div>
            <div class="gym-stat-box">
              <span class="gym-stat-val" style="color:var(--chart-2)">
                <asp:Label ID="LabelInv2" runat="server" Text="&mdash;"></asp:Label>
              </span>
              <span class="gym-stat-label">Invitation</span>
            </div>
            <div class="gym-stat-box">
              <span class="gym-stat-val"><asp:Label ID="Labelmax2" runat="server" Text="&mdash;"></asp:Label></span>
              <span class="gym-stat-label">Max Attend</span>
            </div>
            <div class="gym-stat-box">
              <span class="gym-stat-val" style="font-size:14px;">&mdash;</span>
              <span class="gym-stat-label">Plan</span>
            </div>
          </div>

          <!-- Date boxes -->
          <div class="gym-date-row">
            <div class="gym-date-box">
              <span class="gym-date-key">Start Date</span>
              <span class="gym-date-val"><asp:Label ID="LabelDate" runat="server" Text="&mdash;"></asp:Label></span>
            </div>
            <div class="gym-date-box">
              <span class="gym-date-key">End Date</span>
              <span class="gym-date-val"><asp:Label ID="LabelEnd" runat="server" Text="&mdash;"></asp:Label></span>
            </div>
          </div>

        </div>
      </div>
    </div>
    <!-- /RIGHT -->

  </div>
</div>

<script type="text/javascript">
(function () {
    'use strict';

    /* =====================================================
       1. NOTES FORMATTER  (auto, no shortcut needed)
       Targets: LabelNotes
       ===================================================== */
    function formatNotes() {
        var ids = [
            'ctl00_ContentPlaceHolder1_LabelNotes',
            'ctl00_ContentPlaceHolder1_LabelnotesData'
        ];
        ids.forEach(function (id) {
            var el = document.getElementById(id);
            if (!el || !el.innerHTML.trim()) return;

            // Insert <br> before each note line starting with **
            var html = el.innerHTML;
            html = html.replace(/\s(\*\*\s\d{4}-\d{2}-\d{2})/g, '<br>$1');
            html = html.replace(/\s(Freez\sfrom)/g, '<br>$1');
            el.innerHTML = html;

            el.style.setProperty('direction',     'rtl',          'important');
            el.style.setProperty('text-align',    'right',        'important');
            el.style.setProperty('white-space',   'pre-wrap',     'important');
            el.style.setProperty('display',       'block',        'important');
            el.style.setProperty('font-family',   'Cairo, Segoe UI, Tahoma, sans-serif', 'important');
            el.style.setProperty('color',         'rgba(255,255,255,0.72)', 'important');
            el.style.setProperty('line-height',   '1.8',          'important');
            el.style.setProperty('font-size',     '13px',         'important');
            el.style.setProperty('font-weight',   '400',          'important');
        });
    }

    /* =====================================================
       2. REMAINING DAYS CARD
       All Arabic text stored as escape sequences to avoid
       any encoding issues in the ASPX file.
       ===================================================== */

    // Arabic strings as Unicode escapes:
    // "\u062A\u0627\u0631\u064A\u062E \u0627\u0644\u0627\u0646\u062A\u0647\u0627\u0621" = "تاريخ الانتهاء"
    // "\u063A\u064A\u0631 \u0645\u0639\u0631\u0648\u0641"                               = "غير معروف"
    // "\u0645\u0646\u062A\u0647\u064A \u0645\u0646\u0630 {n} \u064A\u0648\u0645"        = "منتهي منذ n يوم"
    // "\u064A\u0646\u062A\u0647\u064A \u0627\u0644\u064A\u0648\u0645\u0021"             = "ينتهي اليوم!"
    // "\u064A\u062A\u0628\u0642\u0649 \u064A\u0648\u0645 \u0648\u0627\u062D\u062F"      = "يتبقى يوم واحد"
    // "\u064A\u062A\u0628\u0642\u0649 {n} \u0623\u064A\u0627\u0645"                     = "يتبقى n أيام"
    // "\u064A\u062A\u0628\u0642\u0649 {n} \u064A\u0648\u0645"                           = "يتبقى n يوم"

    function parseDate(str) {
        if (!str) return null;
        // format: DD/MM/YYYY or YYYY-MM-DD
        var m = str.match(/(\d{1,2})\/(\d{1,2})\/(\d{4})/);
        if (m) return new Date(+m[3], +m[2] - 1, +m[1]);
        m = str.match(/(\d{4})-(\d{2})-(\d{2})/);
        if (m) return new Date(+m[1], +m[2] - 1, +m[3]);
        return null;
    }

    function getDiff(endDate) {
        var today = new Date(); today.setHours(0,0,0,0);
        var end   = new Date(endDate); end.setHours(0,0,0,0);
        return Math.ceil((end - today) / 86400000);
    }

    function statusColor(d) {
        if (d < 0)  return '#dc2626';
        if (d === 0) return '#f97316';
        if (d <= 7)  return '#f59e0b';
        if (d <= 30) return '#eab308';
        return '#22c55e';
    }

    function statusText(d) {
        if (d < 0)  return '\u26A0\uFE0F \u0645\u0646\u062A\u0647\u064A \u0645\u0646\u0630 ' + Math.abs(d) + ' \u064A\u0648\u0645';
        if (d === 0) return '\u26A0\uFE0F \u064A\u0646\u062A\u0647\u064A \u0627\u0644\u064A\u0648\u0645\u0021';
        if (d === 1) return '\u26A0\uFE0F \u064A\u062A\u0628\u0642\u0649 \u064A\u0648\u0645 \u0648\u0627\u062D\u062F';
        if (d <= 10) return '\u26A0\uFE0F \u064A\u062A\u0628\u0642\u0649 ' + d + ' \u0623\u064A\u0627\u0645';
        return '\u2705 \u064A\u062A\u0628\u0642\u0649 ' + d + ' \u064A\u0648\u0645';
    }

    function buildRemainingCard(days, endStr) {
        var color      = statusColor(days);
        var dateDisplay = endStr ? endStr.split(' ')[0] : '\u063A\u064A\u0631 \u0645\u0639\u0631\u0648\u0641';

        var card = document.createElement('div');
        card.className = 'gym-remaining-card';
        card.style.borderRightColor = color;

        // close button
        var closeBtn = document.createElement('button');
        closeBtn.className = 'gym-remaining-close';
        closeBtn.textContent = '\u00D7';   // ×  (safe ASCII entity value)
        closeBtn.title = 'Close';
        closeBtn.onclick = function (e) { e.preventDefault(); card.style.display = 'none'; };
        card.appendChild(closeBtn);

        // row
        var row = document.createElement('div');
        row.className = 'rm-row';

        var icon = document.createElement('span');
        icon.className = 'rm-icon';
        icon.textContent = '\uD83D\uDCC5';  // 📅

        var info = document.createElement('div');
        info.className = 'rm-info';

        var lbl = document.createElement('div');
        lbl.className = 'rm-date-lbl';
        lbl.textContent = '\uD83D\uDCC6 \u062A\u0627\u0631\u064A\u062E \u0627\u0644\u0627\u0646\u062A\u0647\u0627\u0621';

        var val = document.createElement('div');
        val.className = 'rm-date-val';
        val.textContent = dateDisplay;

        info.appendChild(lbl);
        info.appendChild(val);
        row.appendChild(icon);
        row.appendChild(info);
        card.appendChild(row);

        // status
        var status = document.createElement('div');
        status.className = 'rm-status';
        status.style.color = color;
        status.textContent = days !== null ? statusText(days) : '\u274C \u062E\u0637\u0623 \u0641\u064A \u0642\u0631\u0627\u0621\u0629 \u0627\u0644\u062A\u0627\u0631\u064A\u062E';
        card.appendChild(status);

        return card;
    }

    function injectRemaining() {
        var slot = document.getElementById('gymRemainingSlot');
        if (!slot) return;

        var labelEnd = document.querySelector('[id$="LabelEnd"]');
        if (!labelEnd) return;

        var endStr = (labelEnd.innerText || labelEnd.textContent || '').trim();
        if (!endStr || endStr === '\u2014' || endStr === '-' || endStr === '') return;

        var endDate = parseDate(endStr);
        var days    = endDate ? getDiff(endDate) : null;

        // Remove old card
        var old = document.getElementById('gymRemainingCard');
        if (old) old.remove();

        var card = buildRemainingCard(days, endStr);
        card.id = 'gymRemainingCard';
        slot.appendChild(card);
    }

    /* =====================================================
       3. RUN — page load + every AJAX postback
       ===================================================== */
    function runAll() {
        formatNotes();
        injectRemaining();
    }

    // Initial run
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function () { setTimeout(runAll, 400); });
    } else {
        setTimeout(runAll, 400);
    }

    // ASP.NET UpdatePanel / ScriptManager AJAX hook
    function hookAjax() {
        if (typeof Sys !== 'undefined' &&
            Sys.WebForms &&
            Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance()
                .add_endRequest(function () { setTimeout(runAll, 350); });
        } else {
            setTimeout(hookAjax, 500);
        }
    }
    hookAjax();

}());
</script>

</asp:Content>
