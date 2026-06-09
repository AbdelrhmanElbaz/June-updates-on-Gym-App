<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="TraineeAttendance, App_Web_xfweqsz4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	
	<div id="content">

		<div id="normalcontent">
	
			<div class="contentarea">
			<div align="center" style="border: medium ridge #333333"> 
    
       <br />
                    <asp:HiddenField ID="HiddenFieldID" runat="server" Value="0" />
                <div style="border-style: ridge; border-width: medium; width: 75%"  >
                   <table bgcolor="Silver" bordercolordark="Black" cellpadding="2"  width="85%"
                        cellspacing="2">
                        <tr>
                            <td class="style1" align="center">
                                </td>
                            <td class="style1" colspan="4" align="center">
                                &nbsp;Trainee Search</td>
                            <td class="style1" align="center">
                                </td>
                        </tr>
                        <tr>
                            <td class="style1" align="center">
                                </td>
                            <td class="style1" colspan="4" align="center">
                                </td>
                            <td class="style1" align="center">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style4">
                                <asp:Label ID="Label2" runat="server" Text="ID :" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxID" runat="server" Font-Size="12pt"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Female :" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                    <asp:CheckBox ID="CheckBoxFemale" runat="server" 
                        oncheckedchanged="CheckBoxFemale_CheckedChanged" />
                            </td>
                            <td width="20px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style4">
                                <asp:Label ID="Label20" runat="server" Text="Name : " Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Font-Size="12pt"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Mobile :" Font-Bold="True"></asp:Label>
                                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxMobile" runat="server" Font-Size="12pt"></asp:TextBox>
                            </td>
                            <td width="20px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td class="style4" colspan="4">
                                <asp:Button ID="ButtonSearch" runat="server" onclick="ButtonSearch_Click" 
                                    Text="Search " />
                                            </td>
                            <td width="20px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8" colspan="6">
                                __________________________</td>
                        </tr>
                                                                        
                        
                        
                    </table>
                   <br />
                    <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" 
                        cellspacing="2">
                        <tr>
                            <td class="style1" >
                                </td>
                            <td class="style1" colspan="4" align="center">
                     <span class="style2">Please Select Trainee&nbsp; </span></td>
                            <td class="style1" >
                                </td>
                        </tr>
                        <tr>
                            <td class="style1" align="right" >
                                Trainee :
                                </td>
                            <td class="style1" colspan="4" align="left">
                                <asp:DropDownList ID="DropDownListTrainee" runat="server" Height="26px" 
                                    Width="177px" AutoPostBack="True" 
                                    onselectedindexchanged="DropDownListTrainee_SelectedIndexChanged" 
                                    Font-Size="12pt">
                                </asp:DropDownList>
                                        </td>
                            <td class="style1" align="left">
                                </td>
                        </tr>
                        <tr>
                            <td class="style1" align="right">
                                Reservation : </td>
                            
                            <td colspan="4" align="left">
                                <asp:DropDownList ID="DropDownListReservation" runat="server" Height="26px" 
                                    Width="177px" Font-Size="12pt">
                                </asp:DropDownList>
                                            </td>
                         
                            <td>
                                &nbsp;</td>
                           
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center" colspan="4">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="View" 
        Width="105px" />
                            </td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="LabelEr" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                                                
                        
                        
                    </table>
                                    <br />
                                    <table bgcolor="Silver" bordercolordark="Black" cellpadding="2" width="75%" id="tb1" runat="server" visible="false"
                        cellspacing="2">
                        <tr>
                            <td class="style1" colspan="7" align="center">
                                &nbsp;Trainee Info</td>
                        </tr>
                        <tr>
                            <td class="style1" colspan="7" align="center">
                                </td>
                        </tr>
                        <tr>
                            <td class="style2">
                    &nbsp;Price: </td>
                            <td>
                                <asp:Label ID="LabelPrice" runat="server" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td bgcolor="Black" width="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style3">
                                <asp:Label ID="LabelAddress0" runat="server" Text="Date :" Font-Bold="True" ></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td width="4">
                                &nbsp;</td>
                            <td bgcolor="Black">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LabelPriceList2" runat="server" Text="Normal :" 
                                    Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelNormal" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td bgcolor="Black">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style3">
                                <asp:Label ID="LabelPriceList3" runat="server" Text="Ivitation :" 
                                    Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelInv" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                             <asp:Label ID="Label4" runat="server" Text="Sauna :" 
                                    Font-Bold="True"></asp:Label>   </td>
                            <td>
                                <asp:Label ID="LabelSauna" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td bgcolor="Black">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style3">
                              
                             <asp:Label ID="Label5" runat="server" Text="Jacuzzi :" 
                                    Font-Bold="True"></asp:Label>    </td>
                            <td>
                                <asp:Label ID="LabelJacuzzi" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                             <asp:Label ID="Label6" runat="server" Text="Spa :" 
                                    Font-Bold="True"></asp:Label> </td>
                            <td>
                                <asp:Label ID="LabelSpa" runat="server"></asp:Label>
                            </td>
                            <td>                                 </td>
                            <td bgcolor="Black">                                 </td>
                            <td> </td>
                            <td class="style3"> </td>
                            <td> </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="LabelPriceList4" runat="server" Text="End date: " 
                                    Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LabelEnd" runat="server"></asp:Label>
                                            </td>
                            <td>
                                &nbsp;</td>
                            <td bgcolor="Black">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style3">
                                <asp:Label ID="LabelPriceList5" runat="server" Text="Max Attend : " 
                                    Font-Bold="True"></asp:Label>
                                            </td>
                            <td>
                                <asp:Label ID="Labelmax" runat="server"></asp:Label>
                                            </td>
                        </tr>
                                                                        
                        
                        
                    </table>
                    </div>
                                <br />
                                <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" 
                                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                                    CellPadding="4"
                                   Width="100%" CellSpacing="2" 
                                    Font-Bold="True" Font-Names="Verdana" Font-Size="12pt" 
                        ForeColor="Black" AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
                                    PageSize="31" AutoGenerateColumns="False" 
                    onrowdatabound="GridView1_RowDataBound"  >
                                    <Columns>
                                    <asp:BoundField  DataField="ID" HeaderText="ID" Visible="false" />
                                     <asp:BoundField  DataField="Name" HeaderText="Name" Visible="false" />
                                      <asp:BoundField  DataField="Date" HeaderText="Date" Visible="True" />
                                       <asp:BoundField  DataField="Normal" HeaderText="Normal" Visible="True" />
                                      <asp:BoundField  DataField="Invitation" HeaderText="Invitation" Visible="True" />
                                     
                                      <asp:BoundField  DataField="Spa" HeaderText="Spa" Visible="True" />
                                      <asp:BoundField  DataField="Sauna" HeaderText="Sauna" Visible="True" />
                                      <asp:BoundField  DataField="Jacuzzi" HeaderText="Jacuzzi" Visible="True" /> 
                                      <asp:BoundField  DataField="Notes" HeaderText="Notes" Visible="True" />
                                      <asp:BoundField  DataField="User" HeaderText="User" Visible="True" />
                                     <asp:TemplateField  >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                                    CommandArgument=<%# Eval("ID") %> CausesValidation="false" 
                                                    OnClientClick="return confirm(' Are you sure you want to delete?')"
                                                   onclick="LinkButton1_Click">
                                                   <img src="images/delete.png" alt="delete" />
                                                   </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                                        PreviousPageText="Previous" Mode="NextPreviousFirstLast" />
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
