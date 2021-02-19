<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 11:12
--%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de anuncios del promotor: ${promotor?.nombre + (promotor?.apellido ? (' ' +  promotor?.apellido) : '')}</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="promotor" action="list" class="btn btn-primary btnVolver">
            <i class="fa fa-arrow-left"></i> Volver
        </g:link>
        <g:link action="form" class="btn btn-info btnCrear">
            <i class="fa fa-file"></i> Nuevo anuncio
        </g:link>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 70%" colspan="4">Anuncio</th>
        <th style="width: 30%" colspan="3">Publicación</th>
    </tr>
    <tr style="width: 100%">
        <th style="width: 20%">Categoría</th>
        <th style="width: 20%">Nombre</th>
        <th style="width: 20%">Descripción</th>
        <th style="width: 10%">Estado</th>
        <th style="width: 10%">Fecha Inicio</th>
        <th style="width: 10%">Fecha Fin</th>
        <th style="width: 10%">Destacado</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${anuncios}" var="anuncio">
            <tr data-id="${promotor?.id}" style="width: 100%">
                <td style="width: 20%; text-align: center">${anuncio?.subcategoria?.categoria?.descripcion}</td>
                <td style="width: 20%">${anuncio?.nombre}</td>
                <td style="width: 20%">${anuncio?.descripcion}</td>
                <td style="width: 10%; text-align: center; background-color:  ${anuncio?.estado == '1' ? '#67a153' : '#EC5415'}">${anuncio?.estado == '1' ? 'ACTIVO' : 'INACTIVO'}</td>
                <td style="width: 10%; text-align: center">${ventas.Publicacion.findByAnuncio(anuncio)?.fechaInicio?.format("dd-MM-yyyy")}</td>
                <td style="width: 10%; text-align: center">${ventas.Publicacion.findByAnuncio(anuncio)?.fechaFin?.format("dd-MM-yyyy")}</td>
                <td style="width: 10%; text-align: center; background-color: ${ventas.Publicacion.findByAnuncio(anuncio)?.destacado == '1' ? '#67a153' : '#cba51d'}">${ventas.Publicacion.findByAnuncio(anuncio)?.destacado == '1' ? 'SI' : 'NO'}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    var id = null;
    function submitForm() {
        var $form = $("#frmAnuncio");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveAnuncio')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Anuncio guardado correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar el anuncio","error");
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
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea eliminar el anuncio seleccionado? Esta acción no se puede deshacer.</p>",
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
                                    log("Anuncio borrado correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                } else {
                                    log("Error al borrar el anuncio","error");
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
        // var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'anuncio', action:'form_ajax')}",
            data    : {
                id: id ?  id : null,
                promotor: '${promotor?.id}'
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEdit",
                    title   : title + " Anuncio",
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

    function fijarPublicacion(id) {
        var title = id ? "Editar" : "Crear";
        // var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'publicacion', action:'form_ajax')}",
            data    : {
                id: id ?  id : null
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEditP",
                    title   : title + " Publicación",
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
    } //createEdit

    function submitFormPublicacion() {
        var $form = $("#frmPublicacion");
        var $btn = $("#dlgCreateEditP").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(controller: 'publicacion', action:'savePublicacion')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Publicación guardada correctamente","success");
                        setTimeout(function () {
                            location.reload(true);
                        }, 1000);
                    } else {
                        log("Error al guardar la Publicación","error");
                    }
                }
            });
        } else {
            return false;
        } //else
    }

    function cargarImagenes(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'anuncio', action:'imagen_ajax')}",
            data    : {
                id:id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgImas",
                    title   : "Imágenes",
                    // class : "modal-lg",
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
                editar   : {
                    label  : "Editar",
                    icon   : "fa fa-edit",
                    action : function ($element) {
                        var id = $element.data("id");
                        createEditRow(id);
                    }
                },
                producto : {
                    label            : "Producto",
                    icon             : "fa fa-briefcase",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        location.href="${createLink(controller: 'producto', action: 'list')}?id=" + id
                    }
                },
                publicacion : {
                    label            : "Publicación",
                    icon             : "fa fa-user-clock",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        fijarPublicacion(id);
                    }
                },
                imagen : {
                    label            : "Imagen",
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
