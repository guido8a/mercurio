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
            <td><a href="#" class="btn btn-sm btn-info btnEditar" title="Editar publicacion" data-fi="${publicacion?.fechaInicio?.format("dd-MM-yyyy")}" data-ff="${publicacion?.fechaFin?.format("dd-MM-yyyy")}" data-d="${publicacion?.destacado}" data-id="${publicacion?.id}"><i class="fa fa-edit"></i> </a> </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script type="text/javascript">

    $(".btnEditar").click(function () {
        var fi = $(this).data("fi");
        var ff = $(this).data("ff");
        var des = $(this).data("d");
        var id = $(this).data("id");
        $("#datetimepicker1").val(fi);
        $("#datetimepicker2").val(ff);
        if(des == '1'){
            // $("#inlineCheckbox1").ariaChecked = true
            $(".ui-switcher").attr("aria-checked",true)
        }else{
            $(".ui-switcher").attr("aria-checked",false)
        }

        $("#id").val(id);
        $(".btnAgregar").addClass("hidden");
        $(".btnGuardarS").removeClass("hidden");
        $(".btnCancelar").removeClass("hidden");
    });

</script>