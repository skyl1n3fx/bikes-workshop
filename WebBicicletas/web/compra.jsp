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
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/basenegrotono?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="compras">
    SELECT v.id, v.fecha_venta, v.id_empleado 
    FROM VENTA v
    WHERE v.id_cliente = ${userSession.id}
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
    </head>
    <body>
        <jsp:include page="./navbar.jsp"></jsp:include>
        <h1 class="text-center">Compras</h1>
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Fecha compra</th>
              <th scope="col">Operacion</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="x" items="${compras.rows}">
            <tr>
              <th scope="row">${x.id}</th>
              <td>${x.fecha_venta}</td>
              <td>
                  <a class="btn btn-success" href="compra?id=${x.id}">Ver detalle</a>
              </td>
            </tr>
          </c:forEach>
            
            
          </tbody>
        </table>
</body>
</html>
