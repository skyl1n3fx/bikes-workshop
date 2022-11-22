<%-- 
    Document   : listar
    Created on : 23-sep-2022, 12:22:21
    Author     : Koala
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <div class="container">

            <div class="col-md-8">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID_CLIENTE</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>EMAIL</th>
                            <th>TELEFONO</th>
                            <th>CONTRASEÑA</th>
                            <th>TIPO CUENTA</th>
                            <th>OPCIONES</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <c:forEach var="aux" items="${lista}">
                            <tr>
                                <td>${aux.getId_cliente()}</td>
                                <td>${aux.getNombre()}</td>
                                <td>${aux.getApellido()}</td>
                                <td>${aux.getEmail()}</td>
                                <td>${aux.getTelefono()}</td>
                                <td>${aux.getContrasena()}</td>
                                <td>
                                <c:set var="val" value="${aux.getId_tipoCuenta()}"/>
                                <c:choose>
                                    <c:when test="${val=='2'}"> Administrador</c:when>
                                    <c:otherwise>Cliente</c:otherwise>
                                </c:choose>
                                </td>
                                
                                <td>
                                    <a href="Controlador?menu=Usuario&accion=Eliminar&id=${aux.getId_cliente()}" id="btn_eliminar" name="btn_eliminar" class="btn btn-danger ">Eliminar</a>
                                    <a href="Controlador?menu=Usuario&accion=Modificar&id=${aux.getId_cliente()}" id="btn_eliminar" name="btn_eliminar" class="btn btn-primary ">Modificar</a>
                                
                                </td>
                            </tr>
                        </c:forEach>



                    </tbody>
                </table>
            </div>
        </div>
    </div>


</<body>
</html>
