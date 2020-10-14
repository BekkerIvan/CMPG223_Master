<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CMPG223_Base.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
</head>
<body style="background-color:rgb(67, 119, 167)">
    <form id="form1" runat="server">
        <div data-include="TestPage.html"></div>
        <br />
        <br />
        <br />
        <div class="d-flex justify-content-center" >
            <div class="col-md-6" style="background-color:white;box-shadow:3px 3px red;border-radius:10px" />
                <div id="modal_Header" class="row">
                    <div class="col-md-12">
                        <img class="fullWidth" style="height:200px;object-fit:contain;" alt="C-Box.logo" src="C-BOX.png" height="150px">
                    </div>
                </div><br />
                <div id="modal_Body" class="row">
                    <div class="fullWidth">
                        <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername">Username</asp:Label>
                        <asp:TextBox runat="server" id="txtUsername" class="form-control fullWidth" /><br />
                    </div>
                    <div class="fullWidth">
                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password</asp:Label>
                        <asp:TextBox runat="server" id="txtPassword" class="form-control fullWidth" TextMode="Password"/>
                    </div>
                    <div class="row fullWidth">
                        <div class="col-md-6"><br />
                            <asp:CheckBox ID="cbRememberMe" runat="server" Text="Remember Me"/>
                        </div>
                        <div class="col-md-6"><br />
                            <a href="" style="color:black">Forgotten Password</a>
                        </div>
                    </div>
                </div><br />
                <div id="modal_Footer" class="row">
                    <div class="fullWidth">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-danger form-control" Text="Login" OnClick="btnLogin_Click"/>
                    </div>
                </div><br />
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

</style>
<script>
    function myHTMLInclude() {
        var z, i, a, file, xhttp;
        z = document.getElementsByTagName("*");
        for (i = 0; i < z.length; i++) {
            if (z[i].getAttribute("w3-include-html")) {
                a = z[i].cloneNode(false);
                file = z[i].getAttribute("w3-include-html");
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        a.removeAttribute("w3-include-html");
                        a.innerHTML = xhttp.responseText;
                        z[i].parentNode.replaceChild(a, z[i]);
                        myHTMLInclude();
                    }
                }
                xhttp.open("GET", file, true);
                xhttp.send();
                return;
            }
        }
    }
</script>

