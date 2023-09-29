<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditService.aspx.cs" Inherits="PMS.EditService" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 439px;
        }
        .style2
        {
            width: 127px;
        }
        .style3
        {
            width: 233px;
        }
        .style4
        {
            width: 110px;
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">

<div id="topPan">

	<a href="index.aspx"><img src="StyleSheet/images/logo.gif" alt="Genious Web" width="208" height="58" border="0" title="Genious Web" /></a>

	<ul>
        <li><a href="AdminIndex.aspx">Home</a></li>
		<li><a href="EmployePage.aspx">Employees</a></li>
		<li class="home">Services</li>
		<li><a href="BranchPage.aspx">Branches</a></li>
		<li><a href="CustomerPage.aspx">Customers</a></li>
		<li><a href="MailsPage.aspx">Mails</a></li>
	</ul>
	<ul class="dropdown">
        <li><a href="ServicePage.aspx">Serives</a></li>
		<li><a href="AddService.aspx">Add</a></li>
        <%--<li><a href="EditService.aspx">Edit</a></li>--%>
		
	</ul>
    
    <ul class="dropleft">
        <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>Edit Service</h2>
    <table class="style1">
        <tr>
            <td class="style2">
                Service Code</td>
            <td class="style3">
                
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                
            </td>
                <td class="style4">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Service Name</td>
            <td class="style3">
                <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 0px"></asp:TextBox>
            </td>
                <td class="style4">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                Description</td>
            <td class="style3">
                <asp:TextBox ID="TextBox3" runat="server" Height="88px" TextMode="MultiLine" 
                    Width="206px"></asp:TextBox>
            </td>
                <td valign="top" class="style4">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Price</td>
            <td class="style3">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
                <td class="style4">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text="Save" />
            </td>
                <td class="style4">
                    &nbsp;</td>
        </tr>
    </table>

</div>

</div>

<div id="bodymainmiddlePan">

</div>



<div id="footermainPan">

  <div id="footerPan">

  

	<a href="index.html"><img src="StyleSheet/images/footer-logo.jpg" title="Genious Web" alt="Genious Web" width="186" height="50" border="0" class="footerlogo" /></a> 

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


