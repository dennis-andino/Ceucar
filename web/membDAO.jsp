<%--
    Document   : membDAO
    Created on : 03-15-2020, 09:02:34 PM
    Author     : Dennis_Andino
--%>

<%@page import="controlador.MembresiaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    MembresiaController memcontrol = new MembresiaController();
    String idtitular = request.getSession().getAttribute("id").toString();
    String tipomemb = request.getParameter("tipomem");
    if (memcontrol.RegistrarMemb(idtitular, tipomemb)) {
        out.print("<script>alert(\"! Se modifico el registro Satisfactoriamente ! \");window.location.href='membresias.jsp';</script>");
    } else {
        out.print("<script>alert(\"! Upps no se pudo Registrar su membresia :c ! \");window.location.href='membresias.jsp';</script>");
    }

%>