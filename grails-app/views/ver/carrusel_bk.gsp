<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBpasnhIQUsHfgCvC3qeJpEgcB9_ppWQI0&sensor=true"></script>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <title>Ventas</title>

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

<g:if test="${tipo == '4' || tipo == '5' || tipo == '6'}">

</g:if>
<g:else>
    <mn:menuNuevo search="${params.bscr?:''}"/>
</g:else>
%{--<mn:menuNuevo search="${params.bscr?:''}"/>--}%

%{--<div class="container" style="min-width: 60% !important; overflow-y: hidden">--}%
<div class="container" style="min-width: 60% !important; overflow-y: hidden">


    <div class="btn-group" style="margin-top: 5px">
        <g:if test="${tipo}">
            <g:if test="${tipo == '1'}">
                <a href="#" class="btn btn-gris borre" id="btnAnterior"><i
                        class="fa fa-arrow-left"></i> Regresar al Anuncio para <strong>Publicar</strong></a>
            </g:if>
            <g:else>
                <g:if test="${tipo == '3'}">
                    <a href="#" class="btn btn-gris btn-outline" onclick="anterior()" style="margin-right: 5px;"><i
                            class="fa fa-arrow-left"></i> Regresar</a>

                    <a href="${createLink(controller: 'principal', action: 'index')}" class="btn btn-gris">
                        <i class="fa fa-columns"></i> Principal
                    </a>

                </g:if>
                <g:else>
                    <g:if test="${tipo == '4'}">
                        <a href="${createLink(controller: 'admin', action: 'index')}" class="btn btn-gris" >
                            <i class="fa fa-arrow-left"></i> Regresar a la lista de Anuncios
                        </a>
                        <g:if test="${anuncio?.tipoPago?.id != 5 && anuncio?.estado == 'R'}">
                            <a href="${createLink(controller: 'admin', action: 'enviaMail')}" class="btn btn-rojo" >
                                <i class="fa fa-check"></i> Aprobar el Anuncio para Pago
                            </a>
                        </g:if>
                    </g:if>
                    <g:else>
                        <g:if test="${tipo == '5'}">
                            <a href="${createLink(controller: 'anuncio', action: 'revisados')}" class="btn btn-gris" >
                                <i class="fa fa-arrow-left"></i> Regresar a la lista de anuncios
                            </a>
                        </g:if>
                        <g:else>
                            <g:if test="${tipo == '6'}">
                                <a href="${createLink(controller: 'alerta', action: 'revisadas')}" class="btn btn-gris" >
                                    <i class="fa fa-arrow-left"></i> Regresar a la lista alertas revisadas
                                </a>
                            </g:if>
                            <g:else>
                                <a href="#" class="btn btn-gris" id="btnAnteriorLista">
                                    <i class="fa fa-arrow-left"></i> Regresar a la lista de Anuncios
                                </a>
                            </g:else>
                        </g:else>
                    </g:else>
                </g:else>
            </g:else>
        </g:if>

        <g:if test="${anuncio?.estado == 'A'}">
            <a href="#" class="btn buscar" id="btnContactar">
                <i class="fa fa-phone"></i> Contactar con el vendedor
            </a>
        </g:if>
        <g:if test="${tipo}">
            <g:if test="${tipo == '3'}">
                <a class="btn btn-gris" href="https://www.facebook.com/sharer/sharer.php?u=http://www.tedein.com.ec/ventas/ver/carrusel/${producto?.id}?tipo=${tipo}" title="Comparte en Facebook"><i class="fab fa-facebook-square text-info"></i></a>
                <a class="btn btn-gris" href="https://twitter.com/intent/tweet?text=Ventas%20&url=http://www.tedein.com.ec/ventas/ver/carrusel/${producto?.id}?tipo=${tipo}&hashtags=tedein" title="Comparte en Twitter"><i class="fab fa-twitter text-info"></i></a>
                <a class="btn btn-gris" href="https://api.whatsapp.com/send?text=Ventas%20http://www.tedein.com.ec/ventas/ver/carrusel/${producto?.id}?tipo=${tipo}" title="Comparte en Whatsapp"><i class="fab fa-whatsapp text-success"></i></a>
            </g:if>
        </g:if>
    </div>


    <div class="alert alert-dark" style="margin-top: 20px; text-align: center">
        <h3>${producto.titulo}</h3>
        <div><strong>${producto.subtitulo}</strong></div>
        <div style="margin-top: 5px">Lugar: ${lugar}</div>
    </div>


    <div class="col-lg-9" style="float: left; background-color: #dfdfdf; border-style: solid;
    border-color: #ddd; border-width: 1px">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 100%">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>--}%
                %{--                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>--}%
            </ol>
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

    <div id="fotos" class="col-lg-3 fotos-guia" style="float: left; background-color: #dfdfdf; margin-left: 0; border-style: solid; border-color: #ddd;  border-width: thin">
        <g:each in="${carrusel}" var="carr" status="i">
            <div id="imagen${i}" class="guia inactiva" style="float: left;">
                <img src="${request.contextPath}/principal/getImgnCarrusel?ruta=${carr.ruta}"
                     data-target="#carouselExampleIndicators" data-slide-to="${i}" style="height: 100px;"/>
            </div>
        </g:each>
    </div>
