<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto.beans.Actividad" %>
<%@ page import="com.example.proyecto.beans.DelegadoActividad" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.proyecto.beans.Alumno" %>
<jsp:useBean id="listaActividades" scope="request" type="ArrayList<com.example.proyecto.beans.DelegadoActividad>"/>
<jsp:useBean id="listaAlumnos_DelegadosActividad" scope="request" type="ArrayList<com.example.proyecto.beans.Alumno>"/>
<jsp:useBean id="listaAlumnosCandidatos" scope="request" type="ArrayList<com.example.proyecto.beans.Alumno>"/>
<%@ page import="com.example.proyecto.beans.DelegadoGeneral" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Actividades</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/IconoBat.png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

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
            <a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=main_page" class="logo text-decoration-none"> <img
                    src="assets/img/IconoBat.png" width="40" height="70" alt="logo"> <span
                    class="logoclass">TELEWEEK</span> </a>
            <a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=main_page" class="logo logo-small">
                <img src="assets/img/IconoBat.png" alt="Logo" width="30" height="30"> </a>
        </div>
        <!-- LAS RAYITAS Q ABREN A LA BARRA LISTOOO-->
        <a href="javascript:void(0);" id="toggle_btn"> <i class="fe fe-text-align-left"></i> </a>
        <a class="mobile_btn" id="mobile_btn"> <i class="fas fa-bars"></i> </a>
        <!-- NAVBAR -->
        <ul class="nav user-menu">
            <!-- FOTO DE PERFIL CON LAS OPCIONES DE EDITAR PERFIL Y DEMAS -->
            <li class="nav-item dropdown has-arrow">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <span class="user-img"><img
                        class="rounded-circle" src="assets/img/profiles/usuario.jpg" width="50" alt="Soeng Souy"></span>
                </a>
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
                    <!-- CHEQUEAR LAS REFERENCIAS Y VISTAS -->
                    <a class="dropdown-item" href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=perfil">Mi
                        Perfil</a>
                    <a class="dropdown-item"
                       href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=cerrar_sesion">Cerrar
                        Sesión</a>
                </div>
            </li>
        </ul>
    </div>

    <!-- BARRA LATERAL -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li><a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=main_page"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                    <li class="list-divider"></li>

                    <li class="menu-title mt-3"><span>ACCIONES</span></li>
                    <!-- USUARIOS -->
                    <li class="submenu"><a href="#"><i class="fas fa-user"></i> <span> Usuarios </span> <span
                            class="menu-arrow"></span></a>
                        <ul class="submenu_class" style="display: none;">
                            <li><a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=validar_registro"> Solicitudes </a></li>
                            <li><a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=lista_usuarios"> Registrados </a></li>
                        </ul>
                    </li>

                    <!-- DONACIONES -->
                    <li class="submenu"><a href="#"><i class="bi bi-heart-fill"></i> <span> Donaciones </span> <span
                            class="menu-arrow"></span></a>
                        <ul class="submenu_class" style="display: none;">
                            <li><a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=validar_donaciones">Recepcionadas </a></li>
                            <li><a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=lista_donaciones">Verificadas</a></li>
                        </ul>
                    </li>

                    <!-- ACTIVIDADES -->
                    <li class="active"><a href="<%=request.getContextPath() %>/DelegadoGeneralServlet?action=editar_actividades"><i class="bi bi-calendar-fill"></i><span>Actividades</span></a>
                    </li>

                    <!-- CONTACTOS -->
                    <li class="list-divider"></li>
                    <li class="menu-title mt-3"><span>CONTACTOS</span></li>
                    <li><a href="https://www.instagram.com/aitel.pucp/" target="_blank"><i
                            class="bi bi-instagram"></i><span>Instagram</span></a></li>
                    <li><a href="mailto:aitel@pucp.pe" target="_blank"><i class="fas fa-envelope"></i>
                        <span>Gmail</span></a></li>

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
                            <h4 class="card-title float-left mt-2">Lista de actividades</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-body booking_card">
                            <div class="table-responsive">
                                <!-- LISTA DE USUARIOS -->
                                <table class="datatable table table-stripped table table-hover table-center mb-0">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Actividad</th>
                                        <th>Delegado</th>
                                        <th>Observar</th>
                                        <th>Eliminar</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%int i = 1;%>
                                    <%for (DelegadoActividad delegadoActividad: listaActividades){%>
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=delegadoActividad.getActividad().getTitulo()%></td>
                                        <td><%=listaAlumnos_DelegadosActividad.get(i-1).getNombre() +" " + listaAlumnos_DelegadosActividad.get(i-1).getApellido()%></td>

                                        <!-- OBSERVAR INFO -->
                                        <td>
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalMostrar<%=i%>">
                                                <i class="bi bi-eye"></i>
                                            </button>
                                        </td>

                                        <!-- ELIMINAR -->
                                        <td>
                                            <button class="btn btn-danger" data-bs-toggle="modal" href="#eliminarActividad<%=i%>">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!------------------------------------------------ Modals ---------------------------------------------->

                                    <!-- Modal de Mostrar actividad -->
                                    <div class="modal fade" id="modalMostrar<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form>

                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="nuevoModalLabel"><%=delegadoActividad.getActividad().getTitulo()%></h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="mb-3 d-flex justify-content-center align-items-center flex-column">
                                                            <img src="images/deportes.jpg" alt="Imagen de evento" id="eventImage"
                                                                 class="img-thumbnail w-70">
                                                        </div>
                                                        <div class="mb-3">
                                                            <h5>Descripción:</h5>
                                                            <p><%=delegadoActividad.getActividad().getDescripcion()%>
                                                            </p>
                                                        </div>

                                                        <div class="mb-3">
                                                            <h5>Estado:</h5>
                                                            <p class="text-uppercase"><%=delegadoActividad.getActividad().getEstado()%></p>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                                                        <button type="button" class="btn btn-primary"  data-bs-toggle="modal"  data-bs-target="#modalEditar<%=i%>"     >Editar</button>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal de Editar actividad -->
                                    <div class="modal fade" id="modalEditar<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form method="post" action="<%=request.getContextPath()%>/DelegadoGeneralServlet?action=editar" enctype="multipart/form-data">

                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="nuevoModalLabel"><%=delegadoActividad.getActividad().getTitulo()%></h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="mb-3 d-flex justify-content-center align-items-center flex-column">
                                                            <img src="images/deportes.jpg" alt="Imagen de evento" id="eventImage"
                                                                 class="img-thumbnail w-70">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="tituloActividad">Título</label>
                                                            <input type="text" class="form-control form-control-sm" name="tituloActividad" id="tituloActividad" value="<%=delegadoActividad.getActividad().getTitulo()%>">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="descripcionActividad" class="form-label">Descripción</label>
                                                            <textarea class="form-control" id="descripcionActividad" rows="4" name="descripcionActividad"
                                                                      placeholder="Ingrese la descripción aquí"><%=delegadoActividad.getActividad().getDescripcion()%></textarea>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="idAlumnoDelegadoActividad">Delegado de Actividad</label>
                                                            <select name="idAlumnoDelegadoActividad" class="form-select" id="idAlumnoDelegadoActividad">

                                                                <option value="0">-- Mantener Delegado de Actividad</option>
                                                                <% for(Alumno alumno: listaAlumnosCandidatos){ %>
                                                                <option value="<%=alumno.getIdAlumno()%>" <%=listaAlumnos_DelegadosActividad.get(i-1).getDelegadoActividad().getIdDelegadoActividad()==delegadoActividad.getIdDelegadoActividad()?"selected":""%>> <%=alumno.getNombre()+" "+alumno.getApellido()%> </option>
                                                                <% } %>

                                                            </select>
                                                            <input type="hidden" class="form-control" name="idAlumnoDelegadoActividadActual" value="<%=listaAlumnos_DelegadosActividad.get(i-1).getIdAlumno()%>">
                                                        </div>

                                                        <div class="mb-3">
                                                            <p>Estado:</p>
                                                            <input type="radio" name="estadoActividad" value="activa" id="activa" />
                                                            <label for="activa">Activa</label>

                                                            <input type="radio" name="estadoActividad" value = "finalizada" id="finalizada" />
                                                            <label for="finalizada">Finalizada</label>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <a href="<%=request.getContextPath()%>/DelegadoGeneralServlet?action=editar_actividades" class="btn btn-danger">Cancelar</a>
                                                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal eliminar actividad -->
                                    <div class="modal fade" id="eliminarActividad<%=i%>" aria-hidden="true"
                                         aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="eliminarActividad">Eliminar actividad</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    ¿Estás seguro que deseas eliminar esta actividad?
                                                </div>
                                                <form method="post" action="<%=request.getContextPath()%>/DelegadoGeneralServlet?action=eliminar_actividad">
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                                        <input type="hidden" class="form-control" name="idAlumnoDelegadoActividadEliminar" value="<%=listaAlumnos_DelegadosActividad.get(i-1).getIdAlumno()%>">
                                                        <input type="hidden" class="form-control" name="idDelegadoActividadEliminar" value="<%=delegadoActividad.getIdDelegadoActividad()%>">
                                                        <input type="hidden" class="form-control" name="idActividadEliminar" value="<%=delegadoActividad.getActividad().getIdActividad()%>">
                                                        <button type="submit" class="btn btn-primary" data-bs-target="#eliminarConfirmado<%=i%>"
                                                                data-bs-toggle="modal" data-bs-dismiss="modal">Sí</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="eliminarConfirmado<%=i%>" aria-hidden="true"
                                         aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="eliminarConfirmado">Actividad eliminada</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Se eliminó la actividad exitosamente.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <%i++;%>
                                    <%}%>

                                    </tbody>
                                </table>

                                <!-- Agregar actividad -->
                                <div class="row">
                                    <div class="col text-center mb-3">
                                        <a type="button" class="link-dark" data-bs-toggle="modal"
                                           data-bs-target="#modalNuevo"><i class="bi bi-plus-circle"></i>
                                            Agregar actividad
                                        </a>
                                    </div>
                                </div>

                                <!-- GUARDAR CAMBIOS?  -->
                                <div class="text-center">
                                    <div class="col">
                                        <a class="btn btn-dark" data-bs-toggle="modal" href="#guardarNuevos"
                                           role="button">Guardar
                                            cambios</a>
                                    </div>
                                </div>
                                <div class="modal fade" id="guardarNuevos" aria-hidden="true"
                                     aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="guardarNuevosLabel">Guardar cambios</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                ¿Estás seguro que quieres guardar los cambios?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Cancelar</button>
                                                <button type="button" class="btn btn-primary" data-bs-target="#guardarNuevos2"
                                                        data-bs-toggle="modal" data-bs-dismiss="modal">Sí</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="guardarNuevos2" aria-hidden="true"
                                     aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                Se guardaron los cambios exitosamente.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal de NUEVO -->
                                <div class="modal fade" id="modalNuevo" tabindex="-1" aria-labelledby="exampleModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form method="post" action="<%=request.getContextPath()%>/DelegadoGeneralServlet?action=crear" enctype="multipart/form-data">

                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="nuevoModalLabel">Nueva actividad</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="mb-3 d-flex justify-content-center align-items-center flex-column">
                                                        <img src="https://yaktribe.games/community/media/placeholder-jpg.84782/full"
                                                             alt="Imagen de muestra" id="exampleImage" class="img-thumbnail w-50">
                                                        <label class="form-label" for="imageUpload">Subir Foto</label>
                                                        <input type="file" class="form-control" id="imageUpload" accept="image/*" name="fotoActividad">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="tituloActividad">Título</label>
                                                        <input type="text" class="form-control form-control-sm" name="tituloActividad" id="tituloActividad">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="descripcionActividad" class="form-label">Descripción</label>
                                                        <textarea class="form-control" id="descripcionActividad" rows="4" name="descripcionActividad"
                                                                  placeholder="Ingrese la descripción aquí"></textarea>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="idAlumnoDelegadoActividad">Delegado de Actividad</label>
                                                        <select name="idAlumnoDelegadoActividad" class="form-select" id="idAlumnoDelegadoActividad">
                                                            <%if(listaAlumnosCandidatos.isEmpty()){%>
                                                            <option value="0">-- Sin Posibles Candidatos --</option>
                                                            <%} else {%>
                                                            <% for(Alumno alumno: listaAlumnosCandidatos){ %>
                                                            <option value="<%=alumno.getIdAlumno()%>"> <%=alumno.getNombre()+" "+alumno.getApellido()%> </option>
                                                            <% } %>
                                                            <%}%>

                                                        </select>
                                                    </div>


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-bs-dismiss="modal">Cancelar</button>

                                                    <button type=submit class="btn btn-primary" data-bs-toggle="modal"
                                                            data-bs-target="#SaveNewEvent">Guardar Cambios</button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Mini modal de guardar -->
                                <div class="modal fade" id="SaveNewEvent" tabindex="-1" aria-labelledby="exampleModalLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                Se guardaron los cambios exitosamente.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
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
    </div>
</div>

<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="assets/plugins/datatables/datatables.min.js"></script>
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/js/script.js"></script>
<!--Script de bootstrap  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>