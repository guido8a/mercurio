<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 06/04/21
  Time: 10:40
--%>


<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de links</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>


<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <a href="#"
           class="btn btn-info btnNuevo" title="Crear un nuevo link"><i class="fa fa-file"></i> Nuevo Link
        </a>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 20%">Título</th>
        <th style="width: 24%">URL</th>
        <th style="width: 28%">Texto</th>
        <th style="width: 8%">Orden</th>
        <th style="width: 8%">Estado</th>
        <th style="width: 12%">Acciones</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${links}" var="link">
            <tr data-id="${link?.id}" style="width: 100%">
                <td style="width: 20%">${link?.titulo}</td>
                <td style="width: 24%; text-align: left">${link?.link}</td>
                <td style="width: 28%; text-align: center">${link?.texto}</td>
                <td style="width: 8%; text-align: center">${link?.orden}</td>
                <td style="width: 8%; text-align: center">${link?.activo == 'A' ? 'Activo' : 'Inactivo'}</td>
                <td style="width: 12%; text-align: center">
%{--                    <a href="#" class="btn btn-xs btn-info btnVer" title="Ver información" data-id="${link?.id}"><i class="fa fa-search"></i> </a>--}%
                    <a href="#" class="btn btn-xs btn-success btnEditar" title="Editar link" data-id="${link?.id}"><i class="fa fa-edit"></i> </a>
                    <a href="#" class="btn btn-xs btn-warning btnLogo" title="Logo" data-id="${link?.id}"><i class="fa fa-image"></i> </a>
                    <a href="#" class="btn btn-xs btn-danger btnBorrar" title="Borrar link" data-id="${link?.id}"><i class="fa fa-trash"></i> </a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>


<script type="text/javascript">

    $(".btnNuevo").click(function () {
       createEditRow();
    });

    $(".btnLogo").click(function (){
        var id = $(this).data("id");
        cargarImagenes(id)
    });

    $(".btnEditar").click(function () {
        var id = $(this).data("id");
       createEditRow(id)
    });

    $(".btnBorrar").click(function () {
        var id = $(this).data("id");
        deleteRow(id)
    });


    var id = null;
    function submitForm() {
        var $form = $("#frmLink");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveLink_ajax')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Link guardado correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar el link","error");
                    }
                }
            });
        } else {
            return false;
        } //else
    }
    function deleteRow(itemId) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea eliminar el link seleccionado? Esta acción no se puede deshacer.</p>",
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
                            url     : '${createLink(action:'deleteLink_ajax')}',
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
    function createEditRow(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'link', action:'form_ajax')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Link",
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
                            className : "btn-success",
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
            url     : "${createLink(controller: 'link', action:'logo_ajax')}",
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
                            label     : "Cancelar",
                            className : "btn-primary",
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

        %{--function createContextMenu(node) {--}%
        %{--    var $tr = $(node);--}%

        %{--    var items = {--}%
        %{--        header : {--}%
        %{--            label  : "Acciones",--}%
        %{--            header : true--}%
        %{--        }--}%
        %{--    };--}%

        %{--    var id = $tr.data("id");--}%
        %{--    var alerta = $tr.hasClass("tieneAlerta");--}%

        %{--    var ver = {--}%
        %{--        label  : 'Ver',--}%
        %{--        icon   : "fa fa-search",--}%
        %{--        action : function () {--}%
        %{--            var id = $tr.data("id");--}%
        %{--            location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + '${persona?.id}' + "&tipo=" + 2;--}%
        %{--        }--}%
        %{--    };--}%

        %{--    var editar = {--}%
        %{--        label           : 'Editar',--}%
        %{--        icon            : "fa fa-pen text-success",--}%
        %{--        separator_after : true,--}%
        %{--        action          : function (e) {--}%
        %{--            var id = $tr.data("id");--}%
        %{--            location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&persona=" + '${persona?.id}'--}%
        %{--        }--}%
        %{--    };--}%

        %{--    var imas = {--}%
        %{--        label           : 'Imágenes',--}%
        %{--        icon            : "fa fa-image text-info",--}%
        %{--        separator_after : true,--}%
        %{--        action          : function (e){--}%
        %{--            var id = $tr.data("id");--}%
        %{--            cargarImagenes(id)--}%
        %{--        }--}%
        %{--    };--}%

        %{--    var eliminar = {--}%
        %{--        label            : 'Eliminar',--}%
        %{--        icon             : "fa fa-trash text-danger",--}%
        %{--        action           : function (e) {--}%
        %{--            var id = $tr.data("id");--}%
        %{--            deleteRow(id);--}%
        %{--        }--}%
        %{--    };--}%

        %{--    items.ver = ver;--}%
        %{--    items.editar = editar;--}%
        %{--    items.imas = imas--}%

        %{--    if (!alerta) {--}%
        %{--        items.eliminar = eliminar;--}%
        %{--    }--}%

        %{--    return items;--}%
        %{--}--}%

        %{--$("tr").contextMenu({--}%
        %{--    items  : createContextMenu,--}%
        %{--    onShow : function ($element) {--}%
        %{--        $element.addClass("trHighlight");--}%
        %{--    },--}%
        %{--    onHide : function ($element) {--}%
        %{--        $(".trHighlight").removeClass("trHighlight");--}%
        %{--    }--}%
        %{--});--}%

    });
</script>

</body>
</html>
