<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 10/02/21
  Time: 11:13
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!anuncio}">
    No se encontró el anuncio
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmAnuncio" role="form" action="saveAnuncio" method="POST">
        <g:hiddenField name="id" value="${anuncio?.id}" />
        <g:hiddenField name="promotor" value="${promotor?.id}" />

        <div class="form-group ${hasErrors(bean: 'anuncio', field: 'categoria', 'error')}">
            <span class="grupo">
                <label for="categoria" class="col-md-2 control-label text-info">
                    Categoría
                </label>
                <div class="col-md-6">
                    <g:select name="categoria" from="${ventas.Categoria.list().sort{it.descripcion}}" class="form-control" optionKey="id" optionValue="descripcion" value="${anuncio?.subcategoria?.categoria?.id}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'anuncio', field: 'categoria', 'error')}">
            <span class="grupo">
                <label for="categoria" class="col-md-2 control-label text-info">
                    Subcategoría
                </label>
                <div class="col-md-6" id="divSubcategoria">
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'anuncio', field: 'nombre', 'error')} required">
            <span class="grupo">
                <label for="nombre" class="col-md-2 control-label text-info">
                    Nombre
                </label>
                <div class="col-md-6">
                    <g:textField name="nombre" maxlength="63" required="" class="form-control required" value="${anuncio?.nombre}"/>
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'anuncio', field: 'descripcion', 'error')}">
            <span class="grupo">
                <label for="descripcion" class="col-md-2 control-label text-info">
                    Descripción
                </label>
                <div class="col-md-6">
                    <g:textArea name="descripcion" maxlength="255" style="width: 400px; height: 70px;
                    resize: none" class="form-control" value="${anuncio?.descripcion}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'anuncio', field: 'estado', 'error')}">
            <span class="grupo">
                <label for="estado" class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-6 form-check form-check-inline" style="margin-top: 5px">
                    <input name="estado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${anuncio?.estado == '1' ? 'checked' : ''}> <span class="badge bg-primary">OK=Activo, No=Inactivo</span>
                </div>
            </span>
        </div>

    </g:form>

    <script type="text/javascript">

        $("#categoria").change(function () {
            var id = $(this).val();
            cargarSubcategoria(id)
        });

        cargarSubcategoria($("#categoria").val());

        function cargarSubcategoria(id){
            $.ajax({
                type: 'POST',
                url: '${createLink(controller: 'anuncio', action: 'subcategoria_ajax')}',
                data:{
                    id: id,
                    anuncio: $("#id").val()
                },
                success: function (msg) {
                    $("#divSubcategoria").html(msg)
                }
            });
        }

        $.switcher('input[type=checkbox]');

        var validator = $("#frmAnuncio").validate({
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