<%-- 
    Document   : index
    Created on : 21-10-2022, 5:40:03
    Author     : duguz
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/basenegrotono?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="products">
    SELECT p.id, p.precio, p.stock, p.descripcion,
    p.imagen, p.descuento,
    CONCAT(m.descripcion) as desc_marca,
    CONCAT(c.descripcion) as desc_categoria
    FROM producto p
    INNER JOIN 
    marca m
    ON p.id_marca = m.id
    INNER JOIN CATEGORIA c
    ON p.id_categoria = c.id
    WHERE p.stock > 1
    ORDER BY RAND()
    LIMIT 5
    
   
</sql:query>
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


        

        <div class="container mx-auto">
            <div class="row justify-content-center text-center">
                <div class="col-md-8 col-lg-6">
                    <div class="header">
                        <p>  </p>
                        <h1>Productos populares</h1>
                        <p>  </p>
                    </div>
                </div>
            </div>

    

            <!-- TOP PRODUCTOS -->
            <div class="container-fluid padding-bottom" >
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
                  <div class="carousel-indicators">

                    <c:forEach var="x" items="${products.rows}"   varStatus="loop">
                     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${loop.index}" class="active" aria-current="true" aria-label="Slide ${loop.index + 1}"></button>
                    </c:forEach>


                   </div>
                  <div class="carousel-inner">
                    
                      
                <c:forEach var="x" items="${products.rows}" >
                    <div class="carousel-item active">
                        <img src="${x.imagen}" width="100%" height="800px"
                      class="d-block w-100" alt="...">
                        
                      <div class="carousel-caption d-none d-md-block" style="background: #00000080; border-radius: 20px; ">
                        <h5>${x.descripcion}</h5>
                            <c:choose>

                            <c:when test = "${x.descuento > 0}">
                                <span style="text-decoration:line-through; color: red">$${x.precio}</span>
                                <span style="font-size: 30px; color: #17d90d;">$${x.precio - x.descuento}</span>
                            </c:when>

                            <c:otherwise>
                                       <span style="font-size: 30px; color: #17d90d;">$${x.precio}</span>
                            </c:otherwise>
                            </c:choose>
                        
                        <p>Contamos con <span style="color: red; font-size: 20px">${x.stock} </span>existencias en nuestro catologo!</p>
                      </div>
                    </div>                      
                </c:forEach>

                    
   
                      
                      
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
            </div>


            <div class="row row-cols-2 row-cols-md-2 g-4 padding-bottom">
                <a class="btn btn-outline-light" href="#1" style=" max-width: 40rem; height: auto;">
                    <img src="https://static.crossmountain.cl/a/500/images/banners/categora_bicicletas_57_8658.webp?treat2" width="100%"  class="card-img" > 
                </a><!-- comment -->
                <a class="btn btn-outline-light " href="#2" style=" max-width: 40rem; height: auto;"> 
                    <img src="https://static.crossmountain.cl/a/500/images/banners/categora_indumentaria_26_68bd.webp?treat2" width="100%"  class="card-img" > 
                </a><!-- comment -->
                <a class="btn btn-outline-light" href="#3" style=" max-width: 40rem; height: auto;">
                    <img src="https://static.crossmountain.cl/a/500/images/banners/protecciones_neumticos_27_2504.webp?treat2" width="100%"  class="card-img" > 
                </a><!-- comment -->
                <a class="btn btn-outline-light" href="#4" style=" max-width: 40rem; height: auto;">
                    <img src="https://static.crossmountain.cl/a/500/images/banners/categora_mantencin-y-lubricacin_24_b807.webp?treat2" width="100%"  class="card-img" > 
                </a><!-- comment -->

            </div>
        </div>

        <div class="container mx-auto">
            <div class="row justify-content-center text-center">
                <div class="col-md-8 col-lg-6">
                    <div class="header">
                        <p>  </p>
                        <h2>Nuestros Servicios</h2>
                        <p>  </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="pricing-area padding-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="single-price">
                            <div class="deal-top">
                                <h3>Mantención Básica</h3>
                                <h4> $ 15.000 <span class="sup"></span> </h4> 
                            </div>
                            <div class="deal-bottom">
                                <ul class="deal-item">
                                    <li>Limpieza General</li>
                                    <li>Lubricación de cadena</li>
                                    <li>Ajuste de Frenos</li>
                                    <li>Ajuste de cambios</li>
                                </ul>
                                <div class="btn-area">
                                    <a href="https://wa.me/56976810505">Agendar</a>      
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="single-price">
                            <div class="deal-top">
                                <h3>Armado de bicicleta</h3>
                                <h4> $ 15.000 <span class="sup"></span> </h4>
                            </div>
                            <div class="deal-bottom">
                                <ul class="deal-item">
                                    <li>Revisión de la bicicleta</li>
                                    <li>Engrasado Correspondiente</li>
                                    <li>Armado</li>
                                    <li>Ajuste de frenos </li>
                                    <li>Ajuste de Cambios </li>
                                </ul>
                                <div class="btn-area">

                                    <a href="https://wa.me/56976810505">Agendar</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="single-price">
                            <div class="deal-top">
                                <h3>Mantención full</h3>
                                <h4> $ 50.000 <span class="sup"></span> </h4> 
                            </div>
                            <div class="deal-bottom">
                                <ul class="deal-item">
                                    <li>Desarme total</li>
                                    <li>Engrasado</li>
                                    <li>Mantencion de Ruedas</li>
                                    <li>Sangrado de Frenos </li>
                                    <li>Ajuste de Cambios </li>
                                    <li>Ajuste de Frenos</li>
                                    <li>Cambio de Piola y fundas</li>

                                </ul>
                                <div class="btn-area">
                                    <a href="https://wa.me/56976810505">Agendar</a>       
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
        </div>
        
        <div class="container mx-auto">
            <div class="row justify-content-center text-center">
                <div class="col-md-8 col-lg-6">
                    <div class="header">
                        <p>  </p>
                        <h2>Preguntas y Respuestas</h2>
                        <p>  </p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="pricing-area padding-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="single-price">
                            <div class="deal-top">
                                <li>Juan Carlos</li>
                            </div>
                            <div class="deal-bottom">
                                <ul class="deal-item">
                                    <h2>¿Que piensas sobre la atenciòn de la empresa?</h2>
                                    <li>Me parecio una atenciòn muy profesional no esperaba menos de su tienda la recomiendo a full.</li>
                                </ul>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="single-price">
                            <div class="deal-top">
                                <li>Piero Sanchez</li>
                            </div>
                            <div class="deal-bottom">
                                <ul class="deal-item">
                                    <h2>¿Que te parecio nuestros servicios?</h2>
                                    <li>Me parecio bastante buena la tienda en general y màs con sus buenos productos de calidad</li>
                                </ul>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="single-price">
                            <div class="deal-top">
                                <li>Bayron Sanchez</li> 
                            </div>
                            <div class="deal-bottom">
                                <ul class="deal-item">
                                    <h2>¿Crees que estamos bien ubicados?</h2>
                                    <li>Estan muy bien ubicados para las personas de la comuna y me gustaria destacar la muy buena accesibilidad de la tienda.</li>

                                </ul>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
        </div>
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
