<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 17/02/21
  Time: 16:15
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Lista de productos</title>

</head>
<body>

<div class="btn-toolbar toolbar" style="margin-top: 5px">
    <div class="btn-group">
        <g:link controller="producto" action="list" id="${producto?.id}" class="btn btn-primary btnVolver">
            <i class="fa fa-arrow-left"></i> Volver
        </g:link>
    </div>
    <a href="#" class="btn btn-success" id="btnGuardar"><i class="fa fa-save" title="Guardar texto"></i> Guardar</a>
</div>

<div class="card">
    <textarea id="editorTramite" class="editor" rows="100" cols="80">${producto?.texto}</textarea>
</div>

<script type="text/javascript">

    $("#btnGuardar").click(function () {
        guardarTexto();
    });

    function guardarTexto() {
        var b = cargarLoader("Guardando...");
        var texto = CKEDITOR.instances.editorTramite.getData();

        $.ajax({
            type     : "POST",
            url      : '${createLink(controller:"producto", action: "guardarTexto_ajax")}',
            data     : {
                id            : "${producto.id}",
                editorTramite : texto
            },
            success  : function (msg) {
                b.modal("hide");
                if(msg == 'ok'){
                    log("Texto guardado correctamente","success");
                }else{
                    log("Error al guardar el texto" , "error")
                }
            }
        });
    }

    $(function () {

        CKEDITOR.replace( 'editorTramite', {
            height: "600px",
            toolbar                 : [
                ['Font', 'FontSize', 'Scayt', '-', 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'],
                ['Find', 'Replace', '-', 'SelectAll'],
                ['Table', 'HorizontalRule', 'PageBreak'],
                ['-', 'TextColor', 'BGColor', '-', 'About'],
                // '/',
                ['Bold', 'Italic', 'Underline'],
                ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-']
            ]
        });

        CKEDITOR.on('instanceReady', function (ev) {
            // Prevent drag-and-drop.
            ev.editor.document.on('drop', function (ev) {
                ev.data.preventDefault(true);
            });
        });
    });

</script>

</body>
</html>