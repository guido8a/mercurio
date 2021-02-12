<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 10:00
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Categorías</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
%{--        <g:link controller="subcategoria" action="list" class="btn btn-primary">--}%
%{--            <i class="fa fa-file"></i> Subcategorías--}%
%{--        </g:link>--}%
        <g:link action="form" class="btn btn-info btnCrear">
            <i class="fa fa-file"></i> Nueva categoría
        </g:link>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 10%">Orden</th>
        <th style="width: 90%">Descripción</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${categorias}" var="categoria">
            <tr data-id="${categoria?.id}" style="width: 100%">
                <td style="width: 10%">${categoria?.orden}</td>
                <td style="width: 90%">${categoria?.descripcion}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    var id = null;
    function submitForm() {
        var $form = $("#frmCategoria");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveCategoria')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Categoría guardada correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar la categoría","error");
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
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea eliminar la categoría seleccionada? Esta acción no se puede deshacer.</p>",
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
                                    log("Categoría borrada correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                } else {
                                    log("Error al borrar la categoría","error");
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
            url     : "${createLink(controller: 'categoria', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Categoría",
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

    $(function () {

        $(".btnCrear").click(function() {
            createEditRow();
            return false;
        });

        $("tbody tr").contextMenu({
            items  : {
                header   : {
                    label  : "Acciones",
                    header : true
                },
                editar   : {
                    label  : "Editar",
                    icon   : "fa fa-edit",
                    action : function ($element) {
                        var id = $element.data("id");
                        createEditRow(id);
                    }
                },
                sub : {
                    label            : "Subcategoría",
                    icon             : "fa fa-file",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        location.href="${createLink(controller: 'subcategoria', action: 'list')}?id=" + id
                    }
                },
                eliminar : {
                    label            : "Eliminar",
                    icon             : "fa fa-trash",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        deleteRow(id);
                    }
                }
            },
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
