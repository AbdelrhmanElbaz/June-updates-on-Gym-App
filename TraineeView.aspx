<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Default2, App_Web_xfweqsz4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
/*
  TraineeView — Dark Theme Layer
  RULE: zero structural changes. CSS only, targeting existing elements by tag/attribute/ID.
  All ASP control IDs, table IDs, runat="server" attrs are untouched.
*/

/* ── Outer container border ── */
div[align="center"][style*="border: medium ridge"] {
    border-color: var(--border) !important;
    background: transparent !important;
}

/* ── Inner ridge border div ── */
div[style*="border-style: ridge"] {
    border-color: var(--border) !important;
    background: transparent !important;
}

/* ══════════════════════════════════════
   ADD / EDIT FORM  (table id="tb2")
══════════════════════════════════════ */
#tb2 {
    background: var(--surface) !important;
    border: 1px solid var(--border) !important;
    border-radius: 10px !important;
    overflow: hidden !important;
    width: 92% !important;
    margin: 0 auto 12px !important;
}

/* Header row of tb2 */
#tb2 tr:first-child td {
    background: var(--surface) !important;
    border-bottom: 2px solid var(--primary-dim) !important;
    color: var(--primary) !important;
    font-size: 13px !important;
    font-weight: 700 !important;
    letter-spacing: .1em !important;
    text-transform: uppercase !important;
    padding: 14px 0 !important;
}

#tb2 td {
    background: var(--surface) !important;
    color: var(--fg) !important;
    border-color: var(--border) !important;
    padding: 7px 10px !important;
    font-size: 13px !important;
}

/* Labels inside tb2 */
#tb2 span[id] {
    color: var(--muted) !important;
    font-size: 11px !important;
    font-weight: 600 !important;
    text-transform: uppercase !important;
    letter-spacing: .06em !important;
}

/* Inputs inside tb2 */
#tb2 input[type="text"],
#tb2 textarea {
    background: var(--surface-2) !important;
    color: var(--fg) !important;
    border: 1px solid var(--border) !important;
    border-radius: var(--radius-sm) !important;
    padding: 6px 10px !important;
    font-family: var(--font) !important;
    font-size: 13px !important;
    transition: border-color .18s, box-shadow .18s !important;
}
#tb2 input[type="text"]:focus,
#tb2 textarea:focus {
    border-color: var(--primary) !important;
    box-shadow: 0 0 0 3px var(--primary-dim) !important;
    outline: none !important;
}

/* TextBoxNotes (multiline) */
#tb2 textarea {
    color: var(--fg) !important;
    resize: vertical !important;
    min-height: 64px !important;
}

/* DropDownLists inside tb2 */
#tb2 select {
    background: var(--surface-2) !important;
    color: var(--fg) !important;
    border: 1px solid var(--border) !important;
    border-radius: var(--radius-sm) !important;
    padding: 5px 8px !important;
    font-family: var(--font) !important;
    font-size: 13px !important;
}
#tb2 select:focus {
    border-color: var(--primary) !important;
    box-shadow: 0 0 0 3px var(--primary-dim) !important;
    outline: none !important;
}

/* FileUpload inside tb2 */
#tb2 input[type="file"] {
    color: var(--fg-light) !important;
    font-size: 12px !important;
}

/* Image preview inside tb2 */
#tb2 img { border-color: var(--border) !important; }

/* LabelnotesData (existing notes display) */
#ctl00_ContentPlaceHolder1_LabelnotesData {
    background: rgba(212,168,83,.06) !important;
    border: 1px solid rgba(212,168,83,.18) !important;
    border-radius: var(--radius-sm) !important;
    display: block !important;
    padding: 8px 12px !important;
    color: var(--fg-light) !important;
    font-size: 13px !important;
    line-height: 1.7 !important;
}

/* Error label */
#ctl00_ContentPlaceHolder1_LabelEr {
    color: var(--destructive) !important;
    font-size: 12px !important;
    font-weight: 600 !important;
}

/* Save button inside tb2 */
#tb2 input[type="submit"],
#tb2 input[type="button"] {
    background: var(--primary) !important;
    color: var(--primary-fg) !important;
    border: none !important;
    padding: 8px 28px !important;
    border-radius: var(--radius-sm) !important;
    font-weight: 700 !important;
    font-size: 12px !important;
    letter-spacing: .06em !important;
    cursor: pointer !important;
    transition: opacity .18s !important;
}
#tb2 input[type="submit"]:hover,
#tb2 input[type="button"]:hover {
    opacity: .85 !important;
    background: var(--primary) !important;
    color: var(--primary-fg) !important;
}

/* ══════════════════════════════════════
   SEARCH TABLE  (second table — no ID)
   target via bgcolor attr
══════════════════════════════════════ */
table[bgcolor="Silver"],
table[bgcolor="silver"] {
    background: var(--surface) !important;
    border: 1px solid var(--border) !important;
    border-radius: 10px !important;
    overflow: hidden !important;
    width: 92% !important;
    margin: 0 auto 16px !important;
}

