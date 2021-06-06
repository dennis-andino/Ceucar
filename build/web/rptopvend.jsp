<%--
    Document   : rptopvend
    Created on : 03-24-2020, 01:16:27 AM
    Author     : Dennis_Andino
--%>

<%@page import="controlador.ReporteController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ceucar.com/top Vendedores</title>
        <%@ include file="estilos.html" %>
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/highcharts.js"></script>
        <script type="text/javascript" src="js/exporting.js"></script>
        <%
            ReporteController reporte = new ReporteController();
            String[] datos = new String[10];
            datos = reporte.topVentas();
        %>
        <script type="text/javascript">
            var chart;
            $(document).ready(function() {
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'graficaCircular'
                    },
                    title: {
                        text: 'Top los mejores Vendedores'
                    },
                    subtitle: {
                        text: 'ceucar.com'
                    },
                    plotArea: {
                        shadow: null,
                        borderWidth: null,
                        backgroundColor: null
                    },
                    tooltip: {
                        formatter: function() {
                            return '<b>' + this.point.name + '</b>: ' + this.y + ' %';
                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                formatter: function() {
                                    return '<b>' + this.point.name + '</b>: ' + this.y + ' %';
                                }
                            }
                        }
                    },
                    series: [{
                            type: 'pie',
                            name: 'Browser share',
                            data: [
            <%
                for (int i = 0; i < 10; i++) {
                    if (!datos[i].equals("")) {
                        out.print(datos[i]);
                        System.out.println(datos[i]);
                    } else {
                        break;
                    }
                }
            %>
                            ]
                        }]
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
                <h5 class="card-title">Los mejores Vendedores</h5>
                <div id="graficaCircular" style="width: 100%; height: 500px; margin: 0 auto"></div>
            </div>
            <div class="card-footer text-muted">
                <%@ include file="footer.html" %>
            </div>
        </div>

    </body>
</html>
