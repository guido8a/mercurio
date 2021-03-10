<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 14:48
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
    <title>Atributos</title>

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
        <h1 class="textoPaso">Atributos</h1>
        <div class="">
            <div class="col-md-12" style="margin-bottom: 10px">
                <h3> Ingrese los atributos de su producto</h3>


                <div class="col-lg-6">

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


                        <div style="margin-top: 20px; margin-bottom: 20px"></div>

                        <div class="col-md-12" id="tablaAtributos" style="margin-top: 30px; margin-left: 30px; text-align: center; width: 90%;">

                        </div>

                    </g:if>


                </div>


            </div>


        </div>

        <a href="#" class="btn btn-warning btnAnterior" style="float: left"><i class="fa fa-arrow-left"></i> Anterior</a>
        <a href="#" class="btn btn-primary btnSiguiente" style="float: right"> Siguiente <i class="fa fa-arrow-right"></i></a>
    </div>

</g:form>

<script type="text/javascript">

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