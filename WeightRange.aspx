<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeightRange.aspx.cs" Inherits="PMS.WeightRange" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style1
        {
            width: 51%;
        }
        .style2
        {
            width: 111px;
        }
        .style3
        {
            width: 163px;
        }
        .style4
        {
            width: 129px;
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
		<li class="home">Services</li>
            <%if(Session["Role"].Equals("Administrator"))
          {%>
		      <li><a href="BranchPage.aspx">Branches</a></li>
                  <% }%>
		<li><a href="CustomerPage.aspx">Customers</a></li>
		<li><a href="MailsPage.aspx">Mails</a></li>	
	</ul>
	<ul class="dropdown">
        <li><a href="ServicePage.aspx">Services</a></li>
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

	<h2>Pricing</h2>
    <%if(Session["Role"].Equals("Administrator"))
          {%>
    <p>
        <asp:Label ID="errLbl1" runat="server" ForeColor="Red" Text="Label" 
            Visible="False"></asp:Label>
    </p>
    <table class="style1">
    <tr>
            <td class="style2">
                Service</td>
            <td class="style3">
            &nbsp;<asp:DropDownList ID="service" runat="server" DataSourceID="serviceDS" 
                    DataTextField="ServiceName" DataValueField="ServiceID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="serviceDS" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    Select="new (ServiceID, ServiceName)" TableName="Services">
                </asp:LinqDataSource>
                </td>
                <td class="style4">
                    &nbsp;</td>
        </tr>  
        <tr>
            <td class="style2">
                Range</td>
            <td class="style3">
            &nbsp;<asp:DropDownList ID="range" runat="server" DataSourceID="rangeDS" 
                    DataTextField="range" DataValueField="id">
                </asp:DropDownList>
                <asp:LinqDataSource ID="rangeDS" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    Select="new (id, range)" TableName="Weights">
                </asp:LinqDataSource>
                </td>
                <td class="style4">
                    &nbsp;</td>
        </tr>    
        <tr>
            <td class="style2">
                Price</td>
            <td class="style3">
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </td>
                <td class="style4">
                    <asp:RequiredFieldValidator ID="RequiredF11ieldValidator4" runat="server" 
                        ControlToValidate="txtPrice" ErrorMessage="Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button11" runat="server" Text="Add" onclick="Button1_Click" />
            </td>
                <td class="style4">
                    &nbsp;</td>
        </tr>
    </table>
    <%} %>
    <br/>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="priceDS" PageSize="15" Width="557px">
        <Columns>
            <asp:TemplateField HeaderText="service " SortExpression="serviceID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Service.ServiceName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Service.ServiceName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Weight" SortExpression="rangeID">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Weight.range") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Weight.range") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="Price1" HeaderText="(N)Price" ReadOnly="True" 
                SortExpression="Price1">
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Right" />
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>

	<asp:LinqDataSource ID="priceDS" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        OrderBy="serviceID" Select="new (rangeID, serviceID, Price1, Weight, Service)" 
        TableName="Prices">
    </asp:LinqDataSource>

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


