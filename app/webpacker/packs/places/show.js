// Reinit map (if already initialized)
var container = L.DomUtil.get('map');
if(container != null) {
  container._leaflet_id = null;
}

// Init map
var map = L.map('map');

// Add map base: OpenStreetMap
L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
}).addTo(map);

// Display the place in the map
var place = JSON.parse(document.querySelector('#map').dataset.place);
L.geoJSON(place.geometry).addTo(map);

// Center the map on the place position
map.setView([place.geometry.coordinates[1], place.geometry.coordinates[0]], 17);
