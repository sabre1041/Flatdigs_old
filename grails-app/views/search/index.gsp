<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<meta name="layout" content="main" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
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
  </head>
  <body>
            <g:form action="search" >
            <g:hiddenField name="searchform" />
                <div class="dialog">
                            <p>
            <label>Bedrooms:</label>
            <g:select name="bedrooms"  from="${1..6}"  />
        </p>
                
        <p>
            <label>Bathrooms:</label>
            <g:select name="bathrooms"  from="${1..6}"   />
        </p>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Serch" /></span>
                </div>
            </g:form>
            </body>
</html>