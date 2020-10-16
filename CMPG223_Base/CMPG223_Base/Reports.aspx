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
        <div>
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Select report to generate:"></asp:Label></div>
            <div class="fullWidth">        
            <asp:RadioButtonList ID="rblReports" runat="server" RepeatDirection="Horizontal" CssClass="col-md-12" style="margin:10px" AutoPostBack="True" >
                 <asp:ListItem>&nbsp;Emergency Situations per Province</asp:ListItem>
                 <asp:ListItem>&nbsp;Emergency Situations per time Period</asp:ListItem>
                 <asp:ListItem>&nbsp;Employee Log Reports</asp:ListItem>
             </asp:RadioButtonList>
        </div>
        </div>
        <!--Simeon-->
        <div>
            <div>
                <asp:CheckBox ID="cbLimpopo" runat="server" Text="Limpopo" Visible="False" />
                <asp:CheckBox ID="cbGauteng" runat="server" Text="Gauteng" Visible="False" />
                <asp:CheckBox ID="cbMpumalanga" runat="server" Text="Mpumalanga" Visible="False" />
            </div>
            <div>
                <asp:CheckBox ID="cbNorthWest" runat="server" Text="North West" Visible="False" />
                <asp:CheckBox ID="cbFreestate" runat="server" Text="Free State" Visible="False" />
                <asp:CheckBox ID="cbKwaZuluNatal" runat="server" Text="KwaZulu Natal" Visible="False" />
            </div>
            <div>
                <asp:CheckBox ID="cbNorthernCape" runat="server" Text="Northern Cape" Visible="False" />
                <asp:CheckBox ID="cbEasternCape" runat="server" Text="Eastern Cape" Visible="False" />
                <asp:CheckBox ID="cbWesternCape" runat="server" Text="Western Cape" Visible="False" />
            </div>
            <br />
            <div>


                <asp:Label ID="lblFname" runat="server" Text="Select User First Name:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="drlFName" runat="server" DataSourceID="User_FirstName" DataTextField="EMPLOYEE_FIRSTNAME" DataValueField="EMPLOYEE_FIRSTNAME" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="User_FirstName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMPLOYEE_FIRSTNAME] FROM [EMPLOYEE]"></asp:SqlDataSource>
                <br />
                <asp:Label ID="lblLName" runat="server" Text="Select User Last Name:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="drlLName" runat="server" DataSourceID="User_LastName" DataTextField="EMPLOYEE_LASTNAME" DataValueField="EMPLOYEE_LASTNAME" Visible="False">
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
            
            <asp:Button ID="btnProvinceReport" runat="server" Text="Run Report" OnClick="btnProvinceReport_Click" />
        &nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="btnExtract" runat="server" Text="Extract Report" OnClick="btnExtract_Click" />
            <br />
            <br />
            <asp:GridView ID="grvOutput" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="EMPLOYEE_ID,LOG_ID" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" InsertVisible="False" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
                    <asp:BoundField DataField="EMPLOYEE_FIRSTNAME" HeaderText="EMPLOYEE_FIRSTNAME" SortExpression="EMPLOYEE_FIRSTNAME" />
                    <asp:BoundField DataField="EMPLOYEE_LASTNAME" HeaderText="EMPLOYEE_LASTNAME" SortExpression="EMPLOYEE_LASTNAME" />
                    <asp:BoundField DataField="EMPLOYEE_USERNAME" HeaderText="EMPLOYEE_USERNAME" SortExpression="EMPLOYEE_USERNAME" />
                    <asp:BoundField DataField="EMPLOYEE_PASSWORD" HeaderText="EMPLOYEE_PASSWORD" SortExpression="EMPLOYEE_PASSWORD" />
                    <asp:BoundField DataField="EMPLOYEE_CONTACTNUMBER" HeaderText="EMPLOYEE_CONTACTNUMBER" SortExpression="EMPLOYEE_CONTACTNUMBER" />
                    <asp:BoundField DataField="USERROLE" HeaderText="USERROLE" SortExpression="USERROLE" />
                    <asp:BoundField DataField="LOG_ID" HeaderText="LOG_ID" InsertVisible="False" ReadOnly="True" SortExpression="LOG_ID" />
                    <asp:BoundField DataField="DATE" HeaderText="DATE" SortExpression="DATE" />
                    <asp:BoundField DataField="LOG_IN_TIME" HeaderText="LOG_IN_TIME" SortExpression="LOG_IN_TIME" />
                    <asp:BoundField DataField="LOG_OUT_TIME" HeaderText="LOG_OUT_TIME" SortExpression="LOG_OUT_TIME" />
                    <asp:BoundField DataField="EMPLOYEE_ID1" HeaderText="EMPLOYEE_ID1" SortExpression="EMPLOYEE_ID1" />
                </Columns>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT EMPLOYEE.*, EMPLOYEE_LOG.* FROM EMPLOYEE INNER JOIN EMPLOYEE_LOG ON EMPLOYEE.EMPLOYEE_ID = EMPLOYEE_LOG.EMPLOYEE_ID WHERE EMPLOYEE.EMPLOYEE_FIRSTNAME = 'ANDRE';"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
