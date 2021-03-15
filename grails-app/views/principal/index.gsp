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

    <asset:stylesheet src="/arbol/bootstrap-treeview.min.css"/>
    <asset:javascript src="/arbol/bootstrap-treeview.min.js"/>

    <style type="text/css">
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
        background-color: #efeff8;
    }
    .carousel-inner { text-align: center; }
    .carousel .item > img { display: inline-block;}
    .imag-item { height: 350px; width: auto; max-height: 350px; margin: 0;}


    .marcoDestacados{
        border-color: #47b636;
    }

    .estilo{
        border-radius: 50px;
        border-style: solid;
        border-width: 1px;
        border-color: #000000;
    }



    </style>
</head>

<body>

<mn:menuHg activo="${activo}"/>



<div class="container" style="margin-top: 30px">
%{--        <div class="row g-2" style="margin-top: 20px">--}%
            <div class="row">
                <div class="input-group col-md-6">
                    <div class="input-group-text text-info">Texto</div>
                    <input type="text" class="form-control estilo" id="inlineFormInputGroupUsername" placeholder="texto a buscar...">
                </div>

                <div class="input-group col-md-4">
                    <div class="input-group-text text-info">Categoría</div>
                    <g:select name="categoriaBuscar" from="${ventas.Categoria.list().sort{it.descripcion}}" class="form-control" optionValue="descripcion" optionKey="id" noSelection="[ 0 : 'Todas']"/>
                </div>

                <div class="col-md-2">
                    <a href="#" class="btn btn-info"><i class="fa fa-search"></i> Buscar </a>
                </div>
            </div>
%{--        </div>--}%
</div>

%{--<div class="container">--}%
%{--<form class="row row-cols-lg-auto g-3 align-items-center">--}%
%{--    <div class="col-12">--}%
%{--        <label class="visually-hidden" for="inlineFormInputGroupUsername">Username</label>--}%
%{--        <div class="input-group">--}%
%{--            <div class="input-group-text">Buscar</div>--}%
%{--            <input type="text" class="form-control" id="inlineFormInputGroupUsername" placeholder="Username">--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div class="col-12">--}%
%{--        <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>--}%
%{--        <select class="form-select" id="inlineFormSelectPref">--}%
%{--            <option selected>Choose...</option>--}%
%{--            <option value="1">One</option>--}%
%{--            <option value="2">Two</option>--}%
%{--            <option value="3">Three</option>--}%
%{--        </select>--}%
%{--    </div>--}%

%{--    <div class="col-12">--}%
%{--        <div class="form-check">--}%
%{--            <input class="form-check-input" type="checkbox" id="inlineFormCheck">--}%
%{--            <label class="form-check-label" for="inlineFormCheck">--}%
%{--                Remember me--}%
%{--            </label>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div class="col-12">--}%
%{--        <button type="submit" class="btn btn-primary">Submit</button>--}%
%{--    </div>--}%
%{--</form>--}%
%{--</div>--}%


<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-lg-3">

%{--
            <g:if test="${usuario}">
                <label style="margin-top: 10px">Usuario: ${usuario.nombre} ${usuario.apellido}</label>
            </g:if>
--}%


%{--
            <div class="btn-group" style="margin-top: 20px">
                <g:if test="${usuario}">
                    <a href="${createLink(controller: 'login', action: 'logout')}" class="btn btn-warning"
                       style="text-decoration: none"><i class="fa fa-user-times"></i> Salir</a>
                </g:if>
                <g:else>
                    <a href="#" id="ingresar" class="btn btn-success" style="text-decoration: none"><i
                            class="fa fa-user-check"></i> Ingresar</a>
                </g:else>

                <a href="#" id="registro" class="btn btn-info" style="text-decoration: none"><i
                        class="fa fa-cog"></i> Registrarse</a>
            </div>
--}%

%{--
            <div class="btn-group" style="margin-top: 5px">
                <g:if test="${usuario}">
                    <a href="${createLink(controller: 'producto', action: 'list', id: usuario?.id)}"
                       class="btn btn-success" style="text-decoration: none"><i class="fa fa-plus-circle"></i> Vender
                    </a>
                </g:if>
            </div>
--}%

            <div style="height: 20px"></div>
            <h2 class="my-2">Categorías</h2>

