<%-- 
    Document   : admin
    Created on : 23-sep-2022, 4:16:21
    Author     : Koala
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>El Negro Toño</title>

        <link rel="stylesheet" href="index.css"><!-- importo el css -->
        <link rel="stylesheet" href="productcard.css">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">


    </head>



    <body>
        <!-- Div de despacho gratis sobre 100k -->
        <div class="div-1">
            <div class="text-center" color="#008000" >
                Envío gratuito para compras superiores a <b>$100.000</b>
            </div>
        </div>


        <!-- div de navbar -->
        <div>
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
                <div class="container-fluid text-center">
                    <a class="navbar-brand"> </a>
                    <img src="https://cdn.discordapp.com/attachments/980994339675197460/1018028559446573099/reparacion.jpg" alt="Logo" style="width:40px;" class="rounded-pill">

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="collapsibleNavbar">
                        <ul class="navbar-nav">
                            
                            <li class="nav-item">
                                <a class="nav-link" href="../index.jsp">Home</a>
                            </li>
                            <li class="nav-item"  >
                                <a class="nav-link"  data-bs-toggle="modal" data-bs-target="#modalAgregar" >Añadir producto</a>
                            </li>
                            
                            <li class="nav-item"  >
                                <a class="nav-link" data-bs-toggle="modal" data-bs-target="#modalEliminar"  >Eliminar producto</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="listar.jsp">Usuarios</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="registrarEmpleado.jsp">Registro Empleado</a>
                            </li>
                        </ul>
                    </div> 
                </div>
            </nav>
        </div>
        <!-- The Modal -->
        <div class="modal" id="modalAgregar">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Añadir Producto </h4>

                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <form action="../servletProducto" id="formulario" method ="GET">
                        <div class="modal-body">

                            <div class="mb-3 mt-3">
                                <label for="txtDescripcion">Nombre</label>
                                <input type="text" class="form-control" id="txtDescripcion" name="txtDescripcion" required>
                            </div>
                            <div class="mb-3 mt-3">
                                <label for="txtPrecio">Precio</label>
                                <input type="number" class="form-control" id="txtPrecio" name="txtPrecio" required>
                            </div>
                            <div class="mb-3 mt-3">
                                <label for="txtStock">Stock</label>
                                <input type="number" class="form-control" id="txtStock" name="txtStock" required>
                            </div>
                            <div class="mb-3 mt-3">
                                <div class="form-outline flex-fill mb-0">
                                    <label for="cboMarca">Marca</label>
                                    <select id='cboMarca' name='cboMarca'>
                                        <option value='1'>Shimano</option>
                                        <option value='2'>Sram</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="mb-3 mt-3">
                                <label for="txtImagen">Imagen 1</label>
                                <input type="text" class="form-control" id="txtImagen" name="txtImagen" >
                            </div>
                            
                            <div class="mb-3 mt-3">
                                <div class="form-outline flex-fill mb-0">
                                    <label for="cboCategoria">Categoria</label>
                                    <select id='cboCategoria' name='cboCategoria'>
                                        <option value='1'>Bicicletas de Ruta</option>
                                        <option value='2'>Bicicletas de Triatlón</option>
                                        <option value='3'>Bicicletas MTB</option>
                                        <option value='4'>Bicicletas de Cyclocross</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="mb-3 mt-3">
                                <label for="txtDescuento">Descuento</label>
                                <input type="number" class="form-control" id="txtDescuento" name="txtDescuento" required>
                            </div>

                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                             <button type="submit" class="btn btn-primary" name="btnAccion" id="btnAccion" value="Agregar">Agregar</button>
                             
                        </div>
                    </form>

                </div>
            </div>
        </div>
        
        <div class="modal" id="modalEliminar">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Eliminar Producto </h4>

                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <form action="../servletProducto" id="formulario" method ="GET">
                        <div class="modal-body">

                            <div class="mb-3 mt-3">
                                <label for="txtId">ID</label>
                                <input type="text" class="form-control" id="txtId" name="txtId" required>
                            </div>
                        </div>    
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cerrar</button>
                             <button type="submit" class="btn btn-danger" name="btnAccion" id="btnAccion" value="Eliminar">Eliminar</button>
                             
                        </div>
                    </form>

                </div>
            </div>
        </div>
        
        <h1>ADMIN</h1>


        <c:forEach var="aux" items="${lista}">
            <div class="col-lg-8 mx-auto">
                <ul class="list-group shadow">
                    <li class="list-group-item">
                        <!-- Custom content-->
                        <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                            <div class="media-body order-2 order-lg-1">
                                <h5 class="mt-0 font-weight-bold mb-2">${aux.getDescripcion()}</h5>
                                <h5 id="id_prod">ID Producto: ${aux.getId_producto()}</h5>
                                <div class="d-flex align-items-center justify-content-between mt-1">
                                    <h6 class="font-weight-bold my-2">$ ${aux.getPrecio()}</h6>
                                    <a href="Controlador?menu=Producto&accion=Eliminar&id=${aux.getId_producto()}" id="btn_eliminar" name="btn_eliminar" class="btn btn-danger ">Eliminar</a>
                                    <!-- Button to Open the Modal -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                                        Modificar
                                    </button>

                                    <!-- The Modal -->
                                    <div class="modal" id="myModal">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Modificar producto: </h4>
                                                    <h3>${aux.getDescripcion()}</h3>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>

                                                <!-- Modal body -->
                                                <form action="Controlador?menu=Producto&accion=Modificar" >
                                                    <div class="modal-body">

                                                        <div class="mb-3 mt-3">
                                                            <label for="txtDesc">Nombre</label>
                                                            <input type="text" class="form-control" id="txt_desc" value="${aux.getDescripcion()}">
                                                        </div>
                                                        <div class="mb-3 mt-3">
                                                            <label for="txtPrecio">Precio</label>
                                                            <input type="text" class="form-control" id="txtPrecio" value="${aux.getPrecio()}">
                                                        </div>
                                                        <div class="mb-3 mt-3">
                                                            <label for="txtStock">Stock</label>
                                                            <input type="text" class="form-control" id="txtStock" value="${aux.getStock()}">
                                                        </div>
                                                        <div class="mb-3 mt-3">
                                                            <label for="txtMarca">Marca</label>
                                                            <input type="text" class="form-control" id="txtMarca" value="${aux.getMarca()}" >
                                                        </div>
                                                        <div class="mb-3 mt-3">
                                                            <label for="txtImagen">Imagen 1</label>
                                                            <input type="text" class="form-control" id="txtImagen" value="${aux.getImagen()}">
                                                        </div>
                                                        <div class="mb-3 mt-3">
                                                            <label for="txtImagen2">Imagen 2</label>
                                                            <input type="text" class="form-control" id="txtImagen2" value="${aux.getImagen2()}">
                                                        </div>
                                                        <div class="mb-3 mt-3">
                                                            <label for="txtImagen3">Imagen 3</label>
                                                            <input type="text" class="form-control" id="txtImagen3" value="${aux.getImagen3()}">
                                                        </div>
                                                        <input type="hidden" id="txtID" name="txtID" value="${aux.getId_producto()}">
                                                    </div>
                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="submit" class="btn btn-primary">Modificar</button>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div><img src="${aux.getImagen()}" alt="Generic placeholder image" width="200" class="ml-lg-5 order-1 order-lg-2">
                        </div> <!-- End -->
                    </li> <!-- End -->
                </ul>
            </div>


        </c:forEach>




    </body>

</html>
