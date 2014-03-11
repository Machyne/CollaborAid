// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  var map = L.mapbox.map('map', MAP_URL).setView([34.7, 38.0], 6);
  // Pass features and a custom factory function to the map
  map.featureLayer.setGeoJSON(geoJson);
});
