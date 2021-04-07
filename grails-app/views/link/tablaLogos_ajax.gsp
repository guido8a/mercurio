<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 06/04/21
  Time: 13:56
--%>


<style>

.marco{
    border-color: #47b636;
}

</style>

<g:if test="${imagenes.size() > 0}">
    <div class="row">
        <g:each in="${imagenes}" var="file" status="i">
            <div class="col-sm-3 ${i}">
                <div class="thumbnail ${link.logo == file.file ? 'marco' : ''}">
                    <a href="#" class="btn btn-success btn-sm btnSeleccionar pull-left" title="Asignar logo" data-file="${file.file}" data-i="${i}" style="margin-bottom: 5px">
                        <i class="fa fa-check-circle"></i> Asignar logo
                    </a>
                    <a href="#" class="btn btn-danger btn-sm btn-delete pull-right" title="Eliminar" data-file="${file.file}" data-i="${i}" style="margin-bottom: 5px">
                        <i class="fa fa-trash"></i>
                    </a>
                    <img src="${createLink(controller: 'link', action: 'getImage', params: [id: file.file] )}"/>
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

    $(".btnSeleccionar").click(function () {
        var lg = $(this).data("file");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'link', action: 'asignar_ajax')}',
            data:{
                id: '${link?.id}',
                logo: lg
            },
            success: function (msg) {
                if(msg == 'ok'){
                    bootbox.alert("<i class'fa fa-parking'></i>El logo fué asignado correctamente");
                    cargarTablaImagenes();
                }else{
                    bootbox.alert("<i class'fa fa-times'></i> Error al asignar el log")
                }
            }
        });
    });


    $(".btn-delete").click(function () {
        var file = $(this).data("file");
        bootbox.confirm("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i> Está seguro que desea borrar la imagen?", function (res) {
            if (res) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'link', action: 'deleteImagen_ajax')}',
                    data:{
                        id: '${link?.id}',
                        file: file
                    },
                    success: function (msg) {
                        if(msg == 'ok'){
                            log("Imagen borrada correctamente","success");
                            cargarTablaImagenes();
                        }else{
                            log("Error al borrar la imagen","error")
                        }
                    }
                });
            }
        });

    });

</script>