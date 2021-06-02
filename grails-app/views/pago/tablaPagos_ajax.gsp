<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/04/21
  Time: 11:20
--%>

<%@ page import="ventas.Producto" %>

<style>

.marco{
    border-color: #AF5B00;
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
                <div class="thumbnail">
                    <a href="#" class="btn btn-gris btn-sm btn-delete pull-right" title="Eliminar" data-file="${file.file}" data-i="${i}" style="margin-bottom: 5px">
                        <i class="fa fa-trash"></i>
                    </a>
                    <img src="${createLink(controller: 'pago', action: 'getImage', params: [id: file.file, pro: producto?.id] )}"/>
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
        No existe ningún comprobante de pago cargado
    </div>
</g:else>

<script type="text/javascript">

    $(".btn-delete").click(function () {
        var file = $(this).data("file");
        bootbox.confirm("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i> Está seguro que desea borrar el comprobante?", function (res) {
            if (res) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'pago', action: 'deleteImagenPago_ajax')}',
                    data:{
                        id: '${producto?.id}',
                        file: file
                    },
                    success: function (msg) {
                        var parts = msg.split("_");
                        if(parts[0] == 'ok'){
                            log("Comprobante borrado correctamente","success");
                            cargarTablaImagenes();
                        }else{
                            if(parts[0] == 'er'){
                                bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i>" + parts[1])
                            }else{
                                log("Error al borrar el comprobante","error")
                            }

                        }
                    }
                });
            }
        });

    });

</script>