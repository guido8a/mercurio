<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 15:06
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Imágenes</title>

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
        height: 370px;
    }

    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
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
                <p class="numeroPaso">4</p>
                <h1 class="textoPaso">Imágenes</h1>
                <div class="col-md-10">
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <h3> Agregar imágenes de su producto</h3>

                        <a href="#" class="btn btn-success" id="btnImasProducto" title="Imágenes asociadas al producto">
                            <i class="fa fa-images"></i> Agregar imágenes
                        </a>

                        <g:if test="${producto?.id}">
                            <g:if test="${imagenes.size() > 0}">
                                <div class="col-md-12">
                                    <div id="carrusel">
                                        <a href="#" class="left-arrow"><asset:image src="apli/left-arrow.png" title='Anterior'/></a>
                                        <a href="#" class="right-arrow"><asset:image src="apli/right-arrow.png" title='Siguiente'/></a>
                                        <div class="carrusel">
                                            <g:each in="${imagenes}" var="im" status="i">
                                                <div class="product" id="product_${i+1}">
                                                    <img src="${createLink(controller: 'producto', action: 'getImage', params: [id: "${im.file}", pro: producto?.id] )}"  width="120" height="80" title="${im.file}"/>
                                                </div>
                                            </g:each>
                                        </div>
                                    </div>
                                </div>
                            </g:if>
                            <g:else>
                                <div class="col-md-12" style="margin-top: 40px">

                                </div>
                            </g:else>
                        </g:if>

                    </div>
                </div>


%{--                <div class="col-md-4 btn-group" style="float: right">--}%

%{--                    <a href="#" class="btn btn-warning btnAnterior" ><i class="fa fa-arrow-left"></i> Anterior</a>--}%
%{--                    <a href="#" class="btn btn-primary btnSiguiente" > Siguiente <i class="fa fa-arrow-right"></i></a>--}%
%{--                </div>--}%
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
        'Imágenes',
        'progress-bar-wrapper'
    );

    $(".btnAnterior").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardAtributos')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
    });

    $(".btnSiguiente").click(function () {
        $.ajax({
            type:'POST',
            url: '${createLink(controller: 'producto', action: 'comprobarImagenes_ajax')}',
            data:{
                id: $("#id").val()
            },
            success: function(msg){
                if(msg == 'ok'){
                    location.href="${createLink(controller: 'producto', action: 'wizardContacto')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
                }else{
                    bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i> Debe ingrear al menos una imagen para su producto")
                }
            }
        });

    });

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
                            label     : "<i class='fa fa-times'></i> Salir",
                            className : "btn-primary",
                            callback  : function () {
                                location.href="${createLink(controller: 'producto', action: 'wizardImagenes')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit


</script>

</body>
</html>