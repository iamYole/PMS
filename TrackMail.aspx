<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrackMail.aspx.cs" Inherits="PMS.TrackMail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style4
        {
            width: 45%;
        }
        .style5
        {
            width: 170px;
        }
        .style6
        {
            width: 99%;
        }
        .style7
        {
            width: 119px;
        }
        .style8
        {
            width: 94px;
        }
        .style9
        {
            width: 105px;
        }
        .style10
        {
            width: 118px;
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
        <li><a href="MailsPage.aspx">New Mail</a></li>
        <li><a href="PendingMails.aspx">Pending</a></li>
		<li><a href="DeliveredMails.aspx">Delivered</a></li>
        <li><a href="TrackMail.aspx">Track</a></li>
        <%if(Session["Role"].Equals("Administrator") || Session["Role"].Equals("Manager"))
          {%>
        <li><a href="Query.aspx">Query</a></li>
		<% }%>
		
	</ul>
    
    <ul class="dropleft">
        <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>Track Mail</h2>
    
    <table class="style4">
        <tr>
            <td class="style5">
                Delivery/Tracking Number</td>
            <td>
                <asp:TextBox ID="trackNo" runat="server" Width="101px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="lbl" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Track" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    <br/>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
    
    <table class="style6">
        <tr>
            <td class="style8">
                Delivery No</td>
            <td class="style7">
                Recieved Date</td>
            <td>
                Service</td>
            <td class="style9">
                Source</td>
            <td class="style10">
                Destination</td>
            <td>
                Customer</td>
            <td>
                Status</td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="dn" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style7">
                <asp:Label ID="rdate" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="service" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style9">
                <asp:Label ID="source" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                <asp:Label ID="destination" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="customer" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="status" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>    
    <br/>
</div>

</div>

<div id="bodymainmiddlePan">

</div>



<div id="footermainPan">

  <div id="footerPan">

  

	<a href="index.html"><img src="StyleSheet/images/footer-logo.jpg" title="Genious Web" alt="Genious Web" width="186" height="50" border="0" class="footerlogo" /></a> 

		<ul>

  		<li><a href="#">Homea>|</li>

  		<li><a href="#">About</a> |</li>

  		<li><a href="#">Support</a>|</li>

  		<li><a href="#">Client</a> |</li>

  		<li><a href="#">Ideas</a> |</li>

		<li><a href="#">Contact</a></li>

 	 </ul>

  	<p class="copyright">ęgeniousweb. all right reserved.</p>

  	<ul class="templateworld">

  		<li>Design By:</li>

		<li><a href="http://www.templateworld.com" target="_blank">Template World</a></li>

    </ul>

	</div>

	</div>

    </form>

</body>

</html>



