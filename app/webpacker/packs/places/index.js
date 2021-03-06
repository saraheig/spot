var language = getCookie('language');

// Reinit map (if already initialized)
var container = L.DomUtil.get('map');
if(container != null) {
  container._leaflet_id = null;
}

// Init and custom map
var map = L.map('map');
map.setView([46.779, 6.641], 15);
// Center map on the user position (if the user agrees to share its location)
map.locate({ setView : true, maxZoom : 18 });

// Add map base: OpenStreetMap
L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
}).addTo(map);

// Get and add approved places in the map
var places = JSON.parse(document.querySelector('#map').dataset.places);
places.forEach(function(place) {
  L.geoJSON(place.geometry).addTo(map).bindPopup('<a href="' + place.id + '">' + place.titles[language] + '</a>');
});

// Get the language from the related cookie
function getCookie(name) {
  var cookieArray = document.cookie.split(";");
  for(var i = 0; i < cookieArray.length; i++) {
    var cookie = cookieArray[i].split("=");
    if(name == cookie[0].trim()) {
      return decodeURIComponent(cookie[1]);
    }
  }
  // Default value: English
  return 'en';
}
