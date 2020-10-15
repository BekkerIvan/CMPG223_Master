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
        <asp:RadioButtonList ID="rblAction" runat="server">
            <asp:ListItem>Create new Emergency Service</asp:ListItem>
            <asp:ListItem>Edit Emergency Service</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="lblSelectService" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Emergency Service:"></asp:Label>
        <br />
        <asp:DropDownList ID="drlServiceName" runat="server" DataSourceID="Emergency_Service_Name" DataTextField="EMERGENCY_SERVICE_NAME" DataValueField="EMERGENCY_SERVICE_NAME" OnSelectedIndexChanged="drlServiceName_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Emergency_Service_Name" runat="server" ConnectionString="<%$ ConnectionStrings:CBOX_DBConnectionString %>" SelectCommand="SELECT [EMERGENCY_SERVICE_NAME] FROM [EMERGENCY_SERVICE]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblServiceID1" runat="server" Font-Bold="True" Text="Service ID:"></asp:Label>
&nbsp;&nbsp;
        <asp:Label ID="lblServiceID2" runat="server" Font-Bold="True" Text="[lblServiceID2]"></asp:Label>
        <br />
        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Name:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="txbName" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="lblType" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Type:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="txbType" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="lblContact" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Contact:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbContact" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblServiceArchive" runat="server" Font-Bold="True" Text="Emergency Services Archive:&nbsp;"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="chbArchive" runat="server" Text="[ticked is archived]" />
        <br />
        <br />
        <asp:Label ID="lblLat" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Location Latitude:"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbLat" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblLng" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Location Longitude:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbLng" runat="server"></asp:TextBox>
        <br />
        <br />
        <p>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
        </p>
        <p>
            <asp:Button ID="btnExit" runat="server" Text="Exit" />
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