table[bgcolor="Silver"] td,
table[bgcolor="silver"] td {
    background: var(--surface) !important;
    color: var(--fg) !important;
    border-color: var(--border) !important;
    padding: 8px 10px !important;
    font-size: 13px !important;
}

/* Section label rows in search table */
table[bgcolor="Silver"] td.style1,
table[bgcolor="silver"] td.style1 {
    color: var(--primary) !important;
    font-size: 11px !important;
    font-weight: 700 !important;
    letter-spacing: .08em !important;
    text-transform: uppercase !important;
    border-bottom: 1px solid var(--primary-dim) !important;
    padding: 12px 10px !important;
}

/* Bold labels (ID, Female, Name, Mobile) */
table[bgcolor="Silver"] td.style4 span,
table[bgcolor="silver"] td.style4 span {
    color: var(--muted) !important;
    font-size: 11px !important;
    font-weight: 600 !important;
    text-transform: uppercase !important;
    letter-spacing: .05em !important;
}

/* Inputs inside search table */
table[bgcolor="Silver"] input[type="text"],
table[bgcolor="silver"] input[type="text"] {
    background: var(--surface-2) !important;
    color: var(--fg) !important;
    border: 1px solid var(--border) !important;
    border-radius: var(--radius-sm) !important;
    padding: 6px 10px !important;
    font-family: var(--font) !important;
    font-size: 13px !important;
}
table[bgcolor="Silver"] input[type="text"]:focus,
table[bgcolor="silver"] input[type="text"]:focus {
    border-color: var(--primary) !important;
    box-shadow: 0 0 0 3px var(--primary-dim) !important;
    outline: none !important;
}

/* Search & Add-New buttons */
table[bgcolor="Silver"] input[type="submit"],
table[bgcolor="Silver"] input[type="button"],
table[bgcolor="silver"] input[type="submit"],
table[bgcolor="silver"] input[type="button"] {
    background: var(--surface-2) !important;
    color: var(--fg) !important;
    border: 1px solid var(--border) !important;
    border-radius: var(--radius-sm) !important;
    padding: 7px 20px !important;
    font-size: 12px !important;
    font-weight: 600 !important;
    letter-spacing: .05em !important;
    cursor: pointer !important;
    transition: background .15s, border-color .15s !important;
}
table[bgcolor="Silver"] input[type="submit"]:hover,
table[bgcolor="Silver"] input[type="button"]:hover,
table[bgcolor="silver"] input[type="submit"]:hover,
table[bgcolor="silver"] input[type="button"]:hover {
    background: var(--primary-dim) !important;
    border-color: var(--primary) !important;
    color: var(--primary) !important;
}

/* Separator line */
table[bgcolor="Silver"] td.style8,
table[bgcolor="silver"] td.style8 {
    color: var(--border) !important;
    font-size: 12px !important;
}

/* ══════════════════════════════════════
   GRIDVIEW  (#GridView1)
══════════════════════════════════════ */

/* Header row */
#ctl00_ContentPlaceHolder1_GridView1 th,
table[id$="GridView1"] th {
    background: var(--surface) !important;
    color: var(--primary) !important;
    border-bottom: 2px solid var(--primary-dim) !important;
    font-size: 11px !important;
    font-weight: 700 !important;
    letter-spacing: .07em !important;
    text-transform: uppercase !important;
    padding: 11px 12px !important;
    white-space: nowrap !important;
    border-color: var(--border) !important;
}

/* Data rows */
#ctl00_ContentPlaceHolder1_GridView1 td,
table[id$="GridView1"] td {
    background: var(--surface-2) !important;
    color: var(--fg) !important;
    border-color: var(--border) !important;
    padding: 9px 12px !important;
    font-size: 13px !important;
    border-bottom: 1px solid var(--border) !important;
}

/* Hover row */
#ctl00_ContentPlaceHolder1_GridView1 tr:hover td,
table[id$="GridView1"] tr:hover td {
    background: var(--primary-dim) !important;
}

/* Pager row */
#ctl00_ContentPlaceHolder1_GridView1 tr.gridPager td,
table[id$="GridView1"] td[colspan] {
    background: var(--surface) !important;
    text-align: left !important;
    padding: 8px 12px !important;
}

#ctl00_ContentPlaceHolder1_GridView1 td[colspan] a,
#ctl00_ContentPlaceHolder1_GridView1 td[colspan] span,
table[id$="GridView1"] td[colspan] a,
table[id$="GridView1"] td[colspan] span {
    display: inline-block !important;
    padding: 4px 10px !important;
    border: 1px solid var(--border) !important;
    border-radius: var(--radius-sm) !important;
    margin: 0 2px !important;
    font-size: 12px !important;
    color: var(--primary) !important;
    text-decoration: none !important;
    background: var(--surface-2) !important;
    transition: background .15s !important;
}
#ctl00_ContentPlaceHolder1_GridView1 td[colspan] a:hover,
table[id$="GridView1"] td[colspan] a:hover {
    background: var(--primary-dim) !important;
}

