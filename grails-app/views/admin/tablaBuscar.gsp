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
    background-color: #fffff8;
    color: #444;
}
.sinAnuncio {
    background-color: #efefef;
    color: #444;
}
.retrasado {
    background-color: #ffe0e0;
    color: #444;
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
</style>

<g:set var="clase" value="${'conAnuncio'}"/>
<g:set var="clase2" value="${'sinAnuncio'}"/>
<g:set var="claseR" value="${'retrasado'}"/>

<div class="" style="width: 99.7%;height: ${msg == '' ? 600 : 575}px; overflow-y: auto;float: right; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="1060px">
        <g:each in="${data}" var="dato" status="z">

            <tr id="${dato.prsn__id}" data-id="${dato.anun__id}" data-prod="${dato.prod__id}"
                class="${dato.anunetdo == 'R'? claseR : dato.anun__id? clase: ''}">
                <td width="15%">
                    ${dato?.prsnnmbr}
                </td>

                <td width="20%" class="text-info">
                    ${dato?.prodtitl}
                </td>

                <td width="15%" style="color:#186063">
                    ${dato?.tppgdscr}
                </td>
                <td width="8%">
                    ${dato.prodfcmd?.format("dd-MMM-yyyy")}
                </td>

                <td width="8%" class="text-info">
                    ${dato?.anunfcin?.format("dd-MMM-yyyy")}
                </td>

                <td width="8%" class="text-info">
                    ${dato.anunfcfn?.format("dd-MMM-yyyy")}
                </td>

                <td width="5%" class="centrado">
                    ${dato.anunetdo}
                </td>
                <td width="5%" class="text-info">
%{--                    ${dato.pagofcha}--}%
                    <g:if test="${dato?.pago__id}">
                        <a href="#" class="btn btn-rojo btn-xs btnVerPago" title="Pago del producto"
                           data-id="${dato?.anun__id}"><i class="fa fa-dollar-sign"></i> </a>
                    </g:if>
                    <g:else>
                        NA
                    </g:else>

                </td>

                <td width="16%" class="text-info">
                    Acciones
                </td>

            </tr>
        </g:each>
    </table>
</div>


<script type="text/javascript">
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

    });


</script>
