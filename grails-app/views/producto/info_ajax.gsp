<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/06/21
  Time: 12:23
--%>

<div class="container">
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

</div>


