<%-- 
    Document   : index
    Created on : 21-10-2022, 5:40:03
    Author     : duguz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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


    <body>
        <!-- Div de despacho gratis sobre 100k -->
        <div class="div-1">
            <div class="text-center" color="#008000" >
                Envío gratuito para compras superiores a <b>$100.000</b>
            </div>
        </div>


        <!-- div de navbar -->
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
                            
                            <li class="nav-item" >
                                <a class="nav-link" href="index.jsp">Home</a>
                            </li> 
                            
                            <li class="nav-item"  >
                                <a class="nav-link"  href="admin/admin.jsp" >Productos</a>
                            </li>
                            
                            
                            <li class="nav-item">
                                <a class="nav-link" href="reparacion.jsp">Servicios</a>
                            </li>
                            
                            
                            
                            
                            <li class="nav-item" >
                                <a class="nav-link" href="registrarCliente.jsp">Registro</a>
                            </li>

                            <li class="nav-item" >
                                <a class="nav-link" href="login.jsp">Cuenta</a>
                            </li> 
                            
                            <li class="nav-item"  >
                                <a class="nav-link"  href="empleado/empleado.jsp" >Empleado</a>
                            </li>

                        </ul>
                    </div> 
                </div>
            </nav>
        </div>



        <!--carrousel -->


        <div class="padding-bottom">
            <div id="carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#carousel" data-bs-slide-to="3" aria-label="Slide 4"></button>

                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://cdn.discordapp.com/attachments/980994339675197460/1019691386372628531/unknown.png" alt="1" class="img-fluid">
                    </div>

                    <div class="carousel-item">
                        <img src="https://cdn.discordapp.com/attachments/980994339675197460/1019455599076974602/unknown.png" alt="2" class="img-fluid">
                    </div>
                    <div class="carousel-item">
                        <img src="https://cdn.discordapp.com/attachments/980994339675197460/1019454871021305916/unknown.png" alt="3"  class="img-fluid">
                    </div>
                    <div class="carousel-item">
                        <img src="https://cdn.discordapp.com/attachments/980994339675197460/1019454910430986280/unknown.png" alt="4" class="img-fluid">
                    </div>
                </div>

                <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>             
                </button>


            </div>
        </div>
        <h1>compra!</h1>
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
    <!-- Footer -->


</html>
