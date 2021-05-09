<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/03/21
  Time: 13:16
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<style type="text/css">
    .titulo0 {
        color:var(--naranja0);
        font-size: 1.6rem;
        font-weight: bolder;
    }
</style>

<div class="container">

    <div class="col-md-5" style="text-align: center; margin-bottom: 12px">
        <strong style="font-size: 16px; "><i class="fa fa-question fa-2x text-warning"></i> ¿Desea destacar este anuncio?</strong>
    </div>

    <div class="col-md-12 form-group">
        <span class="grupo">
            <label class="col-md-2 control-label text-info">
%{--                <span class="badge bg-primary">Destacado</span>--}%
            </label>
            <div class="col-md-2 form-check form-check-inline" style="margin-top: 5px">
                <input name="destacado" class="form-check-input tipo" type="checkbox" id="inlineCheckbox1"
                    ${producto?.destacado == '1' ? 'checked' : ''}>
            </div>
        </span>

    </div>

%{--        <div class="alert alert-warning col-md-6" role="alert" style="font-size: 13px">--}%
    <div class="col-md-6" style="font-size: 15px">
        Con una <strong>pequeña inversión</strong>, destaque su anuncio para que aparezca en la parte superior de
        Anuncios, o que se halle <span class="titulo0">siempre visible</span> en el carrusel principal.
    </div>



</div>


<script type="text/javascript">

    $.switcher('input[type=checkbox]');

    $(".tipo").click(function () {
        var checked = $(this).is(":checked");
        if (checked) {
            destacar('si')
        } else {
            destacar('no')
        }
    });

    function destacar(tipo){
        var cl = cargarLoader("Guardando...");
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'guardarDestacar_ajax')}',
            data:{
                tipo: tipo,
                producto: '${producto?.id}'
            },
            success: function (msg) {
                cl.modal("hide");
            }
        })
    }

</script>