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

<g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="">
        <h1 class="textoPaso">Imágenes</h1>
        <div class="">
            <div class="col-md-12" style="margin-bottom: 10px">
                <h3> Agregar imágenes de su producto</h3>

                <a href="#" class="btn btn-warning" id="btnImasProducto" title="Imágenes asociadas al producto">
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

        <a href="#" class="btn btn-warning btnAnterior" style="float: left"><i class="fa fa-arrow-left"></i> Anterior</a>
        <a href="#" class="btn btn-primary btnSiguiente" style="float: right"> Siguiente <i class="fa fa-arrow-right"></i></a>
    </div>

</g:form>

<script type="text/javascript">

    $(".btnAnterior").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardAtributos')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
    });

    $(".btnSiguiente").click(function () {
        location.href="${createLink(controller: 'producto', action: 'wizardContacto')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
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