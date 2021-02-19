<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 18/02/21
  Time: 12:30
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main">--}%
%{--    <title>Imágenes disponibles</title>--}%

<style type="text/css">
.thumbnail {
    width  : 185px;
    height : 265px;
}

.mfp-with-zoom .mfp-container,
.mfp-with-zoom.mfp-bg {
    opacity                     : 0;
    -webkit-backface-visibility : hidden;
    /* ideally, transition speed should match zoom duration */
    -webkit-transition          : all 0.3s ease-out;
    -moz-transition             : all 0.3s ease-out;
    -o-transition               : all 0.3s ease-out;
    transition                  : all 0.3s ease-out;
}

.mfp-with-zoom.mfp-ready .mfp-container {
    opacity : 1;
}

.mfp-with-zoom.mfp-ready.mfp-bg {
    opacity : 0.8;
}

.mfp-with-zoom.mfp-removing .mfp-container,
.mfp-with-zoom.mfp-removing.mfp-bg {
    opacity : 0;
}

.mfp-counter {
    width : 50px;
}


.file {
    width    : 100%;
    height   : 40px;
    margin   : 0;
    position : absolute;
    top      : 0;
    left     : 0;
    opacity  : 0;
}

.fileContainer {
    width         : 100%;
    border        : 2px solid #327BBA;
    padding       : 15px;
    margin-top    : 10px;
    margin-bottom : 10px;
}

.etiqueta {
    font-weight : bold;
}

.titulo-archivo {
    font-weight : bold;
    font-size   : 18px;
}

.progress-bar-svt {
    border     : 1px solid #e5e5e5;
    width      : 100%;
    height     : 25px;
    background : #F5F5F5;
    padding    : 0;
    margin-top : 10px;
}

.progress-svt {
    width            : 0;
    height           : 23px;
    padding-top      : 5px;
    padding-bottom   : 2px;
    background-color : #428BCA;
    text-align       : center;
    line-height      : 100%;
    font-size        : 14px;
    font-weight      : bold;
}

