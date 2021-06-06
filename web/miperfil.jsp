<%--
    Document   : miperfil
    Created on : 03-14-2020, 03:56:02 PM
    Author     : Dennis_Andino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Ceucar.com/mi perfil</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
        <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
        <link rel="stylesheet" href="assets/fonts/typicons.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
        <link rel="stylesheet" href="assets/css/Features-Boxed.css">
        <link rel="stylesheet" href="assets/css/Footer-Basic.css">
        <link rel="stylesheet" href="assets/css/Header-Blue.css">
        <link rel="stylesheet" href="assets/css/Highlight-Clean.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
        <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Informacion de perfil</h5>
                </div>
                <div class="card-header">
                    <h5 class="card-title">Mi nombre completo</h5>
                </div>
                <div class="card-body">
                    <p class="card-text">Para editar tu informacion , solamente cambia los registros y presiona en el boton de actualizar :).</p>
                    <form method="POST" action="loginDAO.jsp">
                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="txtnombre">Nombre</label>
                                <input type="text" class="form-control" id="txtnombre" name="txtnombre" value="<%=request.getSession().getAttribute("nombre")%>">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="txtapellido">Apellido</label>
                                <input type="text" class="form-control" id="txtpass" name="txtapellido" value="<%=request.getSession().getAttribute("apellido")%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="txtmail">Email</label>
                                <input type="email" class="form-control" id="txtmail" name="txtmail" value="<%=request.getSession().getAttribute("correo")%>">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="txtelefono">Telefono</label>
                                <input type="text" class="form-control" id="txtelefono" name="txtelefono" value="<%=request.getSession().getAttribute("telefono")%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="cbpais">Pais</label>
                                <select id="cbpais" class="form-control" name="cbpais">
                                    <option value="<%=request.getSession().getAttribute("pais")%>" selected><%=request.getSession().getAttribute("pais")%></option>
                                    <option value="Honduras">Honduras</option>
                                    <option value="Guatemala" >Guatemala</option>
                                    <option value="Mexico" >Mexico</option>
                                    <option value="EEUU" >EEUU</option>
                                    <option value="El Salvador" >El Salvador</option>
                                </select>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="fechanac">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" id="fechanac" name="fechanac" value="<%=request.getSession().getAttribute("fechanac")%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="txtrtn">Registro tributario</label>
                                <input type="text" class="form-control" id="txtlat" name="txtrtn" value="<%=request.getSession().getAttribute("rtn")%>" >
                            </div>
                            <%-- <div class="form-group col-md-4">
                            <label for="txtlat">Latitud</label>
                            <input type="text" class="form-control" id="txtlat" name="txtlat" value="" >
                        </div>

                            <div class="form-group col-md-4">
                                <label for="txtlong">Longitud</label>
                                <input type="text" class="form-control" id="txtlong" name="txtlong" value="">
                            </div>--%>
                        </div>
                </div>
                <button type="submit" class="btn btn-primary" name="accion" value="btnactualizar">Actualizar mi Informacion</button>
                </form>
            </div>
        </div>

    </div>
    <%@ include file="footer.html" %>
</body>
</html>
