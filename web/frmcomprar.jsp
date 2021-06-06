<%--
    Document   : miperfil
    Created on : 03-14-2020, 03:56:02 PM
    Author     : Dennis_Andino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Ceucar.com/mi perfil</title>
        <%@ include file="estilos.html" %>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <%
            String detalle = "";
        %>
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Informacion de Facturacion</h5>
                </div>
                <div class="card-header">
                    <h3 class="card-title">Informacion de Facturacion</h3>
                </div>
                <div class="card-body">
                    <p class="card-text">La presente es un compromiso de pago, se retendra el valor del vehiculo en su tarjeta, tendra 10 dias para cancelaciones o negociaciones.</p>
                    <form method="POST" action="factDAO.jsp">
                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="txtnombre">Factura a nombre de :</label>
                                <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="<%=request.getSession().getAttribute("nombre") + " "%><%=request.getSession().getAttribute("apellido")%>">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="comid">Identificador de usuario: </label>
                                <input type="text" class="form-control" id="comid" name="comid" value="<%=request.getSession().getAttribute("id")%>">
                            </div>

                        </div>
                        <h5 class="card-title">Informacion de Vehiculo</h5>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="vin">Registro del Vehiculo :</label>
                                <input type="text" class="form-control" id="vin" name="vin" value="<%=request.getParameter("vin")%>">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="marca">Marca del Vehiculo</label>
                                <input type="text" class="form-control" id="marca" name="marca" value="<%=request.getParameter("marca")%>">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="modelo">Modelo del Vehiculo</label>
                                <input type="text" class="form-control" id="txtelefono" name="modelo" value="<%=request.getParameter("modelo")%>">
                            </div>
                            <div class="form-group col-md-2">
                                <label for="venid">ID de vehiculo</label>
                                <input type="text" class="form-control" id="venid" name="venid" value="<%=request.getParameter("idveh")%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label for="deta">Detalle de factura: </label>
                                <%
                                    detalle = "Venta de Vehiculo con VIN : " + request.getParameter("vin") + " Marca: " + request.getParameter("marca") + "Modelo: " + request.getParameter("modelo") + ". Adquirido por: " + request.getSession().getAttribute("nombre") + " " + request.getSession().getAttribute("apellido");
                                %>
                                <input type="text" class="form-control" id="deta" name="deta" value="<%=detalle%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="subt">Total (No incluye impuestos)</label>
                                <input type="text" class="form-control" id="txtelefono" name="subt" value="<%=request.getParameter("total")%>">
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
                                <input type="text" class="form-control" id="txtnombre" name="txtdigitos">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="fechaven">Fecha de Vencimiento: </label>
                                <input type="date" class="form-control" id="fechanac" name="fechaven">
                            </div>
                        </div>
                </div>
                <button type="submit" class="btn btn-primary" name="accion" value="btnactualizar">Pagar</button>
                </form>
            </div>
        </div>

    </div>
    <%@ include file="footer.html" %>
</body>
</html>
