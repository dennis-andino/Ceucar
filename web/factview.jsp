<%--
    Document   : factview
    Created on : 03-23-2020, 02:15:17 AM
    Author     : Dennis_Andino
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Factura"%>
<%@page import="controlador.FacturaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi facturacion</title>
        <%@ include file="estilos.html" %>
    </head>
    <body>
        <%
            FacturaController factcontrol = new FacturaController();
            int id_user = Integer.parseInt(request.getSession().getAttribute("id").toString());
            List<Factura> milista = factcontrol.misCompras(id_user);
            String nivel = request.getSession().getAttribute("rol").toString();
        %>
        <%@ include file="navbar.jsp" %>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        <div class="card-header">
                            <h5 class="card-title">Informacion de Facturacion</h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Mis Compras</h4>
                        <div class="table-responsive table-bordered d-xl-flex align-items-xl-start">
                            <table class="table table-bordered table-sm">
                                <thead>
                                    <tr>
                                        <th>ID factura</th>
                                        <th>Fecha de Emision</th>
                                        <th>Detalle</th>
                                        <th>Total (No incluye impuestos)</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% if (milista.size() >= 1) {
                                            for (int i = 0; i < milista.size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=milista.get(i).getId_fact()%></td>
                                        <td><%=milista.get(i).getFecha()%></td>
                                        <td><%=milista.get(i).getDetalle()%></td>
                                        <td><%=milista.get(i).getSub_total()%></td>
                                    </tr>
                                    <%}
                                    } else {%>
                                <div>
                                    <tr><td colspan="4" ><br> No se encontraron Registros, Ingresa un nuevo Vehiculo :)</td></tr></div>
                                            <%}%>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <%
                        if (nivel.equals("2")) {
                            milista.clear();
                            milista = factcontrol.misVentas(id_user);
                    %>

                    <div class="card-body">
                        <h4 class="card-title">Mis Ventas</h4>
                        <div class="table-responsive table-bordered d-xl-flex align-items-xl-start">
                            <table class="table table-bordered table-sm">
                                <thead>
                                    <tr>
                                        <th>ID factura</th>
                                        <th>Fecha de Emision</th>
                                        <th>Detalle</th>
                                        <th>Total (No incluye impuestos)</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% if (milista.size() >= 1) {
                                            for (int i = 0; i < milista.size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=milista.get(i).getId_fact()%></td>
                                        <td><%=milista.get(i).getFecha()%></td>
                                        <td><%=milista.get(i).getDetalle()%></td>
                                        <td><%=milista.get(i).getSub_total()%></td>
                                    </tr>
                                    <%}
                                    } else {%>
                                <div>
                                    <tr><td colspan="4" ><br> No se encontraron Registros, Ingresa un nuevo Vehiculo :)</td></tr></div>
                                            <%}%>
                                </tbody>
                            </table>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.html" %>
    </body>
</html>
