<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 17/02/21
  Time: 13:21
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!producto}">
    No se encontró el producto
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmProducto" role="form" action="saveProducto" method="POST">
        <g:hiddenField name="id" value="${producto?.id}" />
        <g:hiddenField name="anuncio" value="${anuncio?.id}" />

        <div class="form-group">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Anuncio
                </label>
                <div class="col-md-6">
                    <span class="badge bg-primary">${anuncio?.nombre}</span>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')} required">
            <span class="grupo">
                <label for="titulo" class="col-md-2 control-label text-info">
                    Título
                </label>
                <div class="col-md-8">
                    <g:textField name="titulo" maxlength="255" required="" class="form-control required" value="${producto?.titulo}"/>
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Subtítulo
                </label>
                <div class="col-md-8">
                    <g:textField name="subtitulo" maxlength="255" class="form-control" value="${producto?.subtitulo}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'producto', field: 'orden', 'error')} required">
            <span class="grupo">
                <label for="orden" class="col-md-2 control-label text-info">
                    Orden
                </label>
                <div class="col-md-3">
                    <g:textField name="orden" maxlength="2" required="" class="digits form-control required" value="${producto?.orden}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'estado', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-6 form-check form-check-inline" style="margin-top: 5px">
                    <input name="estado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${producto?.estado == '1' ? 'checked' : ''}> <span class="badge bg-primary">OK=Activo, No=Inactivo</span>
                </div>
            </span>
        </div>

    </g:form>

    <script type="text/javascript">

        $.switcher('input[type=checkbox]');

        var validator = $("#frmProducto").validate({
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