package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import controlador.MembresiaController;

public final class rpmemxrol_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/estilos.html");
    _jspx_dependants.add("/navbar.jsp");
    _jspx_dependants.add("/footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Ceucar/Reportes</title>\n");
      out.write("        ");
      out.write("<link rel=\"stylesheet\" href=\"assets/bootstrap/css/bootstrap.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/fonts/fontawesome-all.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/fonts/font-awesome.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/fonts/ionicons.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/fonts/typicons.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/Features-Boxed.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/Footer-Basic.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/Header-Blue.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/Highlight-Clean.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/Login-Form-Clean.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/Login-Form-Dark.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/Navigation-with-Button.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"assets/css/styles.css\">");
      out.write("\n");
      out.write("        <!-- Importa las librerias de jQuery y las de Highcharts -->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery-1.7.1.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/highcharts.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/exporting.js\"></script>\n");
      out.write("        ");

            MembresiaController reporte = new MembresiaController();
            String[] parametros;
            parametros = reporte.membXrol();
        
      out.write("\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            var chart;\n");
      out.write("            $(document).ready(function() {\n");
      out.write("\n");
      out.write("                chart = new Highcharts.Chart({\n");
      out.write("                    chart: {\n");
      out.write("                        renderTo: 'graficaLineal', // Le doy el nombre a la gráfica\n");
      out.write("                        type: 'column'  // Pongo que tipo de gráfica es\n");
      out.write("                    },\n");
      out.write("                    title: {\n");
      out.write("                        text: 'Estadisticas'\t// Titulo (Opcional)\n");
      out.write("                    },\n");
      out.write("                    subtitle: {\n");
      out.write("                        text: 'Usuarios por membresia'\t\t\t\t// Subtitulo (Opcional)\n");
      out.write("                    },\n");
      out.write("                    // Pongo los datos en el eje de las 'X'\n");
      out.write("                    xAxis: {\n");
      out.write("                        //poner los meses recuperados de la base de datos\n");
      out.write("                        categories: [");
      out.print(parametros[0]);
      out.write("],\n");
      out.write("                        // Pongo el título para el eje de las 'X'\n");
      out.write("                        title: {\n");
      out.write("                            text: 'Membresias'\n");
      out.write("                        }\n");
      out.write("                    },\n");
      out.write("                    yAxis: {\n");
      out.write("                        // Pongo el título para el eje de las 'Y'\n");
      out.write("                        title: {\n");
      out.write("                            text: 'Clientes'\n");
      out.write("                        }\n");
      out.write("                    },\n");
      out.write("                    // Doy formato al la \"cajita\" que sale al pasar el ratón por encima de la gráfica\n");
      out.write("                    tooltip: {\n");
      out.write("                        enabled: true,\n");
      out.write("                        formatter: function() {\n");
      out.write("                            return '<b>' + this.series.name + '</b><br/>' +\n");
      out.write("                                    this.x + ': ' + this.y + ' ' + this.series.name;\n");
      out.write("                        }\n");
      out.write("                    },\n");
      out.write("                    // Doy opciones a la gráfica\n");
      out.write("                    plotOptions: {\n");
      out.write("                        line: {\n");
      out.write("                            dataLabels: {\n");
      out.write("                                enabled: true\n");
      out.write("                            },\n");
      out.write("                            enableMouseTracking: true\n");
      out.write("                        }\n");
      out.write("                    },\n");
      out.write("                    // Doy los datos de la gráfica para dibujarlas\n");
      out.write("                    series: [{\n");
      out.write("                            name: 'usuarios',\n");
      out.write("                            //poner visitas desde la base de datos\n");
      out.write("                            data: [");
      out.print(parametros[1]);
      out.write("]\n");
      out.write("                        }],\n");
      out.write("                });\n");
      out.write("\n");
      out.write("\n");
      out.write("            });\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<nav class=\"navbar navbar-dark navbar-expand-md fixed-top bg-primary flex-grow-1\">\n");
      out.write("    <div class=\"container\"><a class=\"navbar-brand text-monospace text-uppercase text-left text-warning align-items-start\" href=\"index.jsp\"><strong>CEUCAR</strong></a><button class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#navcol-1\"><span class=\"sr-only\">Toggle navigation</span><span class=\"navbar-toggler-icon\"></span></button>\n");
      out.write("        <div\n");
      out.write("            class=\"collapse navbar-collapse\" id=\"navcol-1\">\n");
      out.write("            <ul class=\"nav navbar-nav flex-grow-1 justify-content-end\">\n");
      out.write("                <li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link active text-white\" href=\"index.jsp\">Ventas</a></li>\n");
      out.write("                <li class=\"nav-item dropdown\"><a class=\"dropdown-toggle nav-link text-white\" data-toggle=\"dropdown\" aria-expanded=\"false\" href=\"\">Membresias</a>\n");
      out.write("                    <div class=\"dropdown-menu\" role=\"menu\"><a class=\"dropdown-item\" role=\"presentation\" href=\"#\">Comprar nueva</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link text-white\" href=\"#\">Asistencia</a></li>\n");
      out.write("                <li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link text-white\" href=\"acercade.jsp\">Quienes somos?</a></li>\n");
      out.write("                    ");

                        if (request.getSession().getAttribute("id") != null) {
                            String nombre = "";
                            String rol;
                            rol = request.getSession().getAttribute("rol").toString().trim();
                            nombre = request.getSession().getAttribute("nombre").toString();
                            switch (rol) {
                                case "1": {
                                    rol = "Administrador";
                                    break;
                                }
                                case "2": {
                                    rol = "Ofertador";
                                    break;

                                }
                                case "3": {
                                    rol = "Cliente";
                                    break;

                                }
                                default: {
                                    break;
                                }
                            }
                    
      out.write("\n");
      out.write("                <li class=\"nav-item dropdown\"><a class=\"dropdown-toggle nav-link text-white\" data-toggle=\"dropdown\" aria-expanded=\"false\" href=\"#\">");
      out.print( nombre + " ( " + rol + " )");
      out.write("</a>\n");
      out.write("                    <div class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("                        ");
 if (rol.equals("Ofertador")) {
      out.write("\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"miperfil.jsp\">Mi Perfil</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"membresias.jsp\">Mis Membresia</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"factview.jsp\">Mi Facturacion</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"ventas.jsp\">Gestionar Ventas</a>\n");
      out.write("                        ");
      out.write("\n");
      out.write("                        ");
} else if (rol.equals("Administrador")) {
      out.write("\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"#\">Gestion de clientes</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"mapclients.jsp\">Mapeo de clientes</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"rptopvend.jsp\">Reportes top Vendedores</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"rpmemxrol.jsp\">Reportes tipo de cliente</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"#\">Facturacion</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"#\">Gestionar Empresa</a>\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"miperfil.jsp\">Mi Perfil</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"membresias.jsp\">Mis Membresias</a>\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"factview.jsp\">Mi Facturacion</a>\n");
      out.write("                        ");
} 
      out.write("\n");
      out.write("                        <a class=\"dropdown-item\" role=\"presentation\" href=\"logout.jsp\">Cerrar Sesion</a></div>\n");
      out.write("                </li>\n");
      out.write("                ");
} else {
      out.write("\n");
      out.write("                <li class=\"nav-item\" role=\"presentation\"><a class=\"nav-link text-white\" href=\"login.jsp\">Iniciar Sesion</a></li>\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</nav>");
      out.write("\n");
      out.write("        <div class=\"card text-center\">\n");
      out.write("            <div class=\"card-header\">\n");
      out.write("                CEUCAR.COM\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("                <h5 class=\"card-title\">Reporte usuarios por Membresia</h5>\n");
      out.write("                <div id=\"graficaLineal\" style=\"width: 100%; height: 500px; margin: 0 auto\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-footer text-muted\">\n");
      out.write("                ");
      out.write("<div class=\"footer-basic\">\n");
      out.write("    <footer>\n");
      out.write("        <div class=\"social\"><a href=\"#\"><i class=\"icon ion-social-instagram\"></i></a><a href=\"#\"><i class=\"icon ion-social-snapchat\"></i></a><a href=\"#\"><i class=\"icon ion-social-twitter\"></i></a><a href=\"#\"><i class=\"icon ion-social-facebook\"></i></a></div>\n");
      out.write("        <ul class=\"list-inline\">\n");
      out.write("            <li class=\"list-inline-item\"><a href=\"#\">Inicio</a></li>\n");
      out.write("            <li class=\"list-inline-item\"><a href=\"#\">Acerca de</a></li>\n");
      out.write("            <li class=\"list-inline-item\"><a href=\"#\">Terminos</a></li>\n");
      out.write("            <li class=\"list-inline-item\"><a href=\"#\">Nuestras Politicas</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <p class=\"copyright\">Ceucar.com Â© 2020</p>\n");
      out.write("    </footer>\n");
      out.write("</div>\n");
      out.write("<script src=\"assets/js/jquery.min.js\"></script>\n");
      out.write("<script src=\"assets/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"assets/js/bs-animation.js\"></script>");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- \"Llamo\" a la gráfica y la pinto en el cuerpo de la página -->\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
