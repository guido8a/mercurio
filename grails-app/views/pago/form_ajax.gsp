<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/04/21
  Time: 10:11
--%>

<div class="container">
    <div class="col-md-12">
        <label class="col-md-2 control-label text-info">
            Período de publicación
        </label>
        <div class="col-md-3">
            <g:select name="periodo" from="${[1:'1 Semana', 2:'2 Semanas', 3:'3 Semanas', 4:'4 Semanas']}" class="form-control per" optionValue="value" optionKey="key"/>
        </div>
    </div>

    <div class="col-md-12" style="margin-top: 10px">
        <label class="col-md-2 control-label text-info">
            Fecha de inicio de la publicación
        </label>
        <div class="col-md-3">
            <input name="fechaInicio" id='datetimepicker1' type='text' required="" class="form-control required" value="${new Date()}"/>
        </div>
    </div>

    <div class="col-md-12" style="margin-top: 10px">
        <label class="col-md-2 control-label text-info">
            Fecha de fin de la publicación
        </label>
        <div class="col-md-3" id="divFin">

        </div>
    </div>

    <div class="col-md-12" id="divValor" style="margin-top: 10px">
    </div>

    <div class="col-md-5" style="margin-top: 10px; text-align: center">
        <a href="#" class="btn btn-rojo btnPagar" title="Pagar" data-id="${producto?.id}"><i class="fa fa-dollar-sign"></i> Pagar publicación</a>
    </div>

</div>

<script type="text/javascript">
    cargarFechaFin($("#datetimepicker1").val());

    function cargarFechaFin(inicio){
        $.ajax({
            type: 'POST',
            url:'${createLink(controller: 'pago', action: 'fin_ajax')}',
            data:{
                inicio:inicio
            },
            success: function(msg){
                $("#divFin").html(msg)
            }
        });
    }

    $(function () {
        $('#datetimepicker1').datetimepicker({
            locale: 'es',
            format: 'DD-MM-YYYY',
            showClose: true,
            icons: {
                close: 'closeText'
            }
        });
    });

    $(".btnPagar").click(function () {
        var pro = $(this).data("id");
        cargarImagenes(pro)
    });

    function cargarImagenes(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'pago', action:'pago_ajax')}",
            data    : {
                id:id
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgP",
                    title   : "Pago",
                    class : "modal-lg",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-times'></i> Salir",
                            className : "btn-gris",
                            callback  : function () {

                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit


    function valor(s){
        $.ajax({
            type:'POST',
            url:'${createLink(controller: 'pago', action: 'valor_ajax')}',
            data:{
                valor: s
            },
            success: function(msg){
                $("#divValor").html(msg)
            }
        });
    }

    valor($("#periodo option:selected").val());

    $(".per").change(function (){
        var s = $("#periodo option:selected").val();
        valor(s)
    });

</script>