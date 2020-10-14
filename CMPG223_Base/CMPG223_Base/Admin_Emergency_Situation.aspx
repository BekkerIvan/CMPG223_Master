<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Emergency_Situation.aspx.cs" Inherits="CMPG223_Base.Admin_Emergency_Situation" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <meta charset="utf-8" />
    <title></title>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
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
<body style="background-color:lightgray">
    <form id="form1" runat="server">
        <br /><br />
        <div class="container" style="background-color:white;box-shadow:2px 2px blue">
            <br />
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
                             <asp:Button ID="btnCoordinates" runat="server" Text="Get Coordinates" CssClass="btn btn-primary form-control" OnClick="btnCoordinates_Click" />
                        </div><br />
                 <div>
                      <asp:Label ID="Label3" runat="server" Text="Coordinates: " AssociatedControlID="tbCoordinates"></asp:Label>
                      <asp:TextBox ID="tbCoordinates" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox><br />
                      <asp:Button ID="btnAddEService" runat="server" Text="Add another emergency service" CssClass="btn btn-primary form-control" OnClick="btnAddEService_Click" />
                 </div>
             </div>
             <div class="col-md-6">
                 <div>
                     <asp:Label ID="lblE_Sit_Type" runat="server" Text="Type of emergency:" AssociatedControlID="ddlE_Sit_Type" ></asp:Label>
                     <asp:DropDownList ID="ddlE_Sit_Type" runat="server" CssClass="form-control" AppendDataBoundItems="true"></asp:DropDownList>
                 </div><br />
                 <div>
                    <asp:Label ID="Label2" runat="server" Text="Type of Emergency service:  " AssociatedControlID="ddlEmergencyType"></asp:Label>
                    <asp:DropDownList ID="ddlEmergencyType" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlEmergencyType_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="true" ></asp:DropDownList>
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
                    <asp:TextBox ID="tbDescription" runat="server" CssClass="form-control" TextMode="MultiLine" style="resize:none"></asp:TextBox>
                </div><br />
                <div>
                    <asp:Button ID="Submit" runat="server" Text="Submit Emergency Situation" CssClass="form-control btn btn-primary" OnClick="Submit_Click" />
                </div><br />
                <div class="col-md-6">
                    <asp:Label ID="lblFeedback" runat="server" Visible="false" AssociatedControlID="btnClear"></asp:Label><br />
                    <asp:Button ID="btnClear" runat="server" Visible="false" Text="Create new emergency situation" CssClass="form-control btn btn-primary" OnClick="btnClear_Click" />
                </div>
            </div><br />
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
        document.getElementById('map'), { zoom: 4, center: pin });
  // The marker, positioned at Uluru
    var marker = new google.maps.Marker({ position: pin, map: map });
    //return false;
}
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function-->
    <script defer="defer"
    src="https://maps.googleapis.com/maps/api/js?key=API-KEY&callback=initMap">
    </script>
    
        
    </form>
</body>
</html>
