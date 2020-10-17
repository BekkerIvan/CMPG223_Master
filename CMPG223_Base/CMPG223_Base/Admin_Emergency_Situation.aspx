<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Emergency_Situation.aspx.cs" Inherits="CMPG223_Base.Admin_Emergency_Situation" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <title></title>
    <style>
       
      #map {
        height: 400px;  
        width: 100%;  
       }
      .Location {
          width:300px;
          margin-left:20px;
      }
      .GeoButton {
          margin-right:100px;
          margin-left:10px;
      }
      .Type {
          width:200px;
          margin-right:100px;
      }
      .Title {
          font-family:Arial;
          font-size:x-large;
          font-weight:700;
          text-align:center;
          margin-top:20px;
          margin-bottom:50px;
      }
      .Description {
          width:100%;
          height:150px;
      }
      .SubmitButton {
          margin:20px;
          height:50px;
      }
      .EP_ID {
          height:100px;
          width:300px;
          margin-left:850px;
      }
      
    </style>
    
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




        
<form id="form2" runat="server">
        <div class="d-flex justify-content-center">
            <div class="col-md-6" style="background-color:white;box-shadow:3px 3px red;border-radius:10px">
                            <div class="text-center">
                <asp:Label ID="lblTitle" runat="server" Text="Maintain Emergency Situations" style="font-size:xx-large"></asp:Label>
            </div><br />
                <div class="row">
                <div class="col-md-6">
                   <div>
                     <asp:Label ID="Label1" runat="server" Text="Location:  " AssociatedControlID="tbLocation"></asp:Label>
                           <asp:TextBox ID="tbLocation" runat="server" class="form-control"></asp:TextBox>
                      </div><br />
                       <div>
                             <asp:Button ID="btnCoordinates" runat="server" Text="Get Coordinates" CssClass="btn btn-primary form-control" OnClick="btnCoordinates_Click" CausesValidation="False" />
                           
                        </div><br />
                 <div>
                      <asp:Label ID="Label3" runat="server" Text="Coordinates: " AssociatedControlID="tbCoordinates"></asp:Label>
                      <asp:TextBox ID="tbCoordinates" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox><br />
                      <asp:Button ID="btnAddEService" runat="server" Text="Add another emergency service" CssClass="btn btn-primary form-control" OnClick="btnAddEService_Click" CausesValidation="False" />
                 </div>
             </div>
             <div class="col-md-6">
                 <div>
                     <asp:Label ID="lblE_Sit_Type" runat="server" Text="Type of emergency:" AssociatedControlID="ddlE_Sit_Type" ></asp:Label>
                     <asp:DropDownList ID="ddlE_Sit_Type" runat="server" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList>
                 </div><br />
                 <div>
                    <asp:Label ID="Label2" runat="server" Text="Type of Emergency service:  " AssociatedControlID="ddlEmergencyType"></asp:Label>
                    <asp:DropDownList ID="ddlEmergencyType" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlEmergencyType_SelectedIndexChanged" AppendDataBoundItems="True" ></asp:DropDownList>
                 </div><br />        
                 <div>
                     <asp:Label ID="Label4" runat="server" Text="Assign emergency personnel: " AssociatedControlID="lbPersonnel"></asp:Label>
                     <asp:ListBox ID="lbPersonnel" runat="server" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
                 </div>
                </div>
            </div>

            <div class="col-md-12">
                <div>
                    <asp:Label ID="lblDescription" runat="server" Text="Description or details of emergency situation:" AssociatedControlID="tbDescription"></asp:Label>              
                    <asp:TextBox ID="tbDescription" runat="server" CssClass="form-control" TextMode="MultiLine" style="resize:none;height:250px"></asp:TextBox>
                </div><br />
                <div>
                    <asp:Button ID="Submit" runat="server" Text="Submit Emergency Situation" CssClass="form-control btn btn-danger" OnClick="Submit_Click" CausesValidation="False" />
                </div><br />
                <div class="col-md-12">
                    <asp:Label ID="lblFeedback" runat="server" Visible="false" AssociatedControlID="btnClear"></asp:Label><br />
                    <asp:Button ID="btnClear" runat="server" Visible="false" Text="Create new emergency situation" CssClass="form-control btn btn-primary" OnClick="btnClear_Click" CausesValidation="False" />
                </div>
            </div><br />






            </div>
            <br />

        </div>
         <h3>My Google Maps Demo</h3>
    <!--The div element for the map -->
    <div id="map"></div>
    <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var pin = {lat: <%=lat%>, lng: <%=lng%>};
  // The map, centered at Uluru
    var map = new google.maps.Map(
        document.getElementById('map'), { zoom: 10, center: pin });
  // The marker, positioned at Uluru
    var marker = new google.maps.Marker({ position: pin, map: map });
    //return false;
}
    </script>
 
    <script defer="defer"
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGi-pgCiTiXbNVa7pnLMHieEzb3oUW5Oo&callback=initMap">
    </script>
    
        
    </form>
</body>
</html>
