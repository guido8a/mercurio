<%@ page import="ventas.Producto" %>
<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 17/02/21
  Time: 10:30
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de productos del usuario: ${persona?.tipoPersona == 'N' ?  (persona?.nombre + " " + persona?.apellido) :  persona?.nombre}</title>
    <style>

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

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<h3 style="text-align: center">Administración de Anuncios de ${persona?.nombre} ${persona?.apellido}</h3>
<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="principal" action="index" class="btn btn-gris" title="Volver a página principal">
            <i class="fa fa-arrow-left"></i> Volver
        </g:link>
        <a href="${createLink(controller: 'producto', action: 'wizardProducto', params: [tipo: 3])}"
           class="btn btn-rojo" title="Crear un nuevo Anuncio"><i class="fa fa-file"></i> Nuevo Anuncio
        </a>
    </div>
    %{--    <a href="#" class="btn btn-gris btnReporte" title="reporte prueba"><i class="fa fa-print"></i> Reporte</a>--}%
    %{--    <a href="#" class="btn btn-gris btnReporteExcel" title="reporte prueba"><i class="fa fa-print"></i> Reporte Excel</a>--}%
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 28%">Anuncio</th>
        <th style="width: 15%">Categoria</th>
        <th style="width: 15%">Subcategoria</th>
        <th style="width: 10%">Estado</th>
        <th style="width: 5%">Info.</th>
        %{--        <th style="width: 8%">Fecha inicio</th>--}%
        %{--        <th style="width: 8%">Fecha fin</th>--}%
        <th style="width: 15%">Acciones</th>
        <th style="width: 12%">Publicar</th>

        %{--        <th style="width: 8%">Pagos</th>--}%
    </tr>
    </thead>
</table>

<div class="" style="width: 100%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${productos}" var="pd">
            <tr data-id="${pd.prod__id}" style="width: 100%" title="${pd.etdo}">
                <td style="width: 28%">${pd.prodtitl}</td>
                <td style="width: 15%">${pd.ctgrdscr}</td>
                <td style="width: 15%">${pd.sbctdscr}</td>
                <td style="width: 10%; text-align: center; font-weight: bold; background-color:${pd.anunetdo == 'R' ? '#afafaf' : (pd.anunetdo == 'A' ? '#EEB51F' : '')}">${pd.anunetdo == 'R' ? 'Revisión' : (pd.anunetdo == 'A' ? 'Publicándose' : 'Inactivo')}</td>
                %{--                <td style="width: 8%; text-align: center">${pd.anunfcin?.format("dd-MMM-yyyy")}</td>--}%
                %{--                <td style="width: 8%; text-align: center">${pd.anunfcfn?.format("dd-MMM-yyyy")}</td>--}%
                <td style="width: 5%; text-align: center; font-weight: bold;">
                    <a href="#" class="btn btn-xs btn-rojo btnInfo" title="Información del Anuncio"
                       data-id="${pd?.prod__id}" data-titulo="${pd?.prodtitl}"><i
                            class="fas fa-info-circle"></i></a></td>
                <td style="width: 15%; text-align: center">
                    <g:if test="${pd?.prodimag > 0}">
                        <a href="#" class="btn btn-xs btn-gris btnRevisar" title="Revisar anuncio"
                           data-id="${pd?.prod__id}"><i class="fa fa-search"></i></a>
                    </g:if>
                    <a href="#" class="btn btn-xs btn-rojo btnEditar" title="Editar anuncio"
                       data-id="${pd?.prod__id}" data-est="${pd?.prodetdo}"><i class="fa fa-edit"></i></a>

                    <g:if test="${pd?.anunetdo != 'A'}">
                        <a href="#" class="btn btn-xs btn-rojo btnBorrar" title="Borrar anuncio"
                           data-id="${pd?.prod__id}" data-titulo="${pd?.prodtitl}"><i class="fa fa-trash"></i></a>
                    </g:if>
                    <g:if test="${pd?.anunactv == 'S'}">
                        <a href="#" class="btn btn-xs btn-rojo btnQuitarAnuncio" title="Quitar anuncio"
                           data-id="${pd?.prod__id}" data-titulo="${pd?.prodtitl}"><i
                                class="fas fa-skull-crossbones"></i></a>
                    </g:if>
                </td>
                <td style="width: 12%; text-align: center">
                    <g:if test="${pd?.anunetdo == 'R'}">
                        <a href="#" class="btn btn-xs btn-rojo btnPublicar" title="Publicar anuncio"
                           data-id="${pd?.prod__id}" data-anun="${pd?.anun__id}">
                            <i class="fab fa-product-hunt"></i> Publicar/Pagar</a>
                    </g:if>
                    <g:if test="${pd?.anunetdo == 'A' && pd?.anunnuvo == 'N'}">
                        <a href="#" class="btn btn-xs btn-gris btnRePublicar" title="Programar siguiente publicación"
                           data-id="${pd?.prod__id}" data-anun="${pd?.anun__id}"><i class="fa fa-sync"></i> Reprogramar</a>
                    </g:if>
                </td>


                %{--                <td style="width: 8%; text-align: center">--}%
                %{--                    <g:if test="${producto?.id}">--}%
                %{--                        <a href="#" class="btn btn-xs btn-rojo btnPagoPublicacion" title="Destacar Anuncio"--}%
                %{--                           data-id="${producto?.id}"><i class="fa fa-dollar-sign"></i> Destacar</a>--}%
                %{--                    </g:if>--}%
                %{--                </td>--}%
            </tr>
        </g:each>
        </tbody>
    </table>
