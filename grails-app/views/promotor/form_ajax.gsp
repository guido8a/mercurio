<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 08/02/21
  Time: 12:29
--%>

<asset:javascript src="/apli/jquery.switcher.js"/>
<asset:stylesheet src="/apli/switcher.css"/>

<g:if test="${!promotor}">
    <elm:notFound elem="Promotor" genero="o" />
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmPromotor" role="form" action="savePromotor" method="POST">
        <g:hiddenField name="id" value="${promotor?.id}" />

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'canton', 'error')} required">
            <span class="grupo">
                <label for="provincia" class="col-md-2 control-label text-info">
                    Provincia
                </label>
                <div class="col-md-4">
                    <g:select name="provincia" from="${geografia.Provincia.list().sort{it.nombre}}" optionValue="nombre" optionKey="id" class="form-control" value="${promotor?.canton?.provincia?.id}"/>
                </div>
                <label class="col-md-1 control-label text-info">
                    Cantón
                </label>
                <div class="col-md-5" id="divCanton">

                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'nombre', 'error')}">
            <span class="grupo">
                <label for="tipo" class="col-md-2 control-label text-info">
                    Tipo
                </label>
                <div class="col-md-6">
                   <g:select name="tipo" from="${[0:'Natural', 1:'Jurídico']}" class="form-control" optionKey="key" optionValue="value" value="${promotor?.tipo}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'nombre', 'error')} required">
            <span class="grupo">
                <label for="nombre" class="col-md-2 control-label text-info">
                    Nombre
                </label>
                <div class="col-md-6">
                    <g:textField name="nombre" maxlength="63" required="" class="form-control required" value="${promotor?.nombre}"/>
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'apellido', 'error')}" id="divApellido">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Apellido
                </label>
                <div class="col-md-6">
                    <g:textField name="apellido" maxlength="31" class="form-control" value="${promotor?.apellido}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'ruc', 'error')} required">
            <span class="grupo">
                <label for="ruc" class="col-md-2 control-label text-info">
                    RUC
                </label>
                <div class="col-md-4">
                    <g:textField name="ruc" maxlength="13" required="" class="digits form-control required" value="${promotor?.ruc}"/>
                </div>
                *
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'direccion', 'error')}">
            <span class="grupo">
                <label for="direccion" class="col-md-2 control-label text-info">
                    Dirección
                </label>
                <div class="col-md-6">
                    <g:textArea name="direccion" maxlength="255" style="width: 430px; height: 60px; resize: none;" class="form-control" value="${promotor?.direccion}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'telefono', 'error')}">
            <span class="grupo">
                <label for="telefono" class="col-md-2 control-label text-info">
                    Teléfono
                </label>
                <div class="col-md-6">
                    <g:textField name="telefono" maxlength="127"  class="digits form-control" value="${promotor?.telefono}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'mail', 'error')}">
            <span class="grupo">
                <label for="mail" class="col-md-2 control-label text-info">
                    Email
                </label>
                <div class="col-md-6">
                    <g:textField name="mail" maxlength="63"  class="email form-control" value="${promotor?.mail}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'observaciones', 'error')}">
            <span class="grupo">
                <label for="observaciones" class="col-md-2 control-label text-info">
                    Observaciones
                </label>
                <div class="col-md-6">
                    <g:textField name="observaciones" maxlength="8"  class="form-control" value="${promotor?.observaciones}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'promotor', field: 'estado', 'error')}">
            <span class="grupo">
                <label for="estado" class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-6 form-check form-check-inline" style="margin-top: 5px">
                    <input name="estado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${promotor?.estado == '1' ? 'checked' : ''}> <span class="badge bg-primary">OK=Activo, No=Inactivo</span>
                </div>
            </span>
        </div>

    </g:form>

    <script type="text/javascript">

        $.switcher('input[type=checkbox]');

        cargarApellido($("#tipo").val());

        $("#tipo").change(function () {
            var id = $(this).val();
            cargarApellido(id)
        });

        function cargarApellido(id){
            if(id == 1){
                $("#divApellido").addClass("hidden")
            }else{
                $("#divApellido").removeClass("hidden")
            }
        }

        $("#provincia").change(function () {
            var id = $(this).val();
            var idPromotor = $("#id").val();
            cargarCanton(id,idPromotor);
        });

        cargarCanton($("#provincia").val(),$("#id").val());

        function cargarCanton(id, promotor) {
            $.ajax({
                type: 'POST',
                url: '${createLink(controller: 'promotor', action: 'canton_ajax')}',
                data:{
                    id:id,
                    promotor: promotor
                },
                success: function (msg){
                    $("#divCanton").html(msg)
                }
            })
        }

        var validator = $("#frmPromotor").validate({
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