<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>




<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
	<title>Maps</title>
	<link rel="stylesheet" type="text/css" href="Content/estilo.css">
</head>

    <div class="jumbotron">
        <h1>FoodAPPJRZ
            <input type="button" value="test button" onclick="te()" />
        </h1>
        <p class="lead">Prueba 1 Desde Maquina Virtual Server UACJ</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
        <style>
    #map{
      height:400px;
      width:100%;
    }
  </style>
</head>
<body>
  <h1>My Google Map</h1>

  <div id="map"></div>
    <script>
        
        //var baseurl = "https://foodappjrz.000webhostapp.com/Select_Menu.php";
        //function Test() {
        //    fetch("https://foodappjrz.000webhostapp.com/Select_Menu.php")
        //    .then((respuesta) =>{
        //        return respuesta.json();
        //    }).then((respuesta)=>{
        //        console.log(respuesta.volume);
        //    })

        //}
      
        function LoadMap(locations)
        {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: new google.maps.LatLng(31.685568, -106.4104472),
                mapTypeId: google.maps.MapTypeId.ROADMAP
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
                        infowindow.setContent(locations[i][0]);
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }
        }
        function te()
        {
            var locations = new Array();
            var objectt = new Array();
            $.ajax({
                method: "POST",
                url: "Default.aspx/Test",
                data: "",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (info) {
                    JsonP = $.parseJSON(info.d);
                    for (var i = 0; i < JsonP.length; i++) {
                        console.log(JsonP[i].Lugar);
                        objectt = locations.push([JsonP[i].Lugar, parseFloat(JsonP[i].East), parseFloat(JsonP[i].Weast), i+1]);
                        //locations.push(objectt);



     //                   var locations = [
     //['Title A', 3.180967, 101.715546, 1],
     //['Title B', 3.200848, 101.616669, 2],
     //['Title C', 3.147372, 101.597443, 3],
     //['Title D', 3.19125, 101.710052, 4]
     //                   ];
                       
                        
                    }
                    LoadMap(locations);
                    jsonstring = info.d;
                }
            });


           
        }
        //function CallCClass()
        //{
        //    var JsonP;
        //    jsonstring="";
        //    //$.ajax({
        //    //    method: "POST",
        //    //    url: "Default.aspx/Test",
        //    //    data: "",
        //    //    contentType: "application/json; charset=utf-8",
        //    //    dataType: "json"
        //    //}).done(function (info) {
        //    //    JsonP = $.parseJSON(info.d);
        //    //    for (var i = 0; i < JsonP.length; i++) {
        //    //        console.log(JsonP[i].Lugar);
        //    //        jsonstring=info.d;
        //    //        //addMarker(sonP[i]);
        //    //    }
        //    //})

        //    $.ajax({
        //        method: "POST",
        //        url: "Default.aspx/Test",
        //        data: "",
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (info)
        //        {
        //            JsonP = $.parseJSON(info.d);
        //                for (var i = 0; i < JsonP.length; i++) {
        //                    console.log(JsonP[i].Lugar);
                            
        //                    //addMarker(sonP[i]);
        //                }
        //                jsonstring = info.d;
        //        }
        //    });


        //    return jsonstring;
           
        //}
     

    //    function initMap() {
    //        //CallCClass();
    //  // Map options
    //  var options = {

    //    zoom:15,
    //    center: { lat: 31.6863321, lng: -106.4120069 }
    //  }


    //  // New map
    //  var map = new google.maps.Map(document.getElementById('map'), options);

    
    //  // Array of markers
    //  var markers = [
    //    {
    //      coords:{lat:42.4668,lng:-70.9495},
    //      iconImage:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
    //      content:'<h1>Lynn MA</h1>'
    //    },
    //    {
    //      coords:{lat:42.8584,lng:-70.9300},
    //      content:'<h1>Amesbury MA</h1>'
    //    },
    //    {
    //      coords:{lat:42.7762,lng:-71.0773}
    //    }
    //  ];

    //        // Loop through markers
    //  var Array = CallCClass();
    //  for (var i = 0; i < Array.length; i++) {
    //      // Add marker
         
    //      addMarker(Array[i]);
    //  }
    //        // coords:{lat:42.4668,lng:-70.9495},
    //  function addMarker(props) {
    //      var marker = new google.maps.Marker({
    //          position: { lat: JsonP.East, lng: JsonP.Weast},
    //          map: map,
    //          //icon:props.iconImage
    //      });

    //        // Add Marker Function
    //        /*
    //  function addMarker(props){
    //    var marker = new google.maps.Marker({
    //      position:props.coords,
    //      map:map,
    //      //icon:props.iconImage
    //    });*/

    //    // Check for customicon
    //    if(props.iconImage){
    //      // Set icon image
    //      marker.setIcon(props.iconImage);
    //    }

    //    // Check content
    //    if(props.content){
    //      var infoWindow = new google.maps.InfoWindow({
    //        content:props.content
    //      });

    //      marker.addListener('click', function(){
    //        infoWindow.open(map, marker);
    //      });
    //    }

         

    //  }
    //}
  </script>
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBATuXThARVMVKFK2-5dHcXq904CnT9sJQ&callback=te">
    </script>
	

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

    </div>
</asp:Content>
