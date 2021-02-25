<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 24/02/21
  Time: 12:20
--%>

<asset:javascript src="/jquery/jquery.validate.min.js"/>
<asset:javascript src="/jquery/jquery.validate.custom.js"/>
<asset:javascript src="/apli/functions.js"/>


<div class="modal-header">
    <h4 class="modal-title" style="text-align: center">Ingreso al Sistema</h4>
</div>

<div class="modal-body" style="width: 280px; margin: auto">
    <g:form name="frmLogin" action="validar" class="form-horizontal">
        <div class="form-group">
            <label class="col-md-5" for="login">Usuario</label>
            <div class="controls col-md-5">
                <input name="login" id="login" type="text" class="form-control required"
                       placeholder="Usuario" required autofocus style="width: 160px;">
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-5" for="pass">Contraseña</label>

            <div class="controls col-md-5">
                <input name="pass" id="pass" type="password" class="form-control required"
                       placeholder="Contraseña" required style="width: 160px;">
            </div>
        </div>

        <div class="divBtn" style="width: 100%">
            <a href="#" class="btn btn-success btn-lg btn-block" id="btn-login"
               style="width: 140px; margin: auto"> <i class="fa fa-lock"></i> Validar
            </a>
        </div>

    </g:form>
</div>

<script type="text/javascript">


    var $frm = $("#frmLogin");
    var recargar = true;

    function timedRefresh(timeoutPeriod) {
        if(recargar) {
            setTimeout("location.reload(true);",timeoutPeriod);
        }
        recargar = false
    }

    function doLogin() {
        if ($frm.valid()) {
            // $("#cargando").removeClass('hidden');
            cargarLoader("Cargando...");
            $(".btn-login").replaceWith($("#cargando"));
            $("#frmLogin").submit();
        }
    }

    function doPass() {
        if ($("#frmPass").valid()) {
            $("#btn-pass").replaceWith(spinner);
            $("#frmPass").submit();
        }
    }

    $(function () {

        $("#ingresar").click(function () {
            var initModalHeight = $('#modal-ingreso').outerHeight();
            //alto de la ventana de login: 270
            // console.log("ventana")
            $("#modalBody").css({'margin-top': ($(document).height() / 2 - 135)}, {'margin-left': $(window).width() / 2});
            // console.log("antes modeal")
            $("#modal-ingreso").modal('show');
            // console.log("luego modeal")
            setTimeout(function () {
                $("#login").focus();
            }, 500);

        });

        $("#btnOlvidoPass").click(function () {
            $("#recuperarPass-dialog").modal("show");
            $("#modal-ingreso").modal("hide");
        });

        $("#btn-login").click(function () {
            doLogin();
        });

        $("#btn-pass").click(function () {
            doPass();
        });

        $("input").keyup(function (ev) {
            if (ev.keyCode == 13) {
                doLogin();
            }
        })
    });
</script>