/* Edit / Delete link buttons in grid */
#ctl00_ContentPlaceHolder1_GridView1 a[id*="LinkButton"],
table[id$="GridView1"] a[id*="LinkButton"] {
    opacity: .75;
    transition: opacity .15s;
}
#ctl00_ContentPlaceHolder1_GridView1 a[id*="LinkButton"]:hover,
table[id$="GridView1"] a[id*="LinkButton"]:hover {
    opacity: 1;
}

/* ══════════════════════════════════════
   MISC
══════════════════════════════════════ */

/* Required field validator asterisk */
#ctl00_ContentPlaceHolder1_RequiredFieldValidator1 {
    color: var(--destructive) !important;
    font-weight: 700 !important;
}

/* Checkbox accent */
input[type="checkbox"] { accent-color: var(--primary) !important; }

/* style1 div spacer at bottom */
div.style1 { background: transparent !important; }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
                <div align="center" style="border: medium ridge #333333;overflow:scroll">
                    <br />
                    <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />
                    <asp:HiddenField ID="HiddenFieldNotes" runat="server" Value="" />
                    <div style="border-style: ridge; border-width: medium;">
                        <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" runat="server" id="tb2"
                            visible="false" cellspacing="2">
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    Add New Trainee
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="LabelName" runat="server" Text="Name :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxName" runat="server" Height="30px" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName"
                                        ErrorMessage="*" ValidationGroup="g">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Label ID="LabelMob" runat="server" Text="Mobile :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxMob" runat="server" Height="30px" Width="200px"></asp:TextBox>
                                </td>
                                <td width="20px">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="LabelAddress" runat="server" Text="Address :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxAddre" runat="server" Height="30px" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="LabelPriceList" runat="server" Text="Price List :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListType" runat="server" Height="30px" Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;<asp:Label ID="LabelActive0" runat="server" Text="Male/Female :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListmale" runat="server" Height="30px" Width="200px">
                                        <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Label ID="LabelPriceList0" runat="server" Text="Image :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td colspan="3">
                                     <asp:Image ID="Image1" runat="server" ImageUrl="~/traineeImg/Tulips.jpg" Visible="false"
                                        Width="300px" style="border-radius:40px;" /></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td colspan="4">
                                    <asp:Label ID="LabelnotesData" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="Labelnotes" runat="server" Text="Notes :" Font-Bold="True"></asp:Label>
                                </td>
                                <td colspan="3" align="left">
                                    <asp:TextBox ID="TextBoxNotes" runat="server" Height="50px" Width="508px" MaxLength="2000"
                                        TextMode="MultiLine" ForeColor="#CC0000"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;
                                </td>
                                <td align="center" colspan="4">
                                    <asp:Button ID="ButtonAdd" runat="server" OnClick="Button1_Click" Text="Save"  
                                          Font-Bold="True" ValidationGroup="g" />
                                </td>
                                <td align="center">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="LabelEr" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" width="85%" cellspacing="2">
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    &nbsp;Trainee Search
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    &nbsp;
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style4">
                                    <asp:Label ID="Label2" runat="server" Text="ID :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxID" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Female :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxFemale" runat="server" />
                                </td>
                                <td width="20px">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style4">
                                    <asp:Label ID="Label20" runat="server" Text="Name : " Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Mobile :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxMobile" runat="server"></asp:TextBox>
                                </td>
                                <td width="20px">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td colspan="4" align="center">
                                    <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search " />
                                    <br />
                                    <br />
                                    <asp:Button ID="ButtonAddNew" runat="server" OnClick="ButtonAddNew_Click" Text="Add New Trainee" />
                                </td>
                                <td width="20px">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" align="center">
                                    __________________________
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999"
                        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="100%" CellSpacing="2"
                        Font-Bold="True" Font-Names="Verdana" Font-Size="12pt" ForeColor="Black" AllowPaging="True"
                        PageSize="40" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false"  
                                        OnClick="LinkButton_ClickEdit" CommandArgument='<%# Bind("ID") %>'>
                                         <img src="images/edit.png" alt="edit" /></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClientClick="return confirm('you are about to Delete all Trainee Data , Are you sure you want to delete?')"
                                        OnClick="LinkButton_ClickDelete" CommandArgument='<%# Bind("ID") %>'>
                                         <img src="images/delete.png" alt="delete" /></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous"
                            Mode="NextPreviousFirstLast" />
                        <RowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </div>

<script type="text/javascript">
(function () {
    'use strict';

    function formatNotes() {
        var el = document.getElementById('ctl00_ContentPlaceHolder1_LabelnotesData');
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
        el.style.setProperty('color',       'rgba(255,255,255,0.82)',              'important');
        el.style.setProperty('line-height', '1.8',                                 'important');
        el.style.setProperty('font-size',   '13px',                                'important');
        el.style.setProperty('font-weight', '400',                                 'important');
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
