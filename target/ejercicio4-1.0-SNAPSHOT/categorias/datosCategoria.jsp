<%-- 
    Document   : datosCategoria
    Created on : 20 oct. 2021, 20:14:52
    Author     : AMJac
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>

        <title>Datos de Categoria</title>
    </head>
    <body>
        

        <div class="container">
            
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
            
            <h1 
                style="margin-top: 20px;
                       margin-bottom: 20px;
            ">Categorias</h1>
            
            <div class="card bg-dark">
                <div class="card-header">
                    <h3 class="text-center" style="
    color: white;"
    >Datos de Categoria</h3>
                </div>
                <div class="card-body bg-dark" style="text-align: center;" >
                    <img src="./img/subfolder.png" alt="" width="200" height="240" class="d-inline-block align-text-top"
                         style=" margin-top: 20px;
                                 margin-bottom: 20px;
                                 align-items: center;
                                ">
                    <ul class="list-group" style="text-align: center;">
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.idCategoria}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.nombreCategoria}" />
                        </li>
                        <li class="list-group-item">
                            <c:out value="${categoria.entidad.descripcionCategoria}" />
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </body>
    
    <style>
        .list-group-item
        {
            background-color: black;
            color: white;
        }
    </style>
      
    
    
   
</html>
