<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 01/03/21
  Time: 15:35
--%>

<style>

.lineaAt {
    height: 1px;
    background-color: #5596ff;
}
</style>

<table class="table table-condensed table-bordered">
    <thead>
    <tr style="width: 80%">
        <th style="width: 70%" colspan="3">Atributos del producto</th>
    </tr>
    <tr style="width: 80%">
        <th style="width: 70%">Nombre</th>
        <th style="width: 20%">Valor</th>
        <th style="width: 10%"><i class="fa fa-trash text-danger"></i> </th>
    </tr>
    </thead>
</table>

<div class=""  style="width: 99.7%;height: ${atributos.size() * 50}px; overflow-y: auto; margin-top: -20px">
    <table class="table-bordered table-condensed table-hover" width="100%">
        <tbody id="tabla_bandeja">
        <g:each in="${atributos}" var="atributo">
            <tr style="width: 100%">
                <td style="width: 70%; text-align: left">
                    <span>${atributo?.atributoCategoria?.atributo?.descripcion}</span>
                </td>
                <td style="width: 20%">${atributo?.valor}</td>
                <td style="width: 10%">
                    <a href="#" class="btn btn-xs btn-danger btnQuitarAt" data-id="${atributo?.id}"><i class="fa fa-trash"></i> </a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>


<script type="text/javascript">

    $(".btnQuitarAt").click(function () {
        var id = $(this).data("id");
        bootbox.confirm("Está seguro que desea borrar este atributo?", function (res) {
            if (res) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'producto', action: 'borrarAtributo_ajax')}',
                    data:{
                        id: id
                    },
                    success: function (msg) {
                        if(msg== 'ok'){
                            log("Borrado correctamente","success");
                            cargarAtributos();
                        }else{
                            log("Error al borrar el atributo","error")
                        }
                    }
                });
            }
        });
    });

</script>