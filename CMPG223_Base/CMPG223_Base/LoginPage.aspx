<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CMPG223_Base.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="container">
                <div class="d-flex justify-content-center">
                    <div class="col-md-6" style="height:40%;background-color:gray;box-shadow:5px 5px red">
                        <div id="header" class="justify-content-center" style="height:25%">
                            <div class="row">
                                <h2 class="text-center col-md-12"><i>Login to</i></h2>
                            </div>
                            <div class="row">
                                <h2 class="text-center col-md-6"><i>INSERT LOGO HERE</i></h2>
                                <img class="col-md-6" src="images-removebg-preview.png" />
                            </div>
                        </div>

                        <div id="body" style="height:50%; padding:10px 10px 10px 10px;">
                            <div class="row">
                                <label>Username</label>
                                <asp:TextBox runat="server" class="form-control" id="txtUsername"/>
                            </div>

                            <div class="row">
                                <label>Password</label>
                                <asp:TextBox runat="server"  class="form-control" id="txtPassword" TextMode="Password"/>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6 text-center">
                                    <asp:CheckBox Text="Remember User" runat="server" />
                                </div>
                                <div class="col-md-6 text-center">
                                    <a href="www.google.com" style="color:black">Forgotten Password</a>
                                </div>
                            </div>
                        </div>

                        <div id="footer" style="height:25%;padding:10px 10px 10px 10px">
                            <div class="row">
                                <div class="col align-self-center">
                                    <asp:Button Text="Login" runat="server" class="btn btn-danger col-md-12" id="btnLogin_Click" OnClick="Unnamed_Click" OnClientClick="checkInput();"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
<script>
    let LoginButtonClickedInt = 0;
    function checkInput() {
        alert(LoginButtonClickedInt);
        if (LoginButtonClickedInt < 3) {
            let PasswordObj = $("#txtPassword");
            let UsernameObj = $("#txtUsername");
            if (!PasswordObj.val() || !UsernameObj.val()) {
                alert("Invalid input");
                LoginButtonClickedInt++;
            }
        } else {
            alert('Too many attempts have been logged.');
            let btnLogin_ClickObj = $("#btnLogin_Click");
            btnLogin_ClickObj.prop('disabled', true);
        }
    }

</script>
