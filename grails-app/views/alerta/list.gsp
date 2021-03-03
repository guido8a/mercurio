<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 03/03/21
  Time: 10:26
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista alertas</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="alerta" action="revisadas" class="btn btn-primary btnRevisadas">
            <i class="fa fa-user-check"></i> Alertas revisadas
        </g:link>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 20%">Usuario</th>
        <th style="width: 60%">Producto</th>
        <th style="width: 20%">Fecha Ingreso</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${alertas}" var="alerta">
            <tr data-id="${alerta?.id}" style="width: 100%">
                <td style="width: 20%; text-align: center">${alerta?.producto?.persona?.nombre}</td>
                <td style="width: 60%">${alerta?.producto?.titulo}</td>
                <td style="width: 20%; text-align: center">${alerta?.fechaIngreso?.format("dd-MM-yyyy")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<script type="text/javascript">

    function generarAnuncio(id) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-check fa-3x pull-left text-success text-shadow'></i><p>¿Está seguro que desea aceptar y generar un anuncio de este producto?.</p>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-success",
                    callback  : function () {
                        $.ajax({
                            type: 'POST',
                            url: '${createLink(controller: 'anuncio', action: 'crearAnuncio_ajax')}',
                            data:{
                                id: id
                            },
                            success: function (msg){
                                if(msg == 'ok'){
                                    bootbox.dialog({
                                        title   : "Alerta",
                                        message : "<i class='fa fa-check fa-3x pull-left text-info text-shadow'></i><p>Producto revisado correctamente</p>",
                                        buttons : {
                                            aceptar : {
                                                label     : "<i class='fa fa-check'></i> Aceptar",
                                                className : "btn-primary",
                                                callback  : function () {
                                                    location.href="${createLink(controller: 'anuncio', action: 'list')}?id=" + id
                                                }
                                            }
                                           }
                                    });
                                }else{
                                    bootbox.alert("<i class='fa fa-times fa-3x pull-left text-danger text-shadow'></i><p style='font-size: 14px; font-weight: bold'> Error al crear el anuncio del producto</p>")
                                }
                            }
                        })
                    }
                }
            }
        });
    }

    function negarProducto(id) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea negar este producto?.</p>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-check'></i> Aceptar",
                    className : "btn-danger",
                    callback  : function () {
                        $.ajax({
                            type    : "POST",
                            url     : "${createLink(controller: 'alerta', action:'negar_ajax')}",
                            data    : {
                                id:id
                            },
                            success : function (msg) {
                                if(msg == 'ok'){
                                    log("Producto negado correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                }else{
                                    log("Error al negar el producto","error")
                                }
                            } //success
                        }); //ajax
                    }
                }
            }
        });
    } //createEdit

    $(function () {

        $(".btnCrear").click(function() {
            createEditRow();
            return false;
        });

        $("tbody tr").contextMenu({
            items  : {
                header   : {
                    label  : "Acciones",
                    header : true
                },
                // editar   : {
                //     label  : "Editar",
                //     icon   : "fa fa-edit",
                //     action : function ($element) {
                //         var id = $element.data("id");
                //         createEditRow(id);
                //     }
                // },
                producto : {
                    label            : "Revisar Producto",
                    icon             : "fa fa-clipboard-check",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        %{--location.href="${createLink(controller: 'producto', action: 'list')}?id=" + id--}%
                    }
                },
                publicacion : {
                    label            : "Aceptar producto",
                    icon             : "fa fa-check text-success",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        generarAnuncio(id)
                    }
                }
                ,
                // imagen : {
                //     label            : "Imagen",
                //     icon             : "fa fa-image",
                //     separator_before : true,
                //     action           : function ($element) {
                //         var id = $element.data("id");
                //         cargarImagenes(id)
                //     }
                // },
                negar : {
                    label            : "Negar producto",
                    icon             : "fa fa-trash text-danger",
                    separator_before : true,
                    action           : function ($element) {
                        var id = $element.data("id");
                        negarProducto(id)
                    }
                }
            },
            onShow : function ($element) {
                $element.addClass("trHighlight");
            },
            onHide : function ($element) {
                $(".trHighlight").removeClass("trHighlight");
            }
        });
    });
</script>

</body>
</html>
