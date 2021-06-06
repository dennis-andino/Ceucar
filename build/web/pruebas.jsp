<%--
    Document   : pruebas
    Created on : 03-24-2020, 03:02:10 AM
    Author     : Dennis_Andino
--%>

<%@page import="java.util.logging.Level"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="encriptadoaes.EncriptadorAES"%>
<%@page import="java.security.InvalidKeyException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="javax.crypto.BadPaddingException"%>
<%@page import="javax.crypto.IllegalBlockSizeException"%>
<%@page import="javax.crypto.NoSuchPaddingException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    final String claveEncriptacion = "ceutecProject";
    String datosOriginales = "Despacito";

    EncriptadorAES encriptador = new EncriptadorAES();

    String encriptado = encriptador.encriptar(datosOriginales, claveEncriptacion);
    String desencriptado = encriptador.desencriptar(encriptado, claveEncriptacion);

    System.out.println("Cadena Original: " + datosOriginales);
    System.out.println("Escriptado     : " + encriptado);
    System.out.println("Desencriptado  : " + desencriptado);
%>