</div>

<div class="container" style="min-width: 60% !important; overflow-y: hidden">

    <div class="col-lg-5 columnas">
        <div class="alert alert-dark" role="alert" style="text-align: center">
            <strong>Características</strong>
        </div>
        <table class="table-bordered table-striped table-hover table-active table-condensed" style="width: 100%">
            <g:each in="${atributos}" var="at" status="i">
                <tr>
                    <td class="alert" role="alert">
                        ${at.atributoCategoria.atributo.descripcion}
                    </td>
                    <td style="text-align: right"  class="alert" role="alert">
                        ${at.valor}
                    </td>
                </tr>
            </g:each>
        </table>

    </div>
    <g:if test="${producto.texto}">
        <div class="col-lg-7 columnas">

            <div class="alert alert-dark" role="alert" style="text-align: center">
                <strong>Descripción del Bien o Servicio</strong>
            </div>
            <g:applyCodec encodeAs="none">
                ${producto.texto}
            </g:applyCodec>

        </div>
    </g:if>
%{--    <g:if test="${publicaciones > 0}">--}%
%{--        <div class="col-lg-5 columnas" style="float: right; margin-top: 2em">--}%

%{--            <a href="#" class="btn buscar" id="btnContactar" style="float: right;">--}%
%{--                <i class="fa fa-phone"></i> Contactar con el vendedor--}%
%{--            </a>--}%
%{--        </div>--}%
%{--    </g:if>--}%
%{--
    <div id="textos" class="col-lg-12" style="display: block; float: left; padding: 1%; border: #ddd; border-style: solid;  border-width: thin" >
        <div class="col-md-12">
        <div class="col-md-6">
            <div class="alert alert-dark" role="alert" style="text-align: center">
                Características
            </div>
            <table class="table-bordered table-striped table-hover table-active" style="width: 100%">
                <g:each in="${atributos}" var="at" status="i">
                    <tr>
                        <td class="alert alert-dark" role="alert">
                            ${at.atributoCategoria.atributo.descripcion}
                        </td>
                        <td style="text-align: right"  class="alert alert-dark" role="alert">
                            ${at.valor}
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>

        <g:if test="${producto.texto}">
            <div class="col-md-5">
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
            </div>
        </g:if>

        </div>
    </div>
--}%

     <g:if test="${producto?.subcategoria?.categoria?.id == 1}">
         <div id="local" class="col-lg-12" style="display: block; float: left; padding: 1%; border: #ddd; border-style: solid;  border-width: thin" >

             <div class="barra" role="alert" style="text-align: center;">
                 Mapa
             </div>
             <div class="col-md-12"  style="width: 100%; height: 500px;" id="divLocalizacion">
             </div>
         </div>
     </g:if>

    <div id="preguntas" class="col-lg-12" style="display: block; float: left; padding: 1%; border: #ddd; border-style: solid;  border-width: thin" >

        <div class="barra" role="alert" style="text-align: center;">
            Preguntar al Proveedor
        </div>

        <div class="row justify-content-center" style="margin-bottom: 10px">
            <div class="col-6">
                <g:textArea name="pregunta" maxlength="255" class="form-control" style="resize: none; height: 100px" placeholder="Enviar una pregunta al vendedor"/>
            </div>
            <div class="col-4">
                <a href="#" class="btn btn-gris-inv btnEnvioPregunta"><i class="fa fa-envelope"></i> Enviar pregunta</a>
            </div>
        </div>

        %{--        <div class="barra" role="alert" style="text-align: center; margin-top: 5px">--}%
        %{--            Preguntas y respuestas--}%
        %{--        </div>--}%

        <div class="col-md-12" style="background-color: #efefef" id="divPreguntas">

        </div>
    </div>

