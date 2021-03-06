// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  var map = L.mapbox.map('map', MAP_URL).setView([36.569095, 36.259985], 10);
  // Pass features and a custom factory function to the map
  var ML = L.mapbox.markerLayer(geoJson, {sanitizer: function(s){return s}}).addTo(map);
  ML.on('layeradd', function(e) {
    var marker = e.layer;
    var feature = marker.feature;
    marker.setIcon(L.icon(feature.properties.icon));
  });
  ML.addTo(map);
  ML.setGeoJSON(geoJson);

  $('#showhide').click(function(){
    $('#fullform').collapse("toggle");
    if (this.innerHTML.trim()!='Hide'){
      this.innerHTML='Hide';
    }else{
      this.innerHTML='More...';
    };
  });

  function myCancelBubble(evnt){
    evnt.stopPropagation();
    evnt.preventDefault();
    var evt=window.event;
    if('event' in window) evt=evt||event;
    if(typeof evt !== 'undefined'){
      if(evt.stopPropagation) evt.stopPropagation();
      evt.cancelBubble=true;
    };
    return false;
  };

  // $('#searchbar').click(function(evnt){
  //   return myCancelBubble(evnt);
  // });
  $('#searchbar').dblclick(function(evnt){
    return myCancelBubble(evnt);
  });
  // $('#searchbar').on('scroll', function(evnt){
  //   return myCancelBubble(evnt);
  // });

  $('#clearS').click(function(){
    $('#check-sector').find(':checked').each(function() {
       $(this).removeAttr('checked');
    });
    updateMap();
  });

  $('#clearB').click(function(){
    $('#check-bens').find(':checked').each(function() {
       $(this).removeAttr('checked');
    });
    updateMap();
  });

  function updateMap(){
    formData = $('form[name=filter]').serializeArray();
    $.get("/search", formData).done(function(projs) {
      var geoJson = {
        type: 'FeatureCollection',
        features: projs
      };
      ML.setGeoJSON(geoJson);
    });
  }

  $('form[name=filter]').submit(function(){
    var sh = $('#showhide').get(0);
    if (sh.innerHTML.trim()!='More...'){
      sh.innerHTML='More...';
      $('#fullform').collapse("toggle");
    };
    updateMap();
    return false;
  });

  $('form[name=filter] input[type=checkbox]').click(updateMap);
});
