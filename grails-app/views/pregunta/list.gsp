<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 01/04/21
  Time: 9:53
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Preguntas del usuario ${persona?.nombre}</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
%{--<div class="btn-toolbar toolbar" style="margin-top: 5px">--}%
%{--    <div class="btn-group">--}%
%{--        <g:link controller="alerta" action="revisadas" class="btn btn-primary btnRevisadas">--}%
%{--            <i class="fa fa-user-check"></i> Alertas revisadas--}%
%{--        </g:link>--}%
%{--    </div>--}%
%{--    <div class="btn-group">--}%
%{--        <g:link controller="anuncio" action="list" class="btn btn-info btnAnuncios">--}%
%{--            <i class="fa fa-copy"></i> Anuncios--}%
%{--        </g:link>--}%
%{--    </div>--}%
%{--</div>--}%

<h3>Preguntas del usuario: ${persona?.nombre}</h3>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 30%">Producto</th>
        <th style="width: 40%">Pregunta</th>
        <th style="width: 10%">Fecha</th>
        <th style="width: 10%">Respondido</th>
        <th style="width: 10%">Acciones</th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:if test="${preguntas.size() > 0}">
            <g:each in="${preguntas}" var="pregunta">
                <tr data-id="${pregunta?.id}"  style="width: 100%">
                    <td style="width: 30%; text-align: center">${pregunta.producto.titulo}</td>
                    <td style="width: 40%">${pregunta.texto}</td>
                    <td style="width: 10%; text-align: center">${pregunta?.fecha?.format("dd-MM-yyyy")}</td>
                    <td style="width: 10%; text-align: center; background-color: ${pregunta?.respuesta ? '#78b665' : '#ff4517'}">${pregunta?.respuesta ? 'SI' : 'NO'}</td>
                    <td style="width: 10%; text-align: center">
                        <a href="#" class="btn btn-sm btn-info btnResponder" title="Respuesta" data-id="${pregunta.id}"><i class="fa fa-bullhorn"></i> </a>
                        <a href="#" class="btn btn-sm btn-danger btnEliminar" title="Eliminar pregunta" data-id="${pregunta?.id}"><i class="fa fa-trash"></i> </a>
                    </td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <div class="alert alert-warning" role="alert" style="text-align: center">
                <p style="font-size: 14px"><i class="fa fa-exclamation-triangle"></i> No existen preguntas</p>
            </div>
        </g:else>
        </tbody>
    </table>
</div>

<script type="text/javascript">

    $(".btnResponder").click(function () {
        var id = $(this).data("id");

        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'pregunta', action: 'respuesta_ajax')}',
            data:{
                id: id
            },
            success: function (msg) {
                bootbox.dialog({
                    title   : "Respuesta",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cancelar",
                            className : "btn-primary",
                            callback  : function () {

                            }
                        },
                        aceptar : {
                            label     : "<i class='fa fa-save'></i> Guardar",
                            className : "btn-success",
                            callback  : function () {
                                guardarRespuesta();
                            }
                        }

                    }
                });
            }
        });
    });

    function guardarRespuesta(){
        var $form = $("#frmRespuesta");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'pregunta', action: 'savePregunta_ajax')}',
            data: $form.serialize(),
            success: function(msg){
                if(msg == 'ok'){
                    log("Respuesta guardada correctamente","success");
                    setTimeout(function (){
                        location.reload(true);
                    }, 1000);
                }else{
                    log("Error al guardar la respuesta","error")
                }
            }
        });
    }

    $(".btnEliminar").click(function () {
        var id = $(this).data("id")
        eliminarPregunta(id)
    });

    function eliminarPregunta(id) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea borrar esta pregunta?.</p>",
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
                            url     : "${createLink(controller: 'pregunta', action:'eliminarPregunta_ajax')}",
                            data    : {
                                id:id
                            },
                            success : function (msg) {
                                if(msg == 'ok'){
                                    log("Pregunta borrada correctamente","success");
                                    setTimeout(function () {
                                        location.reload(true);
                                    }, 1000);
                                }else{
                                    log("Error al borrar la pregunta","error")
                                }
                            } //success
                        }); //ajax
                    }
                }
            }
        });
    } //createEdit

</script>

</body>
</html>
