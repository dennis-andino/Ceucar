<%--
    Document   : login
    Created on : 03-04-2020, 09:24:22 PM
    Author     : Dennis_Andino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ceucarModel</title>
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
        <%-- inicio navbar --%>
        <%@ include file="navbar.jsp" %>
        <%-- fin navbar --%>
        <div class="row" style="width: 1223px;height: 57px;">
            <div class="col"></div>
        </div>
        <div class="row" style="height: 516px;margin: 14px;">
            <div class="col-6">
                <div>
                    <div class="card">
                        <div class="card-body justify-content-center align-content-center" style="padding: 47px;margin: 18px;height: 448px;">
                            <h4 class="text-center card-title">Iniciar Sesion</h4><i class="typcn typcn-user flex-fill align-content-center"></i>
                            <form method="POST" action="loginDAO.jsp">
                                <h2 class="sr-only">Login</h2>
                                <div class="illustration"></div>
                                <div class="form-group"><input class="form-control" type="email" name="txtemail" placeholder="Email"></div>
                                <div class="form-group"><input class="form-control" type="password" name="txtpass" placeholder="Password"></div>
                                <div class="form-group"><button class="btn btn-primary btn-block" type="submit" name="accion" value="btnlogin">Iniciar</button></div><a href="loginDAO.jsp" class="forgot">Recuperar mi Contraseña :C</a></form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div>
                    <div class="card">
                        <div class="card-body" style="margin: 1px;background-image: url(&quot;assets/img/bienvenido.jpg&quot;);background-position: center;background-size: contain;background-repeat: no-repeat;height: 484px;padding: 20px;background-color: #235da2;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-basic">
            <footer>
                <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#">CEUCAR</a></li>
                    <li class="list-inline-item"><a href="#">Servicios</a></li>
                    <li class="list-inline-item"><a href="#">Quienes Somos</a></li>
                    <li class="list-inline-item"><a href="#">Terminos</a></li>
                    <li class="list-inline-item"><a href="#">Politica de privacidad</a></li>
                </ul>
                <p class="copyright">CEUCAR© 2020</p>
            </footer>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bs-animation.js"></script>
    </body>

</html>