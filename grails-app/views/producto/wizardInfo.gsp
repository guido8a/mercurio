<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 13:23
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Información del producto</title>

    <asset:stylesheet src="/bar/main.css"/>
    <asset:javascript src="/bar/progress-bar.js"/>

    <style>

    .numeroPaso{
        background-color: #E6E6E6;
        -webkit-border-radius: 300px;
        -moz-border-radius: 300px;
        border-radius: 300px;
        color: #158CBA;
        float: left;
        font-size: 36px;
        height: 70px;
        margin-right: 10px;
        text-align: center;
        width: 70px;
        font-weight: bold;
        padding-top: 8px;
    }

    .textoPaso {
        color: #158CBA;
        font-size: 36px;
        float: left;
        margin-top: 8px;
    }

    .card {
        border: green;
        width: 100%;
        -webkit-box-shadow : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        -moz-box-shadow    : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        box-shadow         : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
    }

    .card2 {
        border: green;
        width: 100%;
        -webkit-box-shadow : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        -moz-box-shadow    : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        box-shadow         : 7px 7px 5px 0px rgba(50, 50, 50, 0.75);
        height: 450px;
    }

    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-9 btn-group" style="float: left;">
            <a href="${createLink(controller: 'producto', action: 'list', id: persona.id)}"
               class="btn btn-gris btnAtras" ><i class="fa fa-arrow-left"></i> Lista de Anuncios - Productos</a>
        </div>
        <div class="col-md-3 btn-group">
            <a href="#" class="btn btn-gris btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>
            <a href="#" class="btn btn-rojo btnSiguiente"> Siguiente <i class="fa fa-arrow-right"></i></a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            .
        </div>
        <div class="card-body">
        </div>
    </div>


    <div class="card2" style="width: 100%">

        <div class="card-body">

            <div style="margin-top: 10px">
                <p class="numeroPaso">2</p>
                <h1 class="textoPaso">Información</h1>
                <div class="col-md-10">
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <h3> Ingrese la información de su producto</h3>
                        <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Anuncio (Título)
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="titulo" maxlength="255" class="form-control required" title="Texto principal del anuncio"
                                                 value="${producto?.titulo}" style="background-color: #ffffef"/>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Descripción resumida
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="subtitulo" maxlength="255" class="form-control" title="Segunda línea del anuncio"
                                                 value="${producto?.subtitulo}"/>
                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <label class="col-md-3 control-label text-info">
                            Detalles o Especificaciones
                        </label>
                        <div class="col-md-7 form-group ${hasErrors(bean: 'producto', field: 'texto', 'error')}">
                            <textarea id="texto" class="editor">${producto?.texto}</textarea>
                        </div>
                    </div>
                </div>
            </div>
%{--            <div class="col-md-12">--}%
%{--                <div class="col-md-3 btn-group" style="float: right">--}%
%{--                    <a href="#" class="btn btn-warning btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>--}%
%{--                    <a href="#" class="btn btn-primary btnSiguiente"> Siguiente <i class="fa fa-arrow-right"></i></a>--}%
%{--                </div>--}%
%{--            </div>--}%

        </div>
    </div>
</g:form>

<div class="col-md-12">
    .
</div>

<script type="text/javascript">

    ProgressBar.init(
        [ 'Categoría',
            'Información',
            'Atributos',
            'Imágenes',
            'Contacto'
        ],
        'Información',
        'progress-bar-wrapper'
    );


    $(".btnAnterior").click(function () {
        submitFormProducto(0)
    });

    $(".btnSiguiente").click(function () {
        submitFormProducto(1)
    });

    function submitFormProducto(tipo) {

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
                    // subcategoria: $("#subcategoria").val(),
                    titulo: $("#titulo").val(),
                    subtitulo: $("#subtitulo").val(),
                    texto: texto
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        // log("Producto guardado correctamente","success");
                        setTimeout(function () {
                            if(tipo == '1'){
                                location.href="${createLink(controller: 'producto', action: 'wizardAtributos')}?id=" + parts[1] + "&persona=" + '${persona?.id}';
                            }else{
                                location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + parts[1] + "&persona=" + '${persona?.id}';
                            }

                        }, 500);
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
            height: "140px",
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


</script>

</body>
</html>