.background-image {
    background-image  : -webkit-linear-gradient(45deg, rgba(255, 255, 255, .15) 10%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    background-image  : linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    -webkit-animation : progress-bar-stripes-svt 2s linear infinite;
    background-size   : 60px 60px; /*importante, el tamanio tiene que respetarse en la animacion */
    animation         : progress-bar-stripes-svt 2s linear infinite;
}

@-webkit-keyframes progress-bar-stripes-svt {
    /*el x del from tiene que ser multiplo del x del background size...... mientas mas grande mas rapida es la animacion*/
    from {
        background-position : 120px 0;
    }
    to {
        background-position : 0 0;
    }
}

@keyframes progress-bar-stripes-svt {
    from {
        background-position : 120px 0;
    }
    to {
        background-position : 0 0;
    }
}



</style>

<span class="btn btn-success fileinput-button" style="position: relative;margin-top: 5px">
    <i class="glyphicon glyphicon-plus"></i>
    <span>Seleccionar imagen</span>
    <input type="file" name="file" id="file" class="file" multiple accept=".jpeg, .jpg, .png">
</span>

<div class="alert alert-info" style="margin-top: 5px;">
    <i class="fa fa-info-circle fa-2x"></i>
    Se recuerda que puede cargar archivos de <strong>hasta 5 mb</strong> de tipo <strong>.jpeg, .jpg, .png</strong>
</div>

<div style="margin-top:5px;margin-bottom: 5px" id="files">
%{--    <p class="css-vertical-text" id="titulo-arch" style="display: none">Archivos</p>--}%
%{--    <div class="linea" id="linea-arch" style="display: none"></div>--}%
</div>
<div id="anexos">

</div>

<div id="divImagenes">

</div>

%{--<g:if test="${imagenes.size() > 0}">--}%
%{--    <div class="row">--}%
%{--                <g:each in="${imagenes}" var="file" status="i">--}%
%{--                    <div class="col-sm-3 ${i}">--}%
%{--                        <div class="thumbnail">--}%
%{--                            <a href="#" class="btn btn-success btn-sm btn-add" style="margin-bottom: 5px">--}%
%{--                                <i class="fa fa-check"></i> Seleccionar--}%
%{--                            </a>--}%
%{--                            <a href="#" class="btn btn-danger btn-sm btn-delete pull-right" title="Eliminar" data-file="${file.file}" data-i="${i}" style="margin-bottom: 5px">--}%
%{--                                <i class="fa fa-trash"></i>--}%
%{--                            </a>--}%
%{--                                                        <a class="img" href="${resource(dir: file.dir, file: file.file)}">--}%
%{--                                                            <img src="${resource(dir: file.dir, file: file.file)}"/>--}%
%{--                                                        </a>--}%

%{--                            <img src="${createLink(controller: 'producto', action: 'getImage', params: [id: file.file, pro: producto?.id] )}"/>--}%

%{--                            <div class="caption">--}%
%{--                                <p>${file.file}</p>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </g:each>--}%
%{--    </div>--}%
%{--</g:if>--}%
%{--<g:else>--}%
%{--    <div class="alert alert-warning">--}%
%{--        <i class="fa fa-exclamation-triangle fa-2x"></i>--}%
%{--        No tiene imágenes cargadas en el servidor.--}%
%{--    </div>--}%
%{--</g:else>--}%



<script type="text/javascript">

    cargarTablaImagenes();

    function cargarTablaImagenes() {
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'producto', action: 'tablaImagenes_ajax')}',
            data:{
                id: '${producto?.id}'
            },
            success: function (msg) {
                $("#divImagenes").html(msg)
            }
        })
    }

    var archivos = [];

    function reset() {
        $("#files").find(".fileContainer").remove()
    }

    $("#file").change(function () {
        reset();
        archivos = $(this)[0].files;
        var length = archivos.length;
        for (i = 0; i < length; i++) {
            createContainer();
        }
        boundBotones();
    });

    function createContainer() {

        var file = document.getElementById("file");

        var next = $("#files").find(".fileContainer").size();
        if (isNaN(next))
            next = 1;
        else
            next++;
        var ar = file.files[next - 1];
        var div = $('<div class="fileContainer ui-corner-all d-' + next + '">');
        var row1 = $("<div class='row resumen'>");
        var row3 = $("<div class='row botones'  style='text-align: right'>");
        row3.append(" <a href='#' class='btn btn-azul subir' style='margin-right: 15px' clase='" + next + "'><i class='fa fa-upload'></i> Subir Archivo</a>");
        div.append("<div class='row' style='margin-top: 0px'><div class='titulo-archivo col-md-10'><span style='color: #327BBA'>Archivo:</span> " + ar.name + "</div></div>");
        div.append(row1);
        div.append(row3);
        $("#files").append(div);
        if ($("#files").height() * 1 > 120) {
            $("#titulo-arch").show();
            $("#linea-arch").show();
        } else {
            $("#titulo-arch").hide();
            $("#linea-arch").hide();
        }
    }

    function boundBotones() {
        $(".subir").unbind("click");
        $(".subir").bind("click", function () {
            error = false;
            $("." + $(this).attr("clase")).each(function () {
                if ($(this).val().trim() == "") {
                    error = true;
                }
            });
                upload($(this).attr("clase") * 1 - 1);
        });
    }

    var request = [];
    var tam = 0;

    function upload(indice) {
        var tramite = "${producto.id}";
        var file = document.getElementById("file");
        /* Create a FormData instance */
        var formData = new FormData();
        tam = file.files[indice];
        var type = tam.type;
        if (okContents[type]) {
            tam = tam["size"];
            var kb = tam / 1000;
            var mb = kb / 1000;
            if (mb <= 5) {
                formData.append("file", file.files[indice]);
                formData.append("id", tramite);
                $("." + (indice + 1)).each(function () {
                    formData.append($(this).attr("name"), $(this).val());
                });
                var rs = request.length;
                $(".d-" + (indice + 1)).addClass("subiendo").addClass("rs-" + rs);
                $(".rs-" + rs).find(".resumen").remove();
                $(".rs-" + rs).find(".botones").remove();
                $(".rs-" + rs).find(".claves").remove();
                $(".rs-" + rs).append('<div class="progress-bar-svt ui-corner-all" id="p-b"><div class="progress-svt background-image" id="p-' + rs + '"></div></div>').css({
                    height     : 100,
                    fontWeight : "bold"
                });
                request[rs] = new XMLHttpRequest();
                request[rs].open("POST", "${g.createLink(controller: 'producto',action: 'upload_ajax')}");
                request[rs].upload.onprogress = function (ev) {
                    var loaded = ev.loaded;
                    var width = (loaded * 100 / tam);
                    if (width > 100)
                        width = 100;
                    //        console.log(width)
                    $("#p-" + rs).css({width : parseInt(width) + "%"});
                    if ($("#p-" + rs).width() > 50) {
                        $("#p-" + rs).html("" + parseInt(width) + "%");
                    }
                };
                request[rs].send(formData);
                request[rs].onreadystatechange = function () {
                    if (request[rs].readyState == 4 && request[rs].status == 200) {
                        if ($("#files").height() * 1 > 120) {
                            $("#titulo-arch").show();
                            $("#linea-arch").show();
                        } else {
                            $("#titulo-arch").hide();
                            $("#linea-arch").hide();
                        }
                        $(".rs-" + rs).html("<i class='fa fa-check' style='color:#327BBA;margin-right: 10px'></i> " + $(".rs-" + rs).find(".titulo-archivo").html() + " subido exitosamente").css({
                            height     : 50,
                            fontWeight : "bold"
                        }).removeClass("subiendo");
                        cargarTablaImagenes();
                  }
                };
            } else {
                var $div = $(".fileContainer.d-" + (indice + 1));
                $div.addClass("bg-danger").addClass("text-danger");
                var $p = $("<div>").addClass("alert divError").html("No puede subir archivos de más de 5 megabytes");
                $div.prepend($p);
                return false;
            }
        } else {
            var $div = $(".fileContainer.d-" + (indice + 1));
            $div.addClass("bg-danger").addClass("text-danger");
            var $p = $("<div>").addClass("alert divError").html("No puede subir archivos de tipo <b>" + type + "</b>");
            $div.prepend($p);
            return false;
        }
    }


    var okContents = {
        'image/png'  : "png",
        'image/jpeg' : "jpeg",
        'image/jpg'  : "jpg"
    };

    $(function () {
        $("#btnClose").click(function () {
            window.close();
        });
        var effects = ["blind", "bounce", "clip", "drop", "explode", "fold", "highlight", "puff", "pulsate", "scale", "shake", "size", "slide"];
        %{--$(".btn-add").click(function () {--}%
        %{--    window.opener.CKEDITOR.tools.callFunction(${funcNum}, $(this).parents(".thumbnail").find("img").attr("src"));--}%
        %{--    window.close();--}%
        %{--});--}%
        $(".btn-delete").click(function () {
            var file = $(this).data("file");
            var i = $(this).data("i");
            var pos = Math.floor((Math.random() * effects.length) + 1);
            var effect = effects[pos];

            var msg = "<i class='fa fa-trash fa-4x pull-left text-danger text-shadow'></i>" +
                "<p>¿Está seguro que desea eliminar esta imagen del servidor?</p>" +
                "<p><b>Esta acción no se puede deshacer. Una vez eliminada la imagen no podrá ser recuperada.</b></p>";
            bootbox.dialog({
                title   : "Alerta",
                message : msg,
                buttons : {
                    cancelar : {
                        label     : "<i class='fa fa-times'></i> Cancelar",
                        className : "btn-primary",
                        callback  : function () {
                        }
                    },
                    eliminar : {
                        label     : "<i class='fa fa-trash'></i> Eliminar",
                        className : "btn-danger",
                        callback  : function () {
                            openLoader("Eliminando");
                            $.ajax({
                                type    : "POST",
                                url     : '${createLink(action:'delete_ajax')}',
                                data    : {
                                    file : file
                                },
                                success : function (msg) {
                                    var parts = msg.split("_");
                                    log(parts[1], parts[0] == "OK" ? "success" : "error"); // log(msg, type, title, hide)
                                    if (parts[0] == "OK") {
                                        closeLoader();
                                        setTimeout(function () {
                                            $("." + i).hide({
                                                effect   : effect,
                                                duration : 1000,
                                                complete : function () {
                                                    $("." + i).remove();
                                                    if ($(".col-sm-3").length == 0) {
                                                        var alert = '<div class="alert alert-info">';
                                                        alert += '<span class="fa-stack fa-lg">';
                                                        alert += '<i class="fa fa-picture-o fa-stack-1x text-muted"></i>';
                                                        alert += '<i class="fa fa-folder-o fa-stack-2x text-muted"></i>';
                                                        alert += '</span>';
                                                        alert += 'No tiene imágenes cargadas en el servidor.';
                                                        alert += '</div>';
                                                        $(".row").html(alert);
                                                    }
                                                }
                                            });
                                        }, 400);
                                    }
                                }
                            });
                        }
                    }
                }
            });
            return false;
        });
    });
</script>

%{--</body>--}%
%{--</html>--}%