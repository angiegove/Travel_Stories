      var map;
          $(document).ready(function(){

            map = new GMaps({
              div: '#map',
              lat: -33.855734,
              lng: 151.18036
            });

            $.get('/assets/places.json').done(function(locations) {
              console.log(locations)
              $.each(locations, function (i, loc) {
                console.log(loc)
                map.addMarker({
                  lat: loc.lat,
                  lng: loc.long,
                  title: loc.caption,
                  click: function(e) {
                    console.log(e)
                    $('#story').text(e.title);
                    }
                  })
                })

              });
            });
