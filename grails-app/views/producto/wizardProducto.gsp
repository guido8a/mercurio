<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/03/21
  Time: 12:44
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Categoría</title>

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

    </style>

</head>

<body>

<g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div class="progress-bar-wrapper"></div>

    <div class="col-md-12" style="background-color: #d0d0d0; padding: 5px">
        <div class="col-md-3 btn-group" style="float: left;">
            <a href="${createLink(controller: 'producto', action: 'list', id: persona.id)}" class="btn btn-primary btnAtras" ><i class="fa fa-arrow-left"></i> Lista de productos</a>
        </div>
        <div class="col-md-3 btn-group" style="float: right;">
            <a href="#" class="btn btn-primary btnSiguiente" >Siguiente<i class="fa fa-arrow-right"></i></a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            .
        </div>
        <div class="card-body">
        </div>
    </div>

    <div class="card" style="width: 100%; height: 230px">
        <div class="card-body">

            <div style="margin-top: 10px">
                <p class="numeroPaso">1</p>
                <h1 class="textoPaso">Categoría</h1>
                %{--                <div class="col-md-8" style="margin-top: 0px">--}%
                <div class="col-md-10">
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <h3> Seleccione una categoría para su producto</h3>
                        <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
                            <span class="grupo">
                                <label for="categoria" class="col-md-3 control-label text-info">
                                    Categoría
                                </label>
                                <div class="col-md-6">
                                    <g:select name="categoria" from="${ventas.Categoria.list().sort{it.descripcion}}" class="form-control"
                                              optionKey="id" optionValue="descripcion" value="${producto?.subcategoria?.categoria?.id}"/>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
                            <span class="grupo">
                                <label class="col-md-3 control-label text-info">
                                    Subcategoría
                                </label>
                                <div class="col-md-6" id="divSubcategoria">
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-bottom: 10px">
                        <div class="col-md-3 btn-group" style="float: right">
%{--                            <a href="#" class="btn btn-primary btnSiguiente" >Siguiente<i class="fa fa-arrow-right"></i></a>--}%
                            .
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</g:form>

<script type="text/javascript">


    ProgressBar.init(
        [ 'Categoría',
            'Información',
            'Atributos',
            'Imágenes',
            'Contacto'
        ],
        'Categoría',
        'progress-bar-wrapper'
    );


    $(".btnSiguiente").click(function () {
        submitFormProducto();
    });

    function submitFormProducto() {

        var $form = $("#frmProducto");
        var $btn = $("#dlgCreateEdit").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveProducto')}',
                data    : {
                    id: $("#id").val(),
                    persona: $("#persona").val(),
                    subcategoria: $("#subcategoria").val(),
                    // titulo: $("#titulo").val(),
                    // subtitulo: $("#subtitulo").val(),
                    // texto: texto
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        // log("Producto guardado correctamente","success");
                        setTimeout(function () {
                            location.href="${createLink(controller: 'producto', action: 'wizardInfo')}?id=" + parts[1] + "&persona=" + '${persona?.id}';
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


</script>

</body>
</html>