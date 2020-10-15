<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="CMPG223_Base.Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <title></title>
</head>
<body style="background-color:rgb(67, 119, 167);">
        <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-color">

        <!-- Navbar brand -->
        <a class="navbar-brand" href="#">Navbar</a>

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
                    <a class="nav-link" href="#">
                        Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>

                <!-- Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">Dropdown</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>

            </ul>
            <!-- Links -->

            <form class="form-inline">
                <div class="md-form my-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"/>
                </div>
            </form>
        </div>
        <!-- Collapsible content -->

    </nav>
    <!--/.Navbar-->
    <form id="form1" runat="server">
        <br />
        <div class="d-flex justify-content-center">
            <div class="col-md-6" style="background-color:white;box-shadow:3px 3px red;border-radius:10px" >
                <div id="Modal-Header" class="fullWidth text-center"><br />
                    <asp:Label ID="Label1" runat="server" Text="Employee Maintenance" CssClass="col-md-12 text-center mrg" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </div><br />
                <div id="Modal-Body" style="border-top:1px solid lightgrey" class="row">
                    <div class="fullWidth"><br />
                        <div class="text-center"><asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Select action to perform:"></asp:Label></div>
                        <div class="fullWidth">        
                            <asp:RadioButtonList ID="rblAction" runat="server" RepeatDirection="Horizontal" CssClass="col-md-12" style="margin:10px" AutoPostBack="True" OnSelectedIndexChanged="rblAction_SelectedIndexChanged1">
                                <asp:ListItem>&nbsp;Create new employee</asp:ListItem>
                                <asp:ListItem>&nbsp;Update employee information</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <br />
                    <div id="Update_Employee" class="fullWidth" style="padding-bottom:20px">
                        <div class="row">
                            <div class="text-center col-md-4"><asp:Label ID="lblSelectEmp" runat="server" Font-Bold="True" Text="Select Employee:" Visible="False"></asp:Label></div><br />
                            <asp:DropDownList ID="drlUserName" runat="server" DataSourceID="CBOX_DB" DataTextField="EMPLOYEE_USERNAME" DataValueField="EMPLOYEE_USERNAME" Visible="False" CssClass="fullWidth form-control col-md-6" AutoPostBack="True" OnSelectedIndexChanged="drlUserName_SelectedIndexChanged1" Width="300px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="CBOX_DB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMPLOYEE_USERNAME] FROM [EMPLOYEE]"></asp:SqlDataSource></div>                            

                    </div>
                    <div class=" fullWidth ">
                        <div id="lblEmployeeID_Div" class="row display-none" style="padding-bottom:20px">
                            <div class="col-md-4 text-center"><asp:Label ID="Label11" runat="server" Text="Employee ID:"></asp:Label></div>
                            <div class="col-md-6 text-center"><asp:Label ID="lblEmp_ID" runat="server">asd</asp:Label></div>
                        </div>
                        <div id="txtFirstName_Div" class="row" style="padding-bottom:20px">
                            <div class="col-md-4 text-center" style="padding-top:5px"><asp:Label ID="Label2" style="padding-top:10px" runat="server" Font-Bold="True" Text="First Name:"></asp:Label></div>
                            <asp:TextBox ID="txbFName" runat="server" class="fullWidth col-md-6 form-control"></asp:TextBox>
                        </div>
                        <div id="txtLastname_Div" class="row" style="padding-bottom:20px">
                            <div class="col-md-4 text-center" style="padding-top:5px"><asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Last Name:"></asp:Label></div>
                            <asp:TextBox ID="txbLName" runat="server" class="fullWidth col-md-6 form-control"></asp:TextBox>
                        </div>
                        <div id="txtUsername_Div" class="row" style="padding-bottom:20px">
                            <div class="col-md-4 text-center" style="padding-top:5px"><asp:Label ID="Label5" runat="server" Font-Bold="True" Text="User Name:"></asp:Label></div>
                            <asp:TextBox ID="txbUName" runat="server" class="fullWidth col-md-6 form-control"></asp:TextBox>
                            <asp:Label ID="lblInvalid" runat="server" Text="Invalid user name" Visible="False" ForeColor="#FF3300"></asp:Label>
                        </div>
                        <div id="txtPassword_Div" class="row" style="padding-bottom:20px">
                            <div class="col-md-4 text-center" style="padding-top:5px"><asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Password:"></asp:Label></div>
                            <asp:TextBox ID="txbPassword" runat="server" class="fullWidth col-md-6 form-control"></asp:TextBox>
                        </div>
                        <div id="txtContactNumber_Div" class="row" style="padding-bottom:20px">
                            <div class="col-md-4 text-center" style="padding-top:5px"><asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Contact Number:"></asp:Label></div>
                            <asp:TextBox ID="txbCNum" runat="server" class="fullWidth col-md-6 form-control"></asp:TextBox>
                        </div>
                        <div id="txtUserRole_Div" class="row" style="padding-bottom:20px">
                            <div class="col-md-4 text-center" style="padding-top:5px"><asp:Label ID="Label8" runat="server" Font-Bold="True" Text="User Role:"></asp:Label></div>
                                <asp:RadioButtonList ID="rblUserRole" runat="server" RepeatDirection="Horizontal" CssClass="col-md-6">
                                    <asp:ListItem>&nbsp;Admin</asp:ListItem>
                                    <asp:ListItem>&nbsp;Operator</asp:ListItem>
                                    <asp:ListItem>&nbsp;Inactive</asp:ListItem>
                                </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
                <div id="Modal_Footer" class="row" style="border-top:1px solid lightgrey;padding:20px">
                    <div class="col-md-6">
                        <asp:Button ID="btnCommit" runat="server" Text="Submit" class="btn btn-primary form-control fullWidth" OnClick="btnCommit_Click1"/>
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-danger form-control fullWidth"/>
                    </div>
                </div>
            </div>
        </div>
        <br />
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