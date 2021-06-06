<%--
    Document   : mapclients
    Created on : 03-23-2020, 04:04:42 PM
    Author     : Dennis_Andino
--%><%@page import="modelo.Mapa"%>
<%@page import="java.util.List"%>
<%@page import="controlador.MapasController"%>

//
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    MapasController controlmap = new MapasController();
    List<Mapa> milista = controlmap.obtenerCoordenadas();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ceucar.com/mapeo</title>
        <%@ include file="estilos.html" %>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAPqaY-K1Q0YEtqdO08W1Vv8KMrdSM8h2o"></script>
        <script>
            function initMap() {
                var map;
                var bounds = new google.maps.LatLngBounds();
                var mapOptions = {
                    mapTypeId: 'roadmap'
                };
                // Display a map on the web page
                map = new google.maps.Map(document.getElementById("mapCanvas"), mapOptions);
                map.setTilt(50);
                // Multiple markers location, latitude, and longitude
                var markers = [
            <% for (int i = 0; i < milista.size(); i++) {
                    out.print("['" + milista.get(i).getNombre() + "'," + milista.get(i).getLatitud() + "," + milista.get(i).getLongitud() + "],");
                }%>];
                // Info window content
                var infoWindowContent = [
            <%
                for (int j = 0; j < milista.size(); j++) {
            %>
                    ['<div class="info_content">' +
                            '<h3><%=milista.get(j).getNombre()%></h3>' +
                            '<p><%=milista.get(j).getEmailCli()%></p>' + '</div>'],
            <%
                }
            %>
                ];

                // Add multiple markers to map
                var infoWindow = new google.maps.InfoWindow(), marker, i;

                // Place each marker on the map
                for (i = 0; i < markers.length; i++) {
                    var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
                    bounds.extend(position);
                    marker = new google.maps.Marker({
                        position: position,
                        map: map,
                        title: markers[i][0]
                    });

                    // Add info window to marker
                    google.maps.event.addListener(marker, 'click', (function(marker, i) {
                        return function() {
                            infoWindow.setContent(infoWindowContent[i][0]);
                            infoWindow.open(map, marker);
                        }
                    })(marker, i));

                    // Center the map to fit all markers on the screen
                    map.fitBounds(bounds);
                }

                // Set zoom level
                var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
                    this.setZoom(6);
                    google.maps.event.removeListener(boundsListener);
                });

            }

            // Load initialize function
            google.maps.event.addDomListener(window, 'load', initMap);
        </script>

        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #mapCanvas {
                width: 100%;
                height: 650px;
            }
        </style>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="card text-center">
            <div class="card-header">
                CEUCAR.COM
            </div>
            <div class="card-body">
                <h5 class="card-title">Mapeo de usuarios</h5>
                <div id="mapCanvas"></div>
            </div>
            <div class="card-footer text-muted">
                <%@ include file="footer.html" %>
            </div>
        </div>
    </body>
</html>
