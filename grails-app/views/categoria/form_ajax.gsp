<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 10:04
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!categoria}">
    No se encontró categoría
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmCategoria" role="form" action="saveCategoria" method="POST">
        <g:hiddenField name="id" value="${categoria?.id}" />

        <div class="form-group ${hasErrors(bean: 'categoria', field: 'descripcion', 'error')} required">
            <span class="grupo">
                <label for="descripcion" class="col-md-2 control-label text-info">
                    Descripción
                </label>
                <div class="col-md-6">
                    <g:textArea name="descripcion" maxlength="255" required="" style="width: 400px; height: 40px;
                    resize: none" class="form-control required" value="${categoria?.descripcion}"/>
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
                                 value="${categoria?.orden}"/>
                </div>
                *
            </span>
        </div>
    </g:form>

    <script type="text/javascript">

        var validator = $("#frmCategoria").validate({
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