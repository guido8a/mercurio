<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 19/02/21
  Time: 13:46
--%>

<g:if test="${imagenes.size() > 0}">
    <div class="row">
        <g:each in="${imagenes}" var="file" status="i">
            <div class="col-sm-3 ${i}">
                <div class="thumbnail">
                    <a href="#" class="btn btn-danger btn-sm btn-delete pull-right" title="Eliminar" data-file="${file.file}" data-i="${i}" style="margin-bottom: 5px">
                        <i class="fa fa-trash"></i>
                    </a>
                    <img src="${createLink(controller: 'anuncio', action: 'getImage', params: [id: file.file, anun: anuncio?.id] )}"/>
                    <div class="caption">
                        <p>${file.file}</p>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</g:if>
<g:else>
    <div class="alert alert-warning">
        <i class="fa fa-exclamation-triangle fa-2x"></i>
        No tiene imágenes cargadas en el servidor.
    </div>
</g:else>

<script type="text/javascript">

    $(".btn-delete").click(function () {
        var file = $(this).data("file");
        bootbox.confirm("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i> Está seguro que desea borrar la imagen?", function (res) {
            if (res) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'anuncio', action: 'deleteImagen_ajax')}',
                    data:{
                        id: '${anuncio?.id}',
                        file: file
                    },
                    success: function (msg) {
                        if(msg == 'ok'){
                            log("Imagen borrada correctamente","success");
                            cargarTablaImagenes();
                            $("#divCarga").removeClass('hidden');
                        }else{
                            log("Error al borrar la imagen","error")
                        }
                    }
                });
            }
        });

    });

</script>