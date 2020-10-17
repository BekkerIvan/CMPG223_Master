<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CMPG223_Base.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <title></title>
</head>
<body style="background-color:rgb(67, 119, 167);">
            <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-color">

        <!-- Navbar brand -->

        <img class="navbar-brand" height="50px" width="50px"  src="WhatsApp_Image_2020-10-15_at_18.41.12-removebg-preview.png" />

        <!-- Collapse button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Collapsible content -->
        <div class="collapse navbar-collapse" id="basicExampleNav">

            <!-- Links -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Admin_Emergency_Situation.aspx">
                        Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Emergency_Service.aspx">Emergency Service</a>
                </li>

                <!-- Dropdown -->
                <li class="nav-item dropdown" >
                    <a class="nav-link dropdown-toggle fa fa-cogs" id="navbarDropdownMenuLink" data-toggle="dropdown"style="padding:15px;" aria-haspopup="true" aria-expanded="false"></a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a></a>
                        <a class="dropdown-item" href="Employees.aspx">Maintain Employess</a>
                        <a class="dropdown-item" href="Reports.aspx">Reports</a>
                        <a class="dropdown-item" href="#">Emergency Situation Type</a>
                    </div>
                </li>

            </ul>
            <!-- Links -->

            <form class="form-inline">

                <div class="md-form my-0">
                    <div>
                        <a class="form-control" id="Logout_Span" href="LoginPage.aspx">Log out</a>
                    </div>
                </div>
            </form>
        </div>
        <style>
            #Logout_Span {
                font-weight:600;
            }
                #Logout_Span:hover {
                    background-color: rgb(67, 119, 167);
                    color: black;
                    border:1px solid black;
                    cursor:pointer;
                }
        </style>
        <!-- Collapsible content -->

    </nav>
    <!--/.Navbar-->







    <form id="form1" runat="server">
        <div class="d-flex justify-content-center">
            <div class="col-md-6" style="background-color:white;box-shadow:3px 3px red;border-radius:10px">
                <div id="Modal-Header" class="fullWidth text-center" >
                    <div class="fullWidth text-center"><asp:Label ID="Label1" runat="server" Font-Bold="True" style="font-size:xx-large" Text="Reports"></asp:Label></div>
                </div>
                <div id="Modal-Body" class="row" style="border-top:1px solid lightgrey">
                    <div>
                        <asp:Label ID="Feedback" runat="server" Visible="false"></asp:Label>
                    </div>
                    <div class="fullWidth">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Select report to generate:"></asp:Label>
                        <div class="col-md-12">        
                            <asp:RadioButtonList ID="rblReports" runat="server" RepeatDirection="Horizontal" CssClass="auto-style1" style="margin:10px;" AutoPostBack="True" >
                                    <asp:ListItem>&nbsp;Emergency Situations per Province</asp:ListItem>
                                    <asp:ListItem>&nbsp;Emergency Situations per time Period</asp:ListItem>
                                    <asp:ListItem>&nbsp;Employee Log Reports</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="fullWidth">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Select province:"></asp:Label>
                        <div class="row">
                            <asp:CheckBox ID="cbLimpopo" runat="server" Text="&nbsp;Limpopo" class="col-md-3"/>
                            <asp:CheckBox ID="cbGauteng" runat="server" Text="&nbsp;Gauteng" class="col-md-3"/>
                            <asp:CheckBox ID="cbMpumalanga" runat="server" Text="&nbsp;Mpumalanga" class="col-md-3"/>
                        </div>
                        <div class="row">
                            <asp:CheckBox ID="cbNorthWest" runat="server" Text="&nbsp;North West" class="col-md-3"/>
                            <asp:CheckBox ID="cbFreestate" runat="server" Text="&nbsp;Free State" class="col-md-3"/>
                            <asp:CheckBox ID="cbKwaZuluNatal" runat="server" Text="&nbsp;KwaZulu Natal" class="col-md-3"/>
                        </div>
                        <div class="row">
                            <asp:CheckBox ID="cbNorthernCape" runat="server" Text="&nbsp;Northern Cape" class="col-md-3"/>
                            <asp:CheckBox ID="cbEasternCape" runat="server" Text="&nbsp;Eastern Cape" class="col-md-3"/>
                            <asp:CheckBox ID="cbWesternCape" runat="server" Text="&nbsp;Western Cape" class="col-md-3"/>
                        </div><br />
                    </div>
                    <div class="fullWidth">
                        <div class="row">
                            <div class="col-md-4 text-center"><asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Select User First Name:"></asp:Label></div>
                            <asp:DropDownList ID="drlFName" runat="server" DataSourceID="User_FirstName" DataTextField="EMPLOYEE" DataValueField="EMPLOYEE_ID" CssClass="col-md-6 form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="User_FirstName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMPLOYEE_ID], [EMPLOYEE_FIRSTNAME] +' '+ [EMPLOYEE_LASTNAME] as EMPLOYEE FROM [EMPLOYEE]"></asp:SqlDataSource>
                        </div><br />
                        <div class="row">
                                               
                        </div><br /> 
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-12"><asp:Label ID="lblStartDate" runat="server" Font-Bold="true" Text="Select a start date for the report:"></asp:Label></div>
                                <div class="col-md-12 "><asp:Calendar ID="StartCalendar" runat="server"></asp:Calendar></div>
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-12"><asp:Label ID="lblEndDate" Font-Bold="true" runat="server" Text="Select an end date for report:"></asp:Label></div>
                                <div class="col-md-12 justify-content-center"><asp:Calendar ID="EndCalendar" runat="server"></asp:Calendar></div><br />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="Modal_Footer" class="row" style="border-top:1px solid lightgrey;padding:20px">
                    <div class="col-md-5"><asp:Button ID="btnProvinceReport" runat="server" Text="Run Report" class="form-control btn btn-danger" OnClick="btnProvinceReport_Click"/></div><div class="col-md-2"></div>
                    <div class="col-md-5 2"><asp:Button ID="btnExtract" runat="server" Text="Extract Report" class="form-control btn btn-primary" OnClick="btnExtract_Click"/></div>
                </div>
                <p>
                  <button class="btn btn-primary fullWidth" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Show search results</button>
                </p>
                <div class="collapse" id="collapseExample">
                  <div class="card card-body">
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
                </div>              
            </div>
        </div>
    </form>
</body>
</html>
<style>
    .fullWidth {
        width: 100%;
        padding:0 10px 0 10px;
    }

    .display-none {
        display:none;
    }

    .display-initial {
        display:initial;
    }

    .auto-style1 {
        position: relative;
        width: 100%;
        -ms-flex: 0 0 100%;
        flex: 0 0 100%;
        max-width: 100%;
        left: 0px;
        top: 0px;
        padding-left: 15px;
        padding-right: 15px;
    }

</style>