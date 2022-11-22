<%-- 
    Document   : compra
    Created on : 22-11-2022, 15:21:39
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <jsp:include page="./navbar.jsp"></jsp:include>
        <h1 class="text-center">Detalle Consulta</h1>
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Descripcion</th>
              <th scope="col">Estado</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">${queryData.id}</th>
              <td>${queryData.descripcion}</td>
              <td>${queryData.estado}</td>
            </tr>
 
          </tbody>
        </table>
            
        <form style="margin: 50px 500px 0 500px" action="consulta" method="POST">
            <input type="hidden" name="txtId" value="${queryData.id}">
        <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Respuesta</label>
        <input type="text" class="form-control" id="exampleInputEmail1" name="txtDescripcion">
        </div>

        <button type="submit" class="btn btn-primary" name="btnAction" value="Responder">Enviar</button>
        </form>
            
</body>
</html>
