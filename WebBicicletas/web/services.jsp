<%-- 
    Document   : catalogo
    Created on : 22-11-2022, 14:01:40
    Author     : duguz
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/basenegrotono?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="services">
    SELECT s.id, s.nombre_repa, s.descripcion
    FROM reparacion s
   
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
              <!-- Incluimos la barra de navegación -->
        <jsp:include page="./navbar.jsp"></jsp:include>

            
        <h1 class="text-center">Servicios</h1>
  
            <div class="container-fluid d-flex align-items-center">
                <c:forEach var="x" items="${services.rows}">
                <div class="card" style="width: 18rem;">
                    <img src="https://thumbs.dreamstime.com/b/servicaturista-reparando-una-bicicleta-en-un-taller-de-bicicletas-concepto-servicio-reparaci%C3%B3n-ilustraci%C3%B3n-vectorial-plana-con-188777862.jpg" class="card-img-top" alt="...">
                    <div class="card-body text-center">
                    <p class="card-text">${x.nombre_repa}</p>
                    <p class="card-text">${x.descripcion}</p>
        
                    <input class="btn btn-success" value="Solicitar">
                    </div>
                </div>
                </c:forEach>                                
            </div>
  
 

 
        
        
    </body>
</html>
