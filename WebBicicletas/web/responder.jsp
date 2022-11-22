<%-- 
    Document   : catalogo
    Created on : 22-11-2022, 14:01:40
    Author     : duguz
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${ userSession.tipo != 3}">
    <c:redirect url="./login.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
    </c:redirect>
</c:if>
<!-- Establecemos la conexión a la BD -->
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/basenegrotono?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="consultas">
    SELECT c.id, c.descripcion, cli.nombre, c.estado
    FROM CONSULTA c
    INNER JOIN CLIENTE cli
    ON c.id_cliente = cli.id
    WHERE c.estado = 'PENDIENTE'
   
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

            
        <h1 class="text-center">Consultas</h1>
  
            <div class="container-fluid d-flex align-items-center">
                <c:forEach var="x" items="${consultas.rows}">
                <div class="card" style="width: 18rem;">
                    <img src="data:image/png;base64,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" class="card-img-top" alt="...">
                    <div class="card-body text-center">
                    <p class="card-text">${x.descripcion}</p>
                    <p class="card-text">${x.nombre}</p>
        
                    <A class="btn btn-success" href="consulta?id=${x.id}">Responder</a>
                    </div>
                </div>
                </c:forEach>                                
            </div>
  
 

 
        
        
    </body>
</html>
