<%--
    Document   : misventas
    Created on : 03-04-2020, 09:30:37 PM
    Author     : Dennis_Andino
--%>



<%@page import="java.util.List"%>
<%@page import="modelo.Vehiculo"%>
<%@page import="controlador.VehiculoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>CEUCAR-Ventas</title>
        <%@ include file="estilos.html" %>
    </head>

    <body>
        <!-------------------------------------------------------------------------------------------------- -->

        <!-------------------------------------------------------------------------------------------------- -->




        <%
            VehiculoController veh = new VehiculoController();
            int id_user = Integer.parseInt(request.getSession().getAttribute("id").toString());
            List<Vehiculo> milista = veh.misVehiculos(id_user);
        %>
        <%@ include file="navbar.jsp" %>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Informacion de Ventas</h5>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Mis Vehiculos</h4>
                        <div class="table-responsive table-bordered d-xl-flex align-items-xl-start">
                            <table class="table table-bordered table-sm">
                                <thead>
                                    <tr>
                                        <th>VIN</th>
                                        <th>Marca</th>
                                        <th>Modelo</th>
                                        <th>Precio</th>
                                        <th>Disponibilidad/vendido</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% if (milista.size() >= 1) {
                                            String disponibilidad = "No encontrado";
                                            for (int i = 0; i < milista.size(); i++) {
                                    %>
                                    <tr>
                                        <td><%=milista.get(i).getVin()%></td>
                                        <td><%=milista.get(i).getMarca()%></td>
                                        <td><%=milista.get(i).getModelo()%></td>
                                        <td><%=milista.get(i).getVal_venta()%></td>
                                        <%

                                            if (milista.get(i).getDisp_vent() == 1) {
                                                disponibilidad = "En venta";
                                            } else {
                                                disponibilidad = "Vendido";
                                            }
                                        %>
                                        <td><%=disponibilidad%></td>
                                        <td>
                                            <form action="vehDAO.jsp"  method="POST">
                                                <%-- <input type="hidden" name="idveh" value="<%=milista.get(i).getId_veh()%>"> --%>
                                                <input type="submit" name="accion" value="Modificar" class="btn btn-primary">
                                                <input type="submit" name="accion" value="Eliminar" class="btn btn-primary">
                                            </form>
                                        </td>
                                    </tr>
                                    <%}
                                    } else {%>
                                <div>
                                    <tr><td colspan="6" ><br> No se encontraron Registros, Ingresa un nuevo Vehiculo :)</td></tr></div>
                                            <%}%>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <a href="regveh.jsp" class="btn btn-primary stretched-link">Agregar Nuevo</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.html" %>
    </body>

</html>
