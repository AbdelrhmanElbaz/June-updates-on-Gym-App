<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Renew, App_Web_xfweqsz4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<meta charset="utf-8" />
<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Cairo:wght@400;500;600;700&display=swap');

:root {
  --bg:#0f0f17; --surface:#181824; --surface-2:#1e1e2e;
  --border:rgba(255,255,255,0.08); --primary:#d4a853; --primary-fg:#1a1000;
  --primary-dim:rgba(212,168,83,0.12); --muted:rgba(255,255,255,0.45);
  --fg:rgba(255,255,255,0.92); --fg-light:rgba(255,255,255,0.72);
  --destructive:#e05c5c; --radius-sm:6px;
  --shadow:0 4px 24px rgba(0,0,0,0.45);
  --font:'DM Sans','Segoe UI',system-ui,sans-serif;
  --font-ar:'Cairo','Segoe UI',Tahoma,sans-serif;
}

#gymRenewPage, #gymRenewPage * { box-sizing:border-box; font-family:var(--font); }
#gymRenewPage { background:var(--bg); min-height:100vh; padding:28px 20px 48px; color:var(--fg); max-width:800px; margin:0 auto; }

.gym-card { background:var(--surface); border:1px solid var(--border); border-radius:14px; overflow:hidden; box-shadow:var(--shadow); margin-bottom:20px; }
.gym-card-header { display:flex; align-items:center; gap:10px; padding:16px 20px; border-bottom:1px solid var(--border); }
.gym-card-icon { width:28px; height:28px; display:flex; align-items:center; justify-content:center; background:var(--primary-dim); border-radius:var(--radius-sm); color:var(--primary); flex-shrink:0; }
.gym-card-icon svg { width:15px; height:15px; stroke:currentColor; fill:none; stroke-width:2; stroke-linecap:round; stroke-linejoin:round; }
.gym-card-title { font-size:11px; font-weight:700; letter-spacing:.12em; text-transform:uppercase; color:var(--primary); margin:0; }
.gym-card-body { padding:20px; }

.gym-form-grid { display:grid; grid-template-columns:1fr 1fr; gap:14px; }
.gym-field { display:flex; flex-direction:column; gap:5px; }
.gym-field-full { grid-column:1/-1; }
.gym-label { font-size:11px; font-weight:600; letter-spacing:.05em; text-transform:uppercase; color:var(--muted); }

