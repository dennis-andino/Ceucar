<%--
    Document   : vehDAO
    Created on : 03-20-2020, 01:17:49 AM
    Author     : Dennis_Andino
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.VehiculoController"%>
<%@page import="modelo.Vehiculo"%>

<%
    String idveh = request.getParameter("idveh");
    String accion = request.getParameter("accion");
    VehiculoController vehcontrol = new VehiculoController();
    Vehiculo vehiculo = new Vehiculo();
    switch (accion) {
        case "Eliminar":
            if (vehcontrol.eliminaVeh(idveh)) {
                out.print("<script>alert(\"Se elimino Satisfactoriamente ! \");window.location.href='ventas.jsp';</script>");
            } else {
                out.print("<script>alert(\"Upps Algo Salio mal ! no se pudo Eliminar :C contactanos a ceucarsupport@ceucar.com ! \");window.location.href='ventas.jsp';</script>");
            }
            break;
        case "Modificar":
            request.setAttribute("idveh", idveh);
            request.getRequestDispatcher("editveh.jsp").forward(request, response);
            break;
        case "actualizar":
            vehiculo.limpiar();
            int idvehiculo = Integer.parseInt(idveh);
            String marca = request.getParameter("cbmarca");
            String modelo = request.getParameter("txtmodelo");
            String vin = request.getParameter("txtvin");
            String cilindraje = request.getParameter("txtcil");
            String kilometraje = request.getParameter("txtkil");
            String trasmision = request.getParameter("txttras");
            int valorv = Integer.parseInt(request.getParameter("txtvalv"));
            int valorr = Integer.parseInt(request.getParameter("txtvalr"));
            String ubicacion = request.getParameter("txtubi");
            String descripcion = request.getParameter("txtdesc");
            vehiculo.setId_veh(idvehiculo);
            vehiculo.setMarca(marca);
            vehiculo.setModelo(modelo);
            vehiculo.setVin(vin);
            vehiculo.setCilindraje(cilindraje);
            vehiculo.setKilometraje(kilometraje);
            vehiculo.setTransmision(trasmision);
            vehiculo.setVal_venta(valorv);
            vehiculo.setVal_renta(valorr);
            vehiculo.setUbicacion(ubicacion);
            vehiculo.setDescripcion(descripcion);
            if (vehcontrol.actualizarVeh(vehiculo)) {
                out.print("<script>alert(\"! Se modifico el registro Satisfactoriamente ! \");window.location.href='ventas.jsp';</script>");
            } else {
                out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo guardar :C contactanos a ceucarsupport@ceucar.com ! \");window.location.href='ventas.jsp';</script>");
            }
            break;
        default:
            break;
    }
%>