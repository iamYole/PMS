<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailsPage.aspx.cs" Inherits="PMS.MailsPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 72%;
        }
        .style2
        {
            width: 156px;
        }
        .style3
        {
            width: 190px;
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

	<h2>New Mail</h2>
    <p>
        <asp:Label ID="errlbl" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </p>
    <table class="style1">
        <tr>
            <td class="style2">
                Actual Weight 
                (kg)</td>
            <td class="style3">
                <asp:TextBox ID="txtWeight" runat="server" 
                    ontextchanged="txtWeight_TextChanged" Width="82px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtWeight" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Weight Range</td>
            <td class="style3">
                <asp:DropDownList ID="txtRange" runat="server" DataSourceID="rangeDS" 
                    DataTextField="range" DataValueField="id">
                </asp:DropDownList>
                <asp:LinqDataSource ID="rangeDS" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    Select="new (id, range)" TableName="Weights">
                </asp:LinqDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Preffered Service</td>
            <td class="style3">
                <asp:DropDownList ID="txtService" runat="server" DataSourceID="ServiceDS" 
                    DataTextField="ServiceName" DataValueField="ServiceID" 
                    onselectedindexchanged="txtService_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:LinqDataSource ID="ServiceDS" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    TableName="Services">
                </asp:LinqDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Destination Office</td>
            <td class="style3">
                <asp:DropDownList ID="txtOffice" runat="server" 
                    DataSourceID="DestinationDS" DataTextField="Branch_Location" 
                    DataValueField="BranchID" AutoPostBack="True" 
                    onselectedindexchanged="txtOffice_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:LinqDataSource ID="DestinationDS" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    Select="new (BranchID, Branch_Location)" TableName="Branches">
                </asp:LinqDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Customer Code&nbsp;&nbsp;&nbsp;&nbsp; <a href="CustomerPage.aspx">New</a></td>
            <td class="style3">
                <asp:TextBox ID="txtCust" runat="server" ontextchanged="txtCust_TextChanged"></asp:TextBox>
                <br />
                <asp:Label ID="fullname" runat="server" Font-Bold="True" Font-Italic="True" 
                    Font-Size="Smaller" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtCust" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnSave" runat="server" Text="Proceed" 
                    onclick="btnSave_Click" />
            </td>
            <td>
                <asp:Label ID="priceLbl" runat="server" Font-Bold="True" Font-Size="Larger" 
                    Font-Underline="True" ForeColor="#0066FF" Text="0.00 NGN"></asp:Label>
            </td>
        </tr>
    </table>
    <p>&nbsp;</p>
    


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