.gym-input, .gym-select, .gym-textarea,
input[type="text"].gym-input, select.gym-select, textarea.gym-textarea {
  width:100%; background:rgba(255,255,255,0.04); border:1px solid var(--border);
  border-radius:var(--radius-sm); color:var(--fg); font-family:var(--font-ar);
  font-size:13px; padding:0 10px; direction:rtl; text-align:right;
  transition:border-color .2s,box-shadow .2s; outline:none; -webkit-appearance:none;
}
.gym-input,.gym-select { height:36px; }
.gym-input:focus,.gym-select:focus,.gym-textarea:focus { border-color:var(--primary); box-shadow:0 0 0 3px rgba(212,168,83,.18); }
.gym-input::placeholder,.gym-textarea::placeholder { color:var(--muted); }
.gym-select option { background:#1e1e2e; direction:rtl; }
.gym-textarea { min-height:76px; height:auto; padding:8px 10px; resize:vertical; }

.gym-select-wrap { position:relative; }
.gym-select-wrap::after { content:""; position:absolute; right:10px; top:50%; transform:translateY(-50%); width:0; height:0; border-left:4px solid transparent; border-right:4px solid transparent; border-top:5px solid var(--muted); pointer-events:none; }

.gym-check-row { display:flex; align-items:center; gap:8px; padding:10px 12px; border:1px solid var(--border); border-radius:var(--radius-sm); background:rgba(255,255,255,0.03); cursor:pointer; transition:border-color .2s; }
.gym-check-row:hover { border-color:var(--primary); }
.gym-check-row input[type=checkbox] { accent-color:var(--primary); width:15px; height:15px; }
.gym-check-row .gym-check-label { font-size:12px; font-weight:500; color:var(--fg); }

.gym-btn-row { display:flex; justify-content:center; margin-top:20px; }
.gym-btn, input[type=submit].gym-btn, input[type=button].gym-btn {
  display:inline-flex; align-items:center; gap:8px; height:38px; padding:0 28px;
  background:var(--primary); color:var(--primary-fg); font-family:var(--font);
  font-size:12px; font-weight:700; letter-spacing:.08em; text-transform:uppercase;
  border:none; border-radius:var(--radius-sm); cursor:pointer; transition:opacity .2s,transform .1s;
}
.gym-btn:hover { opacity:.88; }
.gym-btn:active { transform:translateY(1px); }

.gym-error { font-size:12px; color:var(--destructive); font-weight:600; min-height:18px; display:block; margin-top:8px; }

.gym-notes-alert {
  background:rgba(224,92,92,.08); border:1px solid rgba(224,92,92,.2);
  border-radius:var(--radius-sm); padding:8px 12px; font-size:13px;
  color:var(--fg-light); font-weight:400; font-family:var(--font-ar);
  direction:rtl; text-align:right; white-space:pre-wrap; line-height:1.8;
  margin-bottom:14px; display:block;
}
.gym-notes-alert:empty { display:none; }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="gymRenewPage">

  <!-- SEARCH CARD -->
  <div class="gym-card">
    <div class="gym-card-header">
      <div class="gym-card-icon">
        <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      </div>
      <h2 class="gym-card-title">Trainee Search</h2>
    </div>
    <div class="gym-card-body">
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
      <asp:Label ID="LabelEr" runat="server" CssClass="gym-error"></asp:Label>
    </div>
  </div>

  <!-- RENEW CARD -->
  <div class="gym-card">
    <div class="gym-card-header">
      <div class="gym-card-icon">
        <svg viewBox="0 0 24 24"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/></svg>
      </div>
      <h2 class="gym-card-title">Renew Reservation</h2>
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
          <asp:HiddenField ID="HiddenFieldNotes" runat="server" Value="" />
          <asp:Label ID="LabelnotesData" runat="server" CssClass="gym-notes-alert"></asp:Label>
        </div>

        <div class="gym-field gym-field-full">
          <label class="gym-label">Notes</label>
          <asp:TextBox ID="TextBoxNotes" runat="server" TextMode="MultiLine"
            CssClass="gym-textarea" MaxLength="2000"></asp:TextBox>
        </div>

        <div class="gym-field gym-field-full">
          <label class="gym-label">Price List</label>
          <div class="gym-select-wrap">
            <asp:DropDownList ID="DropDownListType" runat="server" CssClass="gym-select"></asp:DropDownList>
          </div>
        </div>

      </div>

      <div class="gym-btn-row">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click2"
          Text="Renew" CssClass="gym-btn" />
      </div>
    </div>
  </div>

</div>

<script type="text/javascript">
(function () {
    'use strict';

    function formatNotes() {
        var ids = [
            'ctl00_ContentPlaceHolder1_LabelnotesData',
            'ctl00_ContentPlaceHolder1_LabelNotes'
        ];
        ids.forEach(function (id) {
            var el = document.getElementById(id);
            if (!el || !el.innerHTML.trim()) return;
            var html = el.innerHTML;
            html = html.replace(/\s(\*\*\s\d{4}-\d{2}-\d{2})/g, '<br>$1');
            html = html.replace(/\s(Freez\sfrom)/g, '<br>$1');
            el.innerHTML = html;
            el.style.setProperty('direction',   'rtl',                                 'important');
            el.style.setProperty('text-align',  'right',                               'important');
            el.style.setProperty('white-space', 'pre-wrap',                            'important');
            el.style.setProperty('display',     'block',                               'important');
            el.style.setProperty('font-family', 'Cairo, Segoe UI, Tahoma, sans-serif', 'important');
            el.style.setProperty('color',       'rgba(255,255,255,0.72)',              'important');
            el.style.setProperty('line-height', '1.8',                                 'important');
            el.style.setProperty('font-size',   '13px',                                'important');
            el.style.setProperty('font-weight', '400',                                 'important');
        });
    }

    function run() { formatNotes(); }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function () { setTimeout(run, 400); });
    } else {
        setTimeout(run, 400);
    }
    function hookAjax() {
        if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () { setTimeout(run, 350); });
        } else { setTimeout(hookAjax, 500); }
    }
    hookAjax();
}());
</script>

</asp:Content>
