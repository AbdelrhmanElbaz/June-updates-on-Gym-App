<%@ page language="C#" autoeventwireup="true" inherits="Play, App_Web_miccv0mn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type ="text/css">
    audio { width: 700px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    <audio controls autoplay  height="200" width="300px">
  
  <source src="http://localhost:1043/GYM/wav/mexico_cbradio.wav" type="audio/wav" /> 
</audio>

    <%--<embed height='0' width='0' src='http://localhost:1043/GYM/wav/mexico_cbradio.wav' />--%>
    </div>
    </form>
</body>
</html>
