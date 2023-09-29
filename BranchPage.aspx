<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BranchPage.aspx.cs" Inherits="PMS.BranchPage" %>

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
		<li><a href="ServicePage.aspx">Services</a></li>
        <%if(Session["Role"].Equals("Administrator"))
          {%>
		      <li class="home">Branches</li>
          <% }%>
		<li><a href="CustomerPage.aspx">Customers</a></li>
		<li><a href="MailsPage.aspx">Mails</a></li>
	</ul>	
	<ul class="dropdown">
        <li><a href="BranchPage.aspx">Branches</a></li>
        <li><a href="NewBranch.aspx">Add</a></li>
		
	</ul>
    
    <ul class="dropleft">
        <li>Welcome <asp:Label ID="user" runat="server" Text="Label"></asp:Label></li><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </ul>
    
</div>

<div id="bodytopmainPan">

<div id="bodytopPan">

	<h2>Branches</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="BranchID" DataSourceID="Branches" 
        Width="733px">
        <Columns>
            <asp:BoundField DataField="BranchID" HeaderText="Branch Code" ReadOnly="True" 
                SortExpression="BranchID" />
            <asp:BoundField DataField="Branch_Location" HeaderText="Branch Location" 
                SortExpression="Branch_Location" />
            <asp:BoundField DataField="Contact" HeaderText="Contact" 
                SortExpression="Contact" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
        </Columns>
        <HeaderStyle ForeColor="#6E6C00" HorizontalAlign="Left" />
        </asp:GridView>
    

	<asp:LinqDataSource ID="Branches" runat="server" 
        ContextTypeName="PMS.dataStoreDataContext" EntityTypeName="" 
        TableName="Branches">
    </asp:LinqDataSource>
    

	<%--<p class="more"><a href="#">more</a></p>--%>

</div>

</div>

<div id="bodymainmiddlePan">

</div>



<div id="footermainPan">

  <div id="footerPan">

  

	<a href="index.aspx"><img src="StyleSheet/images/footer-logo.jpg" title="Genious Web" alt="Genious Web" width="186" height="50" border="0" class="footerlogo" /></a> 

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


