<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="PriceList, App_Web_xfweqsz4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
                <div align="center" style="border: medium ridge #333333">
                    <br />
                    <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />
                    <div style="border-style: ridge; border-width: medium; width: 95%">
                        <table id="tb1" bgcolor="Silver" bordercolordark="Black" cellpadding="2" runat="server"
                            visible="false" cellspacing="2">
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="5" align="center">
                                    Add New Price
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="5" align="center">
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelName" runat="server" Text="Name :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxName" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelPrice" runat="server" Text="Price :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPrice" runat="server" Height="22px" Width="200px"></asp:TextBox>
                                </td>
                                <td width="20px">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelFreez" runat="server" Text="Freez :" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxFreez" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Week
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelFree" runat="server" Text="Free :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxFree" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
                                <td class="style2">
                                    Week
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelInv" runat="server" Text="Invitations :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxInvitation" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelEveryDay" runat="server" Text="Every Day :"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="CheckBoxEveryDay" runat="server" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelType" runat="server" Text="Type :"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownListType" runat="server" Height="26px" Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    <asp:Label ID="LabelCount" runat="server" Text="Count :"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxCount" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    Sauna:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxSauna" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    Spa:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxSpa" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    jacuzzi:
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxJacuzzi" runat="server" Height="22" Width="200px"></asp:TextBox>
                                </td>
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
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;
                                </td>
                                <td align="center">
                                    &nbsp;
                                </td>
                                <td align="center">
                                    &nbsp;
                                </td>
                                <td align="center">
                                    <asp:Button ID="ButtonAdd" runat="server" OnClick="Button1_Click" Text="Save" Width="76px" />
                                </td>
                                <td align="center" colspan="2">
                                    &nbsp;
                                </td>
                                <td align="center">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="7">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="LabelEr" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                        <br />
                        <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" width="100%" cellspacing="2">
                            <tr>
                                <td class="style1" align="center">
                                    &nbsp;
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    <asp:Button ID="ButtonAddNew" runat="server" OnClick="ButtonAddNew_Click" Text="Add New  Price"
                                        Width="113px" />
                                </td>
                                <td class="style1" align="center">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    Price List
                                </td>
                                <td class="style1" align="center">
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" align="center">
                                </td>
                                <td class="style1" colspan="4" align="center">
                                    <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999"
                                        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" OnRowDeleting="GridView1_RowDeleting"
                                        OnRowEditing="GridView1_RowEditing" Width="100%" CellSpacing="2" ForeColor="Black"
                                        AllowPaging="True" PageSize="40" Font-Names="Verdana" Font-Size="12pt" OnPageIndexChanged="GridView1_PageIndexChanged"
                                        OnPageIndexChanging="GridView1_PageIndexChanging">
                                        <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                                        <RowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField >
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Edit"
                                                    >  <img src="images/edit.png" alt="edit" /></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false"  >
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete?')"
                                                        CommandName="Delete"  >
                                                        <img src="images/delete.png" alt="delete" /></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                </div>
             
     
</asp:Content>
