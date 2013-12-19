      var map;
          $(document).ready(function(){

            console.log(places);

            map = new GMaps({
              div: '#map',
              lat: -33.855734,
              lng: 151.18036
            });

            var setup_marker = function(map, lat, lng) {
              map.addMarker({
                lat: lat,
                lng: lng,
                draggable : true,
                dragend: function(e) {
                  var position = this.getPosition();
                  $content.find('#place_latitude').val(position.lat());
                  $content.find('#place_longitude').val(position.lng());
                },
                infoWindow: {
                  content: $("#myModalBtn")[0]
                }
              });
            }

            $.each(places, function(index, place){
              setup_marker(map, place.latitude, place.longitude)
            });

            $('#map_search').submit(function (event) {
              event.preventDefault();
              GMaps.geocode({
                address: $('#address').val(),
                callback: function(results, status) {
                  if (status == 'OK') {


                    var latlng = results[0].geometry.location;

                    $content = $('#myModal');
                    $content.find('#place_latitude').val(latlng.lat());
                    $content.find('#place_longitude').val(latlng.lng());

                    //console.log(latlng.lat());
                    map.setCenter(latlng.lat(), latlng.lng());

                    setup_marker(map, latlng.lat(), latlng.lng());
                  }
                }
              });
            });
            // Adding markers manualy

            $.get('/assets/places.json').done(function(locations) {
              console.log(locations)
              $.each(locations, function (i, loc) {
                console.log(loc)
                map.setContextMenu({
                  control: 'map',
                  options: [{
                    title: 'Add marker',
                    name: 'add_marker',
                    action: function(e) {
                      //var query = '?lat=' + e.latLng.lat() + '&lng=' + e.latLng.lng();
                      $content = $('#myModal');
                      $content.find('#place_latitude').val(e.latLng.lat());
                      $content.find('#place_longitude').val(e.latLng.lng());

                      setup_marker(this, e.latLng.lat(), e.latLng.lng());
                    }
                  }]
                })

              })
            })


            });
