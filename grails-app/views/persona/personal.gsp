<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Configuración</title>

    <style type="text/css">
    .auth {
        width : 155px !important;
    }
    </style>

</head>

<body>

<div>

    <!-- Nav tabs -->
    <ul class="nav nav-pills" role="tablist">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Datos de la cuenta</a></li>
%{--        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"></a></li>--}%
        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Datos de contacto</a></li>
        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Cambiar password</a></li>
    </ul>


    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">

            <div class="panel panel-info" style="margin-top: 10px">
                <div class="panel-heading" role="tab" id="headerInfo">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#info" aria-expanded="true" aria-controls="info">
                            Datos de la cuenta
                        </a>
                    </h4>
                </div>
                <div id="info" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headerInfo">
                    <div class="panel-body">

                        <g:form class="form-horizontal" name="frmRegistro" role="form" controller="persona" action="savePersona_ajax" method="POST">

                            <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'tipoPersona', 'error')} required" style="margin-top: 20px">
                                <div class="col-md-12">
                                    <span class="grupo">
                                        <label for="tipoPersona" class="col-md-3 control-label">
                                            Tipo Persona
                                        </label>
                                        <div class="col-md-6">
                                            <g:select name="tipoPersona" from="${['N': 'Natural', 'J':'Jurídica']}" optionKey="key"
                                                      optionValue="value" class="form-control" value="${persona?.tipoPersona}"/>
                                        </div>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'nombre', 'error')} required">
                                <div class="col-md-12">
                                    <span class="grupo">
                                        <label for="nombre" class="col-md-3 control-label">
                                            Nombre
                                        </label>

                                        <div class="col-md-6">
                                            <g:textField name="nombre" maxlength="31" required="" class="form-control input-sm required" value="${persona?.nombre}"/>
                                        </div>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group keeptogether  ${hasErrors(bean: persona, field: 'apellido', 'error')}" id="divApellido">
                                <div class="col-md-12" >
                                    <span class="grupo">
                                        <label for="apellido" class="col-md-3 control-label">
                                            Apellido
                                        </label>

                                        <div class="col-md-6">
                                            <g:textField name="apellido" maxlength="31" class="form-control input-sm" value="${persona?.apellido}"/>
                                        </div>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'mail', 'error')} required">
                                <div class="col-md-12">
                                    <span class="grupo">
                                        <label for="mail" class="col-md-3 control-label">
                                            E-mail
                                        </label>

                                        <div class="col-md-6">
                                            <g:textField name="mail" maxlength="63" required="" class="email form-control input-sm unique noEspacios required" value="${persona?.mail}"/>
                                        </div>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group keeptogether ${hasErrors(bean: persona, field: 'canton', 'error')} ">
                                <div class="col-md-12">
                                    <span class="grupo">
                                        <label for="provincia" class="col-md-3 control-label">
                                            Provincia
                                        </label>
                                        <div class="col-md-6">
                                            <g:select name="provincia" from="${geografia.Provincia?.list().sort{it.nombre}}" optionKey="id"
                                                      optionValue="nombre" class="form-control" value="${persona?.canton?.provincia?.id}"/>
                                        </div>
                                    </span>
                                </div>
                            </div>

                        </g:form>

                    </div>
                </div>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane" id="profile">2</div>
        <div role="tabpanel" class="tab-pane" id="messages">

            <div class="panel panel-info" style="margin-top: 10px">
                <div class="panel-heading" role="tab" id="headerContacto">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#contacto" aria-expanded="true" aria-controls="contacto">
                            Datos de contacto
                        </a>
                    </h4>
                </div>
                <div id="contacto" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headerContacto">
                    <div class="panel-body">

                    </div>
                </div>
            </div>

        </div>
        <div role="tabpanel" class="tab-pane" id="settings">

            <div class="panel panel-info" style="margin-top: 10px">
                <div class="panel-heading" role="tab" id="headerPass">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            Cambiar clave de ingreso al sistema
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headerPass">
                    <div class="panel-body">
                        <g:form class="form-inline" name="frmPass" action="savePass_ajax">
                            <g:hiddenField name="id" value="${usuario?.id}"/>
                            <div class="form-group" style="margin-left: 40px;">
                                <label for="nuevoPass">Nueva clave</label>

                                <div class="input-group">
                                    <g:passwordField name="nuevoPass" class="form-control required auth"/>
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                </div>
                            </div>

                            <div class="form-group" style="margin-left: 40px;">
                                <label for="passConfirm">Confirme la clave nueva</label>

                                <div class="input-group">
                                    <g:passwordField name="passConfirm" class="form-control required auth"/>
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                </div>
                            </div>
                            <a href="#" id="btnSavePass" class="btn btn-primary" style="margin-left: 40px;">
                                <i class="fa fa-save"></i> Guardar
                            </a>
                        </g:form>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>






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


    $(function () {
        var $frmAuth = $("#frmAuth");
        var $frmPass = $("#frmPass");

        $("#btnSavePass").click(function () {

            if ($frmPass.valid()) {
                $.ajax({
                    type    : "POST",
                    url     : $frmPass.attr("action"),
                    data    : $frmPass.serialize(),
                    success : function (msg) {
                        console.log("-->" + msg)
                        var parts = msg.split("*");
                        log(parts[1], parts[0] == "SUCCESS" ? "success" : "error"); // log(msg, type, title, hide)
                        setTimeout(function () {
                            if (parts[0] == "SUCCESS") {
                                location.href = "${createLink(controller: "login", action: "logout" )}"
                            } else {
                            }
                        }, 1000);
                        closeLoader();
                    }
                });
            }
            return false;
        });

    });
</script>

</body>
</html>