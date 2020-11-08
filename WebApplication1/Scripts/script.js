function iniciarMap(){
    var coord = { lat: 31.601421, lng: -106.3976961 };
    var map = new google.maps.Map(document.getElementById('map'),{
      zoom: 15,
      center: coord
    });
    var marker = new google.maps.Marker({
      position: coord,
      map: map
    });
}