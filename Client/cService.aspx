<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cService.aspx.cs" Inherits="PMS.Client.cService" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>PMS</title>

<link href="../StyleSheet/style.css" rel="stylesheet" type="text/css" />

    </head>

<body>

    <form id="form1" runat="server">

<div id="topPan">

	<a href="../Index.aspx"><img src="../StyleSheet/images/logo.gif" alt="Genious Web" width="208" height="58" border="0" title="Genious Web" /></a>

	<ul>
     <li><a href="../Index.aspx">Home</a></li>

		<li class="home">Services</li>

		<li><a href="cTrack.aspx">Track</a></li>

<%--		<li><a href="cClients.aspx">Clients</a></li>--%>		

		<li><a href="cContact.aspx">Contact</a></li>
	</ul>
	<ul class="dropdown">
        <li><a href="../Index.aspx">Home</a></li>		
	</ul>
    
    <%--<ul class="dropleft">
        <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>--%>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2> Our Services</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="serviceDS" GridLines="Vertical" 
        Width="703px">
        <Columns>
            <asp:BoundField DataField="ServiceID" HeaderText="Service Code" ReadOnly="True" 
                SortExpression="ServiceID" />
            <asp:BoundField DataField="ServiceName" HeaderText="Service Name" 
                ReadOnly="True" SortExpression="ServiceName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                ReadOnly="True" SortExpression="Description" />
        </Columns>
        <HeaderStyle Font-Bold="True" Font-Size="X-Large" ForeColor="#6E6C00" 
            HorizontalAlign="Left" VerticalAlign="Top" />
    </asp:GridView>
    <p>
        <asp:LinqDataSource ID="serviceDS" runat="server" 
            ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
            Select="new (ServiceName, Description, ServiceID)" TableName="Services">
        </asp:LinqDataSource>
    </p>
    
    <br/>
    <br/>
</div>

</div>

<div id="bodymainmiddlePan">

</div>



<div id="footermainPan">

  <div id="footerPan">

  

	<a href="../Index.aspx"><img src="../StyleSheet/images/footer-logo.jpg" title="Genious Web" alt="Genious Web" width="186" height="50" border="0" class="footerlogo" /></a> 

		<ul>

  		<li><a href="#">Homea>|</li>

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





