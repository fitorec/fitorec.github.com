/**
* Returns an XMLHttp instance to use for asynchronous
* downloading. This method will never throw an exception, but will
* return NULL if the browser does not support XmlHttp for any reason.
* @return {XMLHttpRequest|Null}
*/
function createXmlHttpRequest() {
 try {
   if (typeof ActiveXObject != 'undefined') {
     return new ActiveXObject('Microsoft.XMLHTTP');
   } else if (window["XMLHttpRequest"]) {
     return new XMLHttpRequest();
   }
 } catch (e) {
   changeStatus(e);
 }
 return null;
};

/**
* This functions wraps XMLHttpRequest open/send function.
* It lets you specify a URL and will call the callback if
* it gets a status code of 200.
* @param {String} url The URL to retrieve
* @param {Function} callback The function to call once retrieved.
*/
function downloadUrl(url, callback) {
 var status = -1;
 var request = createXmlHttpRequest();
 if (!request) {
   return false;
 }

 request.onreadystatechange = function() {
   if (request.readyState == 4) {
     try {
       status = request.status;
     } catch (e) {
       // Usually indicates request timed out in FF.
     }
     if (status == 200) {
       callback(request.responseXML, request.status);
       request.onreadystatechange = function() {};
     }
   }
 }
 request.open('GET', url, true);
 try {
   request.send(null);
 } catch (e) {
   changeStatus(e);
 }
};

/**
 * Parses the given XML string and returns the parsed document in a
 * DOM data structure. This function will return an empty DOM node if
 * XML parsing is not supported in this browser.
 * @param {string} str XML string.
 * @return {Element|Document} DOM.
 */
function xmlParse(str) {
  if (typeof ActiveXObject != 'undefined' && typeof GetObject != 'undefined') {
    var doc = new ActiveXObject('Microsoft.XMLDOM');
    doc.loadXML(str);
    return doc;
  }

  if (typeof DOMParser != 'undefined') {
    return (new DOMParser()).parseFromString(str, 'text/xml');
  }

  return createElement('div', null);
}

/**
 * Appends a JavaScript file to the page.
 * @param {string} url
 */
function downloadScript(url) {
  var script = document.createElement('script');
  script.src = url;
  document.body.appendChild(script);
}


///////////////////////////////////////////////////////////////////////////////////////////
  var url_icons = './img/';
/////////////////////////////////////////////////////

var map;
var markersArray = [];

function initialize() {
	 var latlng = new google.maps.LatLng(17.077051,-96.708269);
        var myOptions = {
          zoom: 10,
		center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP          
        };
        map = new google.maps.Map(document.getElementById('map_canvas'),
            myOptions);

        /*// Try HTML5 geolocation
        if(navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = new google.maps.LatLng(position.coords.latitude,
                                             position.coords.longitude);

            var infowindow = new google.maps.InfoWindow({
              map: map,
              position: pos,
              content: 'Aqui estas'
            });

            map.setCenter(pos);
          }, function() {
            handleNoGeolocation(true);
          });
        } else {
          // Browser doesn't support Geolocation
          handleNoGeolocation(false);
        }*/
        
      }

      function handleNoGeolocation(errorFlag) {
        if (errorFlag) {
          var content = 'Error: The Geolocation service failed.';
        } else {
          var content = 'Error: Your browser doesn\'t support geolocation.';
        }

        var options = {
          map: map,
          position: new google.maps.LatLng(60, 105),
          content: content
        };

        var infowindow = new google.maps.InfoWindow(options);
        map.setCenter(options.position);
      }
google.maps.event.addDomListener(window, 'load', initialize);


