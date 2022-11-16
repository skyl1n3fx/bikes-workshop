<%-- 
    Document   : admin
    Created on : 23-sep-2022, 4:16:21
    Author     : Koala
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>El Negro Toño</title>

        <link rel="stylesheet" href="index.css"><!-- importo el css -->
        <link rel="stylesheet" href="productcard.css">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">


    </head>



    <div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
            <div class="container-fluid text-center">
                <a class="navbar-brand"> </a>
                <img src="https://cdn.discordapp.com/attachments/980994339675197460/1018028559446573099/reparacion.jpg" alt="Logo" style="width:40px;" class="rounded-pill">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                            
                        <li class="nav-item">
                            <a class="nav-link" href="../index.jsp">Home</a>
                        </li>
                        
                    </ul>
                </div> 
            </div>
        </nav>
    </div>
    <section class="vh-100" style="background-color: #eee;">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12 col-xl-11">
                        <div class="card text-black" style="border-radius: 25px;">
                            <div class="card-body p-md-5">
                                <div class="row justify-content-center">
                                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Empleado</p>

                                        <form action="../servletEmpleado" id="formulario" method ="GET" >
                                       
                                            <button type="submit" class="btn btn-primary" name="btnAccion" id="btnAccion" value="Listar">Liquidaciones</button>
                                        </form>
                                        
                                        <form action="../servletEmpleado" id="formulario" method ="GET" >
                                       
                                            
                                            <button type="submit" class="btn btn-dark" name="btnAccion" id="btnAccion" value="Anticipo">Anticipos</button>
                                        </form>
                                        
                                        <form action="../servletEmpleado" id="formulario" method ="GET" >
                                       
                                            
                                            
                                            <button type="submit" class="btn btn-danger" name="btnAccion" id="btnAccion" value="Eliminar">Renunciar</button>
                                        </form>


                                    </div>
                                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                        <img src="https://cdn.discordapp.com/attachments/980994339675197460/1021273943719563295/unknown.png"
                                             class="img-fluid resize" alt="Sample image">

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

    
    <!-- Footer -->
    <footer
        class="text-center text-lg-start text-white"
        style="background-color: #16A086"
        >
        <!-- Section: Social media -->
        <section
            class="d-flex justify-content-between p-4"
            style="background-color: #262626"
            >
            <!-- Left -->
            <div class="me-5">
                <span></span>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="text-white me-4">
                    <i class="fa fa-facebook-f"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-google"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-instagram"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-linkedin"></i>
                </a>
                <a href="" class="text-white me-4">
                    <i class="fa fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold">Negro Toño</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p>
                            Acá puedes encontrar información adicional sobre nuestra tienda
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Información</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p>
                            <a href="#!" class="text-white">Garantia</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Politica de Cambios</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Taller</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">¿Puedo devolver mi pedido?</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold"></h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p>
                            <a href="#!" class="text-white">Terminos Y condiciones</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Politicas de Privacidad</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Politica de Cookies</a>
                        </p>
                        <p>
                            <a href="#!" class="text-white">Ayuda</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold">Nuestra Tienda</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p><i class="fas fa-home mr-3"></i> El Peñón 2662, Puente Alto</p>
                        <p><i class="fas fa-envelope mr-3"></i> contacto@negroTono.com</p>
                        <p><i class="fas fa-phone mr-3"></i> + 56 9 02711538</p>
                        <p><i class="fas fa-print mr-3"></i> + 56 9 51877279</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div
            class="text-center p-3"
            style="background-color: rgba(0, 0, 0, 0.2)"
            >
            © 2022 Copyright
        </div>
        <!-- Copyright -->
    </footer>
</html>
