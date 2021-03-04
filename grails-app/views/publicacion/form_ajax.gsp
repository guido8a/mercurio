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
    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmPublicacion" role="form" action="savePublicacion" method="POST">
            <g:hiddenField name="id" value="${publicacion?.id}" />
            <g:hiddenField name="anuncio" value="${anuncio?.id}" />

            <div class="form-group ${hasErrors(bean: 'publicacion', field: 'anuncio', 'error')}">
                <span class="grupo">
                    <label class="col-md-2 control-label text-info">
                        Anuncio
                    </label>
                    <div class="col-md-5">
                       <span class="badge bg-primary"> ${anuncio?.titulo}</span>
                    </div>
                </span>

%{--                <span class="grupo">--}%
%{--                    <label class="col-md-2 control-label text-info">--}%
%{--                        Destacado--}%
%{--                    </label>--}%
%{--                    <div class="col-md-2 form-check form-check-inline" style="margin-top: 5px">--}%
%{--                        <input name="destacado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${publicacion?.destacado == '1' ? 'checked' : ''}>--}%
%{--                    </div>--}%
%{--                </span>--}%
            </div>

            <div class="form-group ${hasErrors(bean: 'publicacion', field: 'destacado', 'error')}">
                <span class="grupo">
                    <label class="col-md-2 control-label text-info">
                        Destacado
                    </label>
                    <div class="col-md-2 form-check form-check-inline" style="margin-top: 5px">
                        <input name="destacado" class="form-check-input" type="checkbox" id="inlineCheckbox1" ${publicacion?.destacado == '1' ? 'checked' : ''}>
                    </div>
                </span>
            </div>

            <div class="form-group ${hasErrors(bean: 'publicacion', field: 'fechaInicio', 'error')} required">
                <span class="grupo">
                    <label class="col-md-2 control-label text-info">
                        Fecha Inicio
                    </label>
                    <div class="col-md-3">
                        <input name="fechaInicio" id='datetimepicker1' type='text' required="" class="form-control required"/>
                    </div>
                </span>

                <span class="grupo">
                    <label class="col-md-2 control-label text-info">
                        Fecha Fin
                    </label>
                    <div class="col-md-3">
                        <input name="fechaFin" id='datetimepicker2' type='text' class="form-control"/>
                    </div>
                </span>

                <span>
                    <a href="#" class="btn btn-success btnAgregar" title="Agregar publicación"><i class="fa fa-plus"></i> </a>
                    <a href="#" class="btn btn-success btn-sm btnGuardarS hidden" title="Guardar"><i class="fa fa-save"></i> </a>
                    <a href="#" class="btn btn-warning btn-sm btnCancelar hidden" title="Cancelar edición"><i class="fa fa-times"></i> </a>
                </span>

            </div>

%{--            <div class="form-group ${hasErrors(bean: 'publicacion', field: 'fechaFin', 'error')}">--}%

%{--            </div>--}%

%{--            <div class="form-group ${hasErrors(bean: 'publicacion', field: 'destacado', 'error')}">--}%


%{--            </div>--}%

        </g:form>

        <div id="divTablaPublicacion">

        </div>
    </div>


    <script type="text/javascript">

        $(".btnAgregar, .btnGuardarS").click(function () {
            var $form = $("#frmPublicacion");
            if ($form.valid()) {
                var l = cargarLoader("Grabando...");
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'publicacion', action: 'savePublicacion')}',
                    // data:{
                        %{--anuncio: '${anuncio?.id}',--}%
                        %{--id: $("#id").val(),--}%
                        %{--fechaInicio: $("#datetimepicker1").val(),--}%
                        %{--fechaFin: $("#datetimepicker2").val(),--}%
                        %{--destacado : $("#des option:checked").val()--}%

                    // },
                    data    : $form.serialize(),
                    success: function (msg) {
                        l.modal("hide");
                        var parts = msg.split("_");
                        if(parts[0] == 'ok'){
                            log("Publicación agregada correctamente", "success");
                            cargarTablaPublicacion();
                        }else{
                            if(parts[0] == 'er'){
                                bootbox.alert(parts[1])
                            }else{
                                log("Error al agregar la publicación","error")
                            }
                        }

                    }
                })
            }
        });

        $(".btnCancelar").click(function () {
           $("#datetimepicker1").val('');
            $("#datetimepicker2").val('');
             $(".ui-switcher").attr("aria-checked",false)
            $("#id").val('');
            $(".btnAgregar").removeClass("hidden");
            $(".btnGuardarS").addClass("hidden");
            $(".btnCancelar").addClass("hidden");
        });

        cargarTablaPublicacion();

        function cargarTablaPublicacion(){
            $.ajax({
                type: 'POST',
                url: '${createLink(controller: 'publicacion', action: 'tablaPublicacion_ajax')}',
                data:{
                    id: '${anuncio?.id}'
                },
                success: function (msg) {
                    $("#divTablaPublicacion").html(msg)
                }
            })
        }

        $(function () {
            $('#datetimepicker1, #datetimepicker2').datetimepicker({
                locale: 'es',
                format: 'DD-MM-YYYY',
                showClose: true,
                icons: {
                    close: 'closeText'
                }
            });
        });

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