<%--
  Created by IntelliJ IDEA.
  User: gato
  Date: 02/08/16
  Time: 11:31 AM
--%>

<div class="portfolio-modal modal fade in dialogo" aria-hidden="true" role="dialog" tabindex="-1" style="display: block; padding-right: 14px; overflow-y: auto; background-color: #f4f4f3 !important;" id="modalArticulo">
    <div class="modal-dialog">
        %{--<div class="modal-content" style="background-color: #94c3d7 !important;">--}%
        <div class="modal-content" style="background-color: #fffffb !important;">
            <div class="close-modal" data-dismiss="modal" id="cerrarModal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="modal-body" style="text-align: justify">
                            <h2 style="text-align: center!important;">${art?.titulo}</h2>
                            <p class="item-intro text-muted" style="text-align: center">${art?.subtitulo}</p>
                            %{--<img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt="">--}%
                            <p>${art?.descripcion}</p>
                            <p style="text-align: justify">  <util:renderHTML html="${art?.texto}"/></p>
                            <button type="button" class="btn btn-primary"  data-dismiss="modal" id="btnCerrar"><i class="fa fa-arrow-left"></i> Regresar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>

    $("#cerrarModal").click(function () {
//        $("#modalArticulo").remove();
//        $("#modalArticulo").modal('toggle');
        $("#modalArticulo").fadeOut();
//        $('#modalArticulo').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    });

    $("#btnCerrar").click(function () {
        //        $("#modalArticulo").remove();
//        $("#modalArticulo").modal('toggle');
        $("#modalArticulo").fadeOut();
//        $('#modalArticulo').modal('hide');
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
    })

</script>



