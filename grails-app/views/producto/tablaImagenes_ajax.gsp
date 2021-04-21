<%@ page import="ventas.Producto" %>
<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 19/02/21
  Time: 12:20
--%>

<style>

.marco{
    border-color: #47b636;
}

.btn-rojo {
    border-radius: 4px;
    background-image: linear-gradient(var(--naranja3),var(--naranja),var(--naranja3));
    text-align-all: center;
    margin: 2px;
}

.btn-gris {
    border-radius: 4px;
    background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
    text-align-all: center;
    margin: 2px;
}

</style>

<g:if test="${imagenes.size() > 0}">
    <div class="row">
        <g:each in="${imagenes}" var="file" status="i">
            <div class="col-sm-3 ${i}">
                <div class="thumbnail ${ventas.Imagen.findByProductoAndRuta(ventas.Producto.get(producto?.id), file.file)?.principal == '1' ? 'marco' : ''}">

                    <g:if test="${ventas.Imagen.findByProductoAndRuta(ventas.Producto.get(producto?.id), file.file)?.principal != '1'}">
                        <a href="#" class="btn btn-rojo btn-sm btnPrincipal" data-id="${ventas.Imagen.findByProductoAndRuta(ventas.Producto.get(producto?.id), file.file)?.id}" title="Asignar imagen principal">
                            <i class="fa fa-parking"></i>
                        </a>
                    </g:if>

                    <a href="#" class="btn btn-gris btn-sm btn-delete pull-right" title="Eliminar" data-file="${file.file}" data-i="${i}" style="margin-bottom: 5px">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" class="btn btn-gris btn-sm pull-right btnTexto" title="Texto de la imagen" data-id="${ventas.Imagen.findByProductoAndRuta(ventas.Producto.get(producto?.id), file.file)?.id}" style="margin-bottom: 5px">
                        <i class="fa fa-edit"></i>
                    </a>
                    <img src="${createLink(controller: 'producto', action: 'getImage', params: [id: file.file, pro: producto?.id] )}"/>
                    <div class="caption">
                        <p>${file.file}</p>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</g:if>
<g:else>
    <br>
    <div class="alert alert-warning">
        <i class="fa fa-exclamation-triangle fa-2x"></i>
        Aún no hay imágenes para su producto.
    </div>
</g:else>

<script type="text/javascript">

    $(".btnTexto").click(function () {
        var id = $(this).data("id");
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'producto', action:'textoImagen_ajax')}",
            data    : {
                id:id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgTexto",
                    title   : "Texto de la imagen",
                    // class : "modal-lg",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Cancelar",
                            className : "btn-gris",
                            callback  : function () {
                            }
                        },
                        guardar : {
                            label     : "<i class='fa fa-save'></i> Guardar",
                            className : "btn-rojo",
                            callback  : function () {
                                guardarTexto(id)
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    });

    function guardarTexto(id){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'guardarTextoImagenes_ajax')}',
            data:{
                id: id,
                texto: $("#textoImagen").val()
            },
            success: function (msg) {
                if(msg == 'ok'){
                    log("Texto guardado correctamente","success")
                }else{
                    log("Error al guardar el texto","error")
                }
            }
        });
    }

    $(".btnPrincipal").click(function () {
        var id = $(this).data("id");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'ponerPrincipal_ajax')}',
            data:{
                id:id
            },
            success: function (msg) {
                if(msg == 'ok'){
                    bootbox.alert("<i class'fa fa-parking'></i> La imagen fue asignada como principal correctamente");
                    cargarTablaImagenes();
                }else{
                    bootbox.alert("<i class'fa fa-times'></i> Error al asignar la imagen como principal")
                }
            }
        });
    });

    $(".btn-delete").click(function () {
        var file = $(this).data("file");
        bootbox.confirm("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Está seguro que desea borrar la imagen?", function (res) {
            if (res) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'producto', action: 'deleteImagen_ajax')}',
                    data:{
                        id: '${producto?.id}',
                        file: file
                    },
                    success: function (msg) {
                        var parts = msg.split("_");
                        if(parts[0] == 'ok'){
                            log("Imagen borrada correctamente","success");
                            cargarTablaImagenes();
                        }else{
                            if(parts[0] == 'er'){
                              bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i>" + parts[1])
                            }else{
                                log("Error al borrar la imagen","error")
                            }

                        }
                    }
                });
            }
        });

    });

</script>