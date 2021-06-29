<%@ page import="ventas.Categoria" contentType="text/html;charset=UTF-8" %>

<%
    def buscadorServ = grailsApplication.classLoader.loadClass('utilitarios.BuscadorService').newInstance()
%>

<html>
<head>
    <meta name="layout" content="main">
    <title>Preguntas al Anunciante</title>

    <style type="text/css">

    .alinear {
        text-align: center !important;
    }
    .aviso{
        font-size: 16px;
        font-weight: normal;
    }
    .caja50{
        width: 100px !important;
        height: 70px;
        display: block;
    }
    </style>

</head>

<body>

<div style="text-align: center; margin-top: -20px;margin-bottom:20px">
    <h3>Administración de Preguntas</h3>
</div>

<elm:flashMessage tipo="${flash.tipo}" icon="${flash.icon}"
                  clase="${flash.clase}">${flash.message}</elm:flashMessage>

<div style="margin-top: -15px;" class="vertical-container">
    <p class="css-icono" style="margin-bottom: -15px"><i class="far fa-folder-open"></i></p>

    <div class="linea45"></div>



    <div class="row" style="margin-bottom: 10px;">

        <div class="row-fluid">
            <div style="margin-left: 20px;">
                <div class="col-xs-6 col-md-6">
                    <div class="col-xs-3 col-md-3">
                        <b>Anunciante: </b>
                        <elm:select name="buscador" from = "${buscadorServ.parmAnuncios()}" value="${params.buscador}"
                                    optionKey="campo" optionValue="nombre" optionClass="operador" id="buscador_con"
                                    style="width: 110px" class="form-control"/>
                    </div>
                    <div class="col-xs-3 col-md-3">
                        <strong style="margin-left: 20px;">Operación:</strong>
                        <span id="selOpt"></span>
                    </div>
                    <div class="col-xs-3 col-md-3">
                        <b style="margin-left: 20px">Criterio: </b>
                        <g:textField name="criterio" style="margin-left: 10px; width: 100%; border-color: #AF5B00"
                                     value="${params.criterio}" id="criterio_con" class="form-control"/>
                    </div>
                    <div class="col-xs-3 col-md-3">
                        <b>Ordenado por: </b>
                        <elm:select name="buscador" from = "${buscadorServ.parmAnuncios()}" value="${params.ordenar}"
                                    optionKey="campo" optionValue="nombre" optionClass="operador" id="ordenar_por"
                                    style="width: 100px" class="form-control"/>
                    </div>
                </div>

                <div class="col-xs-6 col-md-6">
                    <div class="btn-group col-xs-4" style="margin-left: -10px; margin-top: 0px;">
                        <b>Categoría:</b>
%{--                        <elm:select name="torres" from = "${ventas.Categoria.list([sort: 'orden'])}"--}%
%{--                                    optionKey="id" optionValue="descripcion" value="${actual}"--}%
%{--                                    style="width: 105px" class="form-control"/>--}%
                        <g:select name="categoria" from="${categoria}" class="form-control"
                                  optionKey="id" optionValue="descripcion" style="border-color: #4F1B00"
                                  value="${params.actual}"/>

                    </div>

                    <div class="btn-group col-xs-3" style="margin-left: -10px; margin-top: 0px;">
                        <b>Estados:</b>
                        <elm:select name="estados" from = "${estados}" style="border-color: #4F1B00"
                                    optionKey="key" optionValue="value" value="${actual}"
                                    class="form-control"/>
                    </div>


                    <div class="btn-group col-xs-6 col-md-4" style="margin-left: -20px; margin-top: 18px;">

                        <a href="#" name="busqueda" class="btn btn-info" id="btnBusqueda" title="Buscar"
                           style="height: 34px; width: 46px">
                            <i class="fa fa-search"></i></a>

                        <a href="#" name="limpiarBus" class="btn btn-warning" id="btnLimpiarBusqueda"
                           title="Borrar criterios" style="height: 34px; width: 34px">
                            <i class="fa fa-eraser"></i></a>
                    </div>

%{--
                    <div class="btn-group col-xs-1" style="margin-left: 20px; margin-top: 20px;">
                        <g:link action="creaIngresos" class="btn btn-info" title="Registro de aportes" style="height: 34px; padding: 9px; width: 46px">
                            <i class="fa fa-money"></i>
                        </g:link>
                    </div>
--}%

                </div>

            </div>

        </div>
    </div>
