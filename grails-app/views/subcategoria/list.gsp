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
    <title>Subcategorías</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="categoria" action="list" class="btn btn-primary btnVolver">
            <i class="fa fa-arrow-left"></i> Volver
        </g:link>
        <g:link action="form" class="btn btn-info btnCrear">
            <i class="fa fa-file"></i> Nueva subcategoría
        </g:link>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 30%">Categoría</th>
        <th style="width: 10%">Orden</th>
        <th style="width: 60%">Descripción</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${subcategorias}" var="subcategoria">
            <tr data-id="${subcategoria?.id}" style="width: 100%">
                <td style="width: 30%">${subcategoria?.categoria?.descripcion}</td>
                <td style="width: 10%">${subcategoria?.orden}</td>
                <td style="width: 90%">${subcategoria?.descripcion}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    var id = null;
    function submitForm() {
        var $form = $("#frmSubcategoria");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveSubcategoria')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Subcategoría guardada correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar la subcategoría","error");
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
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea eliminar la subcategoría seleccionada? Esta acción no se puede deshacer.</p>",
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
                                    log("Subcategoría borrada correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                } else {
                                    log("Error al borrar la subcategoría","error");
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
            url     : "${createLink(controller: 'subcategoria', action:'form_ajax')}",
            data    : {
                id:  id ? id : null,
                categoria: '${categoria?.id}'
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Subcategoría",
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
