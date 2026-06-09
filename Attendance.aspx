<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Attendance, App_Web_xfweqsz4" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
    <div id="content">
        <div id="normalcontent">
            <div class="contentarea">
                <div align="center" style="border: medium ridge #333333">
                    <br />
                    <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />
                    <div style="border-style: ridge; border-width: medium; width: 75%">
                        <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" cellspacing="2">
                            <tr>
                                <td class="style1" colspan="4" align="center">
                                    <span class="style2">Please Select Attendance Date</span>
                                </td>
                            </tr>
                            <tr>
                                   <td align="center"  >
                                Date :  
                                </td>

                                <td align="center"  >
                                  <asp:TextBox ID="TextBoxDate" runat="server" CssClass="text" Height="22px" 
                                Width="150px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBoxDate">
                            </ajaxToolkit:CalendarExtender>

                                </td>
                            </tr>
                            </tr>
                            <tr>
                                <td align="center" colspan="4">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" Width="105px" />
                                </td>
                            </tr>
                            <tr>
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
                            </tr>
                        </table>
                        <br />
                    </div>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999"
                        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="100%" CellSpacing="2"
                        Font-Bold="True" Font-Names="Verdana" Font-Size="12pt" ForeColor="Black" 
                        onrowdatabound="GridView1_RowDataBound">
                        <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                        <RowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <br />
                </div>
                <div class="style1">
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
