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
        <g:link controller="principal" action="index" class="btn btn-gris" title="Volver a página principal">
            <i class="fa fa-arrow-left"></i> Volver
        </g:link>
        <a href="${createLink(controller: 'producto', action: 'wizardProducto', params: [persona: persona?.id])}"
           class="btn btn-rojo" title="Crear un nuevo Anuncio"><i class="fa fa-file"></i> Nuevo Anuncio
        </a>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 25%">Anuncio</th>
        <th style="width: 15%">Categoria</th>
        <th style="width: 20%">Subcategoria</th>
        <th style="width: 10%">Fecha creación</th>
        <th style="width: 7%">Estado</th>
        <th style="width: 13%">Acciones</th>
        <th style="width: 10%">Pagos</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${productos}" var="producto">
            <tr data-id="${producto?.id}" class="${ventas.Alerta.findAllByProducto(producto) ? 'tieneAlerta' : 'no'}" style="width: 100%">
                <td style="width: 25%">${producto?.titulo}</td>
                <td style="width: 15%">${producto?.subcategoria?.categoria?.descripcion}</td>
                <td style="width: 20%">${producto?.subcategoria?.descripcion}</td>
                <td style="width: 10%; text-align: center">${producto?.fecha?.format("dd-MMM-yyyy")}</td>
                <td style="width: 7%; text-align: center">${producto?.estado == 'A' ? 'Activo' : (producto?.estado == 'R' ? 'En Revisión' : ( producto?.estado == 'N' ? 'Negado' : 'Inactivo'))}</td>
                <td style="width: 13%; text-align: center">
                    <a href="#" class="btn btn-xs btn-gris btnRevisar" title="Revisar producto"
                       data-id="${producto?.id}" data-per="${producto.persona.id}"><i class="fa fa-search"></i></a>
                    <a href="#" class="btn btn-xs btn-rojo btnEditar" title="Editar producto"
                       data-id="${producto?.id}"><i class="fa fa-edit"></i></a>
                    <a href="#" class="btn btn-xs btn-gris btnImagenes" title="Imágenes del producto"
                       data-id="${producto?.id}"><i class="fa fa-image"></i></a>
                    <g:if test="${producto?.id}">
                        <g:if test="${!ventas.Alerta.findAllByProducto(producto)}">
                            <a href="#" class="btn btn-xs btn-rojo btnBorrar" title="Borrar producto" data-id="${producto?.id}"><i class="fa fa-trash"></i> </a>
                        </g:if>
                    </g:if>
                </td>
                <td style="width: 10%; text-align: center">
                    <g:if test="${producto?.id}">
                        <a href="#" class="btn btn-xs btn-rojo btnPagoPublicacion" title="Destacar Anuncio"
                           data-id="${producto?.id}"><i class="fa fa-dollar-sign"></i> Destacar</a>
%{--                        <a href="#" class="btn btn-xs btn-rojo btnPagoDestacado" title="Pago destacado" data-id="${producto?.id}"><i class="fa fa-dollar-sign"></i> </a>--}%
                    </g:if>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>


<script type="text/javascript">

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
        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + '${persona?.id}' + "&tipo=" + 2;
    });

    $(".btnEditar").click(function () {
        var id = $(this).data("id");
        location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&persona=" + '${persona?.id}'
    });

    $(".btnImagenes").click(function () {
        var id = $(this).data("id");
        cargarImagenes(id)
    });

    $(".btnBorrar").click(function () {
        var id = $(this).data("id");
        deleteRow(id)
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

            var items = {
                header : {
                    label  : "Acciones",
                    header : true
                }
            };

            var id = $tr.data("id");
            var alerta = $tr.hasClass("tieneAlerta");

            var ver = {
                label  : 'Ver',
                icon   : "fa fa-search",
                action : function () {
                    var id = $tr.data("id");
                    location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + '${persona?.id}' + "&tipo=" + 2;
                }
            };

            var editar = {
                label           : 'Editar',
                icon            : "fa fa-pen",
                separator_after : true,
                action          : function (e) {
                    var id = $tr.data("id");
                    location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + id + "&persona=" + '${persona?.id}'
                }
            };

            var imas = {
                label           : 'Imágenes',
                icon            : "fa fa-image",
                separator_after : true,
                action          : function (e){
                    var id = $tr.data("id");
                    cargarImagenes(id)
                }
            };

            var eliminar = {
                label            : 'Eliminar',
                icon             : "fa fa-trash text-warning",
                action           : function (e) {
                    var id = $tr.data("id");
                    deleteRow(id);
                }
            };

            items.ver = ver;
            items.editar = editar;
            items.imas = imas;

            if (!alerta) {
                items.eliminar = eliminar;
            }

            return items;
        }

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
