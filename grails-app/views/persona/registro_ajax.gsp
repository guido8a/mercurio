<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 23/02/21
  Time: 12:21
--%>

<div class="modal-header">
    <h4 class="modal-title" style="text-align: center">Registro de usuarios</h4>
</div>

<g:form class="form-horizontal" name="frmRegistro" role="form" controller="persona" action="saveRegistro_ajax" method="POST">
    <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'tipoPersona', 'error')} required" style="margin-top: 20px">
        <div class="col-md-12">
            <span class="grupo">
                <label for="tipoPersona" class="col-md-4 control-label">
                    Tipo Persona
                </label>
                <div class="col-md-8">
                    <g:select name="tipoPersona" from="${['N': 'Natural', 'J':'Jurídica']}" optionKey="key" optionValue="value" class="form-control"/>
                </div>
            </span>
        </div>
    </div>

    <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'nombre', 'error')} required">
        <div class="col-md-12">
            <span class="grupo">
                <label for="nombre" class="col-md-4 control-label">
                    Nombre
                </label>

                <div class="col-md-8">
                    <g:textField name="nombre" maxlength="31" required="" class="form-control input-sm required"/>
                </div>
            </span>
        </div>
    </div>

    <div class="form-group keeptogether  ${hasErrors(bean: persona, field: 'apellido', 'error')}" id="divApellido">
        <div class="col-md-12" >
            <span class="grupo">
                <label for="apellido" class="col-md-4 control-label">
                    Apellido
                </label>

                <div class="col-md-8">
                    <g:textField name="apellido" maxlength="31" class="form-control input-sm"/>
                </div>
            </span>
        </div>
    </div>

    <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'mail', 'error')} required">
        <div class="col-md-12">
            <span class="grupo">
                <label for="mail" class="col-md-4 control-label">
                    E-mail
                </label>

                <div class="col-md-8">
                    <g:textField name="mail" maxlength="63" required="" class="email form-control input-sm unique noEspacios required"/>
                </div>
            </span>
        </div>
    </div>
</g:form>
%{--</div>--}%

<script type="text/javascript">

    cargarTipo($("#tipoPersona").val());


    $("#tipoPersona").change(function () {
        var tipo = $(this).val();
        cargarTipo(tipo)
    });

    function cargarTipo(tipo){
        if(tipo == '1'){
            $("#divApellido").hide()
        }else{
            $("#divApellido").show()
        }
    }

</script>