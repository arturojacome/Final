<%-- 
    Document   : listaCategorias
    Created on : 19 oct. 2021, 20:53:13
    Author     : AMJac
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Categorias</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
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
            
            <br/>
            <h1>Categorias</h1>
            <br/>
            <br/>

            <div class="row">
                <div class="col col-lg-2">
                    <h4 class="card-title">
                        <a href="CategoriaServlet?accion=nuevo" class="btn btn-outline-success">Crear Categoria</a>
                    </h4>
                </div>
                <div class="col">

                </div>
                <div class="col col-lg-2">
                    <h4 class="card-title">
                        <a href="CategoriaServlet?accion=graficar" class="btn btn-outline-primary" target="_blank">Mostrar Grafica</a>
                    </h4>
                </div>                 
                <div class="col col-lg-2">
                    <h4 class="card-title">
                        <a href="CategoriaServlet?accion=verReporte" class="btn btn-outline-danger" target="_blank">Mostrar Reporte</a>
                    </h4>
                </div>
            </div>

            <br/>

            <div class="card border-primary text-light bg-dark">
                <div class="card-header text-center">
                    Categorias
                </div>
                <div class="card-body text-light">

                    <c:if test="${mensaje != null}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>${mensaje}</strong>
                            <button class="btn-close" data-bs-dismiss="alert" aria-lbel="Close"></button>
                        </div>
                    </c:if>

                    <table class="table table-striped text-light">
                        <thead>
                            <tr>
                                <th>Clave</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Eliminar</th>
                                <th>Actualizar</th>
                                <th>Reporte</th>
                            </tr>
                        </thead>
                        <c:forEach var="dto" items="${listaDeCategorias}">
                            <tbody class="text-light">
                                <tr class="text-light">
                                    <td>
                                        <a href="CategoriaServlet?accion=ver&id=<c:out value="${ dto.entidad.idCategoria }"/>" class="btn btn-outline-warning">
                                            <c:out value="${ dto.entidad.idCategoria }"/>
                                        </a>
                                    </td>
                                    <td>
                                        <c:out value="${ dto.entidad.nombreCategoria }"/>
                                    </td>
                                    <td>
                                        <c:out value="${ dto.entidad.descripcionCategoria }"/>
                                    </td>
                                    <td>
                                        <a href="CategoriaServlet?accion=eliminar&id=<c:out value="${ dto.entidad.idCategoria }"/>" class="btn btn-outline-danger">Eliminar</a>
                                    </td>
                                    <td>
                                        <a href="CategoriaServlet?accion=actualizar&id=<c:out value="${ dto.entidad.idCategoria }"/>" class="btn btn-outline-success">Actualizar</a>
                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-outline-info">Reporte</a>
                                    </td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
    
    <style>
        .table-striped>tbody>tr:nth-of-type(odd)>* {
            --bs-table-accent-bg: var(--bs-table-striped-bg);
            color: #ffffff;
        }
    </style>
</html>
