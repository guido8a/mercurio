%{--<h2 class="my-2">Categorías</h2>--}%
<h2 class="titulo">Categorías</h2>
<div class="list-group">
    <g:each in="${ventas.Categoria.findAll([sort: 'orden'])}" var="ct">
        <a href="#" class="item_cat categoria ${ct.id== activo?'act_ct': ''}" id="ct_${ct?.id}">${ct.descripcion}</a>
        <g:if test="${ct?.id == activo}">
            <g:each in="${ventas.Subcategoria.findAllByCategoria(ct, [sort: 'orden'])}" var="sbct">
                <a href="#" class="categoria subcat ${sbct.id==sbct_actv?'activo': ''}" id="sbct_${sbct?.id}">${sbct.descripcion}</a>
            </g:each>
        </g:if>
    </g:each>
</div>

<script type="text/javascript">

    $(function () {
        $(".item_cat").click(function () {
            var id = $(this).attr("id")
            console.log("cat33", id)
            cargarCategorias(id, '');
        });

        $(".subcat").click(function () {
            // var ct = $(".categoria").siblings().attr("id")
            // console.log("subcat", ct)
            $(".subcat").removeClass("activo")
            $(this).addClass("activo")
            // var dato = $('#bsca').val()
            %{--location.href="${createLink(controller: 'principal', action: 'buscar')}?bscr=" + dato + "&sbct=" + $(this).attr("id")--}%
            location.href="${createLink(controller: 'principal', action: 'buscar')}?sbct=" + $(this).attr("id")
        });
    });

    $(".titulo").mousedown(function () {
        console.log("ttsubcat")
        cargarCategorias($(this).attr("id"));
    });

</script>