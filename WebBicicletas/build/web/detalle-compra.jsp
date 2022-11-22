<%-- 
    Document   : compra
    Created on : 22-11-2022, 15:21:39
    Author     : duguz
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${ userSession.tipo != 1}">
    <c:redirect url="./login.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
    </c:redirect>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
    </head>
    <body>
        <jsp:include page="./navbar.jsp"></jsp:include>
        <h1 class="text-center">Detalle</h1>
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Cantidad</th>
              <th scope="col">Producto</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="x" items="${compras.rows}">
            <tr>
              <th scope="row">${x.id}</th>
              <td>${x.cantidad}</td>
              <td>Producto</td>
            </tr>
          </c:forEach>
            
            
          </tbody>
        </table>
</body>
</html>
