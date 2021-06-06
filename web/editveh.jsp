<%--
    Document   : editveh
    Created on : 03-20-2020, 11:55:48 AM
    Author     : Dennis_Andino
--%>

<%@page import="controlador.VehiculoController"%>
<%@page import="modelo.Vehiculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ceucarModel</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
        <link rel="stylesheet" href="assets/fonts/typicons.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
        <link rel="stylesheet" href="assets/css/Features-Boxed.css">
        <link rel="stylesheet" href="assets/css/Footer-Basic.css">
        <link rel="stylesheet" href="assets/css/Header-Blue.css">
        <link rel="stylesheet" href="assets/css/Highlight-Clean.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
        <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>
    <body>
        <%
            VehiculoController vehcontrol = new VehiculoController();
            Vehiculo vehiculo = new Vehiculo();
            String idveh = request.getParameter("idveh");
            vehiculo = vehcontrol.getVehiculo(idveh);
        %>
        <div class="row">
            <div class="col">
                <%@ include file="navbar.jsp" %>
            </div>
            <div class="row" style="width: 1223px;height: 57px;">
                <div class="col"></div>
            </div>
        </div>
        <div class="row" style="padding: 17px;">
            <div class="col-6" style="padding: 4px;">
                <div>
                    <div class="card" style="width: 581px;">
                        <div class="card-body" style="margin: 7px;padding: 10px;">
                            <h4 class="card-title">Modificando informacion de vehiculo</h4>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <%=vehiculo.getImg1()%>
                                </div>
                                <div class="form-group col-md-4">
                                    <%=vehiculo.getImg2()%>
                                </div>
                                <div class="form-group col-md-4">
                                    <%=vehiculo.getImg3()%>
                                </div>
                            </div>
                            <form method="POST" action="vehDAO.jsp">
                                <input type="hidden" name="idveh" value="<%=idveh%>">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="cbmarca">Marca</label>
                                        <select id="cbmarca" class="form-control" name="cbmarca">
                                            <option value="<%=vehiculo.getMarca()%>" selected><%= vehiculo.getMarca()%></option>
                                            <option value="Hyundai">Hyundai</option>
                                            <option value="Toyota" >Toyota</option>
                                            <option value="Honda" >Honda</option>
                                            <option value="Mitsubishi" >Mitsubishi</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtmodelo">Modelo</label>
                                        <input type="text" class="form-control" id="txtmodelo" name="txtmodelo" value="<%= vehiculo.getModelo()%>" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtvin">VIN</label>
                                        <input type="text" class="form-control" id="txtvin" name="txtvin" value="<%= vehiculo.getVin()%>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtcil">Cilindraje</label>
                                        <input type="text" class="form-control" id="txtcil" name="txtcil" value="<%= vehiculo.getCilindraje()%>"  required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtkil">Kilometraje</label>
                                        <input type="text" class="form-control" id="txtkil" name="txtkil" value="<%= vehiculo.getKilometraje()%>"  required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txttras">Transmision</label>
                                        <select id="txttras" class="form-control" name="txttras">
                                            <option value="<%= vehiculo.getTransmision()%>" selected><%=vehiculo.getTransmision()%></option>
                                            <option value="Manual">Manual</option>
                                            <option value="Automatica" >Automatica</option>
                                            <option value="Triptonica" >Triptonica</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtvalv">Valor de venta</label>
                                        <input type="text" class="form-control" id="txtvalv" name="txtvalv" value="<%= vehiculo.getVal_venta()%>"  required >
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="txtvalr">Valor de Renta</label>
                                        <input type="text" class="form-control" id="txtvalr" name="txtvalr" value="<%= vehiculo.getVal_renta()%>"  required >
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtubi">Ubicacion </label>
                                        <input type="text" class="form-control" id="txtubi" name="txtubi" value="<%= vehiculo.getUbicacion()%>"  required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtdesc">Descripcion </label>
                                        <input type="text" class="form-control" id="txtdesc" name="txtdesc" value="<%= vehiculo.getDescripcion()%>"  required>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary" name="accion" value="actualizar">Actualizar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col" style="margin: 1px;padding: 4px;width: 594.5px;">
                <div></div>
                <div class="card">
                    <div class="card-body" style="height: 496px;width: 581px;"><img style="background-image: url(&quot;assets/img/registrese_.jpg&quot;);height: 457px;width: 509px;"></div>
                </div>
            </div>
        </div>
        <%@ include file="footer.html" %>
    </body>
</html>