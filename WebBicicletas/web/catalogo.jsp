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

        
  
            <div class="container-fluid d-flex align-items-center">
                <c:forEach var="x" items="${products.rows}">
                <div class="card" style="width: 18rem;">
                <img src="${x.imagen}" class="card-img-top" alt="...">
                    <div class="card-body text-center">
                    <p class="card-text">${x.descripcion}</p>
                    <p class="card-text">Stock: ${x.stock}</p>
                    <c:choose>
                        <c:when test = "${x.descuento > 0}">
                            <span style="text-decoration:line-through; color: red">$${x.precio}</span>
                            <span style="font-size: 30px; color: #17d90d;">$${x.precio - x.descuento}</span>
                        </c:when>

                        <c:otherwise>
                                   <span style="font-size: 30px; color: #17d90d;">$${x.precio}</span>
                        </c:otherwise>
                    </c:choose>
                    <input class="btn btn-success" value="Comprar">
                    </div>
                </div>
                </c:forEach>                                
            </div>
  
 

 
        
        
    </body>
</html>
