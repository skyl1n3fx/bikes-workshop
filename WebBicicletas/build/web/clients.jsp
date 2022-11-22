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
<sql:query dataSource="${dataSource}" var="clients">
    SELECT c.id, c.nombre, c.apellido, c.email, c.direccion
    FROM CLIENTE c
   
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
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Direccion</th>
      <th scope="col">Email</th>
      <th scope="col">Accion</th>
    </tr>
  </thead>
  <div style="margin: 20px">
     
  </div>
        
        <tbody>
        <c:forEach var="x" items="${clients.rows}">
          <tr>
            <th scope="row">${x.id}</th>
            <td>${x.nombre}</td>
            <td>${x.apellido}</td>
            <td>${x.direccion}</td>
            <td>$${x.email}</td>
            <td>
                <a class="btn btn-primary" href="./servletCliente?id=${x.id}">Modificar</a>
                <a class="btn btn-danger"  onclick="deleteEntity('Cliente','${x.id}')">Eliminar</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="./validation/delete-message.js"></script>
    </body>
</html>
