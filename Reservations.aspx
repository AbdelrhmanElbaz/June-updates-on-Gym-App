<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Default4, App_Web_xfweqsz4" %>
    
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel>
                    <ContentTemplate>
                    
    <div id="content">
        <div id="normalcontent">
            <div class="contentarea">
                <div align="center" style="border: medium ridge #333333">
                    <br />
                    <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />
                    <div style="border-style: ridge; border-width: medium; width: 85%">
                        <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" runat="server" id="tb1"
                            visible="false" width="50%" cellspacing="2">
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    Freezing<br />
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="LabelPriceList" runat="server" Text="Freez" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LabelTrainee" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownFreez" runat="server" Height="25px" Width="146px">
                                    </asp:DropDownList>
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
                                    &nbsp;
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
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;
                                </td>
                                <td align="center" colspan="4">
                                    <asp:Button ID="ButtonFreez" runat="server" OnClick="ButtonFreez_Click" Text="Freez"
                                        Height="30px" Width="120px" Font-Bold="True" />
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
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
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
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" width="95%" 
                            cellspacing="2">
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
                                    <asp:Label ID="Label20" runat="server" Text="Gender :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonListGender" runat="server" 
                                        RepeatDirection="Horizontal">
                                    <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                                    
                                    <asp:ListItem Text="Male" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
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
                                    <asp:Label ID="Label201" runat="server" Text="Name : " Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
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
                                    &nbsp;</td>
                                <td class="style4">
                                    <asp:Label ID="Label203" runat="server" Text="Reservation Date :" 
                                        Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                        <asp:TextBox ID="TextBoxDate" runat="server" CssClass="text" Height="22px" 
                                Width="150px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBoxDate">
                            </ajaxToolkit:CalendarExtender>
                            </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td width="20px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td class="style4">
                                    <asp:Label ID="Label202" runat="server" Text="Old Res :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxOldRes" runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="Label204" runat="server" Text="Can Freez" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxCanFreez" runat="server" />
                                </td>
                                <td width="20px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style4" colspan="4" align="center">
                                    <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search " />
                                </td>
                                <td width="20px">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" colspan="6" align="center">
                                    __________________________
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Label ID="LabelEr" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                        <br />
                        <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" width="100%" cellspacing="2">
                            <tr>
                                <td class="style1" align="center">
                                    &nbsp;
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    <asp:HiddenField ID="HiddenFieldResID" runat="server" Value="0" />
                                </td>
                                <td class="style1" align="center">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    Current Reservations
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999"
                                        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Width="100%" CellSpacing="2"
                                        ForeColor="Black" AllowPaging="True" PageSize="40" OnPageIndexChanging="GridView1_PageIndexChanging"
                                        AutoGenerateColumns="False" onrowdatabound="GridView1_RowDataBound">
                                        <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous"
                                            Mode="NextPreviousFirstLast" />
                                        <RowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="HyperLink1" runat="server" Text="Freez" AccessKey='<%# Eval("freez") %>'
                                                        CommandName='<%# Eval("pricelistid") %>' CommandArgument='<%# Eval("Name") %>'
                                                        ToolTip='<%# Eval("Traineeid") %>' CssClass='<%# Eval("ID") %>' OnClick="HyperLink1_Click"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="name" HeaderText="Name" />
                                            <asp:BoundField DataField="Package" HeaderText="Package" />
                                            <asp:BoundField DataField="FirstTime" HeaderText="FirstTime" />
                                            <asp:BoundField DataField="Date" HeaderText="Date" />
                                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" />
                                            <asp:BoundField DataField="MaxAttend" HeaderText="MaxAttend" />
                                            <asp:BoundField DataField="PriceList" HeaderText="PriceList" />
                                            <asp:BoundField DataField="PriceListID" HeaderText="PriceListID" Visible="false" />
                                            <asp:BoundField DataField="freez" HeaderText="Freez"  />
                                            <asp:BoundField DataField="pFreez" HeaderText="MaxFreez"   />
                                            <asp:BoundField DataField="user" HeaderText="User" />

                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    &nbsp;
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
                                <td width="20px">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>
                    <br />
                    <br />
                    <div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
</asp:Content>