</div>

<div class="container" style="min-width: 60% !important; overflow-y: hidden">
<div class="btn-group" style="margin-top: 5px;">
    <g:if test="${tipo}">
        <g:if test="${tipo == '1'}">
            <a href="#" class="btn btn-gris borre" id="btnAnterior"><i
                    class="fa fa-arrow-left"></i> Regresar al Anuncio para <strong>Publicar</strong></a>
        </g:if>
        <g:if test="${tipo == '2'}">
            <a href="#" class="btn btn-gris borre" id="btnAnterior"><i
                    class="fa fa-arrow-left"></i> Regresar al Producto</a>
            <a href="#" class="btn btn-gris borre" id="btnPublicar"><i
                    class="fa fa-arrow-left"></i><strong>Publicar</strong></a>
        </g:if>
        <g:else>
            <g:if test="${tipo == '3'}">
                <a href="#" class="btn btn-gris btn-outline" onclick="anterior()" style="margin-right: 5px;"><i
                        class="fa fa-arrow-left"></i> Regresar</a>

                <a href="${createLink(controller: 'principal', action: 'index')}" class="btn btn-gris">
                    <i class="fa fa-columns"></i> Principal
                </a>

            </g:if>
            <g:else>
                <g:if test="${tipo == '4'}">
                    <a href="${createLink(controller: 'alerta', action: 'list')}" class="btn btn-gris" >
                        <i class="fa fa-arrow-left"></i> Regresar a la lista de alertas
                    </a>
                </g:if>
                <g:else>
                    <g:if test="${tipo == '5'}">
                        <a href="${createLink(controller: 'anuncio', action: 'list')}" class="btn btn-gris" >
                            <i class="fa fa-arrow-left"></i> Regresar a la lista de anuncios
                        </a>
                    </g:if>
                    <g:else>
                        <g:if test="${tipo == '6'}">
                            <a href="${createLink(controller: 'alerta', action: 'revisadas')}" class="btn btn-gris" >
                                <i class="fa fa-arrow-left"></i> Regresar a la lista alertas revisadas
                            </a>
                        </g:if>
                        <g:else>
                            <a href="#" class="btn btn-gris" id="btnAnteriorLista">
                                <i class="fa fa-arrow-left"></i> Regresar a la lista de productos
                            </a>
                        </g:else>
                    </g:else>
                </g:else>
            </g:else>
        </g:else>
    </g:if>

    <g:if test="${anuncio?.estado == 'A'}">
        <a href="#" class="btn buscar" id="btnContactar">
            <i class="fa fa-phone"></i> Contactar con el vendedor
        </a>
    </g:if>
    <g:if test="${tipo}">
        <g:if test="${tipo == '3'}">
            <a class="btn btn-gris" href="https://www.facebook.com/sharer/sharer.php?u=http://www.tedein.com.ec/ventas/ver/carrusel/${producto?.id}?tipo=${tipo}" title="Comparte en Facebook"><i class="fab fa-facebook-square text-info"></i></a>
            <a class="btn btn-gris" href="https://twitter.com/intent/tweet?text=Ventas%20&url=http://www.tedein.com.ec/ventas/ver/carrusel/${producto?.id}?tipo=${tipo}&hashtags=tedein" title="Comparte en Twitter"><i class="fab fa-twitter text-info"></i></a>
            <a class="btn btn-gris" href="https://api.whatsapp.com/send?text=Ventas%20http://www.tedein.com.ec/ventas/ver/carrusel/${producto?.id}?tipo=${tipo}" title="Comparte en Whatsapp"><i class="fab fa-whatsapp text-success"></i></a>
        </g:if>
    </g:if>
</div>
</div>


<!-- Footer -->
%{--<footer class="py-3 bg-dark">--}%
<div class="navbar-dark bg-dark" style="width: 100%; margin-top: 1%">
    <a href="${createLink(controller: 'principal', action: 'manual')}" class="badge badge-pill badge-warning buscar"
       style="text-decoration: none; margin-left: 10%"><i class="fa fa-book"></i> Manual de Usuario</a>
    <a href="${createLink(controller: 'principal', action: 'terminos')}" class="badge badge-pill badge-warning buscar"
       style="text-decoration: none;"><i class="fa fa-book"></i> Política del Sitio
    </a>
    <span style="float: right; font-size: small; margin-right: 10%; margin-top: 3px">
        <span class="text-white">Copyright &copy; Tedein S.A. 2021 &nbsp;  Versión: ${message(code: 'version', default: '1.1.0x')}
        </span>
    </span>
