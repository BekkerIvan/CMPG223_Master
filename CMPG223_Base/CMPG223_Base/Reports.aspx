<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CMPG223_Base.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Reports"></asp:Label>
            <br />
            <br />
        </div>
        <!--Simeon-->
        <div>
            <div>
                <asp:CheckBox ID="cbLimpopo" runat="server" Text="Limpopo" />
                <asp:CheckBox ID="cbGauteng" runat="server" Text="Gauteng" />
                <asp:CheckBox ID="cbMpumalanga" runat="server" Text="Mpumalanga" />
            </div>
            <div>
                <asp:CheckBox ID="cbNorthWest" runat="server" Text="North West" />
                <asp:CheckBox ID="cbFreestate" runat="server" Text="Free State" />
                <asp:CheckBox ID="cbKwaZuluNatal" runat="server" Text="KwaZulu Natal" />
            </div>
            <div>
                <asp:CheckBox ID="cbNorthernCape" runat="server" Text="Northern Cape" />
                <asp:CheckBox ID="cbEasternCape" runat="server" Text="Eastern Cape" />
                <asp:CheckBox ID="cbWesternCape" runat="server" Text="Western Cape" />
            </div>
            <br />
            <div>
                <asp:Label ID="lblStartDate" runat="server" Text="Select a start date for the report:"></asp:Label>
                <asp:Calendar ID="StartCalendar" runat="server"></asp:Calendar>
                <asp:Label ID="lblEndDate" runat="server" Text="Select an end date for report:"></asp:Label>
                <asp:Calendar ID="EndCalendar" runat="server"></asp:Calendar>
            </div>
            
            <asp:Button ID="btnProvinceReport" runat="server" Text="Extract Report" />
        </div>
    </form>
</body>
</html>
