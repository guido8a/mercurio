<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 23/02/21
  Time: 12:21
--%>

<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmRegistro" role="form" controller="persona" action="saveRegistro_ajax" method="POST">
        <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'tipoPersona', 'error')} required">
            <div class="col-md-6">
                <span class="grupo">
                    <label for="tipoPersona" class="col-md-4 control-label">
                        Tipo Persona
                    </label>
                    <div class="col-md-8">
                        <g:select name="tipoPersona" from="${[0: 'Natural', 1:'Jurídica']}" optionKey="key" optionValue="value" class="form-control"/>
                    </div>
                </span>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'nombre', 'error')} ${hasErrors(bean: persona, field: 'apellido', 'error')} required">
            <div class="col-md-6">
                <span class="grupo">
                    <label for="nombre" class="col-md-4 control-label">
                        Nombre
                    </label>

                    <div class="col-md-8">
                        <g:textField name="nombre" maxlength="40" required="" class="form-control input-sm required"/>
                    </div>
                </span>
            </div>

            <div class="col-md-6" id="divApellido">
                <span class="grupo">
                    <label for="apellido" class="col-md-4 control-label">
                        Apellido
                    </label>

                    <div class="col-md-8">
                        <g:textField name="apellido" maxlength="40" required="" class="form-control input-sm"/>
                    </div>
                </span>
            </div>
        </div>

        <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'mail', 'error')} required">
            <div class="col-md-6">
                <span class="grupo">
                    <label for="mail" class="col-md-4 control-label">
                        E-mail
                    </label>

                    <div class="col-md-8">
                        <div class="input-group input-group-sm"><span class="input-group-addon"><i class="fa fa-envelope"></i>
                        </span><g:field type="email" name="mail" maxlength="63" class="form-control input-sm unique noEspacios"/>
                        </div>
                    </div>
                </span>
            </div>
        </div>
    </g:form>
</div>

<script type="text/javascript">

    // $("#")


</script>