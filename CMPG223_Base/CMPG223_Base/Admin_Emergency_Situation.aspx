<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Emergency_Situation.aspx.cs" Inherits="CMPG223_Base.Admin_Emergency_Situation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
<body>
    <form id="form1" runat="server">
        
        <div class="Title">
            <asp:Label ID="lblTitle" runat="server" Text="Maintain Emergency Situations"></asp:Label>
        </div>

        <div>
            <asp:Label ID="Label1" runat="server" Text="Location:  "></asp:Label>
            <asp:TextBox ID="tbLocation" runat="server" CssClass="Location"></asp:TextBox>
            <asp:Button ID="btnCoordinates" runat="server" Text="Get Coordinates" CssClass="GeoButton" OnClick="btnCoordinates_Click" />
            <asp:Label ID="Label2" runat="server" Text="Type of Emergency:  "></asp:Label>
            <asp:DropDownList ID="ddlEmergencyType" runat="server" CssClass="Type" OnSelectedIndexChanged="ddlEmergencyType_SelectedIndexChanged" >
            </asp:DropDownList>
            <asp:Label ID="Label4" runat="server" Text="Assign emergency personnel: "></asp:Label>
            
            <div>
                <asp:Label ID="Label3" runat="server" Text="Coordinates: "></asp:Label>
                <asp:TextBox ID="tbCoordinates" runat="server" ReadOnly="true"></asp:TextBox>
                <asp:ListBox ID="lbPersonnel" runat="server" CssClass="EP_ID"></asp:ListBox>
            </div>
            <div style="margin-top:10px">
                <asp:Label ID="lblDescription" runat="server" Text="Description or details of emergency situation:"></asp:Label>              
                <asp:TextBox ID="tbDescription" runat="server" CssClass="Description" TextMode="MultiLine"></asp:TextBox>

            </div>
            <div><asp:Button ID="Submit" runat="server" Text="Submit Emergency Situation" CssClass="SubmitButton" OnClick="Submit_Click" /></div>
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
