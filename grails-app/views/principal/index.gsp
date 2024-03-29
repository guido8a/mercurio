<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-121607475-1"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-HQJWN3ZDKR"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-HQJWN3ZDKR');
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <title>Ventas</title>

    %{--    <g:layoutHead/>--}%

    <!-- Bootstrap core CSS -->
    <asset:stylesheet src="/merc/bootstrap.min.css"/>
    <asset:stylesheet src="/apli/shop-homepage.css"/>
    <asset:stylesheet src="/apli/anuncio.css"/>

    <asset:javascript src="/merc/jquery.min.js"/>
    <asset:javascript src="/merc/bootstrap.bundle.js"/>
    <asset:javascript src="/apli/bootbox.js"/>
    <asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.min.js"/>
    <asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.js"/>
    <asset:javascript src="/jquery-validation-1.11.1/localization/messages_es.js"/>
    <asset:javascript src="/apli/functions.js"/>
    <asset:javascript src="/apli/loader.js"/>
    <asset:javascript src="/apli/fontawesome.all.min.js"/>

</head>

<body>

<mn:menuNuevo search="${params.bscr?:''}"/>


<!-- Page Content -->
<div class="container" style="background-color: #efefef">

    <div class="row" style="margin-top: 20px;">

        <div class="col-lg-3">
            <div id="categorias"></div>

            <h2 class="my-4 titulo0">Consultas</h2>

            <div class="list-group">
                <g:each in="${consultas}" var="cs">
                    <a href="#" class="lista-item consulta" title="${cs.texto}" onclick="guardarConsulta('${cs?.id}','${cs?.link}')">
                        <img src="${request.contextPath}/principal/getImgnCnsl?ruta=${cs.logo}"
                             style='float:left; height:20px'>
                        <span style="margin-left: 10px">${cs.titulo}</span></a>
                </g:each>
            </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

            <div style="margin-top: 10px">
                <elm:flashMessage tipo="${flash.tipo}" icon="${flash.icon}"
                                  clase="${flash.clase}">${flash.message}</elm:flashMessage>
            </div>

            <div id="carouselExampleIndicators" class="carousel slide my-4 cs900" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                    %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>--}%
                    %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>--}%
                </ol>

                <div class="carousel-inner cs900" role="listbox">

                    <g:each in="${carrusel}" var="carr" status="i">
                        <div class="carousel-item ${i == 0 ? 'active' : ''}">
                            <a href="${createLink(controller: 'ver', action: 'carrusel',  params: [anun: carr.id, tipo: 3])}">
                                <img class="img-fluid imag-item" alt="First slide"
                                     src="${request.contextPath}/principal/getImgnProd?ruta=${carr.ruta}&tp=${carr.tp}&id=${carr.prod}"/>
                            </a>
