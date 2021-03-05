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

    /********    */
    #carrusel {
        float:left;
        width:100%;
        overflow:hidden;
        height:120px;
        position:relative;
        margin-top:20px;
        margin-bottom:20px;
    }

    #carrusel .left-arrow {
        position:absolute;
        left:10px;
        z-index:1;
        top:35%;
        margin-top:-9px;
    }

    #carrusel .right-arrow {
        position:absolute;
        right:10px;
        z-index:1;
        top:35%;
        margin-top:-9px;
    }

    .carrusel {
        width:4000px;
        left:0px;
        position:absolute;
        z-index:0;
    }

    .carrusel>div {
        float: left;
        height: 80px;
        margin-right: 5px;
        width: 120px;
        text-align:center;
    }

    .carrusel img {
        cursor:pointer;
    }

    .product {
        border:#CCCCCC 1px solid;
    }


    </style>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <a href="#" class="btn btn-primary btnVolver">
            <i class="fa fa-arrow-left"></i> Volver
        </a>
        <a href="#" class="btn btn-success" id="btnGuardarProducto" title="Guardar cambios en producto">
            <i class="fa fa-save"></i> Guardar </a>
        <g:if test="${producto?.id}">
            <a href="#" class="btn btn-warning" id="btnImasProducto" title="Imágenes asociadas al producto">
                <i class="fa fa-images"></i> Agregar imágenes </a>

            <a href="#" class="btn btn-primary" id="btnImasProducto" title="Visualizar como se presentará el anuncio">
                <i class="fa fa-search-dollar"></i> Previsualizar el Anuncio</a>

            <a href="#" class="btn btn-primary" id="btnImasProducto" title="Visualizar como se presentará el anuncio">
                <i class="fas fa-lightbulb"></i> Destacar este Anuncio</a>

        </g:if>
    </div>

    <div class="btn-group">
        <g:if test="${producto?.id}">
            <a href="#" class="btn btn-info" id="btnAprobacion" title="Publicar producto"><i class="fa fa-check"></i> Publicar producto </a>
        </g:if>
    </div>
</div>

<g:if test="${producto?.id}">
    <div class="col-md-12">
        <div id="carrusel">

            <a href="#" class="left-arrow"><asset:image src="apli/left-arrow.png" title='Anterior'/></a>
            <a href="#" class="right-arrow"><asset:image src="apli/right-arrow.png" title='Siguiente'/></a>
            <div class="carrusel">
                <g:each in="${imagenes}" var="im" status="i">
                    <div class="product" id="product_${i+1}">
                        <img src="${createLink(controller: 'producto', action: 'getImage', params: [id: "${im.file}", pro: producto?.id] )}"  width="120" height="80"/>
                    </div>
                </g:each>
            </div>
        </div>
    </div>
</g:if>

<div class="row">
<g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />


    <div class="col-lg-6" style="border-right: #0a193b; border-style: solid; border-width: 1px; border-left: none; border-top: none; border-bottom: none">

        <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
            <span class="grupo" >
                <div style="text-align: center">
                    <g:if test="${producto?.id}">
                        <label class="col-md-3 control-label text-info">
                            Estado del producto
                        </label>

                        <div class="col-md-4">
                            <span class="badge bg-warning" style="font-size: x-large; background-color:  ${producto?.estado == 'A' ? '#78B665' : (producto?.estado == 'R' ? '#cba51d' : '#C42623')} ">${producto?.estado == 'A' ? 'Activo' : (producto?.estado == 'R' ? 'En Revisión' : 'Inactivo')}</span>
                        </div>
                    </g:if>
                </div>
            </span>
        </div>


        <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
            <span class="grupo">
                <label for="categoria" class="col-md-2 control-label text-info">
                    Categoría
                </label>
                <div class="col-md-10">
                    <g:select name="categoria" from="${ventas.Categoria.list().sort{it.descripcion}}" class="form-control"
                              optionKey="id" optionValue="descripcion" value="${producto?.subcategoria?.categoria?.id}"/>
                </div>
            </span>
        </div>




        <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Subcategoría
                </label>
                <div class="col-md-10" id="divSubcategoria">
                </div>
            </span>
        </div>

        <div style="margin-top: 20px; margin-bottom: 20px"></div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Título
                </label>
                <div class="col-md-10">
                    <g:textField name="titulo" maxlength="255" class="form-control" value="${producto?.titulo}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Subtítulo
                </label>
                <div class="col-md-10">
                    <g:textField name="subtitulo" maxlength="255" class="form-control" value="${producto?.subtitulo}"/>
                </div>
            </span>
        </div>

        <div style="margin-top: 20px; margin-bottom: 20px"></div>

        <label class="col-md-2 control-label text-info">
            Texto adicional
        </label>
        <div class="col-md-10 form-group ${hasErrors(bean: 'producto', field: 'texto', 'error')}">
            <textarea id="texto" class="editor">${producto?.texto}</textarea>
        </div>

    </div>

    <div class="col-lg-6">

        <g:if test="${producto?.id}">

