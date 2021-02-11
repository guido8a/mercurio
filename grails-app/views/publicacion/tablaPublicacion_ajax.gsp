<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 15:41
--%>

<table class="table table-bordered table-hover table-condensed" style="width: 100%">
    <thead>
    <tr>
        <th class="alinear" style="width: 40%">Fecha Inicio</th>
        <th class="alinear" style="width: 50%">Fecha Fin</th>
        <th class="alinear" style="width: 10%"><i class="fa fa-edit"></i> </th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${publicaciones}" var="publicacion">
        <tr>
            <td>${publicacion?.fechaInicio?.format("dd-MM-yyyy")}</td>
            <td>${publicacion?.fechaFin?.format("dd-MM-yyyy")}</td>
%{--            <td>${g.formatNumber(number: sueldo?.valor ?: 0, format: '##,##0', maxFractionDigits: 2, minFractionDigits: 2, locale: 'en_US')}</td>--}%
            <td><a href="#" class="btn btn-sm btn-info btnEditar" title="Editar sueldo" data-fi="${publicacion?.fechaInicio}" data-ff="${publicacion?.fechaFin}" data-id="${publicacion?.id}"><i class="fa fa-edit"></i> </a> </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script type="text/javascript">

    $(".btnEditar").click(function () {
        var anio = $(this).data("anio");
        var valor = $(this).data("valor");
        var sueldo = $(this).data("id");
        $("#anio").val(anio);
        $("#valor").val(valor);
        $("#id").val(sueldo);
        $(".btnAgregar").addClass("hidden");
        $(".btnGuardarS").removeClass("hidden");
        $(".btnCancelar").removeClass("hidden");
    });

</script>