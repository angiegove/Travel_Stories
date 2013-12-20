  var map;

  var show_story = function(place){
    console.log('showing place');
    $('#story').html('<h2>' + place.title + '</h2><img src="'+ place.image.url +'"><p>' + place.story + '</p><br><img src="'+ place.image2.url +'"><br><img src="'+ place.image3.url +'">')
  };


          $(document).ready(function(){

            console.log(places);

            map = new GMaps({
              div: '#map',
              lat: -33.855734,
              lng: 151.18036,
              zoom: 2
            });

            var setup_marker = function(map, place, newRecord) {
              if (newRecord) {
                $('#myModal .modal-body.form').show();
                $('#myModal .modal-body.saved').hide();
                map.addMarker({
                  lat: place.latitude,
                  lng: place.longitude,
                  draggable : true,
                  dragend: function(e) {
                    var position = this.getPosition();
                    $content.find('#place_latitude').val(position.lat());
                    $content.find('#place_longitude').val(position.lng());
                  },
                  infoWindow: {
                    content: '<a href="#" id="myModalBtn" data-toggle="modal" data-target="#myModal">Tell My Story</a>'
                  },
                  icon: "/assets/pink_MarkerA.png"
                });

              }
              else {


                map.addMarker({
                  lat: place.latitude,
                  lng: place.longitude,
                  click: function(){
                    show_story(place);
                  },
                  dragend: function(e) {
                    var position = this.getPosition();
                    $content.find('#place_latitude').val(position.lat());
                    $content.find('#place_longitude').val(position.lng());
                  },
                  infoWindow: {
                    content: "<h3>"+ place.title +"</h3>"
                  },
                });
              }
            }

            $.each(places, function(index, place){
              setup_marker(map, place, false)
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
                    var place = { latitude: latlng.lat(), longitude: latlng.lng()}
                    setup_marker(map, place, true);
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
                      var place = { latitude: e.latLng.lat(), longitude: e.latLng.lng()}
                      setup_marker(this, place, true);
                    }
                  }]
                })

              })
            })



            });
