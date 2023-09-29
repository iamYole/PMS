<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Query.aspx.cs" Inherits="PMS.Query" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="StyleSheet/style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        .style5
        {
            width: 49px;
        }
        .style6
        {
            width: 85px;
        }
        .style7
        {
            width: 34px;
        }
        .style8
        {
            width: 83px;
        }
        .style9
        {
            width: 55px;
        }
        .style12
        {
            width: 45px;
        }
        .style13
        {
            width: 44px;
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

	<h2>Advance Query</h2>
    <table class="style4">
        <tr>
            <td class="style5">
                From:</td>
            <td class="style6">
                <asp:DropDownList ID="fromList" runat="server" AutoPostBack="True" 
                    DataSourceID="fromDS" DataTextField="BranchID" DataValueField="BranchID" 
                    onselectedindexchanged="fromList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:LinqDataSource ID="fromDS" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    Select="new (BranchID)" TableName="Branches">
                </asp:LinqDataSource>
&nbsp;</td>
            <td class="style7">
                To:</td>
            <td class="style8">
                <asp:DropDownList ID="tList" runat="server" AutoPostBack="True" 
                    DataSourceID="toList" DataTextField="BranchID" DataValueField="BranchID" 
                    onselectedindexchanged="tList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:LinqDataSource ID="toList" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    OrderBy="BranchID desc" Select="new (BranchID)" TableName="Branches">
                </asp:LinqDataSource>
            </td>
            <td class="style9">
                Service:</td>
            <td class="style6">
                <asp:DropDownList ID="svList" runat="server" AutoPostBack="True" 
                    DataSourceID="serviceList" DataTextField="ServiceName" 
                    DataValueField="ServiceID" 
                    onselectedindexchanged="svList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:LinqDataSource ID="serviceList" runat="server" 
                    ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
                    Select="new (ServiceID, ServiceName)" TableName="Services">
                </asp:LinqDataSource>
            </td>            
            <td class="style12">
                Status</td>
            <td class="style13">
                <asp:DropDownList ID="stsList" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="stsList_SelectedIndexChanged">
                    <asp:ListItem>PENDING</asp:ListItem>
                    <asp:ListItem>DELIVERED</asp:ListItem>
                </asp:DropDownList>
            </td>            
        </tr>
    </table>
    <asp:GridView ID="fView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="DeliveryNo" DataSourceID="fDs" 
        Width="745px">
        <Columns>
            <asp:BoundField DataField="DeliveryNo" HeaderText="Delivery No" ReadOnly="True" 
                SortExpression="DeliveryNo" >
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="DateRecieved" DataFormatString="{0:d}" 
                HeaderText="Date Recieved" SortExpression="DateRecieved" >
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
<asp:TemplateField HeaderText="Weight Range" SortExpression="WeightRange">
    <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Weight.range") %>'></asp:TextBox>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Weight.range") %>'></asp:Label>
                
</ItemTemplate>
    <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
</asp:TemplateField>
            <asp:BoundField DataField="PrefferedService" HeaderText="Service" 
                SortExpression="PrefferedService" >
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="DeliverySource" HeaderText="Source" 
                SortExpression="DeliverySource" >
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="DeliveryDestination" HeaderText="Destination" 
                SortExpression="DeliveryDestination" >
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="DeliveryDate" DataFormatString="{0:d}" 
                HeaderText="Delivery Date" SortExpression="DeliveryDate" >
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Remarks" HeaderText="Status" 
                SortExpression="Remarks" >
            <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="tView" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="DeliveryNo" DataSourceID="tDs" AllowPaging="True" 
        Width="749px">
        <Columns>
            <asp:TemplateField HeaderText="Delivery No" SortExpression="DeliveryNo">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("DeliveryNo") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DeliveryNo") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Recieved" SortExpression="DateRecieved">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DateRecieved") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DateRecieved","{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Weight Range" SortExpression="WeightRange">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Weight.range") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Weight.range") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Service" SortExpression="PrefferedService">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Service.ServiceName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Service.ServiceName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Source" SortExpression="DeliverySource">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DeliverySource") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("DeliverySource") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Destination" 
                SortExpression="DeliveryDestination">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("DeliveryDestination") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("DeliveryDestination") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivery Date" SortExpression="DeliveryDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("DeliveryDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" 
                        Text='<%# Bind("DeliveryDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="Remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Left" />
    </asp:GridView>
    <asp:GridView ID="stView" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="DeliveryNo" DataSourceID="stDS" 
        Width="751px">
        <Columns>
            <asp:TemplateField HeaderText="Delivery No" SortExpression="DeliveryNo">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("DeliveryNo") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DeliveryNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DateRecieved" DataFormatString="{0:d}" 
                HeaderText="Date Recieved" SortExpression="DateRecieved" />
            <asp:TemplateField HeaderText="Weight Range" SortExpression="WeightRange">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Weight.range") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Weight.range") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Service" SortExpression="PrefferedService">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Service.ServiceName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Service.ServiceName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Source" SortExpression="DeliverySource">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DeliverySource") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DeliverySource") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Destination" 
                SortExpression="DeliveryDestination">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("DeliveryDestination") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("DeliveryDestination") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delivery Date" SortExpression="DeliveryDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DeliveryDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" 
                        Text='<%# Bind("DeliveryDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
    </asp:GridView>
    <asp:GridView ID="sourceView" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="DeliveryNo" DataSourceID="sourceDS" Width="746px" 
        AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="DeliveryNo" 
                HeaderText="Delivery No" SortExpression="DeliveryNo" ReadOnly="True" />
            <asp:BoundField DataField="DateRecieved" DataFormatString="{0:d}" 
                HeaderText="Date Recieved" SortExpression="DateRecieved" />
            <asp:TemplateField HeaderText="Weight Range" SortExpression="WeightRange">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Weight.range") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Weight.range") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PrefferedService" HeaderText="Service" 
                SortExpression="PrefferedService" />
            <asp:BoundField DataField="DeliverySource" HeaderText="Source" 
                SortExpression="DeliverySource" />
            <asp:BoundField DataField="DeliveryDestination" HeaderText="Destination" 
                SortExpression="DeliveryDestination" />
            <asp:BoundField DataField="DeliveryDate" DataFormatString="{0:d}" 
                HeaderText="Delivery Date" SortExpression="DeliveryDate" />
            <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                SortExpression="Remarks" />
        </Columns>
        <HeaderStyle ForeColor="#6E6C36" HorizontalAlign="Left" />
    </asp:GridView>
    <asp:LinqDataSource ID="sourceDS" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Mails" Where="PrefferedService == @PrefferedService">
        <WhereParameters>
            <asp:ControlParameter ControlID="svList" Name="PrefferedService" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="stDS" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Mails" Where="Remarks == @Remarks">
        <WhereParameters>
            <asp:ControlParameter ControlID="stsList" Name="Remarks" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="fDs" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Mails" Where="DeliverySource == @DeliverySource">
        <WhereParameters>
            <asp:ControlParameter ControlID="fromList" Name="DeliverySource" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="tDs" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Mails" Where="DeliveryDestination == @DeliveryDestination">
        <WhereParameters>
            <asp:ControlParameter ControlID="tList" Name="DeliveryDestination" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <br/>

       
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




