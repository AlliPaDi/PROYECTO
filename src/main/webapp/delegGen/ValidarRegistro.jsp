
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.proyecto.beans.Alumno" %>
<%@ page import="com.example.proyecto.beans.DelegadoGeneral" %>
<jsp:useBean id="listaAlumnosPendientes" scope="request" type="ArrayList<com.example.proyecto.beans.Alumno>" />
<jsp:useBean id="listaAlumnosActivos" scope="request" type="ArrayList<com.example.proyecto.beans.Alumno>" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Solicitudes</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/IconoBat.png">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="assets/css/feathericon.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
<div class="main-wrapper">
    <!-- CABECERA -->
    <div class="header">
        <!-- CABECERA DE LA BARRA LATERAL LISTOOOOO -->
        <div class="header-left">
            <a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=main_page" class="logo"> <img src="assets/img/IconoBat.png" width="40" height="70" alt="logo"> <span class="logoclass">TELEWEEK</span> </a>
            <a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=main_page" class="logo logo-small"> <img src="assets/img/IconoBat.png" alt="Logo" width="30" height="30"> </a>
        </div>
        <!-- LAS RAYITAS Q ABREN A LA BARRA LISTOOO-->
        <a href="javascript:void(0);" id="toggle_btn"> <i class="fe fe-text-align-left"></i> </a>
        <a class="mobile_btn" id="mobile_btn"> <i class="fas fa-bars"></i> </a>
        <!-- NAVBAR -->
        <ul class="nav user-menu">
            <!-- FOTO DE PERFIL CON LAS OPCIONES DE EDITAR PERFIL Y DEMAS -->
            <li class="nav-item dropdown has-arrow">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/usuario.jpg" width="50" alt="Soeng Souy"></span> </a>
                <!-- MENU DESPLEGABLE DE LA FLECHITA DE LA FOTO DE PERFIL -->
                <div class="dropdown-menu">
                    <div class="user-header">
                        <!-- nombre y rol del usuario -->
                        <div class="user-text">
                            <%if (session.getAttribute("usuariologueado") == null) {%>
                            <span class="email">codigo@pucp.edu.com</span>
                            <%} else {%>
                            <%DelegadoGeneral delegadoGenerallogueado = (DelegadoGeneral) session.getAttribute("usuariologueado");%>
                            <h6><%=delegadoGenerallogueado.getNombre() + " " + delegadoGenerallogueado.getApellido()%>
                            </h6>
                            <%}%>
                            <p class="text-muted mb-0">Delegado General</p>
                        </div>
                    </div>
                    <a class="dropdown-item" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=perfil">Mi Perfil</a>
                    <!-- revisar ruta -->
                    <a class="dropdown-item"  href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=cerrar_sesion">Cerrar Sesión</a>
                </div>
            </li>
        </ul>
    </div>

    <!-- BARRA LATERAL -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li> <a href="MainPage.html"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a>
                    </li>
                    <li class="list-divider"></li>

                    <li class="menu-title mt-3"> <span>ACCIONES</span> </li>
                    <!-- USUARIOS -->
                    <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Usuarios </span> <span
                            class="menu-arrow"></span></a>
                        <ul class="submenu_class" style="display: none;">
                            <li><a class="active" href="SolicitudesUsuarios.html"> Solicitudes </a></li>
                            <li><a href="UsuariosRegistrados.html"> Registrados </a></li>
                        </ul>
                    </li>

                    <!-- DONACIONES -->
                    <li class="submenu"> <a href="#"><i class="bi bi-heart-fill"></i> <span> Donaciones </span>
                        <span class="menu-arrow"></span></a>
                        <ul class="submenu_class" style="display: none;">
                            <li><a href="DonacionesRecepcionadas.html">Recepcionadas </a></li>
                            <li><a href="DonacionesVerificadas.html">Verificadas</a></li>
                        </ul>
                    </li>

                    <!-- ACTIVIDADES -->
                    <li> <a href="ListaActividades.html"><i class="bi bi-calendar-fill"></i><span>Actividades</span></a>
                    </li>

                    <!-- CONTACTOS -->
                    <li class="list-divider"></li>
                    <li class="menu-title mt-3"> <span>CONTACTOS</span> </li>
                    <li> <a href="https://www.instagram.com/aitel.pucp/" target="_blank">
                        <i class="bi bi-instagram"></i> <span>Instagram</span></a> </li>
                    <li> <a href="mailto:aitel@pucp.pe" target="_blank"><i class="fas fa-envelope"></i>
                        <span>Gmail</span></a> </li>

                </ul>
            </div>
        </div>
    </div>

    <!-- TODO LO Q ESTA EN LA PAGINA SIN BARRA LATERAL -->
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <div class="mt-5">
                            <h4 class="card-title float-left mt-2">Solicitudes de usuarios</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-body booking_card">
                            <div class="table-responsive">
                                <!-- LISTA DE NUEVAS SOLICITUDES -->
                                <table class="datatable table table-stripped table table-hover table-center mb-0">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre</th>
                                        <th>Correo</th>
                                        <th>Observar</th>
                                        <th>Aceptar</th>
                                        <th>Rechazar</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Nombre Apellido</td>
                                        <td>nombre@gmail.com</td>
                                        <!-- OBSERVAR INFO -->
                                        <td>
                                            <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalMostrar<%=j%>">
                                                <i class="bi bi-eye"></i>
                                            </button>
                                        </td>
                                        <!-- ACEPTAR -->
                                        <td>
                                            <button class="btn btn-primary">
                                                <i class="bi bi-person-check-fill"></i>
                                            </button>
                                        </td>
                                        <!-- RECHAZAR -->
                                        <td>
                                            <button class="btn btn-danger">
                                                <i class="bi bi-person-x-fill"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                                <!-- Modal de Mostrar Alumno -->
                                <div class="modal fade" id="modalMostrar<%=j%>" tabindex="-1" aria-labelledby="exampleModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form>

                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="nuevoModalLabel">Alumno</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="mb-3 d-flex justify-content-center align-items-center flex-column">
                                                        <img src="images/usuario.jpg" alt="Imagen del usuario" id="userImage"
                                                             class="img-thumbnail w-50">
                                                    </div>

                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <h5>Nombre:</h5>
                                                            <p><%=alumno.getNombre()%></p>
                                                        </div>
                                                        <div class="col">
                                                            <h5>Apellido:</h5>
                                                            <p><%=alumno.getApellido()%></p>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <h5>Rol:</h5>
                                                            <%if(alumno.getDelegadoActividad().getActividad()==null){%>
                                                            <p>Alumno</p>
                                                            <%} else{%>
                                                            <p>Delegado de  <%=alumno.getDelegadoActividad().getActividad().getTitulo()%></p>
                                                            <%}%>
                                                        </div>
                                                        <div class="col">
                                                            <h5>Código:</h5>
                                                            <p><%=alumno.getCodigo()%></p>
                                                        </div>
                                                    </div>


                                                    <div class="mb-3">
                                                        <h5>Correo:</h5>
                                                        <p><%=alumno.getCorreo()%></p>
                                                    </div>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-bs-dismiss="modal">Cerrar</button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- GUARDAR CAMBIOS?  -->
                                <div class="text-center">
                                    <div class="col">
                                        <a class="btn btn-dark" data-bs-toggle="modal" href="#guardarNuevos" role="button">Guardar
                                            cambios</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/datatables.min.js"></script>
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/js/script.js"></script>
</body>

</html>
