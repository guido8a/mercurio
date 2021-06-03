<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 29/04/21
  Time: 10:11
--%>

<div class="container">

    <div class="col-md-12" style="margin-bottom: 10px">
        <div class="form-group ${hasErrors(bean: 'tipopago', field: 'pago', 'error')}">
            <label class="col-md-1 control-label text-warning" style="font-size: 10pt">
                Tipo de publicación
            </label>
            <div class="col-md-5 text-info">
                <select id="tipopago" class="form-control per required" style="color: #4F1B00; border-bottom-style: solid; border-color: #AF5B00; font-size: 12pt">
                    <g:each in="${ventas.TipoPago.list([sort: 'orden'])}" var="tp">
                        <option value="${tp.id}" data-dias="${tp.dias}" ${tp.id == anuncio.tipoPago.id? 'selected' : ''}>
                            ${tp.descripcion} ${tp.tarifa? '- precio: $' + tp.tarifa:''}</option>
                    </g:each>
                </select>

            </div>
        </div>
    </div>

    <div class="col-md-12" style="margin-bottom: 10px">
        <div class="form-group ${hasErrors(bean: 'fechaInicio', field: 'pago', 'error')}">
            <label class="col-md-1 control-label" style="font-size: 10pt">
                Publicar desde
            </label>
            <div class="col-md-2 text-info">
                <input name="fechaInicio" id='fechaInicio' type='text' class="form-control datepicker required"
                       value="${anuncio.fechaInicio? anuncio.fechaInicio.format('dd-MM-yyyy') : new Date().format('dd-MM-yyyy')}"/>
            </div>

            <label class="col-md-3 control-label" style="font-size: 10pt" id="fcHasta">
                Hasta:
            </label>

        </div>
    </div>



%{--
    <div class="col-md-12" style="margin-bottom: 10px">
        <div class="form-group ${hasErrors(bean: 'tipopago', field: 'pago', 'error')}">
            <label class="col-md-2 control-label text-warning" style="font-size: 10pt">
                Tipo de publicación o (seleccione Gratis)
            </label>
            <div class="col-md-3 text-info">
                <g:select name="periodo" from="${ventas.TipoPago.list([sort: 'orden'])}"
                          class="form-control per required" optionValue="descripcion" optionKey="id"
                          style="color: #4F1B00; border-bottom-style: solid; border-color: #AF5B00; font-size: 12pt"/>
            </div>
        </div>
    </div>

    <div class="col-md-12" style="margin-top: 10px">
        <label class="col-md-2 control-label text-info">
            Fecha de inicio de la publicación
        </label>
        <div class="col-md-3">
            <input name="fechaInicio" id='datetimepicker1' type='text' required="" class="form-control required" value="${new Date().format("dd-MM-yyyy")}"/>
        </div>
    </div>

--}%
%{--
    <div class="col-md-12" style="margin-top: 10px">
        <label class="col-md-2 control-label text-info">
            Fecha de fin de la publicación
        </label>
        <div class="col-md-3" id="divFin">

        </div>
    </div>

    <div class="col-md-12" id="divValor" style="margin-top: 10px">
    </div>
--}%

    <div style="width: 560px; margin-top: 10px; text-align: center">
        <a href="#" class="btn btn-rojo" id="btnPagar" title="Pagar" data-id="${producto?.id}">
            <i class="fa fa-dollar-sign"></i> Pagar publicación</a>
    </div>
    <div style="width: 560px; margin-top: 10px; display: flex; justify-content: center;">
        <a href="#" class="btn btn-rojo" id="btnPublicar" title="Publicar Gratis" data-id="${producto?.id}">
            <i class="fa fa-check"></i> Publicar Gratis</a>
    </div>
</div>

<script type="text/javascript">

    // cargarFechaFin($("#datetimepicker1").val());

