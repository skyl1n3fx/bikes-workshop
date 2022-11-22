 <%-- 
    Document   : login
    Created on : 16-sep-2022, 23:51:09
    Author     : Koala
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>El Negro Toño - Login</title>
        
        <link rel="stylesheet" href="index.css"><!-- importo el css -->
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
<!-- Incluimos la barra de navegación -->
<jsp:include page="./navbar.jsp"></jsp:include>
    <section style="background-color: #9A616D;">
        <div class="container py-5" >
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block" >
                                <img src="https://cdn.discordapp.com/attachments/980994339675197460/1021182356578635826/unknown.png"
                                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form action="Controlador?menu=Usuario&accion=Login" method="POST">

                                            <div class="d-flex align-items-center mb-3 pb-1">
                                              <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                              <span class="h1 fw-bold mb-0">Logo</span>
                                            </div>

                                            <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Inicia Sesión</h5>

                                            <div class="form-outline mb-4">
                                                <input type="email" id="email_log" class="form-control form-control-lg" name="email_log" />
                                                <label class="form-label" for="form2Example17">Correo Electronico</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" id="contra_log" class="form-control form-control-lg" name="contra_log" required/>
                                                <label class="form-label" for="form2Example27">Contraseña</label>
                                            </div>

                                            <div class="pt-1 mb-4">
                                                <button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
                                            </div>

                                          
                                            <p class="mb-5 pb-lg-2" style="color: #393f81;">No tienes una cuenta? <a href="crearCuenta.jsp"
                                                style="color: #393f81;">Registrate aquí</a></p>
                                            <a href="#!" class="small text-muted">Terminos de uso.</a>
                                            <a href="#!" class="small text-muted">Politicas de Privacidad</a>
                                        </form>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
</html>
