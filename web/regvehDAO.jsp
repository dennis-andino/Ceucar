<%@page import="controlador.VehiculoController"%>
<%@page import="modelo.Vehiculo"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Vehiculo nuevoCarrito = new Vehiculo();
    VehiculoController control = new VehiculoController();
    nuevoCarrito.setId_cli(Integer.parseInt(request.getSession().getAttribute("id").toString().trim()));
    //clase para subir archivos a disco
    ServletFileUpload fu = new ServletFileUpload(new DiskFileItemFactory()); //apache 7
    List items = fu.parseRequest(new ServletRequestContext(request)); //apache 8.14 en adelante
    // Iteramos por cada elemento del Request
    Iterator i = items.iterator();
    String nombreArchivo = "";
    String ruta = "";
    File fichero = null;
    int contador = 1;
    while (i.hasNext()) {
        FileItem ff = (FileItem) i.next();
        //verificamos si el elemento es un archivo y verificamos si el tamano del archivo es mayor a 0 bites
        if (!ff.isFormField() && ff.getSize() > 0) {
            nombreArchivo = ff.getName().trim();
            fichero = new File(nombreArchivo);
            // escribimos el fichero en la carpeta que corresponde
            ruta = application.getRealPath("") + "imagens\\".trim();
            fichero = new File(ruta, fichero.getName());
            System.out.println(ruta);
            ff.write(fichero);
            ruta = "<img src=\"" + application.getContextPath() + "/imagens/" + fichero.getName() + "\" class=img-thumbnail \\>";
            switch (contador) {

                case 1: {
                    nuevoCarrito.setImg1(ruta);
                    contador++;
                    break;
                }
                case 2: {
                    nuevoCarrito.setImg2(ruta);
                    contador++;
                    break;
                }
                case 3: {
                    nuevoCarrito.setImg3(ruta);
                    contador++;
                    break;
                }
                default:
                    break;
            }

        } else {
            nombreArchivo = ff.getFieldName();
            switch (nombreArchivo) {
                case "cbmarca": {
                    nuevoCarrito.setMarca(ff.getString().trim());
                    break;
                }
                case "txtmodelo": {
                    nuevoCarrito.setModelo(ff.getString().trim());
                    break;
                }
                case "txtvin": {
                    nuevoCarrito.setVin(ff.getString().trim());
                    break;
                }
                case "txtcil": {
                    nuevoCarrito.setCilindraje(ff.getString().trim());
                    break;
                }
                case "txtkil": {
                    nuevoCarrito.setKilometraje(ff.getString().trim());
                    break;
                }
                case "txttras": {
                    nuevoCarrito.setTransmision(ff.getString().trim());
                    break;
                }
                case "txtvalv": {
                    nuevoCarrito.setVal_venta(Integer.parseInt(ff.getString().trim()));
                    break;
                }
                case "txtvalr": {
                    nuevoCarrito.setVal_renta(Integer.parseInt(ff.getString().trim()));
                    break;
                }
                case "txtubi": {
                    nuevoCarrito.setUbicacion(ff.getString().trim());
                    break;
                }
                case "txtdesc": {
                    nuevoCarrito.setDescripcion(ff.getString().trim());
                }
                default:
                    break;

            }

        }
    }

    if (control.agregarVehiculo(nuevoCarrito)) {
        out.print("<script>alert(\"Felicidades ! Su vehiculo ya esta en venta ! \");window.location.href='ventas.jsp';</script>");
    } else {
        out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo guardar :C contactanos a ceucarsupport@ceucar.com ! \");window.location.href='ventas.jsp';</script>");
    }
%>





