<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 13:29
--%>

<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 11:13
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!publicacion}">
    No se encontró la publicación
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmPublicacion" role="form" action="savePublicacion" method="POST">
        <g:hiddenField name="id" value="${publicacion?.id}" />
        <g:hiddenField name="anuncio" value="${anuncio?.id}" />

        <div class="form-group ${hasErrors(bean: 'publicacion', field: 'anuncio', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Anuncio
                </label>
                <div class="col-md-6">
                   ${anuncio?.nombre}
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'publicacion', field: 'fechaInicio', 'error')} required">
            <span class="grupo">
                <label for="fechaInicio" class="col-md-2 control-label text-info">
                    Fecha Inicio
                </label>
                <div class="col-md-6">

                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'publicacion', field: 'fechaFin', 'error')}">
            <span class="grupo">
                <label for="fechaFin" class="col-md-2 control-label text-info">
                   Fecha Fin
                </label>
                <div class="col-md-6">

                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'publicacion', field: 'destacado', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Destacado
                </label>
                <div class="col-md-6 form-check form-check-inline" style="margin-top: 5px">
                    <input name="destacado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${publicacion?.destacado == '1' ? 'checked' : ''}>
                </div>
            </span>
        </div>

    </g:form>

    <script type="text/javascript">

        $.switcher('input[type=checkbox]');

        var validator = $("#frmPublicacion").validate({
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