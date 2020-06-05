// Reinit map (if already initialized)
var container = L.DomUtil.get('map');
if(container != null) {
  container._leaflet_id = null;
}

// Init and custom map
var map = L.map('map').setView([46.779, 6.637], 15);
// Center map on the user position (if the user agrees to share its location)
map.locate({ setView : true, maxZoom : 17 });

// Add map base: OpenStreetMap
L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
}).addTo(map);

// Get map click
var marker = {};
map.on('click', onMapClick);

// Function to add new marker (and delete old marker)
function onMapClick(ev) {
  if (marker != undefined) {
    map.removeLayer(marker);
  }
  marker = L.marker(ev.latlng).addTo(map);
  var div = document.getElementById('location');
  div.innerHTML = "<input type='hidden' name='place[geometry]' id='place_geometry' value='POINT(" + ev.latlng.lng + " " + ev.latlng.lat + ")'>";
}
