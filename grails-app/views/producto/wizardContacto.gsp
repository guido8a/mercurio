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
        height: 540px;
    }


    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmContacto" role="form" action="" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-5 btn-group" style="float: left;">
            %{--            <a href="${createLink(controller: 'producto', action: 'list', id: persona.id)}"--}%
            %{--               class="btn btn-gris btnRetornar" ><i class="fa fa-arrow-left"></i> Lista de Anuncios - Productos</a>--}%
            <a href="#" class="btn btn-gris btnRetornar" ><i class="fa fa-arrow-left"></i> Lista de Anuncios - Productos</a>
        </div>

        <div class="col-md-4 btn-group" >
            <a href="#" class="btn btn-rojo btnVer" ><i class="fa fa-search"></i> Pre-visualizar</a>
        </div>

        <div class="col-md-3 btn-group">
            <a href="#" class="btn btn-gris btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>
            <a href="#" class="btn btn-rojo btnAprobacion" > Publicar el Anuncio &nbsp;<i class="fa fa-check"></i></a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            &nbsp;
        </div>
        <div class="card-body">
        </div>
    </div>

    <div class="card2" style="width: 100%">
        <div class="card-body">

            <div style="margin-top: 10px">
                <p class="numeroPaso">6</p>
                <h1 class="textoPaso">Información de contacto</h1>
                <div class="col-md-10">
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <h3> A quien contactar para comprar: '${producto.titulo}'</h3>
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
                                    Teléfonos de contacto
                                </label>
                                <div class="col-md-6">
                                    <g:textField name="telefonoContacto" maxlength="63" class="form-control" title="Teléfono de contacto"
                                                 value="${persona?.telefonoContacto ? persona?.telefonoContacto : persona?.telefono}"/>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-bottom: 20px">
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

                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'fechaInicio', field: 'pago', 'error')}">
                            <label class="col-md-3 control-label text-warning" style="font-size: 10pt">
                                Publicar desde
                            </label>
                            <div class="col-md-2 text-info">
                                <input name="fechaInicio" id='fechaInicio' type='text' required="" class="form-control required datepicker"
                                       value="${new Date().format('dd-MM-yyyy')}"/>
                            </div>

                            <label class="col-md-4 control-label" style="font-size: 10pt" id="fcHasta">
                                Hasta:
                            </label>

                        </div>
                    </div>

                    <div class="col-md-12" style="margin-bottom: 40px">
                        <div class="form-group ${hasErrors(bean: 'tipopago', field: 'pago', 'error')}">
                            <label class="col-md-3 control-label text-warning" style="font-size: 10pt">
                                Seleccione su tipo de publicación
                            </label>
                            <div class="col-md-6 text-info">
%{--                                <g:select name="tipopago" from="${ventas.TipoPago.list([sort: 'orden'])}"--}%
%{--                                          class="form-control per required" optionValue="descripcion" optionKey="id"--}%
%{--                                          dataAttrs="[dias: it.dias]"--}%
%{--                                          style="color: #4F1B00; border-bottom-style: solid; border-color: #AF5B00; font-size: 12pt"/>--}%
                                <select id="tipopago" class="form-control per required" style="color: #4F1B00; border-bottom-style: solid; border-color: #AF5B00; font-size: 12pt">
                                    <g:each in="${ventas.TipoPago.list([sort: 'orden'])}" var="tp">
                                        <option value="${tp.id}" data-dias="${tp.dias}">${tp.descripcion} ${tp.tarifa? '- precio: $' + tp.tarifa:''}</option>
                                    </g:each>
                                </select>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div style="display: flex; justify-content: center; width: 100%; margin-top: 20px; font-size: 10pt" id="textoAnuncio">
            </div>
            <div style="display: flex; justify-content: center; width: 100%; margin-top: 20px">
                <a href="#" class="btn btn-rojo btnAprobacion" > Publicar el Anuncio &nbsp;<i class="fa fa-check"></i></a>
            </div>
        </div>
    </div>
</g:form>

<div class="col-md-12">
    .
</div>

