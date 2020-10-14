﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="CMPG223_Base.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Employee Maintenance" Font-Bold="True" Font-Size="Larger"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Select action to perform:"></asp:Label>
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>Create new employee</asp:ListItem>
            <asp:ListItem>Update employee information</asp:ListItem>
        </asp:RadioButtonList>
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="lblSelectEmp" runat="server" Font-Bold="True" Text="Select employee username:" Visible="False"></asp:Label>
        `<br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EMPLOYEE_USERNAME" DataTextField="EMPLOYEE_USERNAME" DataValueField="EMPLOYEE_USERNAME" Visible="False">
        </asp:DropDownList>
        <asp:SqlDataSource ID="EMPLOYEE_USERNAME" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMPLOYEE_USERNAME] FROM [EMPLOYEE]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Employee ID:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblEmp_ID" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="First Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbFName" runat="server" Width="418px"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Last Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbLName" runat="server" Width="424px"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="User Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbUName" runat="server" Width="424px"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Password:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbPassword" runat="server" Width="424px"></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Contact Number:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbCNum" runat="server" Width="424px"></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="User Role:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButtonList ID="rblUserRole" runat="server">
            <asp:ListItem>Admin</asp:ListItem>
            <asp:ListItem>Operator</asp:ListItem>
            <asp:ListItem>Inactive</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Button ID="btnCommit" runat="server" Text="Submit" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
    </form>
</body>
</html>
