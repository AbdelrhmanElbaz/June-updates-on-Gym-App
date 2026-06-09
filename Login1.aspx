<%@ page language="C#" autoeventwireup="true" inherits="Login1, App_Web_miccv0mn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trainee</title>
    


<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="default.css" />

    <style type="text/css">
        .style1
        {
            font-weight: bold;
            text-decoration: underline;
            font-size: large;
            text-align: center;
        }
        </style>

    </head>
<body>
    <form id="form2" runat="server">
    <div>
    <div id="upbg"></div>

<div id="outer">


<%--	<div id="header">
		<div id="headercontent">
			<h1>MY - GYM <sup>IT</sup></h1>
			<h2>designed by Eng Haitham</h2>
		</div>
	</div>


	
		<div id="search">
			<input type="text" class="text" maxlength="64" name="keywords" />
			<input type="submit" class="submit" value="Search" />
		</div>--%>



	<div id="headerpic">
	<div id="headercontent">
			<h1>MY - GYM <sup>IT</sup></h1>
			<h2>designed by Eng Haitham</h2>
		</div>
	</div>

	
	<div id="menu">
		<!-- HINT: Set the class of any menu link below to "active" to make it appear active -->
	</div>

	
	<div id="content">

		<div id="normalcontent">
	
			<div class="contentarea">
				
			   <div align="center" style="border: medium ridge #333333"> 
    
       <br />
                    <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />
                <div style="border-style: ridge; border-width: medium; width:85% " >
                              <table bgcolor="Silver" bordercolordark="Black" cellpadding="2"  width="60%"
                        cellspacing="2">
                        <tr>
                            <td class="style1" colspan="2" align="center">
                                Login</td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <asp:Label ID="Label20" runat="server" Text="User Name : " Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxUName" runat="server" Width="160px" Font-Size="12pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4">
                                <asp:Label ID="Label4" runat="server" Text="Password :" Font-Bold="True" 
                                    Font-Italic="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxPass" runat="server" 
                                    TextMode="Password" Width="160px" Font-Size="12pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style4" colspan="2" align="center">
                                <asp:Button ID="ButtonLogIn" runat="server" onclick="ButtonSearch_Click" 
                                    Text="LOGIN" />
                                            </td>
                        </tr>
                                                                                                
                        
                        
                    </table>
                                 <br /> <asp:Label ID="LabelEr" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                  
                                    <br />
                    </div>
                                <br />
                                <br />
               
              
    
    </div>
			</div>
		</div>


	</div>

	<div id="footer">
			<div class="left">© 2012 GYMApp. All rights reserved.</div>
			<div class="right">Design by En Haitham </div>
	</div>
	
</div>
    </div>
    </form>
</body>
</html>
