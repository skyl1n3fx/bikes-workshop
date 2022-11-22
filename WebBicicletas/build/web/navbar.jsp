<%-- 
    Document   : navbar
    Created on : 22-11-2022, 1:20:44
    Author     : duguz
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                            
                            
                            <c:choose>
                                <c:when test="${userSession.session}">
                                    
                                    <li class="nav-item" style="position: absolute; right: 0">
                                        <a class="nav-link" onclick="logout()">🟢${userSession.email}</a>
                                    </li> 
                         
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item" >
                                        <a class="nav-link" href="login.jsp">Iniciar Sesión</a>
                                    </li> 
                                </c:otherwise>
                            </c:choose>
          
      
                        </ul>
                    </div> 
                </div>
            </nav>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="./validation/delete-message.js"></script>
    </body>
</html>
