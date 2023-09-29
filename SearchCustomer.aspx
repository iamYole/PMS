<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchCustomer.aspx.cs" Inherits="PMS.SearchCustomer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 93%;
        }
        .style3
        {
            width: 136px;
        }
        .style4
        {
            width: 72px;
        }
        .style5
        {
            width: 79px;
        }
        .style6
        {
            width: 145px;
        }
        .style13
        {
            width: 147px;
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

	<h2>Search Customers</h2>
    

    <table class="style1">
    <tr>
    <td>
        <asp:Button ID="Button3" runat="server" Text="Refresh" onclick="Button3_Click" 
            Width="136px" /><td>
    </tr>
        <tr>
            <td class="style13">
                By Customer Code</td>
            <td class="style3">
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
            </td>
            <td class="style4">
                <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" />
            </td>
            <td class="style5">
                By Name</td>
                <td class="style6">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
                <td>
                <asp:Button ID="Button2" runat="server" Text="Search" onclick="Button2_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="allView" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="CustomerID" DataSourceID="allCustomers" Width="739px" 
        AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="Customer Code" 
                ReadOnly="True" SortExpression="CustomerID">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="FullName" HeaderText="Full Name" 
                SortExpression="FullName">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MobileNo" HeaderText="Contact No." 
                SortExpression="MobileNo">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="codeView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="byCode" 
        Visible="False" Width="735px">
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="Customer Code" 
                ReadOnly="True" SortExpression="CustomerID">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="FullName" HeaderText="Full Name" 
                SortExpression="FullName">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MobileNo" HeaderText="Contact No." 
                SortExpression="MobileNo">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="nameView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="byName" 
        Visible="False" Width="731px">
        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="Customer Code" 
                ReadOnly="True" SortExpression="CustomerID">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="FullName" HeaderText="Full Name" 
                SortExpression="FullName">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="MobileNo" HeaderText="Contact No." 
                SortExpression="MobileNo">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="byName" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Customers" Where="FullName == @FullName" OrderBy="FullName">
        <WhereParameters>
            <asp:ControlParameter ControlID="txtName" Name="FullName" PropertyName="Text" 
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="byCode" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Customers" Where="CustomerID == @CustomerID" OrderBy="FullName">
        <WhereParameters>
            <asp:ControlParameter ControlID="txtCode" Name="CustomerID" PropertyName="Text" 
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="allCustomers" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Customers" OrderBy="FullName">
    </asp:LinqDataSource>
    <br />

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



