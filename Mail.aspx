<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="PMS.Mail1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style4
        {
            width: 48%;
        }
        .style5
        {
            width: 177px;
        }
    </style>
    </head>

<body>

    <form id="form1" runat="server">

<div id="topPan">

	<a href="index.aspx"><img src="StyleSheet/images/logo.gif" alt="Genious Web" width="208" height="58" border="0" title="Genious Web" /></a>

	<%--<ul>
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
	</ul>--%>
	<ul class="dropdown">
        <li><a href="TrackMail.aspx">Mails</a></li>
        <%--<li><a href="PendingMails.aspx">Pending</a></li>
		<li><a href="DeliveredMails.aspx">Delivered</a></li>
        <li><a href="TrackMail.aspx">Track</a></li>
        <li><a href="#">Query</a></li>--%>
		
	</ul>
    
   <%-- <ul class="dropleft">
        <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>--%>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2> Mail</h2>    
    <table class="style4">
        <tr>
            <td class="style5">
                Delivery Number</td>
            <td>
                <asp:Label ID="dn" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Date Recieved</td>
            <td>
                <asp:Label ID="rDate" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Acutal Weight</td>
            <td>
                <asp:Label ID="weight" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Source</td>
            <td>
                <asp:Label ID="source" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Destination</td>
            <td>
                <asp:Label ID="destination" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Customer</td>
            <td>
                <asp:Label ID="customer" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Price</td>
            <td>
                <asp:Label ID="price" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Staff Attended</td>
            <td>
                <asp:Label ID="staff" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Status</td>
            <td>
                <asp:Label ID="status" runat="server" Text="Label"></asp:Label>
            </td>
            <tr>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnAction" runat="server" Text="Delivered" Visible="False" 
                    onclick="btnAction_Click" />
            </td>
        </tr>        
    </table>

</div>    

</div>

<div id="bodymainmiddlePan">

</div>



<div id="footermainPan">

  <div id="footerPan">

  

	<a href="index.aspx"><img src="StyleSheet/images/footer-logo.jpg" title="Genious Web" alt="Genious Web" width="186" height="50" border="0" class="footerlogo" /></a> 

		<ul>

  		<li><a href="#">Home</a>|</li>

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



