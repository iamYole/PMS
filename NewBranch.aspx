<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewBranch.aspx.cs" Inherits="PMS.NewBranch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 58%;
        }
        .style2
        {
            width: 105px;
        }
        .style3
        {
            width: 203px;
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
		<li><a href="ServicePage.aspx">Services</a></li>
		<li class="home">Branches</li>
		<li><a href="CustomerPage.aspx">Customers</a></li>
		<li><a href="MailsPage.aspx">Mails</a></li>
	</ul>
	<ul class="dropdown">
        <li><a href="BranchPage.aspx">Branches</a></li>
        <li><a href="NewBranch.aspx">Add</a></li>
		
	</ul>
    
    <ul class="dropleft">
        <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>New Branch</h2>
    <p>
        <asp:Label ID="errLbl" runat="server" ForeColor="Red" Text="Label" 
            Visible="False"></asp:Label>
    </p>
    <table class="style1">
        <tr>
            <td class="style2">
                Branch Code</td>
            <td class="style3">
                <asp:TextBox ID="bCode" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="bCode" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Location</td>
            <td class="style3">
                <asp:TextBox ID="bLocation" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="bLocation" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td class="style2">
                Contact No.</td>
            <td class="style3">
                <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtContact" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                Address</td>
            <td class="style3">
                <asp:TextBox ID="bAddress" runat="server" Height="101px" TextMode="MultiLine" 
                    Width="193px"></asp:TextBox>
            </td>
            <td valign="top">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="bAddress" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
            </td>
            <td></td>
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


