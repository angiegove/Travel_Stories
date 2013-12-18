      var map;
          $(document).ready(function(){

            map = new GMaps({
              div: '#map',
              lat: -33.855734,
              lng: 151.18036
            });

            $('#map_search').submit(function (event) {
              event.preventDefault();
              GMaps.geocode({
                address: $('#address').val(),
                callback: function(results, status) {
                  if (status == 'OK') {
                    var latlng = results[0].geometry.location;
                    map.setCenter(latlng.lat(), latlng.lng());
                    map.addMarker({
                      lat: latlng.lat(),
                      lng: latlng.lng()
                    });
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
                      var query = '?lat=' + e.latLng.lat() + '&lng=' + e.latLng.lng();
                      this.addMarker({
                        lat: e.latLng.lat(),
                        lng: e.latLng.lng(),
                        title: 'New marker',
                        infoWindow: {
                          content: $('#myModalBtn')[0]
                        }
                      });
                    }
                  }]
                })
                // map.addMarker({
                //   lat: loc.lat,
                //   lng: loc.long,
                //   title: loc.caption,
                //   click: function(e) {
                //     infoWindow: {
                //       content: '<p>HTML Content</p>'
                //     };
                //     console.log(e)
                //     $('#story').text(e.title);

                //     }
              })
            })


            });
