<%@page import="java.util.List"%>
<%@page import="modelo.Vehiculo"%>
<%@page import="controlador.VehiculoController"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <%@ include file="estilos.html" %>
        <title>CEUCAR.COM</title>
    </head>

    <body class="text-secondary">
        <%-- inicio navbar --%>
        <%@ include file="navbar.jsp" %>
        <%@ include file="frmneg.jsp" %>
        <%-- fin navbar --%>
        <div class="row" style="width: 1223px;height: 57px;">
            <div class="col"></div>
        </div>
        <div class="row" style="padding: 0px;height: 286px;">
            <div class="col-12">
                <div class="jumbotron" style="background-image: url(&quot;assets/img/portadaer_.jpg&quot;);">
                    <h1>Miles de autos , Miles de opciones !</h1>
                    <p>Adquiere el Auto de tus sueños o promociona tus servicios ! obten una membresia hoy !</p>
                    <% if (request.getSession().getAttribute("id") == null) {%>
                    <p><a class="btn btn-primary text-white" role="button" href="registrarme.jsp">Registrarme</a></p>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Mi Buscador</h4>
                            <form>
                                <div class="form-group"><label>Marca</label><select class="form-control"><option value="toyota" selected="">Toyota</option><option value="hyundai" selected="">Hyundai</option><option value="honda">Honda</option></select></div>
                                <div class="form-group"><label>Año</label><select class="form-control form-control-sm"><option value="2010">2010</option></select></div><button class="btn btn-primary btn-block btn-sm" type="submit">Buscar</button></form>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Buscar por VIN</h4>
                            <form>
                                <div class="form-group"><input class="form-control" type="text"></div>
                                <div class="form-group"><button class="btn btn-primary btn-block btn-sm" type="button">Buscar por VIN</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div></div>
                <%
                    VehiculoController veh = new VehiculoController();
                    List<Vehiculo> milista = veh.PublicidadVeh();
                %>
                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Vehiculos mas recientes</h4>
                            <div class="container-md">
                                <table class="table-responsive table table-borderless">
                                    <tbody>
                                        <tr>
                                            <% if (milista.size() >= 1) {
                                                    int banderin = 0;
                                                    for (int i = 0; i < milista.size(); i++) {
                                            %>
                                            <td>
                                                <div class="card-body">
                                                    <h5 class="card-title"><%=milista.get(i).getMarca() + "(" + milista.get(i).getModelo() + ")"%><span class="badge badge-info"><%= milista.get(i).getVal_venta()%></span></h5>
                                                    <div id="carouselExampleControls<%=i%>" class="carousel slide" data-interval="false"  data-ride="carousel">
                                                        <div class="carousel-inner">
                                                            <div class="carousel-item active">
                                                                <%=milista.get(i).getImg1()%>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <%=milista.get(i).getImg2()%>
                                                            </div>
                                                            <div class="carousel-item">
                                                                <%=milista.get(i).getImg3()%>
                                                            </div>
                                                        </div>
                                                        <a class="carousel-control-prev" href="#carouselExampleControls<%=i%>" role="button" data-slide="prev">
                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>

                                                        </a>
                                                        <a class="carousel-control-next" href="#carouselExampleControls<%=i%>" role="button" data-slide="next">
                                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>

                                                        </a>
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">VIN:<%=milista.get(i).getVin()%>
                                                            <br> Cilindraje: <%= milista.get(i).getCilindraje()%>
                                                            <br>Transmision: <%= milista.get(i).getTransmision()%>
                                                            <br> Kilometraje: <%= milista.get(i).getKilometraje()%>
                                                            <br>Ubicacion:  <%= milista.get(i).getUbicacion()%>
                                                        </li>
                                                        <li class="list-group-item"><%= milista.get(i).getDescripcion()%></li>
                                                    </ul>
                                                    <% if (request.getSession().getAttribute("id") != null) {%>
                                                    <a href="frmcomprar.jsp?vin=<%= milista.get(i).getVin()%>&marca=<%= milista.get(i).getMarca()%>&modelo=<%= milista.get(i).getModelo()%>&total=<%=milista.get(i).getVal_venta()%>&idveh=<%=milista.get(i).getId_veh()%>" class="badge badge-success">Reservar</a>
                                                    <a href="" class="badge badge-warning" data-toggle="modal" data-target="#negform" data-whatever="@mdo">Negociar</a>
                                                    <%} else {%>
                                                    <p><a class="badge badge-warning" href="registrarme.jsp">Registrate para comprar</a></p>
                                                    <%}%>

                                                </div>
                                            </td>

                                            <% banderin++;
                                                if (banderin == 3) {
                                                    banderin = 0;
                                            %>
                                        </tr><tr>
                                            <%
                                                    }
                                                }
                                            } else {%>
                                    <div>
                                        <tr><td colspan="6" ><br> No se encontraron Registros, Ingresa un nuevo Vehiculo :)</td></tr>
                                                <%}%>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <%@ include file="footer.html" %>
</body>

</html>