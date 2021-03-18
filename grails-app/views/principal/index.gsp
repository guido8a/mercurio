<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <meta name="layout" content="main2">
    <title>Ventas</title>

    %{--    <g:layoutHead/>--}%

    %{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">--}%

    <!-- Bootstrap core CSS -->
    <asset:stylesheet src="/merc/bootstrap.min.css"/>

    <!-- Custom styles for this template -->
    <asset:stylesheet src="/apli/shop-homepage.css"/>
    %{--        <asset:javascript src="/merc/jquery.min.js"/>--}%

    %{--    <asset:javascript src="/apli/bootbox.js"/>--}%
    %{--    <asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.min.js"/>--}%
    %{--    <asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.js"/>--}%
    %{--    <asset:javascript src="/jquery-validation-1.11.1/localization/messages_es.js"/>--}%
    %{--    <asset:javascript src="/apli/functions.js"/>--}%
    %{--    <asset:javascript src="/apli/loader.js"/>--}%
    %{--    <asset:javascript src="/apli/fontawesome.all.min.js"/>--}%

    <asset:stylesheet src="/arbol/bootstrap-treeview.min.css"/>
    <asset:javascript src="/arbol/bootstrap-treeview.min.js"/>

    %{--    <asset:javascript src="/merc/bootstrap.bundle.js"/>--}%
    %{--    <asset:javascript src="/apli/bootstrap.js"/>--}%


    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <style type="text/css">
    .lista-item {
        position: relative;
        display: block;
        padding: .5rem 1.0rem;
        background-color: #fff;
        border: 1px solid rgba(0, 0, 0, .125);
        /*border-top-width: 1px;*/
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

%{--<mn:menuHg activo="${activo}"/>--}%

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Inicio</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                %{--                    <a class="nav-link active" aria-current="page" href="#">Ingresar</a>--}%

                    <g:if test="${usuario}">
                        <a href="${createLink(controller: 'login', action: 'logout')}" class="btn btn-warning"
                           style="text-decoration: none"><i class="fa fa-user-times"></i> Salir</a>
                    </g:if>
                    <g:else>
                        <a href="#" id="ingresar" class="btn btn-success" style="text-decoration: none"><i
                                class="fa fa-user-check"></i> Ingresar</a>
                    </g:else>




                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                %{--                <li class="nav-item">--}%
                %{--                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--}%
                %{--                </li>--}%
            </ul>
            <form class="d-flex col-md-6">

                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Categorías</button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Separated link</a></li>
                </ul>

                <input class="form-control me-2 col-md-12" style="min-height: 35px" type="search" placeholder="Buscar..." aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Buscar</button>
            </form>
        </div>
    </div>
</nav>



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

            %{--            <div id="carouselExampleIndicators" class="carousel slide my-4 cs900">--}%
            %{--                <ol class="carousel-indicators">--}%
            %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>--}%
            %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>--}%
            %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>--}%
            %{--                </ol>--}%

            %{--                <div class="carousel-inner cs900" role="listbox">--}%
            %{--                    <g:each in="${carrusel}" var="carr" status="i">--}%
            %{--                        <div class="carousel-item ${i==0? 'active': ''}" >--}%
            %{--                            <img class="img-fluid imag-item" alt="First slide"--}%
            %{--                                 src="${request.contextPath}/principal/getImgnProd?ruta=${carr.ruta}&tp=${carr.tp}&id=${carr.prod}"/>--}%
            %{--                        </div>--}%
            %{--                    </g:each>--}%
            %{--                </div>--}%
            %{--                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">--}%
            %{--                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>--}%
            %{--                                    <span class="sr-only">Previous</span>--}%
            %{--                                </a>--}%
            %{--                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">--}%
            %{--                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>--}%
            %{--                                    <span class="sr-only">Next</span>--}%
            %{--                                </a>--}%
            %{--            </div>--}%

            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">


                    <g:each in="${carrusel}" var="carr" status="i">
                        <div class=" carousel-item ${i==0? 'active': ''}" >
                            <img class="img-fluid imag-item" alt="${i + 1} slide"
                                 src="${request.contextPath}/principal/getImgnProd?ruta=${carr.ruta}&tp=${carr.tp}&id=${carr.prod}"/>
                            <div class="carousel-caption d-none d-md-block">
                                <h5>${i + 1} slide label</h5>
                                <p>Some representative placeholder content for the ${i+1} slide.</p>
                            </div>
                        </div>
                    </g:each>


                %{--                                <div class="carousel-item active">--}%
                %{--                                    <img src="..." class="d-block w-100" alt="...">--}%
                %{--                                    <div class="carousel-caption d-none d-md-block">--}%
                %{--                                        <h5>First slide label</h5>--}%
                %{--                                        <p>Some representative placeholder content for the first slide.</p>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                                <div class="carousel-item">--}%
                %{--                                    <img src="..." class="d-block w-100" alt="...">--}%
                %{--                                    <div class="carousel-caption d-none d-md-block">--}%
                %{--                                        <h5>Second slide label</h5>--}%
                %{--                                        <p>Some representative placeholder content for the second slide.</p>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                                <div class="carousel-item">--}%
                %{--                                    <img src="..." class="d-block w-100" alt="...">--}%
                %{--                                    <div class="carousel-caption d-none d-md-block">--}%
                %{--                                        <h5>Third slide label</h5>--}%
                %{--                                        <p>Some representative placeholder content for the third slide.</p>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                </div>
                <a class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </a>
                <a class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"  data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Siguiente</span>
                </a>


                %{--                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">--}%
                %{--                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>--}%
                %{--                    <span class="sr-only">Previous</span>--}%
                %{--                </a>--}%
                %{--                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">--}%
                %{--                    <span class="carousel-control-next-icon" aria-hidden="true"></span>--}%
                %{--                    <span class="sr-only">Next</span>--}%
                %{--                </a>--}%

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
                                    %{--                                                                    <img width="250px" height="200px" src="${createLink(controller: 'producto', action: 'getImage', params: [id: prod.rt, pro: prod?.p] )}"/>--}%
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


        // var myTree = [
        //     {
        //         text: "Item 1",
        //         nodes: [
        //             {
        //                 text: "Item 1-1",
        //                 nodes: [
        //                     {
        //                         text: "Item 1-1-1"
        //                     },
        //                     {
        //                         text: "Item 1-1-2"
        //                     }
        //                 ]
        //             },
        //             {
        //                 text: "Item 1-2"
        //             }
        //         ]
        //     },
        //     {
        //         text: "Item 2"
        //     },
        //     {
        //         text: "Item 3"
        //     }
        //
        // ];


        %{--console.log(${data})--}%

        %{--var mytree = ${data}--}%

        %{--console.log("result " + ${})--}%

        %{--var json = $.parseJSON(${data});--}%

        %{--$('#default-tree').treeview({--}%
        %{--    data: json--}%
        %{--});--}%

        var arbol = [];

        <g:each in="${ventas.Categoria.list().sort{it.descripcion}}" var="categoria">

        <g:if test="${ventas.Subcategoria.findAllByCategoria(categoria)}">

        arbol.push({
            text: '${categoria?.descripcion}',
            tags: [${ventas.Subcategoria.findAllByCategoria(categoria).size()}],
            nodes:[
                <g:each in="${ventas.Subcategoria.findAllByCategoria(categoria).sort{it.descripcion}}" var="subcategoria">
                {
                    text: '${subcategoria?.descripcion}'
                },
                </g:each>
            ]
        });

        </g:if>
        <g:else>

        arbol.push({
            text: '${categoria?.descripcion}'
        });

        </g:else>

        </g:each>

        %{--console.log("arbol " + arbol)--}%

        %{--var json = $.parseJSON(${data});--}%
        %{--var json = JSON.parse(${data});--}%

        // console.log(arbol)

        %{--var r = JSON.parse(${data.toPrettyString()});--}%

        $('#default-tree').treeview({
            data: arbol,
            // data: myTree,
            enableLinks: true,
            highlightSelected: true,
            // levels: 2,
            expandIcon: 'glyphicon glyphicon-plus',
            collapseIcon: 'glyphicon glyphicon-minus',
            emptyIcon: 'glyphicon',
            nodeIcon: '',
            selectedIcon: '',
            checkedIcon: 'glyphicon glyphicon-check',
            uncheckedIcon: 'glyphicon glyphicon-unchecked',
            // shows borders
            // showBorder: true,

            // shows icons
            showIcon: true,
            showTags: true,
            // borderColor: '#000000'
        });

        $('#default-tree').treeview('collapseAll', { silent: true });


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