%{--            <div class="list-group">--}%
%{--                <g:each in="${categorias}" var="ct">--}%
%{--                    <a href="#${ct?.id}" class="lista-item">${ct.descripcion}</a>--}%
%{--                </g:each>--}%
%{--            </div>--}%

            <div id="default-tree"></div>


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
                    %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>--}%
                    %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>--}%
                </ol>

                <div class="carousel-inner cs900" role="listbox">

   					<g:each in="${carrusel}" var="carr" status="i">
                    	<div class="carousel-item ${i==0? 'active': ''}" >
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

%{--            <div class="row">--}%
%{--                <g:each in="${productos}" var="prod" status="i">--}%

%{--                <div class="col-lg-4 col-md-6 mb-4">--}%
%{--                    <div class="card h-100">--}%
%{--                        <a href="#">--}%
%{--                                <img class="card-img-top"--}%
%{--                                src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>--}%
%{--                        </a>--}%

%{--                        <div class="card-body">--}%
%{--                            <h4 class="card-title">--}%
%{--                                <a href="#">${prod.tt}</a>--}%
%{--                            </h4>--}%
%{--                            <h5>${prod.sb}</h5>--}%

%{--                            <p class="card-text">${prod.t}</p>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--                </g:each>--}%
%{--        </div>--}%


%{--        Destacados--}%
        <g:if test="${productos?.size() > 0}">
            <div style="color: #47b636">Destacados</div>

            <div class="row">
                <g:each in="${productos}" var="prod" status="i">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100 marcoDestacados">
                            <a href="#">
%{--                                <img width="250px" height="200px" src="${createLink(controller: 'producto', action: 'getImage', params: [id: prod.rt, pro: prod?.p] )}"/>--}%
                                <img width="250px" height="200px" src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                            </a>

                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="#">${prod.tt}</a>
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
                            <a href="#">
%{--                                <img width="250px" height="200px" src="${createLink(controller: 'producto', action: 'getImage', params: [id: prod.rt, pro: prod?.p] )}"/>--}%
                                <img width="250px" height="200px" src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                            </a>

                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="#">${prod.tt}</a>
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
    <!-- /.row -->

</div>
<!-- /.container -->







<!-- Footer -->
<footer class="py-3 bg-dark">
    <div class="container">
        <div style="text-align: center; font-size: small">
            <span class="text-white">Copyright &copy; Tedein S.A. 2021 &nbsp;  Versión: ${message(code: 'version', default: '1.1.0x')}
            %{--				<a href="${createLink(controller: 'login', action: 'login')}" style="text-decoration: none">Admin</a>--}%
            </span>
        </div>
    </div>

    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--}%

<script type="text/javascript">

    // var $frm = $("#frmLogin");
    // var recargar = true;

    // function timedRefresh(timeoutPeriod) {
    // 	if(recargar) {
    // 		setTimeout("location.reload(true);",timeoutPeriod);
    // 	}
    // 	recargar = false
    // }

    // function doLogin() {
    // 	if ($frm.valid()) {
    // 		// $("#cargando").removeClass('hidden');
    // 		cargarLoader("Cargando...");
    // 		$(".btn-login").replaceWith($("#cargando"));
    // 		$("#frmLogin").submit();
    // 	}
    // }
    //
    // function doPass() {
    // 	if ($("#frmPass").valid()) {
    // 		$("#btn-pass").replaceWith(spinner);
    // 		$("#frmPass").submit();
    // 	}
    // }

    $(function () {

        // $("#ingresar").click(function () {
        // 	var initModalHeight = $('#modal-ingreso').outerHeight();
        // 	//alto de la ventana de login: 270
        // 	// console.log("ventana")
        // 	$("#modalBody").css({'margin-top': ($(document).height() / 2 - 135)}, {'margin-left': $(window).width() / 2});
        // 	// console.log("antes modeal")
        // 	$("#modal-ingreso").modal('show');
        // 	// console.log("luego modeal")
        // 	setTimeout(function () {
        // 		$("#login").focus();
        // 	}, 500);
        //
        // });

        // $("#btnOlvidoPass").click(function () {
        // 	$("#recuperarPass-dialog").modal("show");
        // 	$("#modal-ingreso").modal("hide");
        // });
        //
        // $("#btn-login").click(function () {
        // 	doLogin();
        // });
        //
        // $("#btn-pass").click(function () {
        // 	doPass();
        // });
        //
        // $("input").keyup(function (ev) {
        // 	if (ev.keyCode == 13) {
        // 		doLogin();
        // 	}
        // })

    });

    $("#ingresar").click(function () {
        cargarIngreso();
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