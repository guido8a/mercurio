<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 14:48
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Atributos</title>

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
        <div class="col-md-3 btn-group" style="float: left;">
            <a href="${createLink(controller: 'producto', action: 'list', id: persona.id)}"
               class="btn btn-primary btnAtras" ><i class="fa fa-arrow-left"></i> Lista de Anuncios - Productos</a>
        </div>
        <div class="col-md-3 btn-group" style="float: right">
            <a href="#" class="btn btn-warning btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>
            <a href="#" class="btn btn-primary btnSiguiente" > Siguiente <i class="fa fa-arrow-right"></i></a>
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
                <h1 class="textoPaso">Atributos</h1>
                <div class="col-md-10">
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <h3> Ingrese los atributos de su producto</h3>

                        <div class="col-md-1"></div>

                        <div class="col-lg-8">

                            <g:if test="${producto?.id}">

                                <label class="col-md-2 control-label text-info">
                                    Atributos
                                </label>

                                <div class="col-md-5">
                                    <g:select name="atributo" from="${ventas.AtributoCategoria.findAllBySubcategoria(ventas.Subcategoria.get(producto?.subcategoria?.id)).sort{it.atributo.descripcion}}"
                                              class="form-control" optionKey="id"/>
                                </div>

                                <label class="col-md-1 control-label text-info">
                                    Valor
                                </label>

                                <div class="col-md-3">
                                    <g:textField name="valor" maxlength="63" class="form-control"/>
                                </div>

                                <div class="col-md-1">
                                    <a href="#" class="btn btn-success" id="btnAgregarAt" title="Agregar atributo"><i class="fa fa-plus"></i></a>
                                </div>


                                <div style="margin-top: 20px; margin-bottom: 10px"></div>

                                <div class="col-md-12" id="tablaAtributos" style="max-height: 300px; margin-top: 30px; margin-left: 30px; text-align: center; width: 90%;">

                                </div>
                            </g:if>
                        </div>
                    </div>

%{--                    <div class="col-md-12">--}%
%{--                        <div class="col-md-3 btn-group" style="float: right">--}%
%{--                            <a href="#" class="btn btn-warning btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>--}%
%{--                            <a href="#" class="btn btn-primary btnSiguiente" > Siguiente <i class="fa fa-arrow-right"></i></a>--}%
%{--                        </div>--}%
%{--                    </div>--}%

                </div>
            </div>
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
        'Atributos',
        'progress-bar-wrapper'
    );

    $(".btnAnterior").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardInfo')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
    });

    $(".btnSiguiente").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardImagenes')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
    });

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



</script>

</body>
</html>