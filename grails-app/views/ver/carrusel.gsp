<%--
  Created by IntelliJ IDEA.
  User: guido
  Date: 12/03/21
  Time: 10:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="/merc/bootstrap.min.css"/>

    <!-- Custom styles for this template -->
    <asset:javascript src="/merc/jquery.min.js"/>
    <asset:javascript src="/merc/bootstrap.bundle.js"/>
    <asset:javascript src="/apli/bootbox.js"/>
    <asset:javascript src="/apli/fontawesome.all.min.js"/>
    <title>${producto?.titulo}</title>


    <style type="text/css">
    body {
        /*background: black;*/
    }

    .carousel-indicators {
        position: static;
    }

    .carousel-indicators .item.active {
        background: transparent;
        color: #0a193b;
        opacity: 0.8;
    }

    .fotos-guia .inactiva {
        opacity: 0.5;
        border-color: #ffffff;
        border-style: solid;
        border-width: 1px;
    }

    .fotos-guia .activa {
        opacity: 1;
    }

    .cs900 {
        /*width: 950px;*/
        /*height: 500px;*/
        align-content: center;
        background-color: #dfdfdf;
    }

    .carousel-inner {
        text-align: center;
    }

    .carousel .item > img {
        display: inline-block;
    }

    .imag-item {
        height: 400px;
        width: auto;
        max-height: 400px;
        margin: 0;
        max-width: 800px
    }

    /* menu */
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


    </style>

</head>

<body>

<g:if test="${tipo == '4' || tipo == '5' || tipo == '6'}">

</g:if>
<g:else>
    <mn:menuNuevo activo="${activo}"/>
</g:else>

<div class="container" style="min-width: 60% !important; margin-top: 70px; overflow-y: hidden">


    <div class="btn-group">
        <g:if test="${tipo}">
            <g:if test="${tipo == '1'}">
                <a href="#" class="btn btn-primary" id="btnAnterior"><i
                        class="fa fa-arrow-left"></i> Regresar al Anuncio para <strong>Publicar</strong></a>
            </g:if>
            <g:else>
                <g:if test="${tipo == '3'}">
                    <a href="#" class="btn btn-primary" id="btnAnteriorPrincipal"><i
                            class="fa fa-arrow-left"></i> Regresar a la pantalla principal</a>
                </g:if>
                <g:else>
                    <g:if test="${tipo == '4'}">
                        <a href="${createLink(controller: 'alerta', action: 'list')}" class="btn btn-primary" >
                            <i class="fa fa-arrow-left"></i> Regresar a la lista de alertas
                        </a>
                    </g:if>
                    <g:else>
                        <g:if test="${tipo == '5'}">
                            <a href="${createLink(controller: 'anuncio', action: 'list')}" class="btn btn-primary" >
                                <i class="fa fa-arrow-left"></i> Regresar a la lista de anuncios
                            </a>
                        </g:if>
                        <g:else>
                            <g:if test="${tipo == '6'}">
                                <a href="${createLink(controller: 'alerta', action: 'revisadas')}" class="btn btn-primary" >
                                    <i class="fa fa-arrow-left"></i> Regresar a la lista alertas revisadas
                                </a>
                            </g:if>
                            <g:else>
                                <a href="#" class="btn btn-primary" id="btnAnteriorLista">
                                    <i class="fa fa-arrow-left"></i> Regresar a la lista de productos
                                </a>
                            </g:else>
                        </g:else>
                    </g:else>
                </g:else>
            </g:else>
        </g:if>

    </div>

    <g:if test="${publicaciones > 0}">
        <a href="#" class="btn btn-success" id="btnContactar" style="float: right">
            <i class="fa fa-phone"></i> Contactar con el vendedor
        </a>
    </g:if>

    <h3 style="margin-top: 20px; text-align: center">
        <div class="alert alert-dark" role="alert">
            ${producto.titulo}
        </div>
    </h3>
    <h5 style="text-align: center">
        <div class="alert alert-info" role="alert">
            ${producto.subtitulo}
        </div>
    </h5>


    <div class="col-lg-12" style="float: left; background-color: #dfdfdf; border-style: solid; border-color: #ddd; border-width: 1px">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 100%">
            <div class="carousel-inner cs900">

                <g:each in="${carrusel}" var="carr" status="i">
                    <div class="carousel-item ${i == 0 ? 'active' : ''}">
                        <img class="img-fluid imag-item" alt="First slide"
                             src="${request.contextPath}/principal/getImgnCarrusel?ruta=${carr.ruta}"/>
                    </div>
                </g:each>

                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Anterior</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Siguiente</span>
                </a>

            </div>

        </div>
    </div>

    <div id="fotos" class="col-lg-12 fotos-guia" style="float: left; background-color: #dfdfdf; margin-left: 0; border-style: solid; border-color: #ddd;  border-width: thin">
        <g:each in="${carrusel}" var="carr" status="i">
            <div id="imagen${i}" class="guia inactiva" style="float: left;">
                <img src="${request.contextPath}/principal/getImgnCarrusel?ruta=${carr.ruta}"
                     data-target="#carouselExampleIndicators" data-slide-to="${i}" style="height: 100px;"/>
            </div>
        </g:each>
    </div>



    <div id="textos" class="col-lg-12" style="display: block; float: left; padding: 1%; border: #ddd; border-style: solid;  border-width: thin" >

        <div class="alert alert-primary" role="alert" style="text-align: center">
            %{--                <h3 style="text-align: center">--}%
            Características
            %{--                </h3>--}%
        </div>

        <div class="col-md-6" style="margin-left: 280px; background-color: #efefef">
            <table class="table-bordered table-striped table-hover table-active" style="width: 100%">
                <g:each in="${atributos}" var="at" status="i">
                    <tr>
                        <td class="alert alert-primary" role="alert">
                            ${at.atributoCategoria.atributo.descripcion}
                            %{--                            <span class="badge bg-success"> ${at.atributoCategoria.atributo.descripcion}</span>--}%
                        </td>
                        <td style="text-align: right"  class="alert alert-success" role="alert">
                            %{--                            <span class="badge bg-info">--}%
                            ${at.valor}
                            %{--                            </span>--}%
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>

    <g:if test="${producto.texto}">
        <div id="divDescripcion">
            <div class="col-lg-12" style="float: left; padding: 1%; background-color: #efefef; border-style: solid; border-width: thin; border-color: #ddd">
                <div class="alert alert-primary" role="alert" style="text-align: center">
                    Descripción
                </div>
                <g:applyCodec encodeAs="none">
                    ${producto.texto}
                </g:applyCodec>
            </div>
        </div>
    </g:if>