%{--            <div style="margin-top: 20px; margin-bottom: 20px"></div>--}%

            <label class="col-md-2 control-label text-info">
                Atributos
            </label>

            <div class="col-md-6">
                <g:select name="atributo" from="${ventas.AtributoCategoria.findAllBySubcategoria(ventas.Subcategoria.get(producto?.subcategoria?.id)).sort{it.atributo.descripcion}}"
                          class="form-control" optionKey="id"/>
            </div>

            <label class="col-md-1 control-label text-info">
                Valor
            </label>

            <div class="col-md-2">
                <g:textField name="valor" maxlength="63" class="form-control"/>
            </div>

            <div class="col-md-1">
                <a href="#" class="btn btn-success" id="btnAgregarAt" title="Agregar atributo"><i class="fa fa-plus"></i></a>
            </div>


            <div style="margin-top: 20px; margin-bottom: 20px"></div>

            <div class="col-md-12" id="tablaAtributos" style="margin-top: 30px; margin-left: 30px; text-align: center; width: 90%;">

            </div>

        </g:if>


    </div>

</g:form>

</div>





<script type="text/javascript">

    $(".btnVolver").click(function () {
       location.href="${createLink(controller: 'producto', action: 'list')}?id=" + '${persona?.id}'
    });

    $("#btnAprobacion").click(function () {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-clipboard-check fa-3x pull-left text-info text-shadow'></i> <p style='font-size: 14px; font-weight: bold'>El producto será publicado con la información guardada hasta el momento.</p>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                publicar : {
                    label     : "<i class='fa fa-check'></i> Publicar",
                    className : "btn-success",
                    callback  : function () {
                            publicarProducto();
                    }
                }
            }
        });
    });

    function publicarProducto(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'alerta', action: 'generarAlerta_ajax')}',
            data:{
                id: $("#id").val()
            },
            success: function (msg) {
                if(msg == 'ok'){

                    bootbox.dialog({
                        title   : "Confirmación",
                        message : "<i class='fa fa-check fa-3x pull-left text-success text-shadow'></i><p style='font-size: 14px; font-weight: bold'> Su producto será revisado y publicado en las próximas 24 horas</p>",
                        buttons : {
                            aceptar : {
                                label     : "<i class='fa fa-check'></i> Aceptar",
                                className : "btn-success",
                                callback  : function () {
                                    location.href="${createLink(controller: 'producto', action: 'list')}?id=" + '${persona?.id}'
                                }
                            }
                        }
                    });
                }else{
                    bootbox.alert("<i class='fa fa-times fa-3x pull-left text-danger text-shadow'></i><p style='font-size: 14px; font-weight: bold'> Error al publicar el producto</p>")
                }
            }
        });
    }

    $("#btnAgregarAt").click(function () {
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'agregarAtributo_ajax')}',
            data:{
                id: $("#id").val(),
                atributo: $("#atributo").val(),
                valor:$("#valor").val()
            },
            success: function (msg) {
                var parts = msg.split("_");
                if(parts[0] == 'ok'){
                    log("Agregado correctamente","success");
                    cargarAtributos();
                }else{
                    if(parts[0] == 'er'){
                        bootbox.alert(parts[1])
                    }else{
                        log("Error al agregar","error")
                    }
                }
            }
        });
    });

    <g:if test="${producto?.id}">
    cargarAtributos();
    </g:if>

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
                            location.href="${createLink(controller: 'producto', action: 'producto')}?id=" + parts[1] + "&persona=" + '${persona?.id}';
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
            height: "100px",
            width: "100%",
            toolbar                 : [
                ['Scayt', '-', 'Cut', 'Copy', 'Paste', 'PasteFromWord', '-', 'Bold', 'Italic', 'Underline'],
                ['NumberedList', 'BulletedList', '-']
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
                        location.href="${createLink(controller: 'producto', action: 'producto')}?id=" + id + "&persona=" + '${persona?.id}';
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




    // **********
    var current = 0;
    var imagenes = new Array();

    $(document).ready(function() {
        var numImages = 6;
        if (numImages <= 3) {
            $('.right-arrow').css('display', 'none');
            $('.left-arrow').css('display', 'none');
        }

        $('.left-arrow').on('click',function() {
            if (current > 0) {
                current = current - 1;
            } else {
                current = numImages - 3;
            }

            $(".carrusel").animate({"left": -($('#product_'+current).position().left)}, 600);

            return false;
        });

        $('.left-arrow').on('hover', function() {
            $(this).css('opacity','0.5');
        }, function() {
            $(this).css('opacity','1');
        });

        $('.right-arrow').on('hover', function() {
            $(this).css('opacity','0.5');
        }, function() {
            $(this).css('opacity','1');
        });

        $('.right-arrow').on('click', function() {
            if (numImages > current + 3) {
                current = current+1;
            } else {
                current = 0;
            }

            $(".carrusel").animate({"left": -($('#product_'+current).position().left)}, 600);

            return false;
        });
    });

</script>

</body>
</html>