<script type="text/javascript">

    $(".btnRetornar").click(function () {
        if(${producto.estado == 'T'}){
            bootbox.dialog({
                title   : "Alerta",
                message : "<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
                    "<p style='font-size: 14px; font-weight: bold'>" + "&nbsp; La edición del producto no se " +
                    "encuentra completa. <br> &nbsp; Desea volver a su lista de productos?." + "</p>",
                buttons : {
                    cancelar : {
                        label     : "<i class='fa fa-times'></i> Cancelar",
                        className : "btn-gris",
                        callback  : function () {
                        }
                    },
                    aceptar : {
                        label     : "<i class='fa fa-check'></i> Aceptar",
                        className : "btn-rojo",
                        callback  : function () {
                            location.href="${createLink(controller: 'producto', action: 'borrar_temporal')}?id=${producto.id}"
                        }
                    }
                }
            });
        }else{
            location.href="${createLink(controller: 'producto', action: 'list')}?id=" + '${persona?.id}'
        }
    });

    $(".btnVer").click(function () {
        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + '${producto?.id}' + "&tipo=" + 1
    });

    ProgressBar.init(['Categoría','Información','Localización','Atributos','Imágenes','Contacto'],
        'Contacto','progress-bar-wrapper');

    ProgressBar.singleStepAnimation = 100;

    $(".btnAnterior").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardImagenes')}?id=" + '${producto?.id}'
    });

    $(".btnAprobacion").click(function () {
        var $form = $("#frmContacto");
        if ($form.valid()) {
            $.ajax({
                type: 'POST',
                url: '${createLink(controller: 'producto', action:'verificarImagen_ajax')}', /* existen imágenes*/
                data:{
                    id: $("#id").val()
                },
                success: function(msg){
                    if(msg == 'ok'){
                        publicar();
                    }else{
                        bootbox.dialog({
                            title   : "Alerta",
                            message : "<i class='fa fa-times fa-3x pull-left text-info text-shadow'></i> " +
                                "<p style='font-size: 14px; font-weight: bold'>Se debe ingresar al menos UNA imagen " +
                                "para el producto.</p>",
                            buttons : {
                                cancelar : {
                                    label     : "<i class='fa fa-times'></i> Aceptar",
                                    className : "btn-rojo",
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

    function publicar(){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'publicar_ajax')}',
            data:{
                id: '${producto?.id}'
            },
            success: function(msg){
                bootbox.dialog({
                    title   : "Publicar producto",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cancelar",
                            className : "btn-gris",
                            callback  : function () {
                            }
                        },
                        aceptar : {
                            label     : "<i class='fa fa-check'></i> Publicar",
                            className : "btn-rojo",
                            callback  : function () {
                                guardarContacto()
                            }
                        }
                    }
                });
            }
        });
    }

    /*
    * Si se trata de una copia para editar un producto aprobado, se debe:
    * Poner 'B' el padre.
    * Cambiar el estado al actual a 'R'
    * Dar de baja el anuncio actual
    * Crear un nuevo anuncio en Revisión
    * Si ya ha pagado el anuncio que se da de baja se debe aprobar el nuevo para el plazo que reste de publicar
    * **/

    function guardarContacto(){
        var a = cargarLoader("Procesando...");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'guardarContacto_ajax')}',
            data:{
                id: '${producto?.id}',
                contacto: $("#contacto").val(),
                telefono: $("#telefonoContacto").val(),
                mail: $("#mailContacto").val(),
                pago: $("#tipopago").val(),
                fecha: $("#fechaInicio").val()
            },
            success: function(msg){
                a.modal("hide");
                if(msg == 'ok'){
                    anuncioOk();
                }else{
                    log("Error al guardar la información de contacto","error")
                }
            }
        });
    }

/*
    function publicarProducto(){
        var a = cargarLoader("Procesando...");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'crearAnuncio_ajax')}',
            data:{
                id: $("#id").val(),
                tipo: '${tipo}'
            },
            success: function (msg) {
                a.modal("hide");
                var parts = msg.split("_");
                if(parts[0] == 'ok'){
                    bootbox.dialog({
                        title   : "Confirmación",
                        message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i>" +
                            "<p style='font-size: 14px; font-weight: bold'> Su producto será revisado y publicado " +
                            "en las próximas 24 horas</p>",
                        buttons : {
                            aceptar : {
                                label     : "<i class='fa fa-check'></i> Aceptar",
                                className : "btn-gris",
                                callback  : function () {
                                    location.href="${createLink(controller: 'producto', action: 'list')}"
                                }
                            }
                        }
                    });
                }else{
                    if(parts[0] == 'er'){
                        bootbox.dialog({
                            title   : "Confirmación",
                            // message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i><p style='font-size: 14px; font-weight: bold'> Ya existe un anuncio activo. <br> Desea volver a publicar su producto con la información actual?</p>",
                            message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i>" +
                                "<p style='font-size: 14px; font-weight: bold'>" + parts[1] + "</p>",
                            buttons : {
                                cancelar : {
                                    label     : "<i class='fa fa-times'></i> Cancelar",
                                    className : "btn-gris",
                                    callback  : function () {
                                        %{--location.href="${createLink(controller: 'producto', action: 'list')}?id=" + '${persona?.id}'--}%
                                    }
                                },
                                aceptar : {
                                    label     : "<i class='fa fa-check'></i> Aceptar",
                                    className : "btn-rojo",
                                    callback  : function () {
                                        reemplazarAnuncio();
                                    }
                                }
                            }
                        });
                    }else{
                        bootbox.alert('<i class="fa fa-times fa-3x pull-left text-warning text-shadow"></i>' +
                            '<p style="font-size: 14px; font-weight: bold">Error al publicar el producto </p>')
                    }
                }
            }
        });
    }
*/

    function anuncioOk() {
        bootbox.dialog({
            title: "Confirmación",
            message: "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i>" +
                "<p style='font-size: 14px; font-weight: bold'> Su producto será revisado y publicado " +
                "en las próximas 24 horas</p>",
            buttons: {
                aceptar: {
                    label: "<i class='fa fa-check'></i> Aceptar",
                    className: "btn-gris",
                    callback: function () {
                        location.href = "${createLink(controller: 'producto', action: 'list')}"
                    }
                }
            }
        });
    }

/*
    function reemplazarAnuncio(){
        var a = cargarLoader("Procesando...");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'reemplazar_ajax')}',
            data:{
                id: $("#id").val(),
                persona: $("#persona").val(),
                tipo: '${tipo}'
            },
            success: function (msg) {
                a.modal("hide");
                var parts = msg.split("_");
                if(parts[0] == 'ok'){
                    bootbox.dialog({
                        title   : "Confirmación",
                        message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i>" +
                            "<p style='font-size: 14px; font-weight: bold'> Su producto será revisado y publicado " +
                            "en las próximas 24 horas</p>",
                        buttons : {
                            aceptar : {
                                label     : "<i class='fa fa-check'></i> Aceptar",
                                className : "btn-gris",
                                callback  : function () {
                                    location.href="${createLink(controller: 'producto', action: 'list')}"
                                }
                            }
                        }
                    });
                }else{
                    bootbox.alert('<i class="fa fa-times fa-3x pull-left text-warning text-shadow"></i>' +
                        '<p style="font-size: 14px; font-weight: bold">Error al publicar el producto </p>')
                }
            }
        });
    }
*/

    $(function () {
        $('#fechaInicio').datetimepicker({
            locale: 'es',
            format: 'DD-MM-YYYY',
            showClose: true,
            minDate: moment().subtract(1, 'days'),
            icons: {
                close: 'closeText'
            }
        });
    });

    format = function date2str(x, y) {
        var z = {
            M: x.getMonth() + 1,
            d: x.getDate(),
            h: x.getHours(),
            m: x.getMinutes(),
            s: x.getSeconds()
        };
        y = y.replace(/(M+|d+|h+|m+|s+)/g, function(v) {
            return ((v.length > 1 ? "0" : "") + z[v.slice(-1)]).slice(-2)
        });

        return y.replace(/(y+)/g, function(v) {
            return x.getFullYear().toString().slice(-v.length)
        });
    }


    $('#fechaInicio').on('dp.change', function(e){
        calculaDias()
    })

    $('#tipopago').change(function(){
        calculaDias()
    })

    function calculaDias() {
        var fcha = $("#fechaInicio").val()
        var dias = $( "#tipopago option:selected" ).attr('data-dias');
        dias = parseInt(dias);
        console.log("cambio2", fcha, dias)
        var parts = fcha.split("-");
        var fecha = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
        fecha.setDate(fecha.getDate() + dias-1);
        console.log(format(fecha, 'dd-MM-yyyy'))
        $("#fcHasta").html("Hasta el " + format(fecha, 'dd-MM-yyyy') + " (" + dias + " días)");
        if(dias > 5) {
            $("#textoAnuncio").html("<i class='far fa-thumbs-up fa-2x'></i><p> Luego de hacer clic en 'Publicar el Anuncio' " +
                "use la opción 'Pagar anuncio' en la <strong>Lista de anuncios</strong> para " +
                "registrar el pago o para modificar el <strong>Tipo de publicación</strong>.</p>" )
        } else {
            $("#textoAnuncio").html("<i class='far fa-thumbs-up fa-2x'></i><p> Use la opción pagar anuncio en la <strong>Lista de anuncios</strong> para " +
                "registrar para modificar el <strong>Tipo de publicación</strong>.</p>" )
        }
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