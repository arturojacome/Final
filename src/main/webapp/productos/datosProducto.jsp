<%-- 
    Document   : datosProducto
    Created on : 15 oct. 2021, 14:55:27
    Author     : AMJac
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>

        <title>Datos de Producto</title>
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
                                <a class="nav-link" href="CategoriaServlet?accion=listaDeCategorias">Lista de Categorias</a>
                            </li>                     
                            <li class="nav-item">
                                <a class="nav-link active" href="ProductoServlet?accion=listaDeProductos">Lista de Productos</a>
                            </li>                              
                            <li class="nav-item">
                                <a class="nav-link" href="ProductoServlet?accion=nuevo">Nuevo Producto</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav> 
            
            <h1 style="margin-top: 20px;
                margin-bottom: 20px;">Producto</h1>




            <div class="card bg-dark text-light">
                <div class="card-header">
                    <h3 class="text-center">Datos de Producto</h3>
                </div>
                <div class="card-body bg-dark text-light">
                    <center>
                        <img style="margin-bottom: 20px;" src="./img/cubes.png" alt="" width="200" height="240" class="d-inline-block align-text-top">
                        <ul class="list-group">
                            <li class="list-group-item">
                                
                                <c:out value="${producto.entidad.idProducto}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.nombreProducto}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.descripcionProducto}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.precio}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.existencia}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.stockMinimo}" />
                            </li>
                            <li class="list-group-item">
                                <c:out value="${producto.entidad.claveCategoria}" />
                            </li>
                        </ul>
                    </center>
                </div>
            </div>

        </div>
    </body>
    
    <style>
        .list-group-item{
            background: black;
            color: white;
        }
    </style>
</html>
