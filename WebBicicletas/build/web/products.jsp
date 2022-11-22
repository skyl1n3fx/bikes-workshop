<%-- 
    Document   : products
    Created on : 21-11-2022, 12:12:19
    Author     : duguz
--%>

<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Establecemos la conexión a la BD -->
<c:if test="${ userSession.tipo != 2}">
    <c:redirect url="./login.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
    </c:redirect>
</c:if>
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
        <title>Productos</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    </head>
    <body style="background: #000">
        <jsp:include page="./navbar.jsp"></jsp:include>
        <table class="table table-dark table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Descripcion</th>
      <th scope="col">Marca</th>
      <th scope="col">Categoria</th>
      <th scope="col">Imagen</th>
      <th scope="col">Precio</th>
      <th scope="col">Stock</th>
      <th scope="col">Descuento</th>
      <th scope="col">Accion</th>
    </tr>
  </thead>
  <div style="margin: 20px">
      <a class="btn btn-success" href="add-product.jsp">Agregar Producto</a>
  </div>
        
        <tbody>
        <c:forEach var="x" items="${products.rows}">
          <tr>
            <th scope="row">${x.id}</th>
            <td>${x.descripcion}</td>
            <td>${x.desc_marca}</td>
            <td>${x.desc_categoria}</td>
            <td>
                <c:choose>
                    <c:when test="${x.imagen != ''}">
                        <img width="40px" height="40px" style="border-radius: 50%" 
                        src="${x.imagen}" alt="${x.descripcion}"
                        title="Imagen de producto ${x.descripcion}"/>
                    </c:when>
                    <c:otherwise>
                        <img width="40px" height="40px" style="border-radius: 50%" 
                        src="https://us.123rf.com/450wm/surfupvector/surfupvector1908/surfupvector190802662/129243509-icono-de-l%C3%ADnea-de-arte-denegado-censura-no-hay-foto-no-hay-imagen-disponible-rechazar-o-cancelar-con.jpg?ver=6"/>
                    </c:otherwise>
                </c:choose>                
            </td>
            <td>$${x.precio}</td>
            <td>${x.stock}</td>
            <td>$${x.descuento}</td>
            <td>
                <a class="btn btn-primary" href="./servletProducto?id=${x.id}">Modificar</a>
                <a class="btn btn-danger"  onclick="deleteEntity('Producto','${x.id}')">Eliminar</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    <form name="reporte" action="./servletPdf" style="margin: 20px;">
        <input class="btn btn-success" type="submit" value="Visualizar Pdf"  name="btn-ver"/>
    </form>
        
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="./validation/delete-message.js"></script>
    </body>
</html>
