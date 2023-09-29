<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployePage.aspx.cs" Inherits="PMS.EmployePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 43%;
        }
        .style2
        {
            width: 174px;
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
	<h2>All Employees in  <asp:Label ID="branchLbl" runat="server" Text="Label"></asp:Label></h2>
    <%}
    else
    { %>
        <h2>All Employees</h2>
    <table class="style1">
        <tr>
        <td> 
            <asp:Button ID="Button1" runat="server" Text="Show All" 
                    style="margin-left: 0px" Width="121px" onclick="Button1_Click" />              
        <asp:LinqDataSource ID="AllEmps" runat="server" 
            ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
            Select="new (StaffID, FirstName, LastName, Gender, Role, Branch, BranchID)" 
            TableName="Employees">
        </asp:LinqDataSource>
            </td>
            <td class="style2">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="BranchDS" DataTextField="Branch_Location" 
                    DataValueField="BranchID" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:LinqDataSource ID="BranchDS" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    Select="new (BranchID, Branch_Location)" TableName="Branches">
                </asp:LinqDataSource>
            </td>            
        </tr>
    </table>
    <%}%>
    <br/>
    <p>
        <asp:GridView ID="branchView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="BranchEmps" Width="736px">
            <Columns>
                <asp:TemplateField HeaderText="Staff Code" SortExpression="StaffID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("StaffID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StaffID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Role" SortExpression="Role">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Branch" SortExpression="BranchID">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("BranchID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("BranchID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:GridView ID="adminView" runat="server" AutoGenerateColumns="False" 
            DataSourceID="FilteredEmps" Width="739px" AllowPaging="True" 
            Visible="False">
            <Columns>
                <asp:BoundField DataField="StaffID" HeaderText="Staff Code" ReadOnly="True" 
                    SortExpression="StaffID" >
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" 
                    SortExpression="FirstName" >
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" 
                    SortExpression="LastName" >
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="True" 
                    SortExpression="Gender" >
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Role" HeaderText="Role" ReadOnly="True" 
                    SortExpression="Role" >
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="BranchID" HeaderText="Branch" ReadOnly="True" 
                    SortExpression="BranchID" >
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:LinqDataSource ID="FilteredEmps" runat="server" 
            ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
            Select="new (StaffID, FirstName, LastName, Gender, Role, Branch, BranchID)" 
            TableName="Employees" Where="BranchID == @BranchID" EnableDelete="True" 
            EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="BranchID" 
                    PropertyName="SelectedValue" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="BranchEmps" runat="server" 
            ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
            Select="new (StaffID, FirstName, LastName, Gender, Role, Branch, BranchID)" 
            TableName="Employees" Where="BranchID == @BranchID" EnableDelete="True" 
            EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="Label1" Name="BranchID" PropertyName="Text" 
                    Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </p>
    
	

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


