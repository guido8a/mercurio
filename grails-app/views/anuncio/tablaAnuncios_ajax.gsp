<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 03/03/21
  Time: 15:24
--%>

<style>


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

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:if test="${anuncios.size() > 0}">
            <g:each in="${anuncios}" var="anuncio">
                <tr data-id="${anuncio?.id}" data-prod="${anuncio?.producto?.id}" data-est="${anuncio?.estado}" data-per="${anuncio.producto.persona.id}" style="width: 100%">
                    <td style="width: 15%; text-align: left">${anuncio?.producto?.persona?.nombres}</td>
                    <td style="width: 35%">${anuncio?.producto?.titulo}</td>
                    <td style="width: 10%; text-align: center; background-color:  ${anuncio?.estado == 'A' ? '#67a153' : '#afafaf'}">${anuncio?.estado == 'A' ? 'ACTIVO' : 'INACTIVO'}</td>
                    <td style="width: 10%; text-align: center">
                        <a href="#" class="btn btn-xs btn-gris btnRevisar" title="Revisar anuncio"
                           data-id="${anuncio?.producto?.id}" data-per="${anuncio.producto.persona.id}">
                            <i class="fa fa-search"></i> </a>
                        <g:if test="${anuncio?.estado == 'A'}">
                            <a href="#" class="btn btn-xs btn-rojo btnPublicacion" title="Publicación" data-id="${anuncio?.id}"><i class="fa fa-user-clock"></i> </a>
                        </g:if>
                                        <a href="#" class="btn btn-xs btn-gris btnEstado" title="Cambiar estado" data-id="${anuncio?.id}"><i class="fa fa-sync"></i> </a>
                    </td>
                    <td style="width: 10%; text-align: center">${ventas.Publicacion.findAllByAnuncio(anuncio) ? ventas.Publicacion.findAllByAnuncio(anuncio)?.last()?.fechaInicio?.format("dd-MM-yyyy") : ''}</td>
                    <td style="width: 10%; text-align: center">${ventas.Publicacion.findAllByAnuncio(anuncio) ? ventas.Publicacion.findAllByAnuncio(anuncio)?.last()?.fechaFin?.format("dd-MM-yyyy") : ''}</td>
                    <td style="width: 10%; text-align: center; background-color: ${ventas.Publicacion.findAllByAnuncio(anuncio) ? (ventas.Publicacion.findAllByAnuncio(anuncio)?.last()?.destacado == '1' ? '#67a153' : '#afafaf') : '#afafaf'}">${ventas.Publicacion.findAllByAnuncio(anuncio) ? (ventas.Publicacion.findAllByAnuncio(anuncio)?.last()?.destacado == '1' ? 'SI' : 'NO') : 'NO'}</td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <div class="alert alert-warning" role="alert" style="text-align: center">
                <p style="font-size: 14px"><i class="fa fa-exclamation-triangle"></i> No existen anuncios</p>
            </div>
        </g:else>
        </tbody>
    </table>
</div>

<script type="text/javascript">


    $(".btnRevisar").click(function () {
        var id = $(this).data("id");
        var persona = $(this).data("per");
        location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + persona + "&tipo=" + 5;
    });


    $(".btnPublicacion").click(function () {
        var id = $(this).data("id");
        fijarPublicacion(id);
    });

    $(".btnEstado").click(function () {
        var id = $(this).data("id");
        cambiarEstado(id);
    });

    // $(function () {

    %{--$("tbody tr").contextMenu({--}%
    %{--    items  : {--}%
    %{--        header   : {--}%
    %{--            label  : "Acciones",--}%
    %{--            header : true--}%
    %{--        },--}%
    %{--        producto : {--}%
    %{--            label            : "Producto",--}%
    %{--            icon             : "fa fa-briefcase",--}%
    %{--            separator_before : true,--}%
    %{--            action           : function ($element) {--}%
    %{--                var id = $element.data("prod");--}%
    %{--                location.href="${createLink(controller: 'producto', action: 'producto')}?id=" + id--}%
    %{--            }--}%
    %{--        },--}%
    %{--        publicacion : {--}%
    %{--            label            : "Publicación",--}%
    %{--            icon             : "fa fa-user-clock",--}%
    %{--            separator_before : true,--}%
    %{--            action           : function ($element) {--}%
    %{--                var id = $element.data("id");--}%
    %{--                fijarPublicacion(id);--}%
    %{--            }--}%
    %{--        },--}%
    %{--        estado : {--}%
    %{--            label            : "Cambiar estado",--}%
    %{--            icon             : "fa fa-sync",--}%
    %{--            separator_before : true,--}%
    %{--            action           : function ($element) {--}%
    %{--                var id = $element.data("id");--}%
    %{--                cambiarEstado(id);--}%
    %{--            }--}%
    %{--        }--}%
    %{--    },--}%
    %{--    onShow : function ($element) {--}%
    %{--        $element.addClass("trHighlight");--}%
    %{--    },--}%
    %{--    onHide : function ($element) {--}%
    %{--        $(".trHighlight").removeClass("trHighlight");--}%
    %{--    }--}%
    %{--});--}%
    // });

    function createContextMenu(node) {
        var $tr = $(node);
        var estadoAnuncio = $tr.data("est");

        var items = {
            header: {
                label: "Acciones",
                header: true
            }
        };

        var producto = {
            label            : "Revisar Anuncio",
            icon             : "fa fa-search",
            separator_before : true,
            action           : function ($element) {
                var id = $tr.data("prod");
                var perso = $tr.data("per");
                location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&persona=" + perso + "&tipo=" + 5;
            }
        };

        var publicacion = {
            label            : "Publicación",
            icon             : "fa fa-user-clock",
            separator_before : true,
            action           : function ($element) {
                var id = $tr.data("id");
                fijarPublicacion(id);
            }
        };

        var estado = {
            label            : "Cambiar estado",
            icon             : "fa fa-sync",
            separator_before : true,
            action           : function ($element) {
                var id = $element.data("id");
                cambiarEstado(id);
            }
        };

        items.producto = producto;
        if(estadoAnuncio == '1'){
            items.publicacion = publicacion;
        }
        items.estado = estado;
        return items;
    }

    $(function () {
        $("tr").contextMenu({
            items  : createContextMenu,
            onShow : function ($element) {
                $element.addClass("trHighlight");
            },
            onHide : function ($element) {
                $(".trHighlight").removeClass("trHighlight");
            }
        });
    });
</script>