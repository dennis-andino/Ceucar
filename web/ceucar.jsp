<%--
    Document   : ceucar
    Created on : 03-24-2020, 05:20:46 PM
    Author     : Dennis_Andino
--%>

<%
    Empresa empresa = new Empresa();
    EmpresaController empControl = new EmpresaController();
    empresa = empControl.obtInfoEmpresa();
%>
<%@page import="modelo.Empresa"%>
<%@page import="controlador.EmpresaController"%>
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
        <%@ include file="navbar.jsp" %>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        <div class="card-header">
                            <h5 class="card-title"><%=empresa.getNombre()%></h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Mision</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text"><%=empresa.getMision()%></p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Vision</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text"><%=empresa.getVision()%></p>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Direccion</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text"><%=empresa.getDireccion()%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="footer.html" %>
    </body>
</html>
