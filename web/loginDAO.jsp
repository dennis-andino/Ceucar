<%--
    Document   : loginDAO
    Created on : 03-04-2020, 10:40:51 PM
    Author     : Dennis_Andino
--%>

<%@page import="controlador.CeuMail"%>
<%@page import="controlador.ClienteCorreo"%>
<%@page import="controlador.UsuarioController"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="encriptacion.EncriptadorAES"%>
<%@page import="java.security.InvalidKeyException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="javax.crypto.BadPaddingException"%>
<%@page import="javax.crypto.IllegalBlockSizeException"%>
<%@page import="javax.crypto.NoSuchPaddingException"%>
<%
    String accion = request.getParameter("accion");
    UsuarioController userDAO = new UsuarioController();

    switch (accion) {
        case "btnlogin":
            Usuario user = new Usuario();
            EncriptadorAES encriptador_ = new EncriptadorAES();
            final String claveEncriptacion_ = "ceutecProject";
            String claveoriginal_ = request.getParameter("txtpass").trim();
            String claveEncriptada_ = encriptador_.encriptar(claveoriginal_, claveEncriptacion_);
            user.setCorreo(request.getParameter("txtemail"));
            user.setClave(claveEncriptada_);
            user = userDAO.validar(user);
            if (user != null) {
                request.getSession().setAttribute("id", user.getId_us());
                request.getSession().setAttribute("nombre", user.getNombre());
                request.getSession().setAttribute("apellido", user.getApellido());
                request.getSession().setAttribute("correo", user.getCorreo());
                request.getSession().setAttribute("pais", user.getRol());
                request.getSession().setAttribute("telefono", user.getTelefono());
                request.getSession().setAttribute("fechanac", user.getFecha_nac());
                request.getSession().setAttribute("rtn", user.getRtn());
                request.getSession().setAttribute("rol", user.getRol());
                out.print("<script>alert(\"Bienvenido " + request.getSession().getAttribute("nombre") + " \");window.location.href='index.jsp';</script>");

            } else {
                out.print("<script>alert(\" Upps ! no se encontro usuario , verifique sus datos en intentelo nuevamente. \");window.location.href='index.jsp';</script>");
            }
            break;
        case "btnRegistro":
            Usuario Nuevouser = new Usuario();
            EncriptadorAES encriptador = new EncriptadorAES();
            final String claveEncriptacion = "ceutecProject";
            String claveoriginal = request.getParameter("txtclave");
            String claveEncriptada = encriptador.encriptar(claveoriginal, claveEncriptacion);
            int rol;
            int tipoMembre = Integer.parseInt(request.getParameter("cblicencia"));
            rol = (tipoMembre == 2) ? 3 : 2;
            Nuevouser.setClave(claveEncriptada);
            Nuevouser.setNombre(request.getParameter("txtnombre"));
            Nuevouser.setApellido(request.getParameter("txtapellido"));
            Nuevouser.setCorreo(request.getParameter("txtmail"));
            Nuevouser.setPais(request.getParameter("cbpais"));
            Nuevouser.setLatitud(request.getParameter("txtlat"));
            Nuevouser.setLongitud(request.getParameter("txtlong"));
            Nuevouser.setTelefono(request.getParameter("txtelefono"));
            Nuevouser.setFecha_nac(request.getParameter("fechanac"));
            Nuevouser.setRtn("08019999999");
            Nuevouser.setRol(rol);
            try {
                if (userDAO.guardar(Nuevouser, tipoMembre)) {
                    CeuMail correo = new CeuMail(request.getParameter("txtmail").trim());
                    correo.enviarMensaje("registro ceucar.com", "Bienvenido a la gran familia de CEUCAR, comienza a disfrutar los mejores  de millones de opciones. \n Atte. Equipo de ceucar.com");
                    out.print("<script>alert(\" Registrado Satisfactoriamente ! Bienvenido \");window.location.href='index.jsp';</script>");
                } else {
                    out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo guardar :C contactanos a ceucarsupport@ceucar.com ! \");window.location.href='index.jsp';</script>");

                }
            } catch (Exception e) {
                out.print("" + e);
                out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo guardar :C contactanos a ceucarsupport@ceucar.com ! \");window.location.href='index.jsp';</script>");

            }
            break;
        default:
            System.out.println("no se encontro la opcion (switch) linea 68 [loginDao]");
            break;
    }


%>