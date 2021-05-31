<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/04/21
  Time: 10:11
--%>

<div class="container">
    <div class="col-md-12" style="margin-bottom: 10px">
        <div class="form-group ${hasErrors(bean: 'tipopago', field: 'pago', 'error')}">
            <label class="col-md-2 control-label text-warning" style="font-size: 10pt">
                Tipo de publicación o (selecciona gratis)
            </label>
            <div class="col-md-3 text-info">
                <g:select name="periodo" from="${ventas.TipoPago.list([sort: 'orden'])}"
                          class="form-control per required" optionValue="descripcion" optionKey="id"
                          style="color: #4F1B00; border-bottom-style: solid; border-color: #AF5B00; font-size: 12pt"/>
            </div>
        </div>
    </div>
%{--
    <div class="col-md-12">
        <label class="col-md-2 control-label text-info">
            Período de publicación
        </label>
        <div class="col-md-3">
            <g:select name="periodo" from="${ventas.TipoPago.list().sort{it.descripcion}}" class="form-control per"
                      optionValue="descripcion" optionKey="id"/>
        </div>
    </div>
--}%

    <div class="col-md-12" style="margin-top: 10px">
        <label class="col-md-2 control-label text-info">
            Fecha de inicio de la publicación
        </label>
        <div class="col-md-3">
            <input name="fechaInicio" id='datetimepicker1' type='text' required="" class="form-control required" value="${new Date().format("dd-MM-yyyy")}"/>
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
        var tipo = $("#periodo option:selected").val();
        $.ajax({
            type: 'POST',
            url:'${createLink(controller: 'pago', action: 'fin_ajax')}',
            data:{
                inicio:inicio,
                tipo:tipo
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
            minDate: moment().subtract(1, 'days'),
            icons: {
                close: 'closeText'
            }
        });
    });

    $(".btnPagar").click(function () {
        var pro = $(this).data("id");
        if($("#datetimepicker1").val() == '' || $("#datetimepicker1").val() == null){
           bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>&nbsp; <strong style='font-size: 15px'>Ingrese una fecha de inicio</strong>");
        }else{
            cargarImagenes(pro)
        }
    });

    function cargarImagenes(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'pago', action:'pago_ajax')}",
            data    : {
                id:id,
                fi: $("#datetimepicker1").val(),
                ff: $("#datetimepicker2").val(),
                tipo: $("#periodo option:selected").val()
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
        valor(s);
        cargarFechaFin($("#datetimepicker1").val());
    });

    // $("#datetimepicker1").change(function () {
    //     cargarFechaFin($("#datetimepicker1").val());
    // });

    $('#datetimepicker1').on('dp.change', function(e){
        var formatedValue = e.date.format(e.date._f);
        cargarFechaFin(formatedValue);
    })

</script>