<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchEmp.aspx.cs" Inherits="PMS.SearchEmp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 99%;
        }
        .style5
        {
            width: 94px;
        }
        .style6
        {
            width: 158px;
        }
        .style7
        {
            width: 90px;
        }
        .style8
        {
            width: 166px;
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

	<h2>Search Employees in Branch</h2>
    <table class="style1">
        <tr>
            <td class="style5">
                By Staff ID :</td>
            <td class="style6">
                <asp:TextBox ID="byId" runat="server" Width="141px"></asp:TextBox>
            </td>
            <td>                
                <asp:Button ID="Button2" runat="server" Text="Search" onclick="Button2_Click" />                
            </td>
            <td class="style7">
                By Name :</td>
            <td class="style8">
                <asp:TextBox ID="byName" runat="server" Width="158px"></asp:TextBox>
            </td>
            <td>                
                <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" />                
            </td>
        </tr>
    </table>
    <br/>
	

	<%--<p class="more"><a href="#">more</a></p>--%>
    <asp:GridView ID="idView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="emID" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Visible="False" 
        Width="734px">
        <Columns>
            <asp:BoundField DataField="StaffID" HeaderText="Staff Code" ReadOnly="True" 
                SortExpression="StaffID">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" 
                SortExpression="FirstName">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" 
                SortExpression="LastName">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="True" 
                SortExpression="Gender">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Role" HeaderText="Role" ReadOnly="True" 
                SortExpression="Role">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Branch" SortExpression="BranchID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("Branch.Branch_Location") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Branch.Branch_Location") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="nameView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="nameDS" Visible="False" Width="730px">
        <Columns>
            <asp:BoundField DataField="StaffID" HeaderText="Staff Code" ReadOnly="True" 
                SortExpression="StaffID">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" 
                SortExpression="FirstName">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" 
                SortExpression="LastName">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="True" 
                SortExpression="Gender">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Role" HeaderText="Role" ReadOnly="True" 
                SortExpression="Role">
            <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Branch" SortExpression="BranchID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("Branch.Branch_Location") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Branch.Branch_Location") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="nameDS" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        Select="new (StaffID, FirstName, LastName, Gender, Role, BranchID, Branch)" 
        TableName="Employees" Where="FirstName == @FirstName">
        <WhereParameters>
            <asp:ControlParameter ControlID="byName" Name="FirstName" PropertyName="Text" 
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="emID" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        Select="new (StaffID, FirstName, LastName, Gender, Role, BranchID, Branch)" 
        TableName="Employees" Where="StaffID == @StaffID">
        <WhereParameters>
            <asp:ControlParameter ControlID="byId" Name="StaffID" PropertyName="Text" 
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>

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