</div>

<!-- Bootstrap core JavaScript -->
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--}%

<script type="text/javascript">

    $(function () {
            initMap();
    });

    // Initialize and add the map
    function initMap() {
        // The location of Uluru
        // var coord = { lat: -0.242779, lng: -78.508217};

        var latitud = ${producto?.latitud ? (producto?.latitud != 0 ? producto?.latitud : (producto?.canton?.latitud != 0 ? producto?.canton?.latitud : producto?.canton?.provincia?.latitud)) : (producto?.canton?.latitud != 0 ? producto?.canton?.latitud : producto?.canton?.provincia?.latitud)};
        var longitud = ${producto?.longitud ? (producto?.longitud != 0 ? producto?.longitud : (producto?.canton?.longitud != 0 ? producto?.canton?.longitud : producto?.canton?.provincia?.longitud)) : (producto?.canton?.longitud != 0 ? producto?.canton?.longitud : producto?.canton?.provincia?.longitud)};

        var coord = {lat: latitud, lng: longitud};

        // The map, centered at Uluru
        var map = new google.maps.Map(document.getElementById("divLocalizacion"), {
            zoom: 16,
            center: coord,
            // maxZoom            : 24,
            // minZoom            : 16
        });
        // The marker, positioned at Uluru
        var marker = new google.maps.Marker({
            position: coord,
            map: map
        });
    }



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
                        bootbox.alert("<i class='fa fa-envelope fa-2x text-info'></i> Un mail de verificación ha sido enviado a su correo " +
                            "<br> <i class='fa fa-exclamation-circle fa-2x text-warning'></i> Si no ha recibido el correo, revise su bandeja de spam", function(){
                            d.modal('hide');
                            // bootbox.hideAll()
                        })
                    }else {
                        if(parts[0] == 'er'){
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i>" + parts[1], function(){
                                d.modal('hide');
                            })
                        }else{
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i>" + "Error al crear el usuario", function(){
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

    cargarPreguntas();

    function cargarPreguntas(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'ver', action: 'preguntas_ajax')}',
            data:{
                id: '${producto?.id}'
            },
            success: function(msg) {
                $("#divPreguntas").html(msg)
            }
        })
    }

    $(".btnEnvioPregunta").click(function () {

        var txt = $("#pregunta").val();

        if(txt == '' || txt == null){
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning text-shadow'></i> Debe ingresar una pregunta!")
        }else{
            bootbox.dialog({
                message : "<i class='fa fa-envelope fa-3x text-warning text-shadow'></i> " +
                    "<strong style='font-size: 14px; font-weight: bold'> ¿Está seguro de enviar esta pregunta al vendedor?</strong>",
                buttons : {
                    cancelar : {
                        label     : "<i class='fa fa-times'></i> Cancelar",
                        className : "btn-rojo",
                        callback  : function () {
                        }
                    },
                    enviar : {
                        label     : "<i class='fa fa-envelope'></i> Enviar",
                        className : "btn-gris",
                        callback  : function () {
                            enviarPregunta();
                        }
                    }
                }
            });
        }

    });

    function enviarPregunta(){
        var l = cargarLoader("Procesando...");

        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'ver', action: 'guardarPregunta_ajax')}',
            data:{
                id: '${producto?.id}',
                texto: $("#pregunta").val()
            },
            success: function(msg){
                l.modal("hide");
                if(msg == 'ok'){
                    bootbox.alert("Pregunta enviada correctamente al vendedor!");
                    $("#pregunta").val('');
                    cargarPreguntas();
                }else{
                    bootbox.alert("Error al enviar la pregunta al vendedor!")
                }
            }
        });
    }

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

    $("#btnAnteriorPrincipal").click(function () {
        location.href = "${createLink(controller: 'principal', action: 'index')}"
    });

    function anterior() {
        // console.log('history', window.history.length)
        if(window.history.length > 1) {
            // console.log("atras")
            window.history.back();
        } else {
            //window.close();
            location.href = "${createLink(controller: 'principal', action: 'index')}?sbct=sbct_" + ${producto.subcategoria.id}
        }
    }

    $("#btnAnteriorLista").click(function () {
        location.href = "${createLink(controller: 'producto', action: 'list')}"
    });

    $(document).ready(function () {

        $('#btnAnterior').click(function () {
            location.href = "${createLink(controller: 'producto', action: 'wizardContacto')}?id=" + '${producto?.id}'
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