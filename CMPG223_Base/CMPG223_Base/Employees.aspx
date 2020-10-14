﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="CMPG223_Base.Employees" %>

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
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="col-md-12" style="margin:10px">
                                <asp:ListItem>&nbsp;Create new employee</asp:ListItem>
                                <asp:ListItem>&nbsp;Update employee information</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <br />
                    <div class="fullWidth display-none" id="Update_Employee">
                        <div class="text-center"><asp:Label ID="lblSelectEmp" runat="server" Font-Bold="True" Text="Select employee username:" Visible="true"></asp:Label></div><br />
                        <div class="d-flex justify-content-center">
                            <asp:DropDownList ID="dlEmpUser" runat="server" DataSourceID="CBOX_DB" DataTextField="EMPLOYEE_USERNAME" DataValueField="EMPLOYEE_USERNAME" Visible="true" CssClass="form-control col-md-6">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="CBOX_DB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EMPLOYEE_USERNAME] FROM [EMPLOYEE]"></asp:SqlDataSource>                            
                        </div>
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
                        <asp:Button ID="btnCommit" runat="server" Text="Submit" class="btn btn-primary form-control fullWidth"/>
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-danger form-control fullWidth"/>
                    </div>
                </div>
            </div>
        </div>
        <br />

        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <br />
        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <br />
        <br />
        
&nbsp;&nbsp;&nbsp;
        
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