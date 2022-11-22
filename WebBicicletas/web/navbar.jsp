<%-- 
    Document   : navbar
    Created on : 22-11-2022, 1:20:44
    Author     : duguz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

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
                                <a class="nav-link"  href="admin/admin.jsp" >Catalogo</a>
                            </li>
                            
                            
                            <li class="nav-item">
                                <a class="nav-link" href="reparacion.jsp">Servicios</a>
                            </li>
                            
                            
                           
                            <li class="nav-item" >
                                <a class="nav-link" href="login.jsp">Iniciar Sesión</a>
                            </li> 
      
                        </ul>
                    </div> 
                </div>
            </nav>
        </div>


</html>
