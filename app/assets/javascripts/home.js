// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  var map = L.mapbox.map('map', MAP_URL).setView([36.569095, 36.259985], 10);
  // Pass features and a custom factory function to the map
  var ML = L.mapbox.markerLayer(geoJson, {sanitizer: function(s){return s}}).addTo(map);

  $('#showhide').click(function(){
    $('#fullform').collapse("toggle");
    if (this.innerHTML.trim()!='Hide'){
      this.innerHTML='Hide';
    }else{
      this.innerHTML='More...';
    };
  });

  $('#clearS').click(function(){
    $('#check-sector').find(':checked').each(function() {
       $(this).removeAttr('checked');
    });
  });

  $('#clearB').click(function(){
    $('#check-bens').find(':checked').each(function() {
       $(this).removeAttr('checked');
    });
  });

  $('form[name=filter]').submit(function(){
    formData = $('form[name=filter]').serializeArray();
    var sh = $('#showhide').get(0);
    if (sh.innerHTML.trim()!='More...'){
      sh.innerHTML='More...';
      $('#fullform').collapse("toggle");
    };
    $.get("/search", formData).done(function(projs) {
      var geoJson = {
        type: 'FeatureCollection',
        features: projs
      };
      ML.setGeoJSON(geoJson);
    });
    return false;
  });
});
