<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/02/21
  Time: 14:01
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!vendedor}">
    No se encontró vendedor
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmVendedor" role="form" action="saveVendedor" method="POST">
        <g:hiddenField name="id" value="${vendedor?.id}" />
        <g:hiddenField name="promotor" value="${promotor?.id}" />

        <div class="form-group ${hasErrors(bean: 'vendedor', field: 'promotor', 'error')} required">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Promotor
                </label>
                <div class="col-md-4">
                    <span class="badge rounded-pill bg-info">${promotor?.nombre + (promotor?.apellido ? promotor?.apellido : '')}</span>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'vendedor', field: 'nombre', 'error')} required">
            <span class="grupo">
                <label for="nombre" class="col-md-2 control-label text-info">
                    Nombre
                </label>
                <div class="col-md-6">
                    <g:textField name="nombre" maxlength="31" required="" class="form-control required" value="${vendedor?.nombre}"/>
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'vendedor', field: 'apellido', 'error')} required">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Apellido
                </label>
                <div class="col-md-6">
                    <g:textField name="apellido" maxlength="31" class="form-control required" value="${vendedor?.apellido}"/>
                </div>
            </span>
        </div>


        <div class="form-group ${hasErrors(bean: 'vendedor', field: 'telefono', 'error')}">
            <span class="grupo">
                <label for="telefono" class="col-md-2 control-label text-info">
                    Teléfono
                </label>
                <div class="col-md-6">
                    <g:textField name="telefono" maxlength="63"  class="digits form-control" value="${vendedor?.telefono}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'vendedor', field: 'mail', 'error')}">
            <span class="grupo">
                <label for="mail" class="col-md-2 control-label text-info">
                    Email
                </label>
                <div class="col-md-6">
                    <g:textField name="mail" maxlength="63"  class="email form-control" value="${vendedor?.mail}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'estado', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-6 form-check form-check-inline" style="margin-top: 5px">
                    <input name="estado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${vendedor?.estado == '1' ? 'checked' : ''}> <span class="badge bg-primary">OK=Activo, No=Inactivo</span>
                </div>
            </span>
        </div>

    </g:form>

    <script type="text/javascript">

        $.switcher('input[type=checkbox]');

        var validator = $("#frmVendedor").validate({
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