</div>


<script type="text/javascript">

    $(".btnInfo").click(function () {
        var id = $(this).data("id");
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'producto', action:'info_ajax')}",
            data    : {
                id: id,
                persona: '${persona?.id}'
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : "Información del Anuncio",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").not(".datepicker").first().focus()
                }, 500);
            } //success
        }); //ajax

    });

    $(".btnReporteExcel").click(function () {
        openLoader("Cargando...");
        location.href = "${g.createLink(controller: 'pdf', action: 'reportePruebaExcel')}";
        closeLoader();
    });

    $(".btnReporte").click(function () {
        openLoader("Cargando...");
        location.href = "${g.createLink(controller: 'pdf', action: 'reportePrueba')}";
        closeLoader();
    });

    function publicarGratis(id){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'alerta', action: 'generarAlerta2_ajax')}',
            data:{
                id: id
            },
            success: function (msg) {
                if(msg == 'ok'){

                    bootbox.dialog({
                        title   : "Confirmación",
                        message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i><p style='font-size: 14px; font-weight: bold'>&nbsp; Su producto será revisado y publicado en las próximas 24 horas</p>",
                        buttons : {
                            aceptar : {
                                label     : "<i class='fa fa-check'></i> Aceptar",
                                className : "btn-gris",
                                callback  : function () {
                                    location.href="${createLink(controller: 'producto', action: 'list')}?id=" + '${persona?.id}'
                                }
                            }
                        }
                    });
                }else{
                    bootbox.alert("<i class='fa fa-times fa-3x pull-left text-danger text-shadow'></i><p style='font-size: 14px; font-weight: bold'>&nbsp; Error al publicar el producto</p>")
                }
            }
        });
    }

    /*
        $(".btnPublicar").click(function () {
            var id = $(this).data("id");
            bootbox.dialog({
                title   : "Alerta",
                message : "<i class='fa fa-clipboard-check fa-3x pull-left text-warning text-shadow caja50'></i> " +
                    "<p style='font-size: 14px; font-weight: bold'>&nbsp; * El producto será publicado con la " +
                    "información guardada hasta el momento.</p><p style='font-size: 14px'>&nbsp; * El producto será publicado durante el período de <strong>una semana</strong> a partir de su aprobación</p>",
                buttons : {
                    cancelar : {
                        label     : "<i class='fa fa-times'></i> Cancelar",
                        className : "btn-gris",
                        callback  : function () {
                        }
                    },
                    publicar : {
                        label     : "<i class='fa fa-check'></i> Publicar",
                        className : "btn-rojo",
                        callback  : function () {
                            publicarGratis(id);
                        }
                    }
                }
            });
        });
    */

    $(".btnPublicar").click(function () {
        var id = $(this).data("id");
        var anun = $(this).data("anun");
        console.log('pago');
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'pago', action:'form_ajax')}",
            data    : {
                anun: anun,
                id: id ? id : ''
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : "Pagar el Anuncio",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                        /*
                                                ,
                                                guardar  : {
                                                    id        : "btnSave",
                                                    label     : "<i class='fa fa-save'></i> Guardar",
                                                    className : "btn-rojo",
                                                    callback  : function () {
                                                        return submitForm();
                                                    } //callback
                                                } //guardar
                        */
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").not(".datepicker").first().focus()
                }, 500);
            } //success
        }); //ajax
    }) //createEdit

    $(".btnRePublicar").click(function () {
        var id = $(this).data("id");
        var anun = $(this).data("anun");
        console.log('pago');
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'pago', action:'republicar_ajax')}",
            data    : {
                anun: anun,
                id: id ? id : ''
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : "Volver a Publicar el Anuncio",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                        /*
                                                ,
                                                guardar  : {
                                                    id        : "btnSave",
                                                    label     : "<i class='fa fa-save'></i> Guardar",
                                                    className : "btn-rojo",
                                                    callback  : function () {
                                                        return submitForm();
                                                    } //callback
                                                } //guardar
                        */
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").not(".datepicker").first().focus()
                }, 500);
            } //success
        }); //ajax
    }) //createEdit


    $(".btnPagoPublicacion").click(function (){
        var id = $(this).data("id");
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'pago', action:'form_ajax')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgPagarPub",
                    title   : "Pagar publicación",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").not(".datepicker").first().focus()
                }, 500);
            } //success
        }); //ajax
    });

    $(".btnRevisar").click(function (){
        var id = $(this).data("id");
        %{--location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + '${persona?.id}' + "&tipo=" + 2;--}%
        visualizar(id);
    });

    function visualizar(id){
        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&tipo=" + 2;
    };

    $(".btnEditar").click(function () {
        var id = $(this).data("id");
        var estado = $(this).data("est");
        var mensaje = "";
        console.log('..1', estado);
        if(estado == 'R' || estado == 'A'){
            if(estado == 'A') {
                mensaje = "ya está Publicado";
                tipo = '1';
            } else {
                mensaje = "está en Revisión para publicarse";
                tipo = '2';
            }
            bootbox.dialog({
                title   : "Confirmación de Edición del Anuncio",
                message : "<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow caja50'></i> " +
                    // "style='width: 80px; height: 50px; display: block'></i>" +
                    "<p style='font-size: 14px;'>" + "El producto que desea editar <strong>" + mensaje + "</strong>" +
                    "<br>Si hace cambios en el anuncio debe <strong>volver a publicarlo</strong>." + "<br>¿Desea continuar la edición?</p>",
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
                            location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&tipo=" + tipo
                        }
                    }
                }
            });
        }else{
            location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&tipo=" + 2
        }

    });

    $(".btnImagenes").click(function () {
        var id = $(this).data("id");
        cargarImagenes(id)
    });

    $(".btnBorrar").click(function () {
        var id = $(this).data("id");
        var prod = $(this).data("titulo");
        // console.log('prod', prod, 'id', id)
        deleteRow(id, prod)
    });

    $(".btnQuitarAnuncio").click(function () {
        var id = $(this).data("id");
        var prod = $(this).data("titulo");
        // console.log('prod', prod, 'id', id)
        quitarAnuncio(id, prod)
    });

    var id = null;
    function submitForm() {
        var $form = $("#frmProducto");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveProducto')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Producto guardado correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar el producto","error");
                    }
                }
            });
        } else {
            return false;
        } //else
    }

    function deleteRow(itemId, prod) {
        bootbox.dialog({
            title   : 'Eliminar el Anunicio: "' + prod + '"',
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow caja50'></i>" +
                "<p class='aviso'>¿Está seguro que desea eliminar: <strong>" + (prod ? prod : 'este producto ') + "</strong>?<br>" +
                "Se eliminarán todos los datos del este anuncio incluyendo todas las imágenes.<br>" +
                "<strong>Esta acción no se puede deshacer</strong>.</p>",
            buttons : {
                cancelar : {
                    label     : "Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                eliminar : {
                    label     : "<i class='fa fa-trash'></i> Eliminar",
                    className : "btn-danger",
                    callback  : function () {
                        var l1 = cargarLoader("Eliminando");
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(action:'delete_ajax')}',
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                l1.modal("hide");
                                if (msg == "ok") {
                                    log("Producto borrado correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                } else {
                                    log("Error al borrar el producto","error");
                                }
                            }
                        });
                    }
                }
            }
        });
    }

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
                            url     : '${createLink(action:'quitarAnuncio_ajax')}',
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                l1.modal("hide");
                                console.log('msg', msg)
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

    /*
        function rePublicar(itemId, prod) {
            bootbox.dialog({
                title   : 'Volver a Publicar: "' + prod + '"',
                message : "<i class='fas fa-eye pull-left text-danger text-shadow caja50'></i>" +
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
                        label     : "<i class='fa fa-check'></i> Publicar",
                        className : "btn-danger",
                        callback  : function () {
                            var l1 = cargarLoader("Eliminando");
                            $.ajax({
                                type    : "POST",
%{--url     : '${createLink(action:'quitarAnuncio_ajax')}',--}%
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                l1.modal("hide");
                                console.log('msg', msg)
                                if (msg == "ok") {
                                    log("Anuncio vuelto a publicar correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                } else {
                                    log("Error al volver a publicar el Anuncio","error");
                                }
                            }
                        });
                    }
                }
            }
        });
    }
*/

    function createEditRow(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'producto', action:'form_ajax')}",
            data    : {
                persona: '${persona?.id}',
                id: id ? id : ''
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Producto",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        guardar  : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-save'></i> Guardar",
                            className : "btn-rojo",
                            callback  : function () {
                                return submitForm();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").not(".datepicker").first().focus()
                }, 500);
            } //success
        }); //ajax
    } //createEdit

    function cargarImagenes(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'producto', action:'imagenes_ajax')}",
            data    : {
                id:id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgImas",
                    title   : "Imágenes",
                    class : "modal-lg",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i>  Salir",
                            className : "btn-gris",
                            callback  : function () {
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    $(function () {

        $(".btnCrear").click(function() {
            createEditRow();
            return false;
        });

        %{--$("tbody tr").contextMenu({--}%
        %{--    items  : {--}%
        %{--        header   : {--}%
        %{--            label  : "Acciones",--}%
        %{--            header : true--}%
        %{--        },--}%
        %{--        ver      : {--}%
        %{--            label  : "Ver",--}%
        %{--            icon   : "fa fa-search",--}%
        %{--            action : function ($element) {--}%
        %{--                var id = $element.data("id");--}%
        %{--                location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + '${persona?.id}' + "&tipo=" + 2;--}%
        %{--            }--}%
        %{--        },--}%
        %{--        editar   : {--}%
        %{--            label  : "Editar",--}%
        %{--            icon   : "fa fa-edit",--}%
        %{--            action : function ($element) {--}%
        %{--                var id = $element.data("id");--}%
        %{--                location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&persona=" + '${persona?.id}'--}%
        %{--            }--}%
        %{--        },--}%
        %{--        imas : {--}%
        %{--            label            : "Imágenes",--}%
        %{--            icon             : "fa fa-image",--}%
        %{--            separator_before : true,--}%
        %{--            action           : function ($element) {--}%
        %{--                var id = $element.data("id");--}%
        %{--                cargarImagenes(id)--}%
        %{--            }--}%
        %{--        },--}%
        %{--        eliminar : {--}%
        %{--            label            : "Eliminar",--}%
        %{--            icon             : "fa fa-trash",--}%
        %{--            separator_before : true,--}%
        %{--            action           : function ($element) {--}%
        %{--                var id = $element.data("id");--}%
        %{--                deleteRow(id);--}%
        %{--            }--}%
        %{--        }--}%
        %{--    },--}%
        %{--    onShow : function ($element) {--}%
        %{--        $element.addClass("trHighlight");--}%
        %{--    },--}%
        %{--    onHide : function ($element) {--}%
        %{--        $(".trHighlight").removeClass("trHighlight");--}%
        %{--    }--}%
        %{--});--}%


        function createContextMenu(node) {
            var $tr = $(node);
            //
            var items = {
                header : {
                    label  : "Acciones",
                    header : true
                }
            };
            %{--//--}%
            %{--    var id = $tr.data("id");--}%
            %{--    var alerta = $tr.hasClass("tieneAlerta");--}%
            %{--//--}%
            var editar = {
                label           : 'Use los botones para ejecutar una acción sobre su producto!',
                icon            : "fa fa-info",
                // separator_after : true,
                // separator_before : true,
                action          : function (e) {
                    // var id = $tr.data("id");
                    %{--location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&persona=" + '${persona?.id}'--}%
                }
            };

            %{--    var revisar = {--}%
            %{--        label           : 'Visualizar el anuncio',--}%
            %{--        icon            : "fa fa-image",--}%
            %{--        separator_after : true,--}%
            %{--        action          : function (e){--}%
            %{--            var id = $tr.data("id");--}%
            %{--            visualizar(id)--}%
            %{--        }--}%
            %{--    };--}%
            %{--//--}%
            %{--    var eliminar = {--}%
            %{--        label            : 'Eliminar',--}%
            %{--        icon             : "fa fa-trash text-warning",--}%
            %{--        action           : function (e) {--}%
            %{--            var id = $tr.data("id");--}%
            %{--            deleteRow(id);--}%
            %{--        }--}%
            %{--    };--}%
            %{--//--}%
            items.editar = editar;
            %{--    items.imas = revisar;--}%
            %{--//--}%
            %{--    if (!alerta) {--}%
            %{--        items.eliminar = eliminar;--}%
            %{--    }--}%
            //
            return items;
        }
        //
        $("tr").contextMenu({
            items  : createContextMenu,
            onShow : function ($element) {
                $element.addClass("trHighlight");
            },
            onHide : function ($element) {
                $(".trHighlight").removeClass("trHighlight");
            }
        });



    });
</script>

</body>
</html>
