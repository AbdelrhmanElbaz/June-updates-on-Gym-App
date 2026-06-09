<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Default2, App_Web_xfweqsz4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
