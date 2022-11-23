<%-- 
    Document   : update-product
    Created on : 21-11-2022, 12:13:38
    Author     : duguz
--%>
<!-- JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${ userSession.tipo != 2}">
    <c:redirect url="./login.jsp" >
        <c:param name="errMsg" value="Please Enter UserName and Password" />
    </c:redirect>
</c:if>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/basenegrotono?zeroDateTimeBehavior=convertToNull" user="root" password=""></sql:setDataSource>
<sql:query dataSource="${dataSource}" var="categories">
    SELECT id, descripcion FROM CATEGORIA
</sql:query>
<sql:query dataSource="${dataSource}" var="brands">
    SELECT id, descripcion FROM MARCA
</sql:query>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear producto</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    </head>
    <body>
        <h1 class="text-center">Crear producto</h1>
            <form action="./servletProducto" method="POST" style="margin: 50px 500px 0 500px">  
                
              <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripcion</label>
                <input type="text" class="form-control" id="txtDescripcion" name="txtDescripcion">
              </div>
               
              <div class="mb-3">
                <label for="cboMarca" class="form-label">Marca</label>
                <select name="cboMarca" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                      <option disabled selected value="0">Seleccione</option>
                      <c:forEach var="x" items="${brands.rows}">
                        <option value="${x.id}">${x.descripcion}</option>
                      </c:forEach>
                </select>
              </div>
              
              <div class="mb-3">
                <label for="cboCategoria" class="form-label">Categoria</label>
                <select name="cboCategoria" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                        <option disabled selected value="0">Seleccione</option>
                      <c:forEach var="x" items="${categories.rows}">
                        <option value="${x.id}">${x.descripcion}</option>
                      </c:forEach>
                </select>
              </div>
              
              <div class="mb-3">
                <label for="txtStock" class="form-label">Stock</label>
                <input type="number" class="form-control" id="txtStock"  name="txtStock">
              </div>
              
              <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio</label>
                <input type="number" class="form-control" id="txtPrecio"  name="txtPrecio">
              </div>              
              
              <div class="mb-3">
                <label for="txtImagen" class="form-label">Imagen</label>
                <input type="text" class="form-control" id="txtImagen"  name="txtImagen">
              </div>                       

              <div class="mb-3">
                <label for="cboPromotion" class="form-label">Descuento</label>
                <select name="cboPromotion" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                    <option selected value="0">Sin descuento</option>
                    <option value="10">10%</option>
                    <option value="20">20%</option>
                    <option value="30">30%</option> 
                    <option value="40">40%</option>
                    <option value="50">50%</option>
                </select>
              </div>              
              
              <button type="submit" class="btn btn-primary" name="btnAction" value="Crear">Crear</button>
            </form>
    </body>
</html>
