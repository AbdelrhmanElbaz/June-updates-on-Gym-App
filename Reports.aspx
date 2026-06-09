<%@ page language="C#" autoeventwireup="true" inherits="Reports, App_Web_miccv0mn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="ButtonAttendLate" runat="server" 
            onclick="ButtonAttendLate_Click" Text="View Absent trainee (10 days)" />
        <asp:Button ID="ButtonRes" runat="server" onclick="ButtonRes_Click" 
            Text="Reservation about to End" />
        <br />
        <asp:Label ID="LabelError" runat="server"></asp:Label>
    
    </div>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </form>
</body>
</html>