//seccion control marcadores.
$(document).ready(function() {
	var botones = [
	  'bomberos',
	  'hospital',
	  'paramedico',
	  'policia',
	  'transito'
	];
	//generamos el mapeo: http://api.jquery.com/jQuery.each/
	jQuery.each(botones, function(i,boton) {
		$('#marcador_'+boton).click(function() {
			$.each(botones, function(j,b) {
					$('#marcador_'+b).removeClass('active');
			});
		$('#marcador_'+boton).addClass('active');
		//cargando los marcadores
		//http://gmaps-samples-v3.googlecode.com/svn/trunk/xmlparsing/downloadurl.html
		//primero eliminamos todos los elementos
		//La tecnica fue extraida de la doc. de google api v3
		//http://code.google.com/apis/maps/documentation/javascript/overlays.html#RemovingOverlays
		if (markersArray) {
			for (i in markersArray) {
				markersArray[i].setMap(null);
			}
			markersArray.length = 0;
		}
		
		downloadUrl("data.xml", function(data) {
		  var markers = data.documentElement.getElementsByTagName("marcador");
		  for (var i = 0; i < markers.length; i++) {
			  if( markers[i].getAttribute("tipo") != boton )
					continue;
				var latlng = new google.maps.LatLng(parseFloat(markers[i].getAttribute("lat")),
											parseFloat(markers[i].getAttribute("lng")));
				var marker = new google.maps.Marker({
					  position: latlng,
					  map: map,
					  title: markers[i].getAttribute("nombre"),
					  clickable: true,
					  icon: url_icons+boton+'.png'
				});
				markersArray.push(marker);
			}
		 });
	 //fin agregado de marcadores
	 //showMSG(boton);
	 
		});
	});
});

function showMSG(type){
 //vaciamos el contenedor.
 $('#pie_twitter_msg').empty();
 var api_url = 'http://search.twitter.com/search.json?callback=?';
  today = new Date();
  //parametros a usar
  //https://dev.twitter.com/docs/api/1/get/search
  var twitter_params = {
	  rpp:5,
	  q:type,
	  //until: today.getFullYear() + '-' + today.getUTCMonth() +  '-' + today.getUTCDate(),
	  //geocode:'17.066944,-96.720278,300km',
	  geocode:'17.066944,-96.720278,200km',
	};
	//generamos el mapeo.
	//http://api.jquery.com/jQuery.each/
	jQuery.each(twitter_params, function(i, val) {
		api_url += '&'+ i + '=' + val;
	});
  $.ajaxSetup({ cache: true });
  // Send JSON request
  // The returned JSON object will have a property called "results" where we find
  // a list of the tweets matching our request query
  $.getJSON(
    api_url,
    function(data) {
      $.each(data.results, function(i, tweet) {
        // Uncomment line below to show tweet data in Fire Bug console
        // Very helpful to find out what is available in the tweet objects
        //console.log(tweet);
        // Before we continue we check that we got data
        if(tweet.text !== undefined) {
          // Calculate how many hours ago was the tweet posted
          var date_tweet = new Date(tweet.created_at);
          var date_now   = new Date();
          var date_diff  = date_now - date_tweet;
          var hours      = Math.round(date_diff/(1000*60*60));
          // Build the html string for the current tweet
          text = tweet.text.replace(/Bombero/ig, "<em>Bombero</em>");
          text = text.replace(/hospital/ig, "<em>Hospital</em>");
          text = text.replace(/paramedico/ig, "<em>Paramedico</em>");
          text = text.replace(/Polic(í|i)a/ig, "<em>Policía</em>");
          text = text.replace(/tr(a|á)nsito/ig, "<em>Tránsito</em>");
          
          var tweet_html = '<a href="http://www.twitter.com/'+ tweet.from_user+'" ';
          tweet_html    +='title="@'+ tweet.from_user+' Hace '+hours+'hrs " target="_blank" class="item">';
          tweet_html    += '<img src="'+tweet.profile_image_url+'" alt="'+tweet.from_user+'" />';
          tweet_html    += text + '<\/a>';
          // Append html string to tweet_container div
          $('#pie_twitter_msg').append(tweet_html);
        }
      });
    }
  );
}
