<%@ page import="ventas.Subcategoria" %>
<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 01/03/21
  Time: 11:58
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<!DOCTYPE html>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Producto del usuario: ${persona?.tipoPersona == 'N' ?  (persona?.nombre + " " + persona?.apellido) :  persona?.nombre}</title>

    <style>

    .lineaAt {
        height: 1px;
        background-color: #5596ff;
    }
    </style>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="producto" action="list" id="${persona?.id}" class="btn btn-primary btnVolver">
            <i class="fa fa-arrow-left"></i> Volver
        </g:link>
        <a href="#" class="btn btn-success" id="btnGuardarProducto" title="Guardar cambios en producto"><i class="fa fa-save"></i> Guardar </a>
        <g:if test="${producto?.id}">
            <a href="#" class="btn btn-warning" id="btnImasProducto" title="Imágenes asociadas al producto"><i class="fa fa-images"></i> Imágenes </a>
        </g:if>
    </div>
</div>

<div class="col-md-12">
    <g:if test="${producto?.id}">
        <h2 style="margin-top: 10px; text-align: center">Producto del usuario:<p style="color: #ff8f5b"> ${persona?.tipoPersona == 'N' ?  (persona?.nombre + " " + persona?.apellido) :  persona?.nombre} </p></h2>
    </g:if>
    <g:else>
        <h2 style="margin-top: 10px; text-align: center">Nuevo Producto del usuario: <p style="color: #ff8f5b"> ${persona?.tipoPersona == 'N' ?  (persona?.nombre + " " + persona?.apellido) :  persona?.nombre}</p></h2>
    </g:else>
</div>

<g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
        <span class="grupo">
            <label for="categoria" class="col-md-2 control-label text-info">
                Categoría
            </label>
            <div class="col-md-4">
                <g:select name="categoria" from="${ventas.Categoria.list().sort{it.descripcion}}" class="form-control" optionKey="id" optionValue="descripcion" value="${producto?.subcategoria?.categoria?.id}"/>
            </div>

            <g:if test="${producto?.id}">
                <label class="col-md-1 control-label text-info">
                    Estado
                </label>

                <div class="col-md-4">
                    <span class="badge bg-warning" style="font-size: x-large; background-color:  ${producto?.estado == 'A' ? '#78B665' : (producto?.estado == 'R' ? '#cba51d' : '#C42623')} ">${producto?.estado == 'A' ? 'Activo' : (producto?.estado == 'R' ? 'En Revisión' : 'Inactivo')}</span>
                </div>
            </g:if>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Subcategoría
            </label>
            <div class="col-md-4" id="divSubcategoria">
            </div>
        </span>
    </div>

    <div style="margin-top: 20px; margin-bottom: 20px"></div>

    <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')}">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Título
            </label>
            <div class="col-md-8">
                <g:textField name="titulo" maxlength="255" class="form-control" value="${producto?.titulo}"/>
            </div>
        </span>
    </div>

    <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
                Subtítulo
            </label>
            <div class="col-md-8">
                <g:textField name="subtitulo" maxlength="255" class="form-control" value="${producto?.subtitulo}"/>
            </div>
        </span>
    </div>

    <div style="margin-top: 20px; margin-bottom: 20px"></div>

    <label class="col-md-2 control-label text-info">
        Texto adicional
    </label>

    <div class="form-group ${hasErrors(bean: 'producto', field: 'texto', 'error')}" style="margin-left: 195px">
        <div class="card">
            <textarea id="texto" class="editor" rows="100" cols="80" >${producto?.texto}</textarea>
        </div>
    </div>

    <g:if test="${producto?.id}">

        <div style="margin-top: 20px; margin-bottom: 20px"></div>

        <label class="col-md-2 control-label text-info">
            Atributos
        </label>

        <div class="col-md-4">
            <g:select name="atributo" from="${ventas.AtributoCategoria.findAllBySubcategoria(ventas.Subcategoria.get(producto?.subcategoria?.id)).sort{it.atributo.descripcion}}" class="form-control" optionKey="id" optionValue="atributo.descripcion"/>
        </div>

        <label class="col-md-1 control-label text-info">
            Valor
        </label>

        <div class="col-md-2">
            <g:textField name="valor" maxlength="63" class="form-control" value="${producto?.subtitulo}"/>
        </div>

        <div class="col-md-1">
            <a href="#" class="btn btn-success" id="btnAgregarAt" title="Agregar atributo adicional"><i class="fa fa-plus"></i></a>
        </div>


        <div style="margin-top: 20px; margin-bottom: 20px"></div>



        <div class="col-md-8" id="tablaAtributos" style="margin-top: 30px; margin-left: 180px; text-align: center; width: 70%;">

        </div>

    </g:if>

</g:form>

