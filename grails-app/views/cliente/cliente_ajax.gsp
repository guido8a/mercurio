<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 26/03/21
  Time: 10:50
--%>


<asset:javascript src="/jquery/jquery.validate.min.js"/>
<asset:javascript src="/jquery/jquery.validate.custom.js"/>
<asset:javascript src="/apli/functions.js"/>

<div class="modal-header" style="text-align: center">
    <h4 class="modal-title" style="text-align: center">Contactar con el vendedor</h4>
</div>

<div class="container">
    <div class="row">
        <g:form name="frmCliente" controller="cliente" action="guardarCliente_ajax" class="form-horizontal">
            <g:hiddenField name="producto" value="${producto?.id}"/>
            <div class="col-md-12">
                <label class="col-md-2" for="nombre">Nombre</label>
                <div class="col-md-12">
                    <g:textField name="nombre" class="form-control required" maxlength="31" required=""/>
                </div>
            </div>
            <div class="col-sm">
                <label class="col-md-2">Email</label>

                <div class="col-lg-12">
                    <g:textField name="mail" class="email form-control required" maxlength="63"  required=""/>
                </div>
            </div>
            <div class="col-sm">
                <label class="col-md-2">Pregunta</label>

                <div class="col-md-12">
                    <g:textArea name="pregunta" class="form-control required" maxlength="1023" required="" style="resize: none"/>
                </div>
            </div>

            <div style="width: 100%; margin-top: 10px" >
                <a href="#" class="btn btn-success btn-lg btn-block" id="btnEnviar"
                   style="width: 160px; margin: auto"> <i class="fa fa-envelope"></i> Enviar
                </a>
            </div>
            <br/>
            <div class="alert alert-info" role="alert">
                Llene los campos y el vendedor se contactará con usted.
            </div>
        </g:form>
    </div>
</div>

<script type="text/javascript">

    function submitFormCliente() {
        var $form = $("#frmCliente");
        if ($form.valid()) {
            var l = cargarLoader("Procesando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'guardarCliente_ajax')}',
                data    : $form.serialize(),
                success : function (msg) {
                    l.modal("hide");
                    if (msg == "ok") {
                        bootbox.alert("Información enviada correctamente", function(){
                            location.reload(true);
                        })
                    } else {
                        bootbox.alert("Error al enviar la información", function(){
                            location.reload(true);
                        });
                    }
                }
            });
        } else {
            return false;
        } //else
    }

    var $frm = $("#frmCliente");

    function doLogin() {
        submitFormCliente();
    }

    $(function () {

        $("#btnEnviar").click(function () {
            doLogin();
        });

        $("input").keyup(function (ev) {
            if (ev.keyCode == 13) {
                doLogin();
            }
        })
    });
</script>