%{--                            <img class="img-fluid imag-item" alt="First slide"--}%
%{--                                 src="${request.contextPath}/principal/getImgnProd?ruta=${carr.ruta}&tp=${carr.tp}&id=${carr.prod}"/>--}%
                        </div>
                    </g:each>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <g:if test="${busqueda}">
                <div class="activo blink_text" style="height: 60px; background-color:#ffab19;
                text-align: center; border-radius: 10px; margin: 10px">
                    <g:applyCodec encodeAs="none">
                        ${busqueda}
                    </g:applyCodec>
                    <p>Pruebe buscar en otra categoría</p>
                </div>
            </g:if>

        %{--        Destacados--}%
            <g:if test="${destacados?.size() > 0}">
                <div class="titulo1">Destacados</div>

                <div class="row">
                    <g:each in="${destacados}" var="prod" status="i">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100 marcoDestacados">
                                <a href="${createLink(controller: 'ver', action: 'carrusel',  params: [anun: prod.id, tipo: 3])}">
                                    <img width="253px" height="auto" style="padding: 1px"
                                         src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                                </a>

                                <div class="card-body">
                                    <h4 class="titulo2">
                                        <a href="${createLink(controller: 'ver', action: 'carrusel',
                                                params: [anun: prod.id, tipo: 3])}">${prod.tt}</a>
                                    </h4>
                                    <h5 class="titulo3">${prod.sb ?: 'Sin descripción'}</h5>
                                    <div class="normal">${prod.gf}</div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>
            </g:if>

        %{--  Normales--}%
            <div class="row">
                <g:if test="${normales?.size() > 0}">
                    <g:each in="${normales}" var="prod" status="i">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100 marcoNormal">
                                <a href="${createLink(controller: 'ver', action: 'carrusel',  params: [anun: prod.id, tipo: 3])}">
                                    <img width="253px" height="auto" style="padding: 1px"
                                         src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                                </a>

                                <div class="card-body">
                                    <h4 class="titulo2n">
                                        <a href="${createLink(controller: 'ver', action: 'carrusel',
                                                params: [anun: prod.id, tipo: 3])}">${prod.tt}</a>
                                    </h4>
                                    <h5 class="titulo4">${prod.sb ?: 'Sin descripción'}</h5>
                                    <div class="normal">${prod.gf}</div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </g:if>
            %{--
                            <g:else>
                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="card h-100">
                                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>

                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <a href="#">Aquí su anuncio</a>
                                            </h4>
                                            <h5>$124.99</h5>

                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                                        </div>

                                        <div class="card-footer">
                                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="card h-100">
                                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>

                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <a href="#">Aquí su anuncio</a>
                                            </h4>
                                            <h5>$1.99</h5>

                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                                        </div>

                                        <div class="card-footer">
                                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="card h-100">
                                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>

                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <a href="#">Aquí su anuncio</a>
                                            </h4>
                                            <h5>$99.99</h5>

                                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                                        </div>

                                        <div class="card-footer">
                                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                        </div>
                                    </div>
                                </div>
                            </g:else>
            --}%

            </div>
            <!-- /.col-lg-9 -->

        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
%{--<footer class="py-3 bg-dark">--}%
<div class="navbar-dark bg-dark" style="width: 100%; margin-top: 1%">
    %{--    <div class="container">--}%
    %{--    <a href="${createLink(controller: 'principal', action: 'manual')}" class="btn btn-sm buscar"--}%
    %{--       style="text-decoration: none; margin-left: 10%">Manual de Usuario</a>--}%
    <a href="${createLink(controller: 'principal', action: 'manual')}" class="badge badge-pill badge-warning buscar"
       style="text-decoration: none; margin-left: 10%"><i class="fa fa-book"></i> Manual de Usuario
    </a>
    <a href="${createLink(controller: 'principal', action: 'terminos')}" class="badge badge-pill badge-warning buscar"
       style="text-decoration: none;"><i class="fa fa-book"></i> Política del Sitio
    </a>
    <span style="float: right; font-size: small; margin-right: 10%; margin-top: 3px">
        <span class="text-white">Copyright &copy; Tedein S.A. 2021 &nbsp;  Versión: ${message(code: 'version', default: '1.1.0x')}
        </span>
    </span>
    %{--    </div>--}%
    <!-- /.container -->
</div>

<!-- Bootstrap core JavaScript -->
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--}%

