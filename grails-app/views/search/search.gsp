<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<meta name="layout" content="main" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.pageslide.js')}" ></script>
    
    <title>Flatdigs Google Maps API test</title>
            
    <%--
    <script type="text/javascript">
    var usCenterPoint = new GLatLng(42.775855, -78.617460)
    var usZoom = 10

    function load() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map"))
        map.setCenter(usCenterPoint, usZoom)
        map.addControl(new GLargeMapControl());
        map.addControl(new GMapTypeControl()); 

          <g:each in="${properties}" var="property">
             var point${property.id} = new GLatLng(${property.latitude}, ${property.longitude})
          var marker${property.id} = new GMarker(point${property.id})
          marker${property.id}.bindInfoWindowHtml("${property.streetNumber} ${property.streetName}<br/>${property.city}, ${property.state} ${property.zip}")
             map.addOverlay(marker${property.id})
          </g:each>
      }
    }
    </script>
     --%>
    	<script src="https://www.google.com/jsapi?key=ABQIAAAAiaQdZBKzL6l3FquZrPHJixTwM0brOpm-All5BF6PoaKBxRWWERSOY_MINSAyMXM8Y6kaQsnuaTBf1w" type="text/javascript"></script>        
         <script type="text/javascript">

		
        	
            google.load("maps", "3",  {other_params:"sensor=false"});
           // google.load("jquery", "1.7.0");

            var markersArray = [];				
        	var form, chicago, options, map;			
        	
        
            google.setOnLoadCallback(function() {
                $(document).ready(function() {

				form  = $("#flatdigsSearch");

                // Create Initial Search Map with default location of Chicago
                	chicago = new google.maps.LatLng(41.934489, -87.657583);
                   
                	options = {
                			  zoom: 11,
                			  center: chicago,
                			  mapTypeId: google.maps.MapTypeId.ROADMAP
                			};
                    map = new google.maps.Map(document.getElementById('map'), options);

                    
                 // Try to find GeoLocation
                    if(navigator.geolocation) {
                      browserSupportFlag = true;
                      navigator.geolocation.getCurrentPosition(function(position) {
                        initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
                        map.setCenter(initialLocation);
                      });
                    // Try Google Gears Geolocation
                    } else if (google.gears) {
                      browserSupportFlag = true;
                      var geo = google.gears.factory.create('beta.geolocation');
                      geo.getCurrentPosition(function(position) {
                        initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
                        map.setCenter(initialLocation);
                      });
                    
                    } 

                    <g:if test="${searchParams != null && !searchParams.isEmpty()}">
                		performFlatdigsSearch();
                		
                  	</g:if>

                    form.submit(function() {
							performFlatdigsSearch();
                        // Indicate that form should not actually be submitted
                        return false; 
                    });  
                    
                });

            });

            function addMarker(marker)
            {
            	markersArray.push(marker)    
            }

            // Deletes all markers in the array by removing references to them
            function deleteOverlays() {
              if (markersArray) {
                for (i in markersArray) {
                  markersArray[i].setMap(null);
                }
                markersArray.length = 0;
              }
            }


            function performFlatdigsSearch() {
                $.post(form.attr("action"), form.serialize(), function (data) {

					// Delete Previous Markers
                	deleteOverlays();

                	var infowindow = new google.maps.InfoWindow();
                    
                    // Loop through friends list and add markers to map
                    $.each(data, function (i, item) {


                    	// Switch statement for determining property type
                    	
                    var iconLocation;
					var iconType;
					
                    if(item.comparision<33)
                    {
                        iconType = "low"
                    }
                    else if(item.comparision>66)
                    {
                        iconType = "high";
                    }
                    else
                    {
                        iconType = "medium";
                    }
                    
					switch(item.propertyType)
					{
					case "Townhouse":
					case "Lowrise":
					case "Midrise":						
					case "Highrise":
						iconLocation = "${resource(dir:'images/search/')}";
						iconLocation += iconType + "_apartment.png";
						break;
					case "House":
						<%--iconLocation = "${resource(dir:'images/search',file:'house.png')}"; --%>
						iconLocation = "${resource(dir:'images/search/')}";
						iconLocation += iconType + "_house.png";
						break;
					
					default:

					}


                        
                    var location = new google.maps.LatLng(item.latitude, item.longitude);
     	            var marker = new google.maps.Marker({
             	               position: location,
             	               map : map,
             	               icon : iconLocation,
             	               title : item.streetNumber+" "+item.streetName,
             	              });

     	           
     	            
     	           google.maps.event.addListener(marker, 'click', function() {

         	           var content;

     	        	 


        	        	 content = "<div class='flatdigsInfoWindow'><a class='propertyDetails' href='/Flatdigs/property/showDetails/"+item.id+"'><b>"+item.streetNumber+" "+item.streetName + "</b></a>" +
        	        	 		   "<br>Bedrooms: " + item	.bedrooms +
        	        	 		   "<br>Bathrooms: " + item.bathrooms +
        	        	 		   "<br>Price: " + item.price +
        	        	 		   "</div>";

     	      			infowindow.setContent(content);
     	        	 	infowindow.open(map, marker);

                        //$(".propertyDetails").bind("click", function (){alert("hello")});
     	        	 	$('a.propertyDetails').pageSlide({
     	                   width: "300px"
     	               });
     	        	 	 });
     	        						
     	            
     	            addMarker(marker);

     	           
     	              
                    });
                });

                }
        </script>
  </head>
  <body>
  <div class="form" style="float:left;padding:30px">
    <form id="flatdigsSearch" action="${createLink(controller: 'search', action: 'updateMap')}">
    
        <%--
        <p>
            <label>Street Name:</label>
            <input type="text" id="name" name="name" value=""/>
        </p>
       --%>
        
        <p>
            <label>Bedrooms:</label>
            <g:select name="bedrooms"  from="${1..6}" value="${searchParams?.bedrooms}"  />
        </p>
                
        <p>
            <label>Bathrooms:</label>
            <g:select name="bathrooms"  from="${1..6}" value="${searchParams?.bathrooms}"  />
        </p>
        <p>
            <label>Min Price Range:</label>
             <g:textField name="minPrice" value="500" />
        </p>
        <p>
            <label>Max Price Range:</label>
             <g:textField name="maxPrice" value="2000" />
        </p>
        <p class="submit">
            <input type="submit" value="Search" />
        </p>
        
    </form>
</div>
        <div id="map" style="width:600px; height:500px; float:right" /> 
        
         </body>
</html>