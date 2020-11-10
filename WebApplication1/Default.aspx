<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>




<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
	<title>Maps</title>
	<link rel="stylesheet" type="text/css" href="Content/estilo.css">
</head>

    <div class="jumbotron">
        <h1>FoodAPP JRZ
            <%--<input type="button" value="test button" onclick="te()" />--%>
        </h1>
        <p class="lead">es una plataforma donde podra encontrar lugares en donde comer mediante un presupuesto</p>
        <p class="lead">&nbsp;</p>
        <p class="lead">
            <asp:Label ID="Label1" runat="server" Text="Ingrese su presupuesto"></asp:Label>
        </p>
        <p class="lead">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p><a  id="botonid" onclick="te()" class="btn btn-primary btn-lg">Buscar &raquo;</a></p>
        <style>
    #map{
      height:400px;
      width:100%;
    }
  </style>
</head>
<body>

  <div id="map"></div>
    <script>

        function LoadMap(locations)
        {
            

            var map = new google.maps.Map(document.getElementById('map'), {
            
                zoom: 18,
                center: new google.maps.LatLng(31.685568, -106.4104472),
                disableDefaultUI: true,
                featureType: 'poi.business',
                elementType: 'labels',
                stylers: [
    { visibility: 'off' }
                ],
                mapTypeId: google.maps.MapTypeId.R
            });

            var infowindow = new google.maps.InfoWindow;

            var marker, i;

            for (i = 0; i < locations.length; i++) {
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                    map: map
                });

                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                    return function () {
                        //infowindow.setContent(locations[i][0]);
                        infowindow.setContent(
                         "<div><strong>" +
                           locations[i][0] +
                           "</strong><br>" +
                           "Platillo: " +
                           locations[i][4] +
                           "<br>" +
                           "Precio:"+ locations[i][5] +
                           "</div>"
                       );
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }
        }
        function te()
        {
            var vae = document.getElementById('<%= TextBox1.ClientID %>');
            var locations = new Array();
            var objectt = new Array();
            $.ajax({
                method: "POST",
                url: "Default.aspx/Test",
                data: JSON.stringify({ text: vae.value }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (info) {
                    JsonP = $.parseJSON(info.d);
                    for (var i = 0; i < JsonP.length; i++) {
                        console.log(JsonP[i].Lugar);
                        objectt = locations.push([JsonP[i].Lugar, parseFloat(JsonP[i].East), parseFloat(JsonP[i].Weast), i + 1, JsonP[i].Producto, JsonP[i].Precio]);
               
                        
                    }
                    LoadMap(locations);
                    jsonstring = info.d;
                }
            });


           
        }
      
  </script>
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBATuXThARVMVKFK2-5dHcXq904CnT9sJQ&callback=te22">
    </script>
	

    </div>
</asp:Content>
