// location detection brains
/** TO USE: call get_location() inside of the ready() wrapper **/

// these are global
latitude = "";
longitude = "";

// this function will do an ajax call and load up the events based on your location
// Note: we should save this stuff in a cookie that does not expire so that this only happens once

	function load_events(lat, lon){
		// should reverse geocode right here and find closest address!!!
		// this should make it more obvious to the user why some events are being displayed
		coords = {
					latitude: lat,
					longitude: lon
					};
		
		$.post("./php/load_events_by_location.php", coords, function(results){
			$(".eventViewer").empty().append(results);
			});
		}
	
//main browser location detecting function
	function get_location() {
		//EXECUTES FROM THE .ready()
		//navigator.geolocation is a global broswer object
		navigator.geolocation.getCurrentPosition(show_map);
		}
	
//this is for calling the google maps thing asynchronously
	function loadScript() {
		// EXECUTES FOURTH
		console.log("appending google maps script to page");
		var script = document.createElement("script");
		script.type = "text/javascript";
		script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
		document.body.appendChild(script);
		}

//this function is the callback of the browser location detector
	function show_map(position){
		latitude = position.coords.latitude;
		longitude = position.coords.longitude;
		
		// globals
		lat = "latitude: " + latitude;
		lon = "Longitude: " + longitude;
		console.log(lat,lon);
		
		load_events(lat, lon);
		}

//on click for: "Location Wrong?"
	function open_map_selector(){
		console.log("showing map");
		$('#map_wrapper').show();
		
		// Loads the js for google maps
		loadScript();
		}
// on click for: "I'm Done!"
	function close_map_selector(){
		console.log("hiding map");
		$('#map_wrapper').hide();
		}

	function initialize() {
		//open up the map
		console.log("initializing map");
		
		//postion for marker
		var lat_m = latitude;//37.79787684894448;
		var lng_m = longitude;//-83.7020318012207;
		
		//Center of map upon init:
		var lat = latitude;//37.839479235926156;
		var lng = longitude;//-83.65678845996092;
		
		var map_center = new google.maps.LatLng(lat,lng);
		// NOTE: mapTypeId is required... lol wow.
		var myOptions = {
						center: map_center,
						zoom: 12,
						mapTypeId: google.maps.MapTypeId.ROADMAP
						};
						
		//this needs to be global because im going to call it later. A lot.
		map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
		
		//add a marker:
		you_icon = 'images/person_you.png';
		marker_pos = new google.maps.LatLng(lat_m,lng_m);
	
		marker_you = new google.maps.Marker({
				map:map,
				draggable:true,
				animation: google.maps.Animation.BOUNCE,
				position: marker_pos,
				icon: you_icon
			});
		}//end init func
