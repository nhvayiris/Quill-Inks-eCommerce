/* ======================================================================== 
                              Google Map Javascript
                             Referenced from Google Maps API
                  This javascript is used for dynamic mapload!
   ======================================================================== */

var map;
function initialize() {
    var latlng = new google.maps.LatLng(4.885724, 114.931686);
    var myOptions = {
        zoom: 18,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map"), myOptions);
    var marker = new google.maps.Marker
    (
        {
            position: new google.maps.LatLng(4.885724, 114.931686),
            map: map,
            title: 'Find us here!'
        }
    );
    var infowindow = new google.maps.InfoWindow({
        content: 'We are here!'
    });
    google.maps.event.addListener(marker, 'click', function () {
        // Calling the open method of the infoWindow 
        infowindow.open(map, marker);
    });
}


