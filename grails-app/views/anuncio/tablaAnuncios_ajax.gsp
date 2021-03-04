<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 03/03/21
  Time: 15:24
--%>

<div class=""  style="width: 99.7%;height: 350px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${anuncios}" var="anuncio">
            <tr data-id="${anuncio?.id}" data-prod="${anuncio?.producto?.id}" data-est="${anuncio?.estado}" style="width: 100%">
                <td style="width: 30%; text-align: center">${anuncio?.titulo}</td>
                <td style="width: 20%">${anuncio?.subtitulo}</td>
                <td style="width: 10%">${anuncio?.orden}</td>
                <td style="width: 10%; text-align: center; background-color:  ${anuncio?.estado == '1' ? '#67a153' : '#EC5415'}">${anuncio?.estado == '1' ? 'ACTIVO' : 'INACTIVO'}</td>
                <td style="width: 10%; text-align: center">${ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio) ? ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio)?.fechaInicio?.format("dd-MM-yyyy") : ventas.Publicacion.findByAnuncio(anuncio)?.last()?.fechaInicio?.format("dd-MM-yyyy")}</td>
                <td style="width: 10%; text-align: center">${ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio) ? ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio)?.fechaFin?.format("dd-MM-yyyy") : ventas.Publicacion.findByAnuncio(anuncio)?.last()?.fechaFin?.format("dd-MM-yyyy")}</td>
                <td style="width: 10%; text-align: center; background-color: ${ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio) ? (ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio)?.destacado == '1' ? '#67a153' : '#cba51d') : ventas.Publicacion.findByAnuncio(anuncio)?.last()?.destacado == '1' ? '#67a153' : '#cba51d'}">${ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio) ? (ventas.Publicacion.findByAnuncioAndFechaFinIsNull(anuncio)?.destacado == '1' ? 'SI' : 'NO') : ventas.Publicacion.findByAnuncio(anuncio)?.last()?.destacado == '1' ? 'SI' : 'NO'}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<script type="text/javascript">
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
            label            : "Producto",
            icon             : "fa fa-briefcase",
            separator_before : true,
            action           : function ($element) {
                var id = $tr.data("prod");
                location.href="${createLink(controller: 'producto', action: 'producto')}?id=" + id
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