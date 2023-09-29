<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePage.aspx.cs" Inherits="PMS.ServicePage" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

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
		<li class="home">Services</li>
        <%if(Session["Role"].Equals("Administrator"))
          {%>
		      <li><a href="BranchPage.aspx">Branches</a></li>
          <% }%>
		<li><a href="CustomerPage.aspx">Customers</a></li>
		<li><a href="MailsPage.aspx">Mails</a></li>	
	</ul>
	<ul class="dropdown">
         <li><a href="ServicePage.aspx">Serives</a></li>
        <%if(Session["Role"].Equals("Administrator"))
          {%>
		      <li><a href="AddService.aspx">Add</a></li>
              <li><a href="WeightRange.aspx">Pricing</a></li>
           <%} %>	
	</ul>
    
    <ul class="dropleft">
         <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>Services</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="ServiceDS" Width="689px">
            <Columns>
                <asp:TemplateField HeaderText="Service Code" SortExpression="ServiceID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ServiceID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ServiceID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ServiceName" SortExpression="ServiceName">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ServiceName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ServiceName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:LinqDataSource ID="ServiceDS" runat="server" 
            ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
            Select="new (ServiceID, Description, ServiceName)" TableName="Services">
        </asp:LinqDataSource>
    </p>
    <p>
        &nbsp;</p>
<br/>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="priceingDS" 
        PageSize="15" Width="685px">
        <Columns>
            <asp:TemplateField HeaderText="Service" SortExpression="serviceID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Service.ServiceName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Service.ServiceName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Weight" SortExpression="rangeID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Weight.range") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Weight.range") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="(N) Price" SortExpression="Price1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Price1") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price1") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="priceingDS" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        OrderBy="serviceID" TableName="Prices">
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


