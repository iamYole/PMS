<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="PMS.Confirmation" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS </title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 61%;
        }
        .style2
        {
            width: 161px;
        }
    </style>

    </head>

<body>

    <form id="form1" runat="server">

<div id="topPan">

	<a href="index.aspx"><img src="StyleSheet/images/logo.gif" alt="Genious Web" width="208" height="58" border="0" title="Genious Web" /></a>
    <ul class="dropdown">
        <li><a href="SearchCustomer.aspx">Customers</a></li>		
	</ul>
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>Customer Slip</h2>

    <br />
    <h3>
    <table class="style1" align="center">
        <tr>
            <td class="style2">
                Customer Code</td>
            <td>
                <asp:Label ID="codeLbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Full Name</td>
            <td>
                <asp:Label ID="nameLbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Contact Number</td>
            <td>
                <asp:Label ID="numLbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                E-Mail</td>
            <td>
                <asp:Label ID="mailLbl" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>    
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <input type="button" value="Print" onclick="window.print()" 
                    style="width: 60px"/>
            </td>
        </tr>     
    </table>
    </h3>
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



