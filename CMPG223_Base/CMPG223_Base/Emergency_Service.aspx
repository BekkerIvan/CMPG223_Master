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
        Emergency Services:<p>
            <asp:Button ID="btnAdd" runat="server" Text="Add" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" />
            <asp:Button ID="btnModify" runat="server" style="margin-top: 0px" Text="Modify" />
        </p>
        <asp:Button ID="btnSearch" runat="server" Text="Search" />
        <asp:Button ID="btnArchive" runat="server" Text="Archive" />
        <asp:Button ID="btnExit" runat="server" Text="Exit" />
        <p>
            Emergency Service ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        Emergency Service Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <p>
            Emergency Service Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        Emergency Service Contact:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <p>
            EmergencyEmergency Service Archive:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
    </form>
</body>
</html>
