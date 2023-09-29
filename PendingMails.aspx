<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PendingMails.aspx.cs" Inherits="PMS.PendingMails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 33%;
        }
        .style2
        {
            width: 95px;
        }
        .style3
        {
            width: 89px;
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

	<h2>Pending Mails</h2>
    <table class="style1">
        <tr>
            <td class="style2">
                Delivery No.<br />
                <asp:Label ID="dnLbl" runat="server" ForeColor="Red" Text="Not Found" 
                    Visible="False"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="dn" runat="server" Width="72px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnShow" runat="server" Text="Show" onclick="btnShow_Click" />
            </td>
        </tr>
    </table>
    <br/>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="pMailsDS" Width="744px">
            <Columns>
                <asp:TemplateField HeaderText="Delivery No" SortExpression="DeliveryNo">
                    <EditItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("DeliveryNo") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("DeliveryNo") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Recieved" SortExpression="DateRecieved">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" 
                            Text='<%# Eval("DateRecieved", "{0:d}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" 
                            Text='<%# Bind("DateRecieved", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Service" SortExpression="PrefferedService">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Service.ServiceName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Service.ServiceName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Source" SortExpression="DeliverySource">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" 
                            Text='<%# Eval("DeliverySource") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" 
                            Text='<%# Bind("DeliverySource") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Destination" 
                    SortExpression="DeliveryDestination">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Eval("DeliveryDestination") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Bind("DeliveryDestination") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Customer" SortExpression="Customer">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Customer1.FullName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Customer1.FullName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:LinqDataSource ID="pMailsDS" runat="server" 
            ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
            Select="new (DeliveryNo, DateRecieved, WeightRange, PrefferedService, DeliverySource, DeliveryDestination, Customer, Customer1, Branch, Weight, Service, Employee)" 
            TableName="Mails" Where="Remarks == @Remarks">
            <WhereParameters>
                <asp:Parameter DefaultValue="PENDING" Name="Remarks" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </p>
    


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



