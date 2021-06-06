<%--
    Document   : registrarme
    Created on : 03-04-2020, 09:29:43 PM
    Author     : Dennis_Andino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ceucar.com</title>
        <%@ include file="estilos.html" %>
        <script>
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(mostrarUbicacion);
            }

            function mostrarUbicacion(ubicacion) {
                const lng = ubicacion.coords.longitude;
                const lat = ubicacion.coords.latitude;
                console.log(`longitud: ${ lng } | latitud: ${ lat }`);
                txtlat.value = lat;
                txtlong.value = lng;
            }
        </script>
    </head>
    <body>
        <div class="row">
            <div class="col">
                <%@ include file="navbar.jsp" %>
            </div>
            <div>
                <h5 class="card-title">Registro de cuenta</h5>
            </div>
        </div>
        <div class="row" style="padding: 17px;">
            <div class="col-6" style="padding: 4px;">
                <div>
                    <div class="card">
                        <div class="card-body" style="margin: 7px;padding: 10px;">
                            <h5 class="card-title">Registro de cuenta</h5>
                            <%-- Inicio Formulario--%>
                            <form method="POST" action="loginDAO.jsp">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtnombre">nombre</label>
                                        <input type="text" class="form-control" id="txtnombre" name="txtnombre">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtapellido">Apellido</label>
                                        <input type="text" class="form-control" id="txtpass" name="txtapellido">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtmail">Email</label>
                                        <input type="email" class="form-control" id="txtmail" name="txtmail">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtelefono">Telefono</label>
                                        <input type="text" class="form-control" id="txtelefono" name="txtelefono">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="cbpais">Pais</label>
                                        <select id="cbpais" class="form-control" name="cbpais">
                                            <option value="Honduras" selected>Honduras</option>
                                            <option value="Guatemala" >Guatemala</option>
                                            <option value="Mexico" >Mexico</option>
                                            <option value="EEUU" >EEUU</option>
                                            <option value="El Salvador" >El Salvador</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="fechanac">Fecha de Nacimiento</label>
                                        <input type="date" class="form-control" id="fechanac" name="fechanac">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtlat">Latitud</label>
                                        <input type="text" class="form-control" id="txtlat" name="txtlat" >
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="txtlong">Longitud</label>
                                        <input type="text" class="form-control" id="txtlong" name="txtlong" >
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtclave">Contraseña: </label>
                                        <input type="password" class="form-control" id="txtclave" name="txtclave">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="cblicencia">Tipo de Licencia</label>
                                        <select id="cblicencia" class="form-control" name="cblicencia">
                                            <option value="2" selected>Cliente</option>
                                            <option value="3" >Ofertador Vendedor</option>
                                        </select>
                                    </div>
                                </div>
                                <h5 class="card-title">Informacion de Pago</h5>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="tipot">Tipo de tarjeta</label>
                                        <select id="cbpais" class="form-control" name="tipot">
                                            <option value="vs" selected>Visa</option>
                                            <option value="mc" >Mastercard</option>
                                            <option value="ae" >American Express</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="txtdigitos">Ultimos 4 digitos: </label>
                                        <input type="text" class="form-control" id="txtnombre" name="txtdigitos" required>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="fechaven">Fecha de Vencimiento: </label>
                                        <input type="date" class="form-control" id="fechanac" name="fechaven" required>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" name="accion" value="btnRegistro">Registrarse</button>
                            </form>
                            <%-- Fin formulario  --%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col" style="margin: 1px;padding: 4px;width: 594.5px;">
                <div></div>
                <div class="card">
                    <div class="card-body"><img style="background-image: url(&quot;assets/img/registrese_.jpg&quot;);height: 457px;width: 509px;"></div>
                </div>
            </div>
        </div>
        <%@ include file="footer.html" %>
    </body>

</html>