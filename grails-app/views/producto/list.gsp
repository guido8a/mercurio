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
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<h3 style="text-align: center">Administración de Anuncios de ${persona?.nombre} ${persona?.apellido}</h3>
<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="principal" action="index" class="btn btn-primary btnVolver" title="Volver a página principal">
            <i class="fa fa-arrow-left"></i> Volver
        </g:link>
        <a href="${createLink(controller: 'producto', action: 'wizardProducto', params: [persona: persona?.id])}"
           class="btn btn-info" title="Crear un nuevo Anuncio"><i class="fa fa-file"></i> Nuevo Anuncio
        </a>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 20%">Anuncio</th>
        <th style="width: 25%">Descripción resuminda</th>
        <th style="width: 15%">Categoria</th>
        <th style="width: 20%">Subcategoria</th>
        <th style="width: 10%">Fecha creación</th>
        <th style="width: 10%">Estado</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${productos}" var="producto">
            <tr data-id="${producto?.id}" style="width: 100%">
                <td style="width: 20%">${producto?.titulo}</td>
                <td style="width: 25%;">${producto?.subtitulo}</td>
                <td style="width: 15%; text-align: center">${producto?.subcategoria?.categoria?.descripcion}</td>
                <td style="width: 20%; text-align: center">${producto?.subcategoria?.descripcion}</td>
                <td style="width: 10%; text-align: center">${producto?.fecha?.format("dd-MM-yyyy")}</td>
                <td style="width: 10%; text-align: center">${producto?.estado == 'A' ? 'Activo' : (producto?.estado == 'R' ? 'En Revisión' : ( producto?.estado == 'N' ? 'Negado' : 'Inactivo'))}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>


<script type="text/javascript">
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
    function deleteRow(itemId) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea eliminar el producto seleccionado? Esta acción no se puede deshacer.</p>",
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

        $("tbody tr").contextMenu({
            items  : {
                header   : {
                    label  : "Acciones",
                    header : true
                },
                ver      : {
                    label  : "Ver",
                    icon   : "fa fa-search",
                    action : function ($element) {
                        var id = $element.data("id");
                        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + '${persona?.id}' + "&tipo=" + 2;
                    }
                },
                editar   : {
                    label  : "Editar",
                    icon   : "fa fa-edit",
                    action : function ($element) {
                        var id = $element.data("id");
                        // createEditRow(id);
                        location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&persona=" + '${persona?.id}'
                    }
                },
                imas : {
                    label            : "Imágenes",
                    icon             : "fa fa-image",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        cargarImagenes(id)
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