%{--/*--}%
%{--    function cargarFechaFin(inicio){--}%
%{--        var tipo = $("#periodo option:selected").val();--}%
%{--        $.ajax({--}%
%{--            type: 'POST',--}%
%{--            url:'${createLink(controller: 'pago', action: 'fin_ajax')}',--}%
%{--            data:{--}%
%{--                inicio:inicio,--}%
%{--                tipo:tipo--}%
%{--            },--}%
%{--            success: function(msg){--}%
%{--                $("#divFin").html(msg)--}%
%{--            }--}%
%{--        });--}%
%{--    }--}%
%{--*/--}%

    $(function () {
        console.log('min', moment().subtract(1, 'days'))
        $('#fechaInicio').datetimepicker({
            locale: 'es',
            format: 'DD-MM-YYYY',
            showClose: true,
            // minDate: moment().subtract(1, 'days'),
            icons: {
                close: 'closeText'
            }
        });
    });

    $("#btnPagar").click(function () {
        var prod = $(this).data("id");
        // console.log('prod:', prod)
        if($("#fechaInicio").val() == '' || $("#fechaInicio").val() == null){
           bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'>" +
               "</i>&nbsp; <strong style='font-size: 15px'>Ingrese una fecha de inicio</strong>");
        }else{
            cargarPago(prod)
        }
    });

    $("#btnPublicar").click(function () {
        var prod = $(this).data("id");
        if($("#fechaInicio").val() == '' || $("#fechaInicio").val() == null){
           bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'>" +
               "</i>&nbsp; <strong style='font-size: 15px'>Ingrese una fecha de inicio</strong>");
        }else{
            publicarGratis(prod)
        }
    });

    function publicarGratis(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'pago', action:'actualizaAnuncio_ajax')}",
            data    : {
                id: id,
                anun: "${anuncio.id}",
                fcin: $("#fechaInicio").val(),
                tipo: $( "#tipopago option:selected" ).val() //$("#periodo option:selected").val()
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgP",
                    title   : "Pago",
                    class : "modal-lg",
                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "<i class='fa fa-check'></i> Aceptar",
                            className : "btn-gris",
                            callback  : function () {
                                location.href = "${createLink(controller: 'producto', action: 'list')}"
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function cargarPago(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller: 'pago', action:'pago_ajax')}",
            data    : {
                anun: "${anuncio.id}",
                fcin: $("#fechaInicio").val(),
                tipo: $( "#tipopago option:selected" ).val() //$("#periodo option:selected").val()
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
                                location.href = "${createLink(controller: 'producto', action: 'list')}"
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit


/*
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
*/

    // valor($("#periodo option:selected").val());

/*
    $(".per").change(function (){
        var s = $("#periodo option:selected").val();
        valor(s);
        cargarFechaFin($("#datetimepicker1").val());
    });
*/

/*
    $('#datetimepicker1').on('dp.change', function(e){
        var formatedValue = e.date.format(e.date._f);
        cargarFechaFin(formatedValue);
    })
*/

    format = function date2str(x, y) {
        var z = {
            M: x.getMonth() + 1,
            d: x.getDate(),
            h: x.getHours(),
            m: x.getMinutes(),
            s: x.getSeconds()
        };
        y = y.replace(/(M+|d+|h+|m+|s+)/g, function(v) {
            return ((v.length > 1 ? "0" : "") + z[v.slice(-1)]).slice(-2)
        });

        return y.replace(/(y+)/g, function(v) {
            return x.getFullYear().toString().slice(-v.length)
        });
    }

    calculaDias();

    $('#fechaInicio').on('dp.change', function(e){
        calculaDias()
    })

    $('#tipopago').change(function(){
        calculaDias()
    })

    function calculaDias() {
        var fcha = $("#fechaInicio").val()
        var dias = $( "#tipopago option:selected" ).attr('data-dias');
        dias = parseInt(dias);
        console.log("cambio2", fcha, dias)
        var parts = fcha.split("-");
        var fecha = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
        fecha.setDate(fecha.getDate() + dias-1);
        console.log(format(fecha, 'dd-MM-yyyy'))
        $("#fcHasta").html("Hasta el " + format(fecha, 'dd-MM-yyyy') + " (" + dias + " días)");

        if(dias > 5) {
            $("#btnPagar").show()
            $("#btnPublicar").hide()
            $("#btnPagar").html("<i class='fa fa-dollar-sign'></i> Realizar el Pago" )
            $("#btnPagar").focus()
        } else {
            $("#btnPublicar").show()
            $("#btnPagar").hide()
            $("#btnPublicar").focus()
        }

    }



</script>