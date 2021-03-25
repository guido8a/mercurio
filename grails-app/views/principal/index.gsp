<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <title>Ventas</title>

    %{--    <g:layoutHead/>--}%

    <!-- Bootstrap core CSS -->
    <asset:stylesheet src="/merc/bootstrap.min.css"/>

    <!-- Custom styles for this template -->
    <asset:stylesheet src="/apli/shop-homepage.css"/>

    <asset:javascript src="/merc/jquery.min.js"/>
    <asset:javascript src="/merc/bootstrap.bundle.js"/>
    <asset:javascript src="/apli/bootbox.js"/>
    <asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.min.js"/>
    <asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.js"/>
    <asset:javascript src="/jquery-validation-1.11.1/localization/messages_es.js"/>
    <asset:javascript src="/apli/functions.js"/>
    <asset:javascript src="/apli/loader.js"/>
    <asset:javascript src="/apli/fontawesome.all.min.js"/>

    %{--    <asset:javascript src="/mdb/mdb.min.js"/>--}%
    %{--    <asset:javascript src="/mdb/modules/treeview.min.js"/>--}%
    %{--    <asset:javascript src="/mdb/modules/animations-extended.min.js"/>--}%

    %{--    <asset:stylesheet src="/arbol/bootstrap-treeview.min.css"/>--}%
    %{--    <asset:javascript src="/arbol/bootstrap-treeview.min.js"/>--}%

    <style type="text/css">
    body {
        background: #B4BAC0;
    }
    .lista-item {
        position: relative;
        display: block;
        padding: .5rem 1.0rem;
        background-color: #fff;
        border: 1px solid rgba(0, 0, 0, .125);
        border-top-width: 1px;
    }

    .consulta {
        font-size: small;
        background-color: #fdfdfd;
    }

    .cs900 {
        width: 800px;
        height: 350px;
        align-content: center;
        /*background-color: #cfcfcf;*/
        background-color: #B4BAC0;
    }

    .carousel-inner {
        text-align: center;
    }

    .carousel .item > img {
        display: inline-block;
    }

    .imag-item {
        height: 350px;
        width: auto;
        max-height: 350px;
        margin: 0;
    }


    .marcoDestacados {
        border-color: #47b636;
    }

    .con-borde {
        border-radius: 4px;
        background-image: linear-gradient(#747A80, #343A40, #545A60);
        text-align-all: center;
        height: 35px;
        font-size:small;
        margin: 2px;
    }

    a.nav-link:hover {
        border-radius: 4px;
        background-image: linear-gradient(#646A70, #141A20, #444A50);
    }

    .redondeado {
        width: 400px;
        border-style:solid;
        border-width: 2px;
        border-color: #FFAB19;
        /*border-color: #e67a00;*/
        border-radius: 4px;
        background-color: #ffab19;
        text-align: center;
    }

    .estilo {
        border-radius: 50px;
        border-style: solid;
        border-width: 1px;
        border-color: #000000;
    }

    .categoria {
        position: relative;
        display: block;
        padding: .5rem 1.0rem;
        background-color: #fff;
        /*border: 1px solid rgba(0, 0, 0, .25);*/
        border: 1px solid #0a193b;
        border-top-width: 1px;
        border-top-width: 1px;
        color: #42577d;
        border-radius: 5px;
        margin-right: 0px;
    }

    .subcat {
        margin-left: 20px;
        padding-left: 20px;
        /*border-left: 10px solid #343a40;*/
        /*border-left: 20px solid rgba(0, 0, 0, .125);*/
        /*border-left: 20px solid rgba(0, 0, 0, 0.5);*/
        /*border-color: #1e7e34;*/
        /*border-width: 1px;*/
        /*border-left: 20px solid #0069d9;*/
        /*border-left-width: 10px;*/
        /*border-left-style: solid;*/
        border-radius: 7px;
        /*margin-right: -10px;*/
    }

        a.categoria:hover{
            text-decoration: none;
            color: #0a193b;
            background-color: #dfdfe8;
        }
        a.subcat:hover{
            text-decoration: none;
            color: #0a193b;
            /*background-color: #efeff8;*/
            background-color: #fFAB20;
        ;
        }

    .act_ct {
        color: #222;
        background-color: #fdf8f0;
        border-width: 2px;
        /*border-left: 10px solid;*/
        border-color: #bF6B00;
        /*border-left: 10px solid #343a40;*/
    }

    .activo {
        color: #222;
        /*background-color: #fdf8f0;*/
        background-color: #fFAB20;
        border-width: 2px;
        /*border-left: 20px solid #343a40;*/
        border-color: #dF8B00;
    }

    /* bootstrap 3 */
    .dropdown-menu > li > a {
        display: block;
        padding: 3px 20px;
        clear: both;
        font-weight: normal;
        line-height: 1.42857143;
        color: #333;
        white-space: nowrap;
        text-decoration: none;
    }
    .dropdown-menu > .disabled > a,
    .dropdown-menu > .disabled > a:hover,
    .dropdown-menu > .disabled > a:focus {
        color: #b3b3b3;
    }
    .open > .dropdown-menu {
        display: block;
    }
    .open > a {
        outline: 0;
    }

    .nav > li > a:hover,
    .nav > li > a:focus {
        text-decoration: none;
        background-color: #242a30;
    }

    .nav > ul > li > a:hover,
    .nav > ul > li > a:focus {
        text-decoration: none;
        background-color: #444;
    }
    .dropdown-menu > li > a:hover,
    .dropdown-menu > li > a:focus {
        color: #1e2c58;
        text-decoration: none;
        background-color: #b3b3b3;
    }

    .blink_text {
        animation:1s blinker linear infinite;
        -webkit-animation:1s blinker linear infinite;
        -moz-animation:1s blinker linear infinite;
        color: black;
    }

    @-moz-keyframes blinker {
        0% { opacity: 1.0; }
        50% { opacity: 0.2; }
        100% { opacity: 1.0; }
    }

    @-webkit-keyframes blinker {
        0% { opacity: 1.0; }
        50% { opacity: 0.2; }
        100% { opacity: 1.0; }
    }

    @keyframes blinker {
        0% { opacity: 1.0; }
        50% { opacity: 0.2; }
        100% { opacity: 1.0; }
    }
    </style>
</head>

<body>

<mn:menuNuevo activo="${activo}"/>
%{--<mn:menuHg activo="${activo}"/>--}%



%{--
<div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="input-group col-md-6">
            <div class="input-group-text text-info">Texto</div>
            <input type="text" class="form-control estilo" id="inlineFormInputGroupUsername"
                   placeholder="texto a buscar...">
        </div>

        <div class="input-group col-md-4">
            <div class="input-group-text text-info">Categoría</div>
            <g:select name="categoriaBuscar" from="${ventas.Categoria.list().sort { it.descripcion }}"
                      class="form-control" optionValue="descripcion" optionKey="id" noSelection="[0: 'Todas']"/>
        </div>

        <div class="col-md-2">
            <a href="#" class="btn btn-info"><i class="fa fa-search"></i> Buscar</a>
        </div>
    </div>
</div>
--}%

<!-- Page Content -->
<div class="container" style="background-color: #efefef">

    <div class="row" style="margin-top: 20px;">

        <div class="col-lg-3">
            <div id="categorias"></div>
%{--
            <h2 class="titulo">Categorías</h2>
            <div class="list-group">
                <g:each in="${ventas.Categoria.findAll([sort: 'orden'])}" var="ct">
                    <a href="#" class="item_cat categoria" id="ct_${ct?.id}">${ct.descripcion}</a>
                    <g:if test="${ct?.id == activo}">
                        <g:each in="${ventas.Subcategoria.findAllByCategoria(ct, [sort: 'orden'])}" var="sbct">
                            <a href="#" class="categoria subcat ${sbct.orden==1?'activo': ''}" id="ct_${sbct?.id}">${sbct.descripcion}</a>
                        </g:each>
                    </g:if>
                </g:each>
            </div>
--}%
%{--            <div style="height: 20px"></div>--}%

            <h2 class="my-4 text-info">Consultas</h2>

            <div class="list-group">
                <g:each in="${consultas}" var="cs">
                    <a href="${cs?.link}" class="lista-item consulta text-info" title="${cs.texto}" target="_blank">
                        <img src="${request.contextPath}/principal/getImgnCnsl?ruta=${cs.logo}"
                             style='float:left; height:30px'>
                        ${cs.titulo}</a>
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
                            <img class="img-fluid imag-item" alt="First slide"
                                 src="${request.contextPath}/principal/getImgnProd?ruta=${carr.ruta}&tp=${carr.tp}&id=${carr.prod}"/>
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
            <g:if test="${productos?.size() > 0}">
                <div style="color: #47b636">Destacados</div>

                <div class="row">
                    <g:each in="${productos}" var="prod" status="i">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100 marcoDestacados">
                                <a href="${createLink(controller: 'ver', action: 'carrusel',  params: [id: prod.id, tipo: 3])}">
                                    %{--                                <img width="250px" height="200px" src="${createLink(controller: 'producto', action: 'getImage', params: [id: prod.rt, pro: prod?.p] )}"/>--}%
                                    <img width="250px" height="200px"
                                         src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                                </a>

                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="${createLink(controller: 'ver', action: 'carrusel', params: [id: prod.id, tipo: 3])}">${prod.tt}</a>
                                    </h4>
                                    <h5>${prod.sb ?: 'Sin descripción'}</h5>

                                    %{--                            <p class="card-text">${prod.sb}</p>--}%
                                </div>

                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>
            </g:if>

        %{--        Normales--}%


            <div class="row">
                <g:if test="${normales?.size() > 0}">
                    <g:each in="${normales}" var="prod" status="i">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="${createLink(controller: 'ver', action: 'carrusel',  params: [id: prod.id, tipo: 3])}">
                                    %{--                                <img width="250px" height="200px" src="${createLink(controller: 'producto', action: 'getImage', params: [id: prod.rt, pro: prod?.p] )}"/>--}%
                                    <img width="250px" height="200px"
                                         src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                                </a>

                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="${createLink(controller: 'ver', action: 'carrusel',  params: [id: prod.id, tipo: 3])}">${prod.tt}</a>
                                    </h4>
                                    <h5>${prod.sb ?: 'Sin descripción'}</h5>

                                    %{--                            <p class="card-text">${prod.sb}</p>--}%
                                </div>

                                <div class="card-footer">
                                    <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </g:if>
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

            </div>
            <!-- /.col-lg-9 -->

        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->







<!-- Footer -->
<footer class="py-3 bg-dark">
%{--    <div class="container">--}%
        <div style="text-align: center; font-size: small">
            <span class="text-white">Copyright &copy; Tedein S.A. 2021 &nbsp;  Versión: ${message(code: 'version', default: '1.1.0x')}
            %{--				<a href="${createLink(controller: 'login', action: 'login')}" style="text-decoration: none">Admin</a>--}%
            </span>
        </div>
%{--    </div>--}%
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--}%

<script type="text/javascript">

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
    };

    $("#ingresar").click(function () {
        cargarIngreso();
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
                            label: "Cancelar",
                            className: "btn-primary",
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
                            label: "Cancelar",
                            className: "btn-primary",
                            callback: function () {
                            }
                        },
                        guardar: {
                            id: "btnSave",
                            label: "<i class='fa fa-save'></i> Guardar",
                            className: "btn-success",
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
            openLoader("Guardando...");
            var d = cargarLoader("Guardando...");
            $.ajax({
                type: "POST",
                url: '${createLink(controller: 'persona', action:'saveRegistro_ajax')}',
                data: $form.serialize(),
                success: function (msg) {
                    // closeLoader();
                    d.modal('hide');
                    if (msg == 'ok') {
                        bootbox.alert("Un mail de verificación ha sido enviado a su correo")
                    } else {
                        bootbox.alert("Error al crear el usuario")
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