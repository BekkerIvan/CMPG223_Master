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


                <asp:Label ID="Label2" runat="server" Text="Select User First Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="drlFName" runat="server" DataSourceID="User_FirstName" DataTextField="EMPLOYEE_FIRSTNAME" DataValueField="EMPLOYEE_FIRSTNAME">
                </asp:DropDownList>
                <asp:SqlDataSource ID="User_FirstName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMPLOYEE_FIRSTNAME] FROM [EMPLOYEE]"></asp:SqlDataSource>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Select User Last Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="drlLName" runat="server" DataSourceID="User_LastName" DataTextField="EMPLOYEE_LASTNAME" DataValueField="EMPLOYEE_LASTNAME">
                </asp:DropDownList>
                <asp:SqlDataSource ID="User_LastName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMPLOYEE_LASTNAME] FROM [EMPLOYEE]"></asp:SqlDataSource>
                <br />


            </div>
            <br />
            <div>
                <asp:Label ID="lblStartDate" runat="server" Text="Select a start date for the report:"></asp:Label>
                <asp:Calendar ID="StartCalendar" runat="server"></asp:Calendar>
                <asp:Label ID="lblEndDate" runat="server" Text="Select an end date for report:"></asp:Label>
                <asp:Calendar ID="EndCalendar" runat="server"></asp:Calendar>
            </div>
            
            <asp:Button ID="btnProvinceReport" runat="server" Text="Run Report" />
        &nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="btnExtract" runat="server" Text="Extract Report" />
            <br />
            <br />
            <asp:GridView ID="grvOutput" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
