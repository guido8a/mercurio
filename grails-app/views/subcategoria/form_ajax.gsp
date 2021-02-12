<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 10:04
--%>

<g:if test="${!subcategoria}">
    No se encontró subcategoría
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmSubcategoria" role="form" action="saveSubcategoria" method="POST">
        <g:hiddenField name="id" value="${subcategoria?.id}" />

        <div class="form-group ${hasErrors(bean: 'subcategoria', field: 'categoria', 'error')} required">
            <span class="grupo">
                <label for="categoria" class="col-md-2 control-label text-info">
                    Categoría
                </label>
                <div class="col-md-6">
                    <g:select name="categoria" from="${ventas.Categoria.list().sort{it.descripcion}}" optionValue="descripcion" optionKey="id" class="form-control" value="${subcategoria?.categoria?.id}"/>
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'categoria', field: 'descripcion', 'error')} required">
            <span class="grupo">
                <label for="descripcion" class="col-md-2 control-label text-info">
                    Descripción
                </label>
                <div class="col-md-6">
                    <g:textArea name="descripcion" maxlength="63" required="" style="width: 400px; height: 40px;
                    resize: none" class="form-control required" value="${subcategoria?.descripcion}"/>
                </div>
                *
            </span>
        </div>
        <div class="form-group ${hasErrors(bean: 'categoria', field: 'descripcion', 'error')} required">
            <span class="grupo">
                <label for="orden" class="col-md-2 control-label text-info">
                    Orden
                </label>
                <div class="col-md-2">
                    <g:textField name="orden" maxlength="2" required="" class="digits form-control required"
                                 value="${subcategoria?.orden}"/>
                </div>
                *
            </span>
        </div>
    </g:form>

    <script type="text/javascript">

        var validator = $("#frmSubcategoria").validate({
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