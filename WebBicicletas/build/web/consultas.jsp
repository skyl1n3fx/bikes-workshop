<%-- 
    Document   : consultas
    Created on : 22-11-2022, 16:34:37
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
        <title>JSP Page</title>
    </head>
    <body>
    <jsp:include page="./navbar.jsp"></jsp:include>
    <h1 class="text-center">Realice una consulta</h1>
        <div class="container-fluid">
            <form style="margin: 50px 500px 0 500px" action="consulta" method="POST">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Descripcion</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="txtDescripcion">
  </div>

  <button type="submit" class="btn btn-primary" name="btnAction" value="Consultar">Enviar</button>
</form>
        </div>
    </body>
</html>
