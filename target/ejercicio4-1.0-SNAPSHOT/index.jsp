<%-- 
    Document   : index
    Created on : 20 oct. 2021, 20:23:19
    Author     : AMJac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyeto y Practica Final</title>
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
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="CategoriaServlet?accion=listaDeCategorias">Lista de Categorias</a>
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
        </div>
        
        <div class="card text-white  mb-3" style="width: 35rem; margin: auto; margin-top: 20px;">
                <div class="card-header " style=" background-color: black; text-align: center;">                
                        <h3>Instituto Politécnico Nacional</h3>
                        <hr style="color: white"/>
                        <h5>Escuela Superior De Cómputo</h5>
                </div>
                <div class="card-body" style="background-color: #352b2b;">
                  <blockquote class="blockquote mb-0">
                      <p style=" margin-bottom: 15px; text-align: center; color: white;">Web App Development</p>
                      <p style=" margin-bottom: 15px; text-align: center; color: white;">Proyecto & Practica Final</p>
                      <p style=" margin-bottom: 15px; text-align: center; color: white;">Profesor: M. en C. José Asunción Enríquez Zárate</p>
                      <p style=" margin-bottom: 15px; text-align: center; color: white;">Alumno: Jácome Portillo Arturo Mohamed</p>
                      <p style=" margin-bottom: 15px; text-align: center; color: white;">Boleta: 2014080736</p>                 
                  </blockquote>
                </div>
            </div>      
    </body>
</html>
