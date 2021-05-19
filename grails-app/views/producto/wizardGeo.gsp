<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 26/04/21
  Time: 13:23
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Localización del producto</title>

    <asset:stylesheet src="/bar/main.css"/>
    <asset:javascript src="/bar/progress-bar.js"/>

    <style>

    .numeroPaso{
        background-color: #E6E6E6;
        -webkit-border-radius: 300px;
        -moz-border-radius: 300px;
        border-radius: 300px;
        color: #AF5B00;
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
        color: #AF5B00;
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

<g:form class="form-horizontal" name="frmGeo" role="form" action="saveProducto" method="POST">
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
                <p class="numeroPaso">3</p>
                <h1 class="textoPaso">Localización</h1>
                <div class="col-md-10">
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <h3> Ingrese la localización del producto</h3>
                        <div class="form-group">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Provincia
                                </label>
                                <div class="col-md-6">
                                    <g:select name="provincia" from="${geografia.Provincia.list().sort{it.nombre}}" class="form-control" optionKey="id" optionValue="nombre" value="${producto?.canton?.provincia?.id ? producto?.canton?.provincia?.id : producto?.padre?.canton?.provincia?.id}"/>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'producto', field: 'canton', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Cantón
                                </label>
                                <div class="col-md-6" id="divCanton">

                                </div>
                            </span>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <label class="col-md-3 control-label text-info">
                           Sitio
                        </label>
                        <div class="col-md-6 form-group ${hasErrors(bean: 'producto', field: 'sitio', 'error')}">
                            <g:textArea name="sitio" class="form-control" style="resize: none" value="${producto?.sitio ? producto?.sitio : producto?.padre?.sitio}"/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <label class="col-md-3 control-label text-info">
                            Coordenadas
                        </label>
                        <div class="col-md-3 form-group ${hasErrors(bean: 'producto', field: 'latitud', 'error')}">
                           <label>Latitud</label>
                           <g:textField name="latitud" value="${producto?.latitud ? producto?.latitud : (producto?.padre?.latitud ? producto?.padre?.latitud : 0)}" class="form-control"/>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-3 form-group ${hasErrors(bean: 'producto', field: 'longitud', 'error')}">
                            <label>Longitud</label>
                            <g:textField name="longitud" value="${producto?.longitud ? producto?.longitud : (producto?.padre?.longitud ? producto?.padre?.longitud : 0)}" class="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>

<div class="col-md-12">
    .
</div>

<script type="text/javascript">

    function validarNumPunto(ev) {
        return ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
            (ev.keyCode >= 96 && ev.keyCode <= 105) ||
            ev.keyCode == 190 || ev.keyCode == 110 ||
            ev.keyCode == 8 || ev.keyCode == 46 || ev.keyCode == 9 ||
            ev.keyCode == 37 || ev.keyCode == 39 ||
            ev.keyCode == 173 || ev.keyCode == 109);
    }


    $("#latitud, #longitud").keydown(function (ev) {
        return validarNumPunto(ev)
    });

    $("#provincia").change(function () {
        var id = $(this).val();
        cargarCanton(id)
    });

    cargarCanton($("#provincia").val());

    function cargarCanton(id){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'canton', action: 'canton_ajax')}',
            data:{
                id: id,
                producto: $("#id").val()
            },
            success: function (msg) {
                $("#divCanton").html(msg)
            }
        });
    }

    ProgressBar.init(
        [ 'Categoría',
            'Información',
            'Localización',
            'Atributos',
            'Imágenes',
            'Contacto'
        ],
        'Localización',
        'progress-bar-wrapper'
    );


    $(".btnAnterior").click(function () {
        submitFormProducto(0)
    });

    $(".btnSiguiente").click(function () {
        submitFormProducto(1)
    });

    function submitFormProducto(tipo) {

        var $form = $("#frmGeo");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveProducto')}',
                data    : {
                    id: $("#id").val(),
                    sitio: $("#sitio").val(),
                    canton: $("#canton").val(),
                    latitud: $("#latitud").val(),
                    longitud: $("#longitud").val()
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
                                location.href="${createLink(controller: 'producto', action: 'wizardInfo')}?id=" + parts[1] + "&persona=" + '${persona?.id}';
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


</script>

</body>
</html>