<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 11/05/21
  Time: 12:15
--%>

<style type="text/css">
.titulo0 {
    color:var(--naranja0);
    font-size: 1.6rem;
    font-weight: bolder;
}
</style>

<div class="container">

    <div style="font-size: 15px; margin-bottom: 20px"><span class="titulo0"><i class="fa fa-exclamation-triangle text-warning fa-2x"></i>&nbsp;
    Nota:</span> el producto será publicado con la información guardada hasta el momento</div>

%{--    <div class="col-md-3 btn-group" style="float: left;">--}%
%{--        <a href="#" class="btn btn-gris btnPublicarGratis" ><i class="fab fa-product-hunt"></i> Publicar gratuitamente</a>--}%
%{--    </div>--}%

%{--    <div class="col-md-3 btn-group" style="float: left;">--}%
%{--        <a href="#" class="btn btn-rojo btnPublicarDestacar" ><i class="fa fa-star"></i> Publicar y destacar el anuncio</a>--}%
%{--    </div>--}%

</div>

<script type="text/javascript">

    %{--$(".btnPublicarGratis").click(function () {--}%
    %{--    bootbox.dialog({--}%
    %{--        title   : "Alerta",--}%
    %{--        message : "<i class='fa fa-clipboard-check fa-3x pull-left text-warning text-shadow'></i> " +--}%
    %{--            "<p style='font-size: 14px; font-weight: bold'>&nbsp; * El producto será publicado con la " +--}%
    %{--            "información guardada hasta el momento.</p><p style='font-size: 14px'>&nbsp; * El producto será publicado durante el período de <strong>una semana</strong> a partir de su aprobación</p>",--}%
    %{--        buttons : {--}%
    %{--            cancelar : {--}%
    %{--                label     : "<i class='fa fa-times'></i> Cancelar",--}%
    %{--                className : "btn-gris",--}%
    %{--                callback  : function () {--}%
    %{--                }--}%
    %{--            },--}%
    %{--            publicar : {--}%
    %{--                label     : "<i class='fa fa-check'></i> Publicar",--}%
    %{--                className : "btn-rojo",--}%
    %{--                callback  : function () {--}%
    %{--                    publicarProductoGratis();--}%
    %{--                }--}%
    %{--            }--}%
    %{--        }--}%
    %{--    });--}%
    %{--});--}%

    %{--function publicarProductoGratis(){--}%
    %{--    var b = cargarLoader("Procesando...");--}%
    %{--    $.ajax({--}%
    %{--        type: 'POST',--}%
    %{--        url: '${createLink(controller: 'alerta', action: 'generarAlerta2_ajax')}',--}%
    %{--        data:{--}%
    %{--            id: '${producto?.id}'--}%
    %{--        },--}%
    %{--        success: function (msg) {--}%
    %{--            b.modal("hide");--}%
    %{--            if(msg == 'ok'){--}%
    %{--                bootbox.dialog({--}%
    %{--                    title   : "Confirmación",--}%
    %{--                    message : "<i class='fa fa-check fa-3x pull-left text-warning text-shadow'></i><p style='font-size: 14px; font-weight: bold'> Su producto será revisado y publicado en las próximas 24 horas</p>",--}%
    %{--                    buttons : {--}%
    %{--                        aceptar : {--}%
    %{--                            label     : "<i class='fa fa-check'></i> Aceptar",--}%
    %{--                            className : "btn-gris",--}%
    %{--                            callback  : function () {--}%
    %{--                                location.href="${createLink(controller: 'producto', action: 'list')}?id=" + '${producto?.persona?.id}'--}%
    %{--                            }--}%
    %{--                        }--}%
    %{--                    }--}%
    %{--                });--}%
    %{--            }else{--}%
    %{--                bootbox.alert("<i class='fa fa-times fa-3x pull-left text-danger text-shadow'></i><p style='font-size: 14px; font-weight: bold'> Error al publicar el producto</p>")--}%
    %{--            }--}%
    %{--        }--}%
    %{--    });--}%
    %{--}--}%

    %{--$(".btnPublicarDestacar").click(function () {--}%
    %{--    $.ajax({--}%
    %{--        type    : "POST",--}%
    %{--        url     : "${createLink(controller: 'pago', action:'form_ajax')}",--}%
    %{--        data    : {--}%
    %{--            id: '${producto?.id}'--}%
    %{--        },--}%
    %{--        success : function (msg) {--}%
    %{--            var b = bootbox.dialog({--}%
    %{--                id      : "dlgPagarPub",--}%
    %{--                title   : "Pagar publicación",--}%
    %{--                message : msg,--}%
    %{--                buttons : {--}%
    %{--                    cancelar : {--}%
    %{--                        label     : "Cancelar",--}%
    %{--                        className : "btn-primary",--}%
    %{--                        callback  : function () {--}%
    %{--                        }--}%
    %{--                    }--}%
    %{--                } //buttons--}%
    %{--            }); //dialog--}%
    %{--        } //success--}%
    %{--    }); //ajax--}%
    %{--});--}%

</script>