<%@ page import="ventas.Producto" %>
<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 03/03/21
  Time: 11:56
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de alertas</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="alerta" action="list" class="btn btn-gris btnEnProceso">
            <i class="fa fa-user-clock"></i> Alertas en proceso
        </g:link>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 15%">Usuario</th>
        <th style="width: 34%">Producto</th>
        <th style="width: 15%">Fecha Ingreso</th>
        <th style="width: 15%">Fecha Aprobación</th>
        <th style="width: 10%">Estado del producto</th>
        <th style="width: 11%">Acciones</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${alertas}" var="alerta">
            <tr data-id="${alerta?.id}" data-est="${alerta?.producto?.estado}" data-per="${alerta.producto.persona.id}" data-anu="${ventas.Anuncio.findByProducto(ventas.Producto.get(alerta?.producto?.id))}" style="width: 100%">
                <td style="width: 15%; text-align: center">${alerta?.producto?.persona?.nombre}</td>
                <td style="width: 35%">${alerta?.producto?.titulo}</td>
                <td style="width: 15%; text-align: center">${alerta?.fechaIngreso?.format("dd-MM-yyyy")}</td>
                <td style="width: 15%; text-align: center">${alerta?.fechaAprobacion?.format("dd-MM-yyyy")}</td>
                <td style="width: 10%; text-align: center">${alerta.estado == '1' ? 'Aprobado' : 'Negado'}</td>
                <td style="width: 20%; text-align: center">
                    <a href="#" class="btn btn-xs btn-gris btnRevisar" title="Revisar producto" data-id="${alerta?.producto?.id}" data-per="${alerta.producto.persona.id}"><i class="fa fa-search"></i> </a>
                    <g:if test="${alerta?.producto?.estado != 'N'}">
                        <g:if test="${!ventas.Anuncio.findByProducto(ventas.Producto.get(alerta?.producto?.id))}">
                            <a href="#" class="btn btn-xs btn-rojo btnForzar" title="Forzar creación de anuncio" data-id="${alerta?.id}"><i class="fa fa-hand-rock"></i> </a>
                        </g:if>
                    </g:if>

                    <a href="#" class="btn btn-xs btn-rojo btnRetornar" title="Retornar alerta" data-id="${alerta?.id}"><i class="fa fa-reply"></i> </a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<script type="text/javascript">

    $(".btnRevisar").click(function () {
        var id = $(this).data("id");
        var persona = $(this).data("per");
        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + persona + "&tipo=" + 6;
    });

    $(".btnRetornar").click(function () {
        var id = $(this).data("id");
       retornar(id)
    });

    $(".btnForzar").click(function () {
        var id = $(this).data("id");
        forzarAnuncio(id)
    });

    function retornar(id) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-arrow-left fa-3x pull-left text-warning text-shadow'></i><p>¿Está seguro que desea retornar esta alerta a su estado 'por revisar'?.</p>",
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
                            url: '${createLink(controller: 'alerta', action: 'retornarAlerta_ajax')}',
                            data:{
                                id: id
                            },
                            success: function (msg){
                                var parts = msg.split("_");
                                if(parts[0] == 'ok'){
                                    bootbox.dialog({
                                        title   : "Alerta",
                                        message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i><p>Alerta retornada correctamente</p>",
                                        buttons : {
                                            aceptar : {
                                                label     : "<i class='fa fa-check'></i> Aceptar",
                                                className : "btn-gris",
                                                callback  : function () {
                                                    location.href="${createLink(controller: 'alerta', action: 'list')}"
                                                }
                                            }
                                        }
                                    });
                                }else{
                                    if(parts[0] == 'er'){
                                        bootbox.alert("<i class='fa fa-times-circle fa-3x pull-left text-warning text-shadow'></i>" + parts[1])
                                    }else{
                                        log("Error al retornar la alerta","error")
                                    }
                                }
                            }
                        })
                    }
                }
            }
        });
    }

   function forzarAnuncio(id){
       bootbox.dialog({
           title   : "Alerta",
           message : "<i class='fa fa-arrow-left fa-3x pull-left text-warning text-shadow'></i><p>¿Está seguro que desea volver a crear el anuncio para este producto?.</p>",
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
                           url: '${createLink(controller: 'anuncio', action: 'forzarAnuncio')}',
                           data:{
                               id: id
                           },
                           success: function (msg){
                               var parts = msg.split("_");
                               if(parts[0] == 'ok'){
                                    log("Anuncio creado correctamente","success")
                               }else{
                                   if(parts[0] == 'er'){
                                       bootbox.alert("<i class='fa fa-times-circle fa-3x pull-left text-warning text-shadow'></i>" + parts[1])
                                   }else{
                                       log("Error al crear el anuncio","error")
                                   }
                               }
                           }
                       })
                   }
               }
           }
       });
   }


    %{--function createContextMenu(node) {--}%
    %{--    var $tr = $(node);--}%
    %{--    var estadoProducto = $tr.data("est");--}%
    %{--    var existeAnuncio = $tr.data("anu");--}%

    %{--    var items = {--}%
    %{--        header: {--}%
    %{--            label: "Acciones",--}%
    %{--            header: true--}%
    %{--        }--}%
    %{--    };--}%

    %{--    var producto = {--}%
    %{--        label            : "Ver Producto",--}%
    %{--        icon             : "fa fa-clipboard",--}%
    %{--        separator_before : true,--}%
    %{--        action           : function ($element) {--}%
    %{--            var id = $tr.data("id");--}%
    %{--            var persona = $tr.data("per");--}%
    %{--            location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + persona + "&tipo=" + 6;--}%
    %{--        }--}%
    %{--    };--}%

    %{--    var forzar = {--}%
    %{--        label            : "Volver a crear anuncio",--}%
    %{--        icon             : "fa fa-cog",--}%
    %{--        separator_before : true,--}%
    %{--        action           : function ($element) {--}%
    %{--            var id = $tr.data("id");--}%
    %{--            forzarAnuncio(id)--}%
    %{--        }--}%
    %{--    };--}%

    %{--    var retornarAlerta = {--}%
    %{--        label            : "Retornar alerta",--}%
    %{--        icon             : "fa fa-arrow-left",--}%
    %{--        separator_before : true,--}%
    %{--        action           : function ($element) {--}%
    %{--            var id = $tr.data("id");--}%
    %{--            retornar(id)--}%
    %{--        }--}%
    %{--    };--}%

    %{--    items.producto = producto;--}%
    %{--    if(estadoProducto != 'N'){--}%
    %{--        if(!existeAnuncio){--}%
    %{--            items.forzar = forzar;--}%
    %{--        }--}%
    %{--    }--}%
    %{--    items.retornar = retornarAlerta;--}%
    %{--    return items;--}%
    %{--}--}%

    // $(function () {
    //     $("tr").contextMenu({
    //         items  : createContextMenu,
    //         onShow : function ($element) {
    //             $element.addClass("trHighlight");
    //         },
    //         onHide : function ($element) {
    //             $(".trHighlight").removeClass("trHighlight");
    //         }
    //     });
    // });

</script>

</body>
</html>