</div>

<div style="margin-top: 30px; min-height: 650px" class="vertical-container">
    <p class="css-vertical-text">Anuncios por Categoria</p>

    <div class="linea"></div>
    <table class="table table-bordered table-hover table-condensed" style="width: 1070px">
        <thead>
        <tr>
            <th class="alinear" style="width: 18%">Usuario</th>
            <th class="alinear" style="width: 20%">Anuncio</th>
            <th class="alinear" style="width: 18%">Tipo de Anuncio</th>
            <th class="alinear" style="width: 8%">Fecha Ingreso</th>
            <th class="alinear" style="width: 8%">Inicio</th>
            <th class="alinear" style="width: 8%">Fin</th>
            <th class="alinear" style="width: 6%">Estado</th>
%{--            <th class="alinear" style="width: 5%">Pago</th>--}%
            <th class="alinear" style="width: 14%">Acciones</th>
        </tr>
        </thead>
    </table>


    <div class="alert alert-danger hidden" id="mensaje" style="text-align: center">
    </div>

    <div id="detalle">
    </div>
</div>

<div><strong>Nota</strong>: Si existen muchos registros que coinciden con el criterio de búsqueda, se retorna
como máximo 30
</div>


<script type="text/javascript">

    $(function () {
        $("#limpiaBuscar").click(function () {
            $("#buscar").val('');
        });
    });

    <g:if test="${categoria}">
    cargarBusqueda();
    </g:if>
    <g:else>
    $("#mensaje").removeClass('hidden').append("No existen registros de propietarios");
    </g:else>


    $("#categoriaId").change(function () {
        cargarBusqueda();
    });


    function cargarBusqueda () {
        var ctgr = $("#categoria option:selected").val();
        var etdo = $("#estados option:selected").val()
        if(ctgr) {
            $("#detalle").html("").append($("<div style='width:100%; text-align: center;'/>").append(spinnerSquare64));
            $.ajax({
                type: "POST",
                url: "${g.createLink(controller: 'admin', action: 'tablaBuscar')}",
                data: {
                    buscador: $("#buscador_con").val(),
                    ordenar:  $("#ordenar_por").val(),
                    criterio: $("#criterio_con").val(),
                    operador: $("#oprd").val(),
                    ctgr: ctgr,
                    etdo: etdo
                },
                success: function (msg) {
                    $("#detalle").html(msg);
                },
                error: function (msg) {
                    $("#detalle").html("Ha ocurrido un error");
                }
            });
        }
    }

    $("#btnBusqueda").click(function () {
        cargarBusqueda();
    });

    $("input").keyup(function (ev) {
        if (ev.keyCode == 13) {
            $("#btnBusqueda").click();
        }
    });

    function createContextMenu(node) {
        var $tr = $(node);
        var items = {
            header: {
                label: "Acciones",
                header: true
            }
        };

        var id = $tr.data("id");

        console.log('id', id, 'tr', $tr)
        var detalle = {
            label: "Detalle Pagos",
            icon: "fa fa-print",
            separator_before : true,
            action : function ($element) {
                var id = $element.data("id");
                console.log('--id', id)
                cargarFechas(id);
            }
        };

        var pago = {
            label: "Pagos",
            icon: "fa fa-dollar-sign",
            separator_before : true,
            action : function ($element) {
                var id = $element.data("id");
                console.log('pago--id', id)
                verPago(id);
            }
        };

/*
        var administrar = {
            label: "Administrar",
            icon: "fa fa-pencil",
            separator_before : true,
            submenu: {
                editar
            }
        };
*/

        // items.administrar = administrar;
        items.detalle = detalle;
        if("{data.pago__id}") items.pago = pago;

        return items
    }

    $("#btnLimpiarBusqueda").click(function () {
        $(".fechaD, .fechaH, #criterio_con").val('');
    });

    $("#nuevo").click(function () {
        createEditRow(null);
    });

    $("#buscador_con").change(function(){
        var anterior = "${params.operador}";
        var opciones = $(this).find("option:selected").attr("class").split(",");

        poneOperadores(opciones);
    });

    function cargarFechas (id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'reportes', action:'fechasDetalle_ajax')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgFechasDetalle",
                    title   : "Período para el detalle de Pagos",
