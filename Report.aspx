<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Report, App_Web_xfweqsz4" title="Untitled Page" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div align ="center">
    
        <asp:Button ID="ButtonAttendLate" runat="server" 
            onclick="ButtonAttendLate_Click" Text="View Absent trainee (10 days)" 
            Font-Bold="True" Width="300px" />
        &nbsp;&nbsp;
        <asp:Button ID="ButtonRes" runat="server" onclick="ButtonRes_Click" 
            Text="Reservation about to End" Font-Bold="True" Width="300px" />
        <asp:Button ID="ButtonResEnd" runat="server" onclick="ButtonResEnd_Click" 
            Text="Reservation Expired" Font-Bold="True" Width="300px" />
        <br />
        <asp:Label ID="LabelError" runat="server"></asp:Label>
     <br />
    </div>
    <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" 
                                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                                    CellPadding="4"
                                   Width="100%" CellSpacing="2" 
                                    Font-Bold="True" Font-Names="Verdana" Font-Size="12pt" 
                        ForeColor="Black" AllowPaging="True" 
      PageSize="50" onpageindexchanging="GridView1_PageIndexChanging" >
        
                <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                                        PreviousPageText="Previous" Position="Top" />
                                    <RowStyle BackColor="White" />
                                  
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    
    </asp:GridView>
</asp:Content>

