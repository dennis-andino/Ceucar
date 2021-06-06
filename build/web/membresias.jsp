<%--
    Document   : membresias
    Created on : 03-10-2020, 05:34:38 PM
    Author     : Dennis_Andino
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Membresia"%>
<%@page import="controlador.MembresiaController"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>CEUCAR-Ventas</title>
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
            SimpleDateFormat sdp = new SimpleDateFormat("dd/MM/yyyy");
            Date fechaActual = new Date();
            Date fechaMemb = new Date();
            int idPropietario = Integer.parseInt(request.getSession().getAttribute("id").toString());
            System.out.println("Propietario ID : linea 37 " + idPropietario);
            MembresiaController controlmemb = new MembresiaController();
            List<Membresia> mismembresias = controlmemb.misMembresias(idPropietario);
        %>
        <%@ include file="navbar.jsp" %>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Ventas</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Rentas</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Carwash</a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Mis Membresias</h4>
                        <div class="table-responsive table-bordered d-xl-flex align-items-xl-start">
                            <table class="table table-bordered table-sm">
                                <thead>
                                    <tr>
                                        <th>ID de Membresia</th>
                                        <th>Fecha de contrato</th>
                                        <th>Tipo de Licencia</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (mismembresias.size() >= 1) {
                                            String tipo = "";
                                            String estado = "";

                                            for (int i = 0; i < mismembresias.size(); i++) {
                                                System.out.println(mismembresias.get(i).getFechaContrato());
                                                fechaMemb = sdp.parse(mismembresias.get(i).getFechaContrato());
                                                if (fechaMemb.compareTo(fechaActual) < 1) {
                                                    estado = "Disponible";
                                                } else {
                                                    estado = "Vencida";
                                                }

                                                switch (mismembresias.get(i).getTipo()) {
                                                    case 1:
                                                        tipo = "Administrador";
                                                        break;
                                                    case 2:
                                                        tipo = "Ofertante";
                                                        break;
                                                    case 3:
                                                        tipo = "Cliente";
                                                        break;
                                                    default:
                                                        break;

                                                }
                                    %>
                                    <tr>
                                        <td><%=mismembresias.get(i).getId_memb()%></td>
                                        <td><%=mismembresias.get(i).getFechaContrato()%></td>
                                        <td><%=tipo%></td>
                                        <td><%=estado%></td>
                                    </tr>
                                    <%}
                                    } else {%>
                                <div>
                                    <tr><td colspan="6" ><br>renova tu membresia para disfrutar de nuestros servicios :)</td></tr></div>
                                            <%}%>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <div class="modal fade" id="membresiaform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Compra de Membresia</h5>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" action="membDAO.jsp">
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="tipot">Tipo de tarjeta</label>
                                                        <select id="cbpais" class="form-control" name="tipot">
                                                            <option value="vs" selected>Visa</option>
                                                            <option value="mc" >Mastercard</option>
                                                            <option value="ae" >American Express</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="txtdigitos">Ultimos 4 digitos: </label>
                                                        <input type="text" class="form-control" id="txtnombre" name="txtdigitos">
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label for="fechaven">Fecha de Vencimiento: </label>
                                                        <input type="date" class="form-control" id="fechanac" name="fechaven">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="tipomem">Tipo de Membresia</label>
                                                        <select id="cbpais" class="form-control" name="tipomem">
                                                            <option value="2" selected>Ofertador (300$)</option>
                                                            <option value="3" >Cliente (150$)</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit"  class="btn btn-primary" name="btnmem" value="adquirir">Adquirir</button>
                                                </div>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#membresiaform" data-whatever="@mdo">Adquirir Nueva Membresia</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bs-animation.js"></script>
    </body>

</html>
