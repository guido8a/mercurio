<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/03/21
  Time: 14:48
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Producto</title>

    <style>

    body{
        margin-top:40px;
    }

    .stepwizard-step p {
        margin-top: 10px;
    }

    .stepwizard-row {
        display: table-row;
    }

    .stepwizard {
        display: table;
        width: 100%;
        position: relative;
    }

    .stepwizard-step button[disabled] {
        opacity: 1 !important;
        filter: alpha(opacity=100) !important;
    }

    .stepwizard-row:before {
        top: 14px;
        bottom: 0;
        position: absolute;
        content: " ";
        width: 100%;
        height: 1px;
        background-color: #ccc;
        z-order: 0;

    }

    .stepwizard-step {
        display: table-cell;
        text-align: center;
        position: relative;
    }

    .btn-circle {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 6px 0;
        font-size: 12px;
        line-height: 1.428571429;
        border-radius: 15px;
    }

    </style>


</head>

<body>

<div class="container">
    <div class="stepwizard">
        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step">
                <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                <p>Categorías</p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                <p>Información</p>
            </div>
            <div class="stepwizard-step">
                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                <p>Características</p>
            </div>
        </div>
    </div>
    <form role="form">
        <div class="row setup-content" id="step-1">
            <div class="col-xs-12" style="min-height: 200px">
                <div class="col-md-12" style="margin-bottom: 10px">
                    <h3> Seleccione una categoría</h3>
                    <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
                        <span class="grupo">
                            <label for="categoria" class="col-md-2 control-label text-info">
                                Categoría
                            </label>
                            <div class="col-md-6">
                                <g:select name="categoria" from="${ventas.Categoria.list().sort{it.descripcion}}" class="form-control"
                                          optionKey="id" optionValue="descripcion" value="${producto?.subcategoria?.categoria?.id}"/>
                            </div>
                        </span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
                        <span class="grupo">
                            <label class="col-md-2 control-label text-info">
                                Subcategoría
                            </label>
                            <div class="col-md-6" id="divSubcategoria">
                            </div>
                        </span>
                    </div>
                    <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>
                </div>
            </div>
        </div>
        <div class="row setup-content" id="step-2">
            <div class="col-xs-12" style="min-height: 200px">
                <div class="col-md-12" style="margin-bottom: 10px">
                    <h3> Información</h3>

                    <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Anuncio (Título)
                            </label>
                            <div class="col-md-6">
                                <g:textField name="titulo" maxlength="255" class="form-control" title="Texto principal del anuncio"
                                             value="${producto?.titulo}" style="background-color: #ffffef"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Descripción resuminda
                            </label>
                            <div class="col-md-6">
                                <g:textField name="subtitulo" maxlength="255" class="form-control" title="Segunda línea del anuncio"
                                             value="${producto?.subtitulo}"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12">
                    <label class="col-md-2 control-label text-info">
                        Detalles o Especifi-caciones
                    </label>
                    <div class="col-md-10 form-group ${hasErrors(bean: 'producto', field: 'texto', 'error')}">
                        <textarea id="texto" class="editor">${producto?.texto}</textarea>
                    </div>
                </div>

                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Siguiente</button>

            </div>
        </div>
        <div class="row setup-content" id="step-3">
            <div class="col-xs-12">
                <div class="col-md-12">
                    <h3> Step 3</h3>
                    <button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">

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

    $(document).ready(function () {

        var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

        allWells.hide();

        navListItems.click(function (e) {
            e.preventDefault();
            var $target = $($(this).attr('href')),
                $item = $(this);

            if (!$item.hasClass('disabled')) {
                navListItems.removeClass('btn-primary').addClass('btn-default');
                $item.addClass('btn-primary');
                allWells.hide();
                $target.show();
                $target.find('input:eq(0)').focus();
            }
        });

        allNextBtn.click(function(){
            var curStep = $(this).closest(".setup-content"),
                curStepBtn = curStep.attr("id"),
                nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
                curInputs = curStep.find("input[type='text'],input[type='url']"),
                isValid = true;

            $(".form-group").removeClass("has-error");
            for(var i=0; i<curInputs.length; i++){
                if (!curInputs[i].validity.valid){
                    isValid = false;
                    $(curInputs[i]).closest(".form-group").addClass("has-error");
                }
            }

            if (isValid)
                nextStepWizard.removeAttr('disabled').trigger('click');
        });

        $('div.setup-panel div a.btn-primary').trigger('click');
    });

</script>

</body>
</html>