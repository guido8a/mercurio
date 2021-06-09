<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/06/21
  Time: 10:44
--%>

<g:if test="${!tipoPago}">
    No se encontró el tipo de pago
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmTipoPago" role="form" action="saveTipoPago" method="POST">
        <g:hiddenField name="id" value="${tipoPago?.id}" />

        <div class="form-group ${hasErrors(bean: 'tipoPago', field: 'descripcion', 'error')} required">
            <span class="grupo">
                <label for="descripcion" class="col-md-2 control-label text-info">
                    Descripción
                </label>
                <div class="col-md-8">
                    <g:textField name="descripcion" maxlength="63" required="" class="form-control required" value="${tipoPago?.descripcion}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'tipoPago', field: 'dias', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Días
                </label>
                <div class="col-md-3">
                    <g:textField name="dias" maxlength="2" required="" class="form-control required" value="${tipoPago?.dias}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'tipoPago', field: 'tarifa', 'error')} required">
            <span class="grupo">
                <label for="tarifa" class="col-md-2 control-label text-info">
                    Tarifa
                </label>
                <div class="col-md-3">
                    <g:textField name="tarifa" required="" class="form-control required" value="${tipoPago?.tarifa}"/>
                </div>
            </span>
        </div>

        <div class="form-group ${hasErrors(bean: 'tipoPago', field: 'orden', 'error')}">
            <span class="grupo">
                <label class="col-md-2 control-label text-info">
                    Orden
                </label>
                <div class="col-md-3">
                    <g:textField name="orden" required="" class="digits form-control required" value="${tipoPago?.orden}"/>
                </div>
            </span>
        </div>

    </g:form>

    <script type="text/javascript">

        function validarNum(ev) {
            /*
             48-57      -> numeros
             96-105     -> teclado numerico
             188        -> , (coma)
             190        -> . (punto) teclado
             110        -> . (punto) teclado numerico
             8          -> backspace
             46         -> delete
             9          -> tab
             37         -> flecha izq
             39         -> flecha der
             */
            return ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
                (ev.keyCode >= 96 && ev.keyCode <= 105) ||
                // ev.keyCode == 190 || ev.keyCode == 110 ||
                ev.keyCode == 8 || ev.keyCode == 46 || ev.keyCode == 9 ||
                ev.keyCode == 37 || ev.keyCode == 39);
        }

        function validarNumPunto(ev) {
            /*
             48-57      -> numeros
             96-105     -> teclado numerico
             188        -> , (coma)
             190        -> . (punto) teclado
             110        -> . (punto) teclado numerico
             8          -> backspace
             46         -> delete
             9          -> tab
             37         -> flecha izq
             39         -> flecha der
             */
            return ((ev.keyCode >= 48 && ev.keyCode <= 57) ||
                (ev.keyCode >= 96 && ev.keyCode <= 105) ||
                ev.keyCode == 190 || ev.keyCode == 110 ||
                ev.keyCode == 8 || ev.keyCode == 46 || ev.keyCode == 9 ||
                ev.keyCode == 37 || ev.keyCode == 39);
        }

        $("#dias, #orden").keydown(function (ev) {
            return validarNum(ev)
        });

        $("#tarifa").keydown(function (ev) {
            return validarNumPunto(ev)
        });


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