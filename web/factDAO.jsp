<%--
    Document   : factDAO
    Created on : 03-22-2020, 09:55:21 PM
    Author     : Dennis_Andino
--%>
<%@page import="controlador.FacturaController"%>
<%@page import="modelo.Factura"%>
<%
    Factura factura = new Factura();
    FacturaController factcontrol = new FacturaController();
    int comprador_id = 0;
    int vehiculo_id = 0;
    String detalle = "";
    int sub_total = 0;
    comprador_id = Integer.parseInt(request.getParameter("comid"));
    vehiculo_id = Integer.parseInt(request.getParameter("venid"));
    detalle = request.getParameter("deta");
    sub_total = Integer.parseInt(request.getParameter("subt"));
    factura.setCliente_id(comprador_id);
    factura.setSub_total(sub_total);
    factura.setVehiculo_id(vehiculo_id);
    factura.setDetalle(detalle);
    if (factcontrol.generarFactura(factura)) {
        out.print("<script>alert(\"! Felicidades, Esperamos disfrutes tu nuevo auto | nuestro Equipo se contactara contigo! \");window.location.href='index.jsp';</script>");
    } else {
        out.print("<script>alert(\"!Upps , Algo salio mal! contactanos a support.ventas@ceucar.com \");window.location.href='index.jsp';</script>");
    }

%>