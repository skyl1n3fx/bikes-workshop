<%-- 
    Document   : consultas
    Created on : 22-11-2022, 16:34:37
    Author     : duguz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <form style="margin: 50px 500px 0 500px">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Descripcion</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>

  <button type="submit" class="btn btn-primary">Enviar</button>
</form>
        </div>
    </body>
</html>
