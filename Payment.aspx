<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="PMS.Payment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 107px;
        }
        .style3
        {
            width: 107px;
            height: 28px;
        }
        .style4
        {
            height: 28px;
            width: 169px;
        }
        .style5
        {
            width: 169px;
        }
        .style6
        {
            width: 100%;
            background-color: #FFFFFF;
        }
        .style7
        {
            width: 138px;
        }
    </style>

    </head>

<body>

    <form id="form1" runat="server">

<div id="topPan">

	<a href="index.aspx"><img src="StyleSheet/images/logo.gif" alt="Genious Web" width="208" height="58" border="0" title="Genious Web" /></a>

	<ul>
       <li><a href="AdminIndex.aspx">Home</a></li>
           <%if(Session["Role"].Equals("Administrator") || Session["Role"].Equals("Manager"))
          {%>
              <li><a href="EmployePage.aspx">Employees</a></li>
                  <%}
        %>		
		<li><a href="ServicePage.aspx">Services</a></li>
            <%if(Session["Role"].Equals("Administrator"))
          {%>
		      <li><a href="BranchPage.aspx">Branches</a></li>
                  <% }%>
		<li><a href="CustomerPage.aspx">Customers</a></li>
		<li class="home">Mails</li>
	</ul>
	<ul class="dropdown">
        <li><a href="MailsPage.aspx">Back</a></li>
            <%--<li><a href="PendingMails.aspx">Pending</a></li>
		<li><a href="DeliveredMails.aspx">Delivered</a></li>
        <li><a href="TrackMail.aspx">Track</a></li>
        <li><a href="#">Query</a></li>--%>
		
	</ul>
    
    
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>Payment Page</h2>
    <p>
        <asp:Label ID="errLbl" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </p>
    <br/>
    <asp:Panel ID="PayPal" runat="server" BorderWidth="4px" Width="332px">
        <table class="style1" bgcolor="White">
        <tr>
                <td class="style3">
                    Customer</td>
                <td class="style4">
                    <asp:Label ID="name" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="cardNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Card Number</td>
                <td class="style4">
                    <asp:TextBox ID="cardNo" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="cardNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Sercret Pin</td>
                <td class="style5">
                    <asp:TextBox ID="pin" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="pin" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Amount (N)</td>
                <td class="style5">
                    <asp:TextBox ID="amt" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Button ID="Button1" runat="server" BackColor="White" Font-Bold="True" 
                        ForeColor="#838000" onclick="Button1_Click" Text="Pay" Width="90px" />
                </td>
                <td></td>
              </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="confirmations" runat="server" Width="337px" BackColor="Black" 
        BorderWidth="5px" Visible="False">
        <table class="style6">
            <tr>
                <td class="style7">
                    Delivery Number</td>
                <td>
                    <asp:Label ID="num" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Customer Code</td>
                <td>
                    <asp:Label ID="code" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Customer Name</td>
                <td>
                    <asp:Label ID="cname" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Delivery Source</td>
                <td>
                    <asp:Label ID="source" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Delivery Destination</td>
                <td>
                    <asp:Label ID="destination" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Service Type</td>
                <td>
                    <asp:Label ID="service" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Secret Pin</td>
                <td>
                    <asp:Label ID="spin" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Staff</td>
                <td>
                    <asp:Label ID="staff" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td><input type="button" value="Print" onclick="window.print()"/> </td>
            </tr>
        </table>
    </asp:Panel>
    <br/><br/>


</div>

</div>

<div id="bodymainmiddlePan">

</div>



<div id="footermainPan">

  <div id="footerPan">

  

	<a href="index.html"><img src="StyleSheet/images/footer-logo.jpg" title="Genious Web" alt="Genious Web" width="186" height="50" border="0" class="footerlogo" /></a> 

		<ul>

  		<li><a href="#">HomeHome</a>|</li>

  		<li><a href="#">About</a> |</li>

  		<li><a href="#">Support</a>|</li>

  		<li><a href="#">Client</a> |</li>

  		<li><a href="#">Ideas</a> |</li>

		<li><a href="#">Contact</a></li>

 	 </ul>

  	<p class="copyright">©geniousweb. all right reserved.</p>

  	<ul class="templateworld">

  		<li>Design By:</li>

		<li><a href="http://www.templateworld.com" target="_blank">Template World</a></li>

    </ul>

	</div>

	</div>

    </form>

</body>

</html>




