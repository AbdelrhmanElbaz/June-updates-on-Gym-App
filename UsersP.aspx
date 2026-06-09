<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="UsersP, App_Web_xfweqsz4" title="Untitled Page" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div align="center">
  
    <table>
        <tr class="row">
            <td align="right">
                <asp:Label ID="Label10" runat="server" Text="User Name"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="TextBoxName" runat="server" CssClass="text" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName"
                    ErrorMessage="*" Text="*" ValidationGroup="g1"></asp:RequiredFieldValidator>
            </td>
            <td align="right">
                <asp:Label ID="Label21" runat="server" Text="Password"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="text" Width="150px" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td align="right">
                <asp:Label ID="Label22" runat="server" Text="Mobile"></asp:Label>
            </td>
            <td align="left">
                <asp:TextBox ID="TextBoxMobille" runat="server" CssClass="text" Width="150px"></asp:TextBox>
            </td>
            <td align="left">
                <asp:CheckBox ID="CheckBoxAdmin" runat="server" Text="Admin" TextAlign="Left" />
            </td>
        </tr>
        <tr class="row">
            <td align="right">
                <asp:Label ID="Label25" runat="server" Text="Address"></asp:Label>
            </td>
            <td align="left" colspan="6">
                <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="text" Width="370px"></asp:TextBox>
            </td>
        </tr>
    </table> 
        <asp:Button ID="ButtonSave" runat="server" ValidationGroup="g1" 
          OnClick="ButtonSave_Click" Text="Save" Width="60px">  
                 </asp:Button>
        &nbsp;
        <asp:Button ID="ButtonClear" runat="server" OnClick="ButtonClear_Click" 
          Text="Clear" Width="60px">  
                
                </asp:Button>
    
    <asp:Label ID="LabelError" runat="server"></asp:Label>
    <asp:GridView ID="GridViewCustomers" runat="server" AutoGenerateColumns="false" OnRowCreated="GridView1_RowCreated"
        AllowPaging="True" OnPageIndexChanging="GridViewCustomers_PageIndexChanging"
         BackColor="#CCCCCC" 
                                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                                    CellPadding="4" 
                                     Width="100%" CellSpacing="2" 
                                    Font-Bold="True" Font-Names="Verdana" Font-Size="12pt" 
                        ForeColor="Black"  PageSize="40" >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <img src="Images/setting.png" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:ImageButton ID="LinkButtonEdit" runat="server" CommandName='<%# Eval("ID") %>'
                        ImageUrl="~/Images/Edit.png" Width="20px" Height="20px" OnClick="HyperLinkEdit_Click">
                    </asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="Admin" HeaderText="Admin" />
        </Columns>
        <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                                        PreviousPageText="Previous" Mode="NextPreviousFirstLast" />
                                    <RowStyle BackColor="White" />
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                 
    </asp:GridView></div>
</asp:Content>