<script type="text/javascript">

    cargarAtributos();

    function cargarAtributos(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'tablaAtributos_ajax')}',
            data:{
                id: $("#id").val()
            },
            success: function (msg) {
                $("#tablaAtributos").html(msg)
            }
        });
    }

    $("#btnImasProducto").click(function () {
       cargarImagenes($("#id").val())
    });

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

    $("#btnGuardarProducto").click(function () {
        submitFormProducto()
    });

    function submitFormProducto() {

        var texto = CKEDITOR.instances.texto.getData();

        var $form = $("#frmProducto");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveProducto')}',
                // data    : $form.serialize(),
                data    : {
                    id: $("#id").val(),
                    persona: $("#persona").val(),
                    subcategoria: $("#subcategoria").val(),
                    titulo: $("#titulo").val(),
                    subtitulo: $("#subtitulo").val(),
                    texto: texto
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        log("Producto guardado correctamente","success");
                        setTimeout(function () {
                            location.href="${createLink(controller: 'producto', action: 'producto')}?id=" + parts[1] + "&persona=" + ${persona?.id};
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

    $(function () {

        CKEDITOR.replace( 'texto', {
            height: "200px",
            width: "750px",
            toolbar                 : [
                ['Font', 'FontSize', 'Scayt', '-', 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'],
                ['Find', 'Replace', '-', 'SelectAll'],
                ['Table', 'HorizontalRule', 'PageBreak'],
                ['-', 'TextColor', 'BGColor', '-', 'About'],
                // '/',
                ['Bold', 'Italic', 'Underline'],
                ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-']
            ]
        });

        CKEDITOR.on('instanceReady', function (ev) {
            // Prevent drag-and-drop.
            ev.editor.document.on('drop', function (ev) {
                ev.data.preventDefault(true);
            });
        });
    });


    $("#categoria").change(function () {
        var id = $(this).val();
        cargarSubcategoria(id)
    });

    cargarSubcategoria($("#categoria").val());

    function cargarSubcategoria(id){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'subcategoria', action: 'subcategoria_ajax')}',
            data:{
                id: id,
                producto: $("#id").val()
            },
            success: function (msg) {
                $("#divSubcategoria").html(msg)
            }
        });
    }

    var id = null;
    %{--function submitForm() {--}%
    %{--    var $form = $("#frmProducto");--}%
    %{--    var $btn = $("#dlgCreateEdit").find("#btnSave");--}%
    %{--    if ($form.valid()) {--}%
    %{--        $btn.replaceWith(spinner);--}%
    %{--        var l = cargarLoader("Grabando...");--}%
    %{--        $.ajax({--}%
    %{--            type    : "POST",--}%
    %{--            url     : '${createLink(action:'saveProducto')}',--}%
    %{--            data    : $form.serialize(),--}%
    %{--            success : function (msg) {--}%
    %{--                l.modal("hide");--}%
    %{--                if (msg == "ok") {--}%
    %{--                    log("Producto guardado correctamente","success");--}%
    %{--                    setTimeout(function () {--}%
    %{--                        location.reload(true);--}%
    %{--                    }, 1000);--}%
    %{--                } else {--}%
    %{--                    log("Error al guardar el producto","error");--}%
    %{--                }--}%
    %{--            }--}%
    %{--        });--}%
    %{--    } else {--}%
    %{--        return false;--}%
    %{--    } //else--}%
    %{--}--}%
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
    %{--function createEditRow(id) {--}%
    %{--    var title = id ? "Editar" : "Crear";--}%
    %{--    var data = id ? { id: id } : {};--}%
    %{--    $.ajax({--}%
    %{--        type    : "POST",--}%
    %{--        url     : "${createLink(controller: 'producto', action:'form_ajax')}",--}%
    %{--        data    : {--}%
    %{--            persona: '${persona?.id}',--}%
    %{--            id: id ? id : ''--}%
    %{--        },--}%
    %{--        success : function (msg) {--}%
    %{--            var b = bootbox.dialog({--}%
    %{--                id      : "dlgCreateEdit",--}%
    %{--                title   : title + " Producto",--}%
    %{--                message : msg,--}%
    %{--                buttons : {--}%
    %{--                    cancelar : {--}%
    %{--                        label     : "Cancelar",--}%
    %{--                        className : "btn-primary",--}%
    %{--                        callback  : function () {--}%
    %{--                        }--}%
    %{--                    },--}%
    %{--                    guardar  : {--}%
    %{--                        id        : "btnSave",--}%
    %{--                        label     : "<i class='fa fa-save'></i> Guardar",--}%
    %{--                        className : "btn-success",--}%
    %{--                        callback  : function () {--}%
    %{--                            return submitForm();--}%
    %{--                        } //callback--}%
    %{--                    } //guardar--}%
    %{--                } //buttons--}%
    %{--            }); //dialog--}%
    %{--            setTimeout(function () {--}%
    %{--                b.find(".form-control").not(".datepicker").first().focus()--}%
    %{--            }, 500);--}%
    %{--        } //success--}%
    %{--    }); //ajax--}%
    %{--} //createEdit--}%

    function cargarImagenes(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'producto', action:'imagenes_ajax')}",
            data    : {
                id:id,
                anuncio: '${anuncio?.id}'
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

        // $(".btnCrear").click(function() {
        //     createEditRow();
        //     return false;
        // });

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
                        $.ajax({
                            type    : "POST",
                            url     : "${createLink(controller: 'producto', action:'show_ajax')}",
                            data    : {
                                id : id
                            },
                            success : function (msg) {
                                bootbox.dialog({
                                    title   : "Ver promotor",
                                    message : msg,
                                    buttons : {
                                        ok : {
                                            label     : "Aceptar",
                                            className : "btn-primary",
                                            callback  : function () {
                                            }
                                        }
                                    }
                                });
                            }
                        });
                    }
                },
                editar   : {
                    label  : "Editar",
                    icon   : "fa fa-edit",
                    action : function ($element) {
                        var id = $element.data("id");
                        // createEditRow(id);
                        location.href="${createLink(controller: 'producto', action: 'producto')}?id=" + id + "&persona=" + ${persona?.id};
                    }
                },
                texto : {
                    label            : "Texto",
                    icon             : "fa fa-pen",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        location.href="${createLink(controller: 'producto', action: 'texto')}?id=" + id
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
