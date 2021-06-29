<util:renderHTML html="${msg}"/>

<style type="text/css">
table {
    table-layout: fixed;
    overflow-x: scroll;
}
th, td {
    overflow: hidden;
    text-overflow: ellipsis;
    word-wrap: break-word;
}

.conAnuncio {
    /*background-color: #fffff8;*/
    color: #444;
}
.pagado {
    /*background-color: #f8fff8;*/
    color: #000;
    /*font-weight: bold;*/
}
.sinAnuncio {
    background-color: #efefef;
    color: #444;
}
.retrasado {
    background-color: #fff0f0;
    /*color: #444;*/
}
.externo {
    background-color: #ffdede;
    color: #444;
}
.reg {
    color: #286e9f;
}
.noReg {
    font-weight: bold;
    color: #aa6;
}
.centrado {
    text-align: center;
    font-weight: bold;
}

.activo {
    background-color: #efffef;
    color: #444;
}


</style>

<div class="" style="width: 99.7%;height: ${msg == '' ? 600 : 575}px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="1060px">
        <g:each in="${data}" var="dato" status="z">
            <g:set var="clase" value="${''}"/>
            <g:if test="${dato.tppg__id == 5}">
                <g:set var="clase" value="${''}"/>
            </g:if>
            <g:else>
                <g:if test="${dato.tppg__id}">
                    <g:set var="clase" value="${'pagado'}"/>
                </g:if>
            </g:else>
            <g:if test="${dato?.anunadmn == 'R'}">
                <g:set var="clase" value="${clase + ' retrasado'}"/>
            </g:if>
            <g:if test="${dato?.anunactv == 'S'}">
                <g:set var="clase" value="${clase + ' activo'}"/>
            </g:if>
            <g:if test="${!dato?.anun__id}">
                <g:set var="clase" value="${clase + ' sinAnuncio'}"/>
            </g:if>

            <tr id="${dato.prsn__id}" data-id="${dato.anun__id}" data-prod="${dato.prod__id}"
                class="${clase}" title="${dato.etdo}">
                <td width="15%">
                    ${dato?.prsnnmbr}
                </td>

                <td width="20%">
                    ${dato?.prodtitl}
                </td>

                <td width="22%">
                    <g:if test="${dato.tppg__id == 5}">
                        ${dato?.tppgdscr}
                    </g:if>
                    <g:else>
                            ${dato?.tppgdscr}
                        <span style="float: right">
                            <g:if test="${dato?.anunetdo == 'A'}">
                                <a href="#" class="btn btn-xs btn-rojo btn-sm btnRevisarPago" title="Revisar el pago"
                                   data-id="${dato?.prod__id}" data-anun="${dato?.anun__id}"><i class="fab fa-product-hunt"></i> </a>
                            </g:if>
                        </span>
                    </g:else>
                </td>
                <td width="8%">
                    ${dato.prodfcmd?.format("dd-MMM-yyyy")}
                </td>

                <td width="8%">
                    ${dato?.anunfcin?.format("dd-MMM-yyyy")}
                </td>

                <td width="8%">
                    ${dato.anunfcfn?.format("dd-MMM-yyyy")}
                </td>

                <td width="5%" class="centrado">
                    ${dato.anunetdo}
                </td>
%{--
                <td width="5%" class="centrado">
                    <g:if test="${dato?.pago__id}">
                        <a href="#" class="btn btn-rojo btn-xs btnVerPago" title="Pago del producto"
                           data-id="${dato?.anun__id}"><i class="fa fa-dollar-sign"></i> </a>
                    </g:if>
                </td>
--}%

                <td width="14%" class="centrado">
                    <a href="#" class="btn btn-xs btn-gris btn-sm btnRevisar" title="Revisar el anuncio"
                       data-id="${dato?.prod__id}" data-anun="${dato?.anun__id}"><i class="fa fa-search"></i> </a>

                    <g:if test="${dato?.anunetdo == 'R'}">
                        <g:if test="${dato?.pago__id}">
                            <a href="#" class="btn btn-rojo btn-xs btnVerPago" title="Pago del producto"
                               data-id="${dato?.anun__id}"><i class="far fa-thumbs-up"fa fa-dollar-sign"></i> </a>
                        </g:if>
                        <g:else>
                            <a href="#" class="btn btn-xs btn-rojo btn-sm btnAceptar" title="Aceptar el anuncio"
                               data-id="${dato?.anun__id}"><i class="fas fa-thumbs-up"></i> </a>
                        </g:else>
                        <a href="#" class="btn btn-xs btn-gris btn-sm btnNegar" title="Negar el anuncio"
                           data-id="${dato?.anun__id}"><i class="fa fa-thumbs-down"></i> </a>

                    </g:if>
                <g:if test="${dato?.anunactv == 'S'}">
                    <a href="#" class="btn btn-xs btn-rojo btnQuitarAnuncio" title="Quitar anuncio"
                       data-id="${dato?.prod__id}" data-titulo="${dato?.prodtitl}"><i
                            class="fas fa-skull-crossbones"></i></a>
                </g:if>
                <g:if test="${dato?.prodpreg > 0}">
                    <a href="#" class="btn btn-xs btn-rojo btnPreguntas" title="Preguntas al anunciante"
                       data-id="${dato?.prod__id}" data-titulo="${dato?.prodtitl}"><i
                            class="fas fa-question-circle"></i></a>
                </g:if>
                </td>

            </tr>
        </g:each>
    </table>
</div>


<script type="text/javascript">

    $(".btnRevisarPago").click(function () {
        var id = $(this).data("anun");
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'anuncio', action:'revisarPago_ajax')}",
            data    : {
                id: id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgRevisaPago",
                    title   : "Ver comprobante de Pago",
                    message : msg,
                    // class : "modal-lg",
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    });


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

        $(".btnVerPago").click(function () {
            var id = $(this).data("id");
            console.log('anuncio-pago', id)
            verPago(id);
        });

        $(".btnRevisar").click(function () {
            var id = $(this).data("id");
            var anun = $(this).data("anun");
            location.href="${createLink(controller: 'ver', action: 'carrusel')}?id=" + id + "&anun=" + anun + "&tipo=" + 4;
        });

        $(".btnPreguntas").click(function () {
            var id = $(this).data("id");
            location.href="${createLink(controller: 'pregunta', action: 'list')}";
        });

        $(".btnAceptar").click(function () {
            var id = $(this).data("id");
            aceptarAnuncio(id)
        });

        $(".btnNegar").click(function () {
            var id = $(this).data("id");
            negarProducto(id)
        });

        $(".btnQuitarAnuncio").click(function () {
            var id = $(this).data("id");
            var prod = $(this).data("titulo");
            // console.log('prod', prod, 'id', id)
            quitarAnuncio(id, prod)
        });
    });

</script>
