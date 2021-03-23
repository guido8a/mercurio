<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 23/03/21
  Time: 16:10
--%>

<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 10:04
--%>

<g:if test="${!atributoCategoria}">
    No se encontró el atributo
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmAtributo" role="form" action="saveAtributo" method="POST">
        <g:hiddenField name="id" value="${atributoCategoria?.id}" />
        <g:hiddenField name="subcategoria" value="${subcategoria?.id}" />

        <div class="form-group ${hasErrors(bean: 'atributoCategoria', field: 'subcategoria', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Subcategoría
                </label>
                <div class="col-md-6">
                    <span class="badge bg-primary">${subcategoria?.descripcion}</span>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'atributoCategoria', field: 'atributo', 'error')}">
            <span class="grupo">
                <label for="atributo" class="col-md-2 control-label text-info">
                    Atributo
                </label>
                <div class="col-md-6">
                    <g:select name="atributo" from="${ventas.Atributo.list().sort{it.descripcion}}" optionValue="descripcion" optionKey="id" class="form-control"/>
                </div>
            </span>
        </div>
    </g:form>

    <script type="text/javascript">

        var validator = $("#frmAtributo").validate({
            errorClass     : "help-block",
            errorPlacement : function (error, element) {
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
                element.parents(".grupo").addClass('has-error');
            },
            success        : function (label) {
                label.parents(".grupo").removeClass('has-error');
            }
        });

        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitForm();
                return false;
            }
            return true;
        });
    </script>
</g:else>