//                    class   : "modal-lg",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cerrar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        aceptar : {
                            label     : "<i class='fa fa-print'></i> Imprimir",
                            className : "btn-success",
                            callback  : function () {
                                var hasta = $("#fechaHastaDet").val();
                                var desde = $("#fechaDesdeDet").val();
                                location.href='${createLink(controller: 'reportes', action: 'reporteDetallePagos')}?id=' + id + "&desde=" + desde + "&hasta=" + hasta ;
                            }
                        }
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 100);
            } //success
        }); //ajax
    }

    function poneOperadores (opcn) {
        var $sel = $("<select name='operador' id='oprd' style='width: 120px' class='form-control'>");
        for(var i=0; i<opcn.length; i++) {
            var opt = opcn[i].split(":");
            var $opt = $("<option value='"+opt[0]+"'>"+opt[1]+"</option>");
            $sel.append($opt);
        }
        $("#selOpt").html($sel);
    };

    /* inicializa el select de oprd con la primea opción de busacdor */
    $(document).ready(function() {
        $("#buscador_con").change();
    });

    function verPago(id){
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'anuncio', action:'revisarPago_ajax')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgRevisaPago",
                    title   : "Ver constancia de Pago y Aprobaciónde anuncio",
                    message : msg,
                    // class : "modal-lg",
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        Aceptar : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-save'></i> Aceptar el Anuncio",
                            className : "btn-success",
                            callback  : function () {
                                return aceptarAnuncio(id);
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    };



    function aceptarAnuncio(id) {
        var l1 = cargarLoader("Procesando...");
        bootbox.dialog({
            title   : "Aceptar producto",
            message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i>" +
                "<span style='font-size: 14px; font-weight: bold'>&nbsp;¿Está seguro que desea aceptar " +
                "el anuncio de este producto?.</span>",
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
                                l1.modal("hide");
                                if(msg == 'ok'){
                                    bootbox.dialog({
                                        title   : "Confirmación",
                                        message : "<i class='fa fa-thumbs-up fa-3x pull-left text-warning text-shadow'>" +
                                            "</i><p>&nbsp; Anuncio revisado correctamente</p>",
                                        buttons : {
                                            aceptar : {
                                                label     : "<i class='fa fa-check'></i> Aceptar",
                                                className : "btn-gris",
                                                callback  : function () {
                                                    %{--location.href="${createLink(controller: 'anuncio', action: 'revisados')}?id=" + id--}%
                                                    location.reload()
                                                }
                                            }
                                        }
                                    });
                                }else{
                                    bootbox.alert("<i class='fa fa-times fa-3x pull-left text-warning text-shadow'>" +
                                        "</i><span style='font-size: 14px; font-weight: bold'>" +
                                        "&nbsp;Error al aceptar anuncio del producto</span>")
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
                        var l2 = cargarLoader("Procesando...");
                        $.ajax({
                            type    : "POST",
                            url     : "${createLink(controller: 'anuncio', action:'negarAnuncio_ajax')}",
                            data    : {
                                id:id
                            },
                            success : function (msg) {
                                l2.modal("hide")
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

    function quitarAnuncio(itemId, prod) {
        bootbox.dialog({
            title   : 'Dejar de Publicar: "' + prod + '"',
            message : "<i class='fas fa-skull-crossbones fa-3x pull-left text-danger text-shadow caja50'></i>" +
                "<p class='aviso'>¿Está seguro que desea dejar de publicar: <strong>" + prod + "</strong>?<br>" +
                "<strong>Esta acción no se puede deshacer</strong>.</p>",
            buttons : {
                cancelar : {
                    label     : "Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                eliminar : {
                    label     : "<i class='fas fa-skull-crossbones'></i> Quitar Publicación",
                    className : "btn-danger",
                    callback  : function () {
                        var l1 = cargarLoader("Eliminando");
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(controller: 'producto', action:'quitarAnuncio_ajax')}',
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                l1.modal("hide");
                                // console.log('msg', msg)
                                if (msg == "ok") {
                                    log("Anuncio eliminado correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                } else {
                                    log("Error al desactivar el Anuncio","error");
                                }
                            }
                        });
                    }
                }
            }
        });
    }



</script>

</body>
</html>