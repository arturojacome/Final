<%-- 
    Document   : categoriasFrom
    Created on : 19 oct. 2021, 21:08:45
    Author     : AMJac
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </head>
    
    
    <body class="container">
        
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <img src="./img/school.png" alt="" width="34" height="30" class="d-inline-block align-text-top">
                    Proyeto y Practica Final
                </a>


                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="CategoriaServlet?accion=listaDeCategorias">Lista de Categorias</a>
                        </li>                     
                        <li class="nav-item">
                            <a class="nav-link" href="ProductoServlet?accion=listaDeProductos">Lista de Productos</a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link" href="ProductoServlet?accion=nuevo">Nuevo Producto</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>       
        
        <h1 style="margin-top: 20px;
            margin-bottom: 20px;">Actualizar Categoria</h1>

        <div class="card border-primary bg-dark">
            <div class="card header bg-dark text-light">
                <h1 class="text-center">Datos Categoria</h1>
            </div>
            <div class="card card-body bg-dark text-light">
                <form method="post" action="CategoriaServlet?accion=guardar">
                    <div class="mb-3">
                        <label class="form-label">ID </label>
                        <input type="text" 
                               name="txtIdCategoria" 
                               id="txtIdCategoria" 
                               placeholder="Id de la categoria"
                               readonly value="<c:out value="${categoria.entidad.idCategoria}"/>"
                               class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" 
                               name="txtNombreCategoria" 
                               id="txtNombreCategoria" 
                               placeholder="Nombre de la categoria"
                               required
                               maxlenght="50"
                               value="<c:out value="${categoria.entidad.nombreCategoria}"/>"
                               class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Descripcion: </label>
                        <input type="text" 
                               name="txtDescripcionCategoria" 
                               id="txtDescripcionCategoria" 
                               placeholder="Descripcion de la categoria"
                               required
                               maxlenght="100"
                               value="<c:out value="${categoria.entidad.descripcionCategoria}"/>"
                               class="form-control" />
                    </div>
                    <button type="submit" class="btn btn-outline-primary">Guadar Cambios</button>     
                </form>
            </div>
        </div>
    </body>
   
    
    
</html>