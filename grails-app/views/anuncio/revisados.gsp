<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 11:12
--%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de anuncios revisados</title>
</head>
<body>

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

<!-- botones -->
<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="anuncio" action="list" class="btn btn-gris btnVolver">
            <i class="fa fa-arrow-left"></i> Anuncios por revisar
        </g:link>
    </div>
</div>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 100%">
        <th style="width: 70%" colspan="4">Anuncio</th>
        <th style="width: 30%" colspan="3">Publicación</th>
    </tr>
    <tr style="width: 100%">
        <th style="width: 15%">Usuario</th>
        <th style="width: 35%">Título</th>
        <th style="width: 10%">Estado</th>
        <th style="width: 10%">Acciones</th>
        <th style="width: 10%">Fecha Inicio</th>
        <th style="width: 10%">Fecha Fin</th>
        <th style="width: 10%">Destacado</th>
    </tr>
    </thead>
</table>

<div id="tablaAnuncios">

</div>


<script type="text/javascript">

    cargarTablaAnuncios();

    function cargarTablaAnuncios(){
        $.ajax({
           type: 'POST',
           url: '${createLink(controller: 'anuncio', action: 'tablaAnuncios_ajax')}',
           data:{

           },
           success: function(msg){
               $("#tablaAnuncios").html(msg)
           }
        });
    }

    function fijarPublicacion(id) {
        var title = id ? "Editar" : "Crear";
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'publicacion', action:'form_ajax')}",
            data    : {
                id: id ?  id : null
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEditP",
                    title   : title + " Publicación",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Salir",
                            className : "btn-gris",
                            callback  : function () {
                                cargarTablaAnuncios();
                            }
                        }
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").not(".datepicker").first().focus()
                }, 500);
            } //success
        }); //ajax
    } //createEdit

    function submitFormPublicacion() {
        var $form = $("#frmPublicacion");
        var $btn = $("#dlgCreateEditP").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(controller: 'publicacion', action:'savePublicacion')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        log("Publicación guardada correctamente","success");
                        cargarTablaAnuncios();
                    } else {
                        log("Error al guardar la Publicación","error");
                    }
                }
            });
        } else {
            return false;
        } //else
    }

    function cambiarEstado(id){
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-sync fa-3x pull-left text-warning text-shadow'></i><p>¿Está seguro que desea cambiar el estado del anuncio seleccionado?.</p>",
            buttons : {
                cancelar : {
                    label     : "<i class='fa fa-times'></i> Cancelar",
                    className : "btn-gris",
                    callback  : function () {
                    }
                },
                aceptar : {
                    label     : "<i class='fa fa-save'></i> Aceptar",
                    className : "btn-rojo",
                    callback  : function () {
                        var l1 = cargarLoader("Guardando...");
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(action:'cambiarEstado_ajax')}',
                            data    : {
                                id : id
                            },
                            success : function (msg) {
                                l1.modal("hide");
                                if (msg == "ok") {
                                    log("Estado del anuncio cambiado correctamente","success");
                                    cargarTablaAnuncios();
                                } else {
                                    log("Error cambiar el estado del anuncio","error");
                                }
                            }
                        });
                    }
                }
            }
        });
    }


</script>

</body>
</html>
