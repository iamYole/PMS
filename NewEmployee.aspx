<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewEmployee.aspx.cs" Inherits="PMS.NewEmployee" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 57%;
        }
        .style2
        {
            width: 135px;
        }
        .style3
        {
            width: 151px;
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
              <li class="home">Employees</li>
          <%}
        %>		
		<li><a href="ServicePage.aspx">Services</a></li>
       <%if(Session["Role"].Equals("Administrator"))
          {%>
		      <li><a href="BranchPage.aspx">Branches</a></li>
          <% }%>
		<li><a href="CustomerPage.aspx">Customers</a></li>
		<li><a href="MailsPage.aspx">Mails</a></li>

	</ul>
	<ul class="dropdown">
        <li><a href="EmployePage.aspx">All</a></li>
		<li><a href="NewEmployee.aspx">New </a></li>
		<li><a href="SearchEmp.aspx">Search</a></li>
	</ul>
    
    <ul class="dropleft">
        <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

    <% if (Session["Role"].Equals("Manager"))
       {%>
	<h2>New Employee <asp:Label ID="branchLbl" runat="server" Text="Label"></asp:Label></h2>
        <%}
       else 
       {%>
       <h2>New Employee</h2>
       <%}%>
    <p>
        <asp:Label ID="errLbl" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <table class="style1">
        <tr>
            <td class="style2">
                Staff ID</td>
            <td class="style3">
                <asp:TextBox ID="staffCode" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="staffCode" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                First Name</td>
            <td class="style3">
                <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="firstName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Last Name</td>
            <td class="style3">
                <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="lastName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Gender</td>
            <td class="style3">
                <asp:DropDownList ID="gender" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="style2">
                Designation</td>
            <td class="style3">
                <asp:DropDownList ID="role" runat="server">
                    <asp:ListItem>Manager</asp:ListItem>
                    <asp:ListItem>Customer Service</asp:ListItem>
                    <asp:ListItem>Administrator</asp:ListItem>
                    <asp:ListItem>Personal Assistance</asp:ListItem>
                    <asp:ListItem>HRManager</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <%if (Session["Role"].Equals("Administrator"))
          {%>
            <tr>
                <td class="style2">Branch</td>
               
                <td class="style3">              
                
                    <asp:DropDownList ID="txtBranch" runat="server" DataSourceID="BranchDS" 
                        DataTextField="Branch_Location" DataValueField="BranchID" 
                        onselectedindexchanged="txtBranch_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="BranchDS" runat="server" 
                        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                        Select="new (BranchID, Branch_Location)" TableName="Branches">
                    </asp:LinqDataSource>
                
                </td>
                <td></td>
            </tr>
            <%}
          else if (Session["Role"].Equals("Manager"))
          { %>
            <tr>
                <td class="style2">Branch</td>
               
                <td class="style3">              
                
                    <asp:TextBox ID="branchCode" runat="server" ReadOnly="True"></asp:TextBox>
                
                </td>
                <td></td>
            </tr>
          <%} %>
         
        <tr>
            <td class="style2"></td>
               
            <td class="style3">
                
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="55px" 
                    onclick="btnSave_Click" />
                
            </td>
            <td></td>
        </tr>
    </table>

	

	<%--<p class="more"><a href="#">more</a></p>--%>

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



