<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emergency_Service.aspx.cs" Inherits="CMPG223_Base.Emergency_Service" %>

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
                    border:none;
                }
        </style>
        <!-- Collapsible content -->

    </nav>
    <!--/.Navbar-->

    <form id="form1" runat="server">
        <div class="d-flex justify-content-center">
            <div class="col-md-6" style="background-color:white;box-shadow:3px 3px red;border-radius:10px" >
                <div id="Modal-Header" class="fullWidth text-center"><br />
                    <asp:Label ID="lblEmergencyServices" runat="server" Font-Bold="True" Font-Size="Larger" Text="Emergency Services" CssClass="col-md-12 text-center mrg"></asp:Label>
                </div><br />
                <div id="Modal-Body" style="border-top:1px solid lightgrey" class="row">
                    <div class="fullWidth"><br />
                        <div class="fullWidth text-center">
                            <asp:Label ID="lblSelectAction" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Action to perform:"></asp:Label>
                        </div>
                        <div class="fullWidth"><br />
                            <asp:RadioButtonList ID="rblAction" runat="server" RepeatDirection="Horizontal" CssClass="col-md-10">
                                <asp:ListItem>&nbsp;Create new Emergency Service</asp:ListItem>
                                <asp:ListItem>&nbsp;Edit Emergency Service</asp:ListItem>
                            </asp:RadioButtonList>
                        </div><br />
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblSelectService" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Emergency Service:"></asp:Label></div>
                            <asp:DropDownList ID="drlServiceName" runat="server" DataSourceID="Emergency_Service_Name" DataTextField="EMERGENCY_SERVICE_NAME" CssClass="col-md-8 form-control" DataValueField="EMERGENCY_SERVICE_NAME">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Emergency_Service_Name" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMERGENCY_SERVICE_NAME] FROM [EMERGENCY_SERVICE]"></asp:SqlDataSource>
                        </div><br />
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblServiceID1" runat="server" Font-Bold="True" Text="Service ID:"></asp:Label></div>
                            <div class="col-md-8 text-center"><asp:Label ID="lblServiceID2" runat="server" Font-Bold="True" Text="[lblServiceID2]"></asp:Label></div>
                        </div><br />
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Name:"></asp:Label></div>
                            <asp:TextBox CssClass="col-md-8 form-control" ID="txbName" runat="server"></asp:TextBox>
                        </div><br />
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblType" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Type:"></asp:Label></div>
                            <asp:TextBox  CssClass="col-md-8 form-control" ID="txbType" runat="server"></asp:TextBox>
                        </div><br />
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblContact" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Contact:"></asp:Label></div>
                            <asp:TextBox CssClass="col-md-8 form-control" ID="txbContact" runat="server"></asp:TextBox>
                        </div><br />
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblServiceArchive" runat="server" Font-Bold="True" Text="Emergency Services Archive:&nbsp;"></asp:Label></div>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="[ticked is archived]" />
                        </div><br />                     
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblLat" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Location Latitude:"></asp:Label></div>
                            <asp:TextBox ID="txbLat" CssClass="col-md-8 form-control" runat="server"></asp:TextBox>
                        </div>    <br />                    
                        <div class="fullWidth row">
                            <div class="col-md-4 text-center"><asp:Label ID="lblLng" runat="server" Font-Bold="True" Font-Size="Medium" Text="Emergency Services Location Longitude:"></asp:Label></div>
                            <asp:TextBox ID="txbLng"  CssClass="col-md-8 form-control" runat="server"></asp:TextBox>
                        </div>  <br />                      

                    </div>
                </div>
                <div id="Modal_Footer" class="row" style="border-top:1px solid lightgrey;padding:20px">
                    <div class="col-md-4"><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="fullWidth btn btn-primary form-control" OnClick="btnSubmit_Click" /></div>
                    <div class="col-md-4"></div>
                    <div class="col-md-4"><asp:Button ID="btnExit" runat="server" Text="Cancel" CssClass="fullWidth btn btn-danger form-control"/></div>
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

</style>
