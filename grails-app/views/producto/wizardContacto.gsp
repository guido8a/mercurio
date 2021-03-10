<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 15:11
--%>

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
    <title>Contacto</title>

    <style>

    .numeroPaso{
    'background-color': '#E6E6E6',
    '-webkit-border-radius': '300px',
    '-moz-border-radius': '300px',
    'border-radius': '300px',
    'color': '#158CBA',
    'float': 'left',
    'font-size': '36px',
    'height': '70px',
    'margin-right': '10px',
    'text-align': 'center',
    'width': '70px',
    'font-weight': 'bold',
    'padding-top': '8px'
    }


    .textoPaso {
        color: #158CBA;
        font-size: 36px;
        float: left;
        font-size: 36px;
        margin-top: 8px;
    }

    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="">
        <h1 class="textoPaso">Información</h1>
        <div class="">
            <div class="col-md-12" style="margin-bottom: 10px">
                <h3> Ingrese la información de contacto</h3>
%{--                <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')}">--}%
%{--                    <span class="grupo">--}%
%{--                        <label class="col-md-3 control-label text-info">--}%
%{--                            Anuncio (Título)--}%
%{--                        </label>--}%
%{--                        <div class="col-md-6">--}%
%{--                            <g:textField name="titulo" maxlength="255" class="form-control" title="Texto principal del anuncio"--}%
%{--                                         value="${producto?.titulo}" style="background-color: #ffffef"/>--}%
%{--                        </div>--}%
%{--                    </span>--}%
%{--                </div>--}%
            </div>
            <div class="col-md-12" style="margin-bottom: 10px">
%{--                <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">--}%
%{--                    <span class="grupo">--}%
%{--                        <label class="col-md-3 control-label text-info">--}%
%{--                            Descripción resumida--}%
%{--                        </label>--}%
%{--                        <div class="col-md-6">--}%
%{--                            <g:textField name="subtitulo" maxlength="255" class="form-control" title="Segunda línea del anuncio"--}%
%{--                                         value="${producto?.subtitulo}"/>--}%
%{--                        </div>--}%
%{--                    </span>--}%
%{--                </div>--}%
            </div>

%{--            <div class="col-md-12">--}%
%{--                <label class="col-md-3 control-label text-info">--}%
%{--                    Detalles o Especificaciones--}%
%{--                </label>--}%
%{--                <div class="col-md-6 form-group ${hasErrors(bean: 'producto', field: 'texto', 'error')}">--}%
%{--                    <textarea id="texto" class="editor">${producto?.texto}</textarea>--}%
%{--                </div>--}%
%{--            </div>--}%

        </div>

        <a href="#" class="btn btn-warning btnAnterior" style="float: left"><i class="fa fa-arrow-left"></i> Anterior</a>
        <a href="#" class="btn btn-success btnSiguiente" style="float: right"> Publicar <i class="fa fa-check"></i></a>
    </div>

</g:form>

<script type="text/javascript">

    $(".btnAnterior").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardImagenes')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
    });

    $(".btnSiguiente").click(function () {
        // submitFormProducto(1)
    });

    %{--function submitFormProducto(tipo) {--}%

    %{--    var texto = CKEDITOR.instances.texto.getData();--}%

    %{--    var $form = $("#frmProducto");--}%
    %{--    var $btn = $("#dlgCreateEdit").find("#btnSave");--}%
    %{--    if ($form.valid()) {--}%
    %{--        $btn.replaceWith(spinner);--}%
    %{--        var l = cargarLoader("Grabando...");--}%
    %{--        $.ajax({--}%
    %{--            type    : "POST",--}%
    %{--            url     : '${createLink(action:'saveProducto')}',--}%
    %{--            // data    : $form.serialize(),--}%
    %{--            data    : {--}%
    %{--                id: $("#id").val(),--}%
    %{--                persona: $("#persona").val(),--}%
    %{--                // subcategoria: $("#subcategoria").val(),--}%
    %{--                titulo: $("#titulo").val(),--}%
    %{--                subtitulo: $("#subtitulo").val(),--}%
    %{--                texto: texto--}%
    %{--            },--}%
    %{--            success : function (msg) {--}%
    %{--                l.modal("hide");--}%
    %{--                var parts = msg.split("_");--}%
    %{--                if (parts[0] == "ok") {--}%
    %{--                    log("Producto guardado correctamente","success");--}%
    %{--                    setTimeout(function () {--}%
    %{--                        if(tipo == '1'){--}%
    %{--                            location.href="${createLink(controller: 'producto', action: 'wizardAtributos')}?id=" + parts[1] + "&persona=" + '${persona?.id}';--}%
    %{--                        }else{--}%
    %{--                            location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + parts[1] + "&persona=" + '${persona?.id}';--}%
    %{--                        }--}%

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




</script>

</body>
</html>