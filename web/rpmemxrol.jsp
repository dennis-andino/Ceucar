<%--
    Document   : rpmemxrol
    Created on : 03-23-2020, 09:16:30 PM
    Author     : Dennis_Andino
--%>

<%@page import="controlador.MembresiaController"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ceucar/Reportes</title>
        <%@ include file="estilos.html" %>
        <!-- Importa las librerias de jQuery y las de Highcharts -->
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/highcharts.js"></script>
        <script type="text/javascript" src="js/exporting.js"></script>
        <%
            MembresiaController reporte = new MembresiaController();
            String[] parametros;
            parametros = reporte.membXrol();
        %>

        <script type="text/javascript">
            var chart;
            $(document).ready(function() {

                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'graficaLineal', // Le doy el nombre a la gráfica
                        type: 'column'  // Pongo que tipo de gráfica es
                    },
                    title: {
                        text: 'Estadisticas'	// Titulo (Opcional)
                    },
                    subtitle: {
                        text: 'Usuarios por membresia'				// Subtitulo (Opcional)
                    },
                    // Pongo los datos en el eje de las 'X'
                    xAxis: {
                        //poner los meses recuperados de la base de datos
                        categories: [<%=parametros[0]%>],
                        // Pongo el título para el eje de las 'X'
                        title: {
                            text: 'Membresias'
                        }
                    },
                    yAxis: {
                        // Pongo el título para el eje de las 'Y'
                        title: {
                            text: 'Clientes'
                        }
                    },
                    // Doy formato al la "cajita" que sale al pasar el ratón por encima de la gráfica
                    tooltip: {
                        enabled: true,
                        formatter: function() {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    this.x + ': ' + this.y + ' ' + this.series.name;
                        }
                    },
                    // Doy opciones a la gráfica
                    plotOptions: {
                        line: {
                            dataLabels: {
                                enabled: true
                            },
                            enableMouseTracking: true
                        }
                    },
                    // Doy los datos de la gráfica para dibujarlas
                    series: [{
                            name: 'usuarios',
                            //poner visitas desde la base de datos
                            data: [<%=parametros[1]%>]
                        }],
                });


            });

        </script>

    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="card text-center">
            <div class="card-header">
                CEUCAR.COM
            </div>
            <div class="card-body">
                <h5 class="card-title">Reporte usuarios por Membresia</h5>
                <div id="graficaLineal" style="width: 100%; height: 500px; margin: 0 auto"></div>
            </div>
            <div class="card-footer text-muted">
                <%@ include file="footer.html" %>
            </div>
        </div>
        <!-- "Llamo" a la gráfica y la pinto en el cuerpo de la página -->

    </body>
</html>
