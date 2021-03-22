<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 15:11
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Contacto</title>

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
        font-size: 36px;
        margin-top: 8px;
    }

    .card {
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
        height: 370px;
    }


    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmContacto" role="form" action="" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-4 btn-group" style="float: right">
            <a href="#" class="btn btn-warning btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>
            <a href="#" class="btn btn-info btnVer" ><i class="fa fa-search"></i> Pre-visualizar</a>
            <a href="#" class="btn btn-success" id="btnAprobacion" > Publicar <i class="fa fa-check"></i></a>
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
                <p class="numeroPaso">5</p>
                <h1 class="textoPaso">Información de contacto</h1>
                <div class="col-md-10">
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <h3> Ingrese la información de contacto</h3>
                        <div class="form-group ${hasErrors(bean: 'persona', field: 'contacto', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Nombre de contacto
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="contacto" maxlength="63" class="form-control required" title="Nombre de contacto"
                                                 value="${persona?.contacto ? persona?.contacto : persona?.nombre}" required=""/>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'persona', field: 'telefonoContacto', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Teléfono de contacto
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="telefonoContacto" maxlength="63" class="form-control" title="Teléfono de contacto"
                                                 value="${persona?.telefonoContacto ? persona?.telefonoContacto : persona?.telefono}"/>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'persona', field: 'mailContacto', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Mail de contacto
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="mailContacto" maxlength="63" class="form-control required" title="Mail de contacto"
                                                 value="${persona?.mailContacto ? persona?.mailContacto : persona?.mail}" required=""/>
                                </div>
                            </span>
                        </div>
                    </div>
                </div>

%{--                <div class="col-md-4 btn-group" style="float: right">--}%
%{--                    <a href="#" class="btn btn-warning btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>--}%
%{--                    <a href="#" class="btn btn-info btnVer" ><i class="fa fa-search"></i> Pre-visualizar</a>--}%
%{--                    <a href="#" class="btn btn-success" id="btnAprobacion" > Publicar <i class="fa fa-check"></i></a>--}%
%{--                </div>--}%
            </div>
        </div>
    </div>
</g:form>

<div class="col-md-12">
    .
</div>

<script type="text/javascript">

    $(".btnVer").click(function () {
        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}' + "&tipo=" + 1
    });

    ProgressBar.init(
        [ 'Categoría',
            'Información',
            'Atributos',
            'Imágenes',
            'Contacto'
        ],
        'Contacto',
        'progress-bar-wrapper'
    );

    ProgressBar.singleStepAnimation = 100;

    $(".btnAnterior").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardImagenes')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
    });

    $("#btnAprobacion").click(function () {
        var $form = $("#frmContacto");
        if ($form.valid()) {
            $.ajax({
                type: 'POST',
                url: '${createLink(controller: 'producto', action:'verificarImagen_ajax')}',
                data:{
                    id: $("#id").val()
                },
                success: function(msg){
                    if(msg == 'ok'){
                        bootbox.dialog({
                            title   : "Alerta",
                            message : "<i class='fa fa-clipboard-check fa-3x pull-left text-info text-shadow'></i> " +
                                "<p style='font-size: 14px; font-weight: bold'>&nbsp;El producto será publicado con la " +
                                "información guardada hasta el momento.</p>",
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
                    }else{
                        bootbox.dialog({
                            title   : "Alerta",
                            message : "<i class='fa fa-times fa-3x pull-left text-info text-shadow'></i> <p style='font-size: 14px; font-weight: bold'>Se debe ingresar al menos UNA imagen para el producto.</p>",
                            buttons : {
                                cancelar : {
                                    label     : "<i class='fa fa-times'></i> Aceptar",
                                    className : "btn-primary",
                                    callback  : function () {
                                    }
                                }
                            }
                        });
                    }
                }
            });
        }else{
            return false;
        }
    });

    function publicarProducto(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'alerta', action: 'generarAlerta_ajax')}',
            data:{
                id: $("#id").val(),
                persona: $("#persona").val(),
                contacto: $("#contacto").val(),
                telefono: $("#telefonoContacto").val(),
                mail: $("#mailContacto").val()
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