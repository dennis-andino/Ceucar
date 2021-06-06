<%--
    Document   : navbar
    Created on : 03-04-2020, 09:36:30 PM
    Author     : Dennis_Andino
--%>

<nav class="navbar navbar-dark navbar-expand-md fixed-top bg-primary flex-grow-1">
    <div class="container"><a class="navbar-brand text-monospace text-uppercase text-left text-warning align-items-start" href="index.jsp"><strong>CEUCAR</strong></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div
            class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav flex-grow-1 justify-content-end">
                <li class="nav-item" role="presentation"><a class="nav-link active text-white" href="index.jsp">Ventas</a></li>
                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link text-white" data-toggle="dropdown" aria-expanded="false" href="">Membresias</a>
                    <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="#">Comprar nueva</a>
                </li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="#">Asistencia</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="acercade.jsp">Quienes somos?</a></li>
                    <%
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
                    %>
                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link text-white" data-toggle="dropdown" aria-expanded="false" href="#"><%= nombre + " ( " + rol + " )"%></a>
                    <div class="dropdown-menu" role="menu">
                        <% if (rol.equals("Ofertador")) {%>
                        <a class="dropdown-item" role="presentation" href="miperfil.jsp">Mi Perfil</a>
                        <a class="dropdown-item" role="presentation" href="membresias.jsp">Mis Membresia</a>
                        <a class="dropdown-item" role="presentation" href="factview.jsp">Mi Facturacion</a>
                        <a class="dropdown-item" role="presentation" href="ventas.jsp">Gestionar Ventas</a>
                        <%--<a class="dropdown-item" role="presentation" href="rentas.jsp">Gestionar Rentas</a>
                        <a class="dropdown-item" role="presentation" href="rentas.jsp">Productos en Subasta</a>
                        <a class="dropdown-item" role="presentation" href="#">Gestionar Carwash</a>--%>
                        <%} else if (rol.equals("Administrador")) {%>
                        <a class="dropdown-item" role="presentation" href="#">Gestion de clientes</a>
                        <a class="dropdown-item" role="presentation" href="mapclients.jsp">Mapeo de clientes</a>
                        <a class="dropdown-item" role="presentation" href="rptopvend.jsp">Reportes top Vendedores</a>
                        <a class="dropdown-item" role="presentation" href="rpmemxrol.jsp">Reportes tipo de cliente</a>
                        <a class="dropdown-item" role="presentation" href="#">Facturacion</a>
                        <a class="dropdown-item" role="presentation" href="ceucar.jsp">Gestionar Empresa</a>
                        <%} else {%>
                        <a class="dropdown-item" role="presentation" href="miperfil.jsp">Mi Perfil</a>
                        <a class="dropdown-item" role="presentation" href="membresias.jsp">Mis Membresias</a>
                        <a class="dropdown-item" role="presentation" href="factview.jsp">Mi Facturacion</a>
                        <%} %>
                        <a class="dropdown-item" role="presentation" href="logout.jsp">Cerrar Sesion</a></div>
                </li>
                <%} else {%>
                <li class="nav-item" role="presentation"><a class="nav-link text-white" href="login.jsp">Iniciar Sesion</a></li>
                    <% }%>
            </ul>
        </div>
    </div>
</nav>