<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emergency_Service.aspx.cs" Inherits="CMPG223_Base.Emergency_Service" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 0px">
        </div>
        <asp:Label ID="lblEmergencyServices" runat="server" Font-Bold="True" Font-Size="Larger" Text="Emergency Services"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblSelectAction" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Action to perform:"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>Create new Emergency Service</asp:ListItem>
            <asp:ListItem>Edit Emergency Service</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="lblSelectService" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Emergency Service:"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Emergency_Service_Name" DataTextField="EMERGENCY_SERVICE_NAME" DataValueField="EMERGENCY_SERVICE_NAME">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Emergency_Service_Name" runat="server" ConnectionString="<%$ ConnectionStrings:CBOX_DBConnectionString %>" SelectCommand="SELECT [EMERGENCY_SERVICE_NAME] FROM [EMERGENCY_SERVICE]"></asp:SqlDataSource>
        <br />
        <p>
            <asp:Button ID="btnAdd" runat="server" Text="Add" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" />
            <asp:Button ID="btnModify" runat="server" style="margin-top: 0px" Text="Modify" />
        </p>
        <asp:Button ID="btnSearch" runat="server" Text="Search" />
        <p>
            &nbsp;<asp:Label ID="lblId" runat="server" Font-Bold="False" Font-Size="Medium" Text="Emergency Services ID:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
            <asp:TextBox ID="txbId" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="lblName" runat="server" Font-Bold="False" Font-Size="Medium" Text="Emergency Services Name:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="txbName" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lblType" runat="server" Font-Bold="False" Font-Size="Medium" Text="Emergency Services Type:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="txbType" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="lblContact" runat="server" Font-Bold="False" Font-Size="Medium" Text="Emergency Services Contact:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbContact" runat="server"></asp:TextBox>
        <br />
        <br />
        Emergency Services Archive:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton runat="server" />
        <br />
        <br />
        <p>
            &nbsp;&nbsp;<asp:Button ID="btnExit" runat="server" Text="Exit" />
        </p>
    </form>
</body>
</html>
