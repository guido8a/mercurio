<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 23/02/21
  Time: 12:21
--%>


<div class="modal-header">
    <h4 class="modal-title" style="text-align: center">Registro en el Sistema</h4>
</div>

<g:form class="form-horizontal" name="frmRegistro" role="form" controller="persona" action="saveRegistro_ajax" method="POST">
    <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'tipoPersona', 'error')} required" style="margin-top: 20px">
        <div class="row form-group">
                <label for="tipoPersona" class="col-md-3 control-label">
                    Tipo de persona
                </label>
                <div class="col-md-8 input-group">
                    <span class="input-group-text" id="basic-addon2"><i class="fa fa-user-friends"></i></span>
                    <g:select name="tipoPersona" from="${['N': 'Natural', 'J':'Jurídica']}" optionKey="key"
                              optionValue="value" class="form-control"/>
                </div>
        </div>
    </div>

    <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'nombre', 'error')} required">
        <div class="row form-group">
                <label for="nombre" class="col-md-3 control-label">
                    Nombre
                </label>

                <div class="col-md-8 input-group">
                    <span class="input-group-text" id="basic-addon2"><i class="fa fa-user"></i></span>
                    <g:textField name="nombre" minlength="5" maxlength="31" required="" class="form-control input-sm required"/>
                </div>
        </div>
    </div>

    <div class="form-group keeptogether  ${hasErrors(bean: persona, field: 'apellido', 'error')}" id="divApellido">
        <div class="row form-group" >
                <label for="apellido" class="col-md-3 control-label">
                    Apellido
                </label>

                <div class="col-md-8 input-group">
                    <span class="input-group-text" id="basic-addon3"><i class="fa fa-id-card"></i></span>
                    <g:textField name="apellido" minlength="5" maxlength="31" class="form-control input-sm"/>
                </div>
        </div>
    </div>

    <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'mail', 'error')} required">
        <div class="row form-group">
                <label for="mail" class="col-md-3 control-label">
                    E-mail
                </label>

                <div class="col-md-8 input-group">
                    <span class="input-group-text" id="basic-addon4"><i class="fa fa-envelope"></i></span>
                    <g:textField name="mail" maxlength="63" required="" class="email form-control input-sm unique noEspacios required"/>
                </div>
        </div>
    </div>
%{--    <br/>--}%
    <br><i class="fa fa-exclamation-circle text-warning"></i> La clave de acceso será enviada a su <strong>correo electrónico</strong>
</g:form>
%{--</div>--}%

<script type="text/javascript">

    cargarTipo($("#tipoPersona").val());


    $("#tipoPersona").change(function () {
        var tipo = $(this).val();
        cargarTipo(tipo)
    });

    function cargarTipo(tipo){
        if(tipo == 'J'){
            $("#divApellido").hide()
        }else{
            $("#divApellido").show()
        }
    }

</script>