module(..., package.seeall)

function getMap() 
    local path = system.pathForFile( "map.html", system.DocumentsDirectory)
    local path2 = system.pathForFile( "edw1.jpg", system.DocumentsDirectory)
    height = display.contentHeight/2
    width = display.contentWidth/2
    local htmlFile = io.open( path, "r" )
    if not htmlFile then  
        local mapString = [[
        <!DOCTYPE html>
        <html>
            <head>
                <style>
                    #distance {
                    display: none;
                    }
                    #target {
                        width: 345px;
                    }
                    html, body {
                        height: 100%;
                        margin: 0;
                        padding: 0;
                      }
                    #aboveMap {


                    }
                    #map-canvas, #map_canvas {
                        height: 60%;
                        -webkit-transform: rotate(30deg);
                        transform: rotate(30deg); 
                    }
                    @media print {
                        html, body {
                            height: auto;
                        }
                    }

                    #panel {
                        position: absolute;
                        top: 5px;
                        left: 50%;
                        margin-left: -180px;
                        z-index: 5;
                        background-color: #fff;
                        padding: 5px;
                        border: 1px solid #999;
                    }
                </style>
                <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
                <meta charset="utf-8">
                <title>45° imagery</title>
                <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
                <script>
                    var map;
                    var mapOptions;
                    var i = 30;
                    var officeLOC = "Koramangala, Bangalore"
                    var input = document.getElementById('target');
                    function initialize() {
                        mapOptions = {
                            center: new google.maps.LatLng(12.9562, 77.7019),
                            zoom: 18,
                            mapTypeId: google.maps.MapTypeId.MAP,
                            heading: 90,
                            maxZoom :34,
                            disableDefaultUI : true,
                            tilt: 45
                          };
                        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                        var input = document.getElementById('target');
                        var autoComplete = new google.maps.places.Autocomplete(input);
                        /* var defaultBounds = map.getBounds();
                        map.fitBounds(defaultBounds);
                        var autoComplete = new google.maps.places.Autocomplete(input);
                        google.maps.event.addListener(searchBox, 'places_changed', function() {
                        var place = autoComplete.getPlaces(); */

                    }

                    function getDirections(){
                        var userLOC = document.getElementById('target').value;
                        var directionsService = new google.maps.DirectionsService();
                            var directionsRequest = {
                                origin: officeLOC,
                                destination: userLOC,
                                travelMode: google.maps.DirectionsTravelMode.DRIVING,
                                unitSystem: google.maps.UnitSystem.METRIC
                            };
                            directionsService.route(
                                directionsRequest,
                                function(response, status)
                                {
                                    if (status == google.maps.DirectionsStatus.OK)
                                    {
                                        new google.maps.DirectionsRenderer({
                                        map: map,
                                        directions: response
                                        });
                                    }
                                    else
                                        $("#error").append("Unable to retrieve your route<br />");
                                }
                            ); 
                            
                            getDistance(userLOC , officeLOC);
                    }
                    
                    

                    function getDistance(userLOC , officeLOC){
                        var xmlhttp=new XMLHttpRequest();
                        xmlhttp.open("GET","http://maps.googleapis.com/maps/api/distancematrix/json?origins="+officeLOC+"&destinations="+userLOC+"&sensor=false",true);
                        xmlhttp.send();
			xmlhttp.onreadystatechange = function() {
 				if(xmlhttp.readyState == 4) {
					//ResponseJSON =  xmlhttp.responseText;
			        	alert((JSON.parse(xmlhttp.responseText)).rows[0].elements[0].distance.text);
                                        //document.getElementById("distance").innerHTML=JSON.parse(xmlhttp.responseText)).rows[0].elements[0].distance.text;
                                        //document.getElementById("distance").style="display:block";
				}
    			}

                    }
                    function rotate90() {
                        var heading = map.getHeading() || 0;
                        map.setHeading(heading + 90);
                    }

                    function rotateCircle() {
                        i = i+30;
                        document.getElementById("map-canvas").style['-webkit-transform'] = 'rotate('+i+'deg)';
                        document.getElementById("map-canvas").style['transform'] = 'rotate('+i+'deg)';    
                    }
                    google.maps.event.addDomListener(window, 'load', initialize);
                </script>
            </head>
            <body>
                <div id="panel">
                    <input id="target" type="text" placeholder="Search Box">
                    <input type="button" value="Get Directions" onclick="getDirections();" >
                    <!-- img src =" ]]..path2.. [[ " -->
                    <p id="distance"></p>
                </div>
                <div id = "aboveMap" style = "position: absolute; z-index: 100; opacity : 0.8;"></div>
                <input type="button" value="Auto Rotate" onclick="rotateCircle();" style="top:]]..height..[[px; position: absolute; z-index: 100; left:]]..width..[[px;">

                <div id="map-canvas"></div>
            </body>
        </html>]]
        htmlFile = io.open( path, "w" )
        htmlFile:write( mapString )
    end
    htmlFile:close()
end

