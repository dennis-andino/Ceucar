<%-- 
    Document   : logout
    Created on : 05-mar-2020, 10:01:16
    Author     : p0008
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 request.getSession().invalidate();
 request.getRequestDispatcher("index.jsp").forward(request, response);
 session.setAttribute("nombre",null);

%>