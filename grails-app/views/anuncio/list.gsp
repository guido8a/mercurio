<%@ page import="ventas.Anuncio" %>
<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 17/05/21
  Time: 10:32
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de anuncios en revisión</title>

    <style>


    </style>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="anuncio" action="revisados" class="btn btn-rojo btnRevisadas">
            <i class="fa fa-user-check"></i> Publicaciones
        </g:link>
    </div>
    <div class="btn-group">
        <g:link controller="anuncio" action="negados" class="btn btn-gris btnNegados">
            <i class="fa fa-user-slash"></i> Anuncios negados
        </g:link>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 20%">Usuario</th>
        <th style="width: 40%">Producto</th>
        <th style="width: 10%">Fecha Ingreso</th>
        <th style="width: 10%">Pago</th>
        <th style="width: 20%">Acciones</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:if test="${anuncios.size() > 0}">
            <g:each in="${anuncios}" var="anuncio">
                <tr data-id="${anuncio?.id}" data-per="${anuncio.producto.persona.id}" data-pr="${anuncio?.producto?.id}" style="width: 100%">
                    <td style="width: 20%; text-align: center">${anuncio?.producto?.persona?.nombre}</td>
                    <td style="width: 40%">${anuncio?.producto?.titulo}</td>
                    <td style="width: 10%; text-align: center">${anuncio?.fecha?.format("dd-MM-yyyy")}</td>
                    <td style="width: 10%; text-align: center; font-weight: bold">
%{--                        <g:if test="${ventas.Pago.findByAnuncio(ventas.Anuncio.get(anuncio.id))}">--}%
                        <g:if test="${anuncio.pago == 'R'}">
                            <a href="#" class="btn btn-rojo btn-sm btnVerPago" title="Pago del producto" data-id="${anuncio?.id}"><i class="fa fa-dollar-sign"></i> </a>
                        </g:if>
                        <g:else>
                            Sin Pago
                        </g:else>
                    </td>
                    <td style="width: 20%; text-align: center">
                        <a href="#" class="btn btn-gris btn-sm btnRevisar" title="Revisar producto" data-id="${anuncio?.producto?.id}" data-per="${anuncio.producto.persona.id}"><i class="fa fa-search"></i> </a>
                        <a href="#" class="btn btn-rojo btn-sm btnAceptar" title="Aceptar producto" data-id="${anuncio?.id}"><i class="fa fa-thumbs-up"></i> </a>
                        <a href="#" class="btn btn-gris btn-sm btnNegar" title="Negar producto" data-id="${anuncio?.id}"><i class="fa fa-thumbs-down"></i> </a>
                    </td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <div class="alert alert-warning" role="alert" style="text-align: center">
                <p style="font-size: 14px"><i class="fa fa-exclamation-triangle"></i> No existen anuncios por revisar</p>
            </div>
        </g:else>
        </tbody>
    </table>
</div>

<script type="text/javascript">

    $(".btnVerPago").click(function () {
        var id = $(this).data("id");
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'anuncio', action:'revisarPago_ajax')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgRevisaPago",
                    title   : "Ver comprobante de Pago",
                    message : msg,
                    // class : "modal-lg",
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    });

    $(".btnRevisar").click(function () {
        var id = $(this).data("id");
        var persona = $(this).data("per");
        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + persona + "&tipo=" + 4;
    });

    $(".btnAceptar").click(function () {
        var id = $(this).data("id");
        aceptarAnuncio(id)
    });

    $(".btnNegar").click(function () {
        var id = $(this).data("id");
        negarProducto(id)
    });

    function aceptarAnuncio(id) {
        bootbox.dialog({
            title   : "Aceptar producto",
            message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i><span style='font-size: 14px; font-weight: bold'>&nbsp;¿Está seguro que desea aceptar el anuncio de este producto?.</span>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-gris",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-rojo",
                    callback  : function () {
                        $.ajax({
                            type: 'POST',
                            url: '${createLink(controller: 'anuncio', action: 'aceptarAnuncio_ajax')}',
                            data:{
                                id: id
                            },
                            success: function (msg){
                                if(msg == 'ok'){
                                    bootbox.dialog({
                                        title   : "Confirmación",
                                        message : "<i class='fa fa-thumbs-up fa-3x pull-left text-warning text-shadow'></i><p>&nbsp; Anuncio revisado correctamente</p>",
                                        buttons : {
                                            aceptar : {
                                                label     : "<i class='fa fa-check'></i> Aceptar",
                                                className : "btn-gris",
                                                callback  : function () {
                                                    location.href="${createLink(controller: 'anuncio', action: 'revisados')}?id=" + id
                                                }
                                            }
                                        }
                                    });
                                }else{
                                    bootbox.alert("<i class='fa fa-times fa-3x pull-left text-warning text-shadow'></i><span style='font-size: 14px; font-weight: bold'>&nbsp;Error al aceptar anuncio del producto</span>")
                                }
                            }
                        })
                    }
                }
            }
        });
    }

    function negarProducto(id) {
        bootbox.dialog({
            title   : "Negar producto",
            message : "<i class='fa fa-user-slash fa-2x pull-left text-warning text-shadow'></i><span style='font-size: 14px; font-weight: bold'>&nbsp; ¿Está seguro que desea negar el anuncio de este producto?.</span>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-gris",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-rojo",
                    callback  : function () {
                        $.ajax({
                            type    : "POST",
                            url     : "${createLink(controller: 'anuncio', action:'negarAnuncio_ajax')}",
                            data    : {
                                id:id
                            },
                            success : function (msg) {
                                if(msg == 'ok'){
                                    log("Producto negado correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                }else{
                                    log("Error al negar el producto","error")
                                }
                            } //success
                        }); //ajax
                    }
                }
            }
        });
    } //createEdit


</script>

</body>
</html>
