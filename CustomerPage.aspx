<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPage.aspx.cs" Inherits="PMS.CustomerPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 73%;
        }
        .style2
        {
            width: 136px;
        }
        .style3
        {
            width: 257px;
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
		<li class="home">Customers</li>
		<li><a href="MailsPage.aspx">Mails</a></li>
	</ul>	
	<ul class="dropdown">
        <li><a href="CustomerPage.aspx">Customers</a></li>
		<li><a href="SearchCustomer.aspx">Search</a></li>		
	</ul>
    
    <ul class="dropleft">
       <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>Create Customer</h2>
    <p>
        <asp:Label ID="errLbl" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <table class="style1">
        <tr>
            <td class="style2">
                Customer Code</td>
            <td class="style3">
                <asp:TextBox ID="cCode" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Title</td>
            <td class="style3">
                <asp:DropDownList ID="cTitle" runat="server">
                    <asp:ListItem>Mr</asp:ListItem>
                    <asp:ListItem>Mrs</asp:ListItem>
                    <asp:ListItem>Miss</asp:ListItem>
                    <asp:ListItem>Dr</asp:ListItem>
                    <asp:ListItem>Coporate</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="style2">
                Full Name</td>
            <td class="style3">
                <asp:TextBox ID="cName" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="cName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Gender</td>
            <td class="style3">
                <asp:DropDownList ID="cGender" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Contact No.</td>
            <td class="style3">
                <asp:TextBox ID="cContact" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="cContact" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                Address</td>
            <td class="style3">
                <asp:TextBox ID="cAddress" runat="server" Height="104px" TextMode="MultiLine" 
                    Width="244px"></asp:TextBox>
            </td>
            <td valign="top">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="cAddress" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Emails</td>
            <td class="style3">
                <asp:TextBox ID="cMail" runat="server" Width="218px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="cMail" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="cMail" ErrorMessage="Invalid E-mail" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" />
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