<script type="text/javascript">

    function guardarConsulta(id,link){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'principal', action: 'actividad_ajax')}",
            data:{
                id: id
            },
            success: function(msg){
                if(msg == 'ok'){
                    // window.location.replace(link);
                    window.open(link);
                }

            }
        });
    }

    $( document ).ready(function() {
        cargarCategorias("ct_${activo}", "sbct_${sbct_actv}");
    });

    %{--cargarPantalla("${sbct_actv?:'sbct_1'}");--}%

    function cargarCategorias(cat_id, sbct_id) {
        // console.log("id", cat_id)
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'principal', action: 'categorias')}",
            data: {id: cat_id, sbct: sbct_id},
            success: function (msg) {
                $("#categorias").html(msg)
                // cargarPantalla(sbct_id)
            } //success
        });
    }

    $("#ingresar").click(function () {
        cargarIngreso();
    });

    $('#bsca').keyup(function (ev) {
        if (ev.keyCode == 13) {
            $("#btn-buscar").click();
        }
    })

    $("#btn-borrar").click(function () {
        event.preventDefault()
        $('#bsca').val('');
    });

    $("#btn-buscar").click(function () {
        var dato = $('#bsca').val()
        var ctgr = $('#categoriaBuscar').val()
        // console.log('hola', dato);
        location.href="${createLink(controller: 'principal', action: 'buscar')}?bscr=" + dato + "&ctgr=" + ctgr
    });

    function cargarIngreso() {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'principal', action: 'login_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgCreateEditIngreso",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i> Salir",
                            className: "btn-gris",
                            callback: function () {
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    $("#registro").click(function () {
        cargarRegistro();
    });

    function cargarRegistro() {
        // console.log("cargar")
        bootbox.hideAll()
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action: 'registro_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgCreateEditRegistro",
                    // class   : "long",
                    // title   : "Registro de usuarios",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i> Salir",
                            className: "btn-gris",
                            callback: function () {
                            }
                        },
                        guardar: {
                            id: "btnSave",
                            label: "<i class='fa fa-save'></i> Guardar",
                            className: "btn-rojo",
                            callback: function () {
                                return submitFormRegistro();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormRegistro() {
        var $form = $("#frmRegistro");
        if ($form.valid()) {
            var d = cargarLoader("Guardando...");
            $.ajax({
                type: "POST",
                url: '${createLink(controller: 'persona', action:'saveRegistro_ajax')}',
                data: $form.serialize(),
                success: function (msg) {
                    var parts = msg.split("_");
                    if (parts[0] == 'ok') {
                        bootbox.alert("<i class='fa fa-envelope fa-2x text-warning'></i> Un mail de verificación ha sido enviado a su correo " +
                            "<br> <i class='fa fa-exclamation-circle fa-2x text-warning'></i> Si no ha recibido el correo, revise su bandeja de spam", function(){
                            d.modal('hide');
                            // bootbox.hideAll()
                        })
                    }else {
                        if(parts[0] == 'er'){
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + parts[1], function(){
                                d.modal('hide');
                            })
                        }else{
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + "Error al crear el usuario", function(){
                                d.modal('hide');
                            })
                        }
                    }
                }
            });
        } else {
            return false;
        } //else
    }

    function cargarPassword() {
        bootbox.hideAll();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action: 'password_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgPassword",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i> Salir",
                            className: "btn-gris",
                            callback: function () {
                            }
                        },
                        guardar: {
                            id: "btnSave",
                            label: "<i class='fa fa-check'></i> Aceptar",
                            className: "btn-rojo",
                            callback: function () {
                                return submitFormPassword();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormPassword() {
        var $form = $("#frmPassword");
        if ($form.valid()) {
            var d = cargarLoader("Procesando...");
            $.ajax({
                type: "POST",
                url: '${createLink(controller: 'persona', action:'recuperarPassword_ajax')}',
                data: $form.serialize(),
                success: function (msg) {
                    var parts = msg.split("_");
                    if (parts[0] == 'ok') {
                        bootbox.alert("<i class='fa fa-envelope fa-2x text-warning'></i> Un mail con su contraseña ha sido enviado a su correo " +
                            "<br> <i class='fa fa-exclamation-circle fa-2x text-warning'></i> Si no ha recibido el correo, revise su bandeja de spam", function(){
                            d.modal('hide');
                            // bootbox.hideAll()
                        })
                    }else {
                        if(parts[0] == 'er'){
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + parts[1], function(){
                                d.modal('hide');
                            })
                        }else{
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + "Error al recuperar el password", function(){
                                d.modal('hide');
                            })
                        }
                    }
                }
            });
        } else {
            return false;
        } //else
    }

</script>

</body>

</html>