</div>

<script type="text/javascript">

    $("#btnContactar").click(function () {
        cargarCliente();
    });

    function cargarCliente() {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'cliente', action: 'cliente_ajax')}",
            data: {
                producto: '${producto?.id}'
            },
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgCargarCliente",
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

    $("#btnAnteriorPrincipal").click(function () {
        location.href = "${createLink(controller: 'principal', action: 'index')}"
    });

    $("#btnAnterior").click(function () {
        location.href = "${createLink(controller: 'producto', action: 'wizardContacto')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
    });

    $("#btnAnteriorLista").click(function () {
        location.href = "${createLink(controller: 'producto', action: 'list')}?id=" + '${persona?.id}'
    });

    $(document).ready(function () {

        $('#btnAnterior').click(function () {
            location.href = "${createLink(controller: 'producto', action: 'wizardContacto')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
        });


        $('.carousel').each(function () {
            // $(this).find('.carousel-indicators .item').eq(0).addClass('active');
            $('#fotos').find('.guia').eq(0).addClass('activa');
        });


        /*

            $("#carouselExampleIndicators").on('slide.bs.carousel',function(e){
                if(window.event){
                    $("body").append("<p>Sliding Manually</p>");
                } else {
                    $("body").append("<p>Sliding Automatically</p>");
                })
*/
    });

    $(function () {
        $('#carouselExampleIndicators').bind('slide.bs.carousel', function (e) {
            // console.log('slide event!');
            $('#fotos').find('.guia').removeClass('activa');
            $('#fotos').find('.guia').addClass('inactiva');
        });

        $("#carouselExampleIndicators").on('slid.bs.carousel', function () {
            $("#carouselExampleIndicators").carousel();
            currentIndex = $('div.active').index();
            // console.log('activo...', currentIndex);
            $('#imagen' + currentIndex).addClass('activa');
        });

    });

    $("#btn-buscar").click(function () {
        var dato = $('#bsca').val()
        var ctgr = $('#categoriaBuscar').val()
        // console.log('hola', dato);
        location.href="${createLink(controller: 'principal', action: 'buscar')}?bscr=" + dato + "&ctgr=" + ctgr
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

</script>
</body>
</html>