<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Categorías</title>

    <asset:javascript src="/jstree-3.0.8/dist/jstree.min.js"/>
    <asset:stylesheet src="/jstree-3.0.8/dist/themes/default/style.min.css"/>

    <style type="text/css">

    #list-cuenta {
        width : 950px;
    }

    #tree {
        background : #DEDEDE;
        overflow-y : auto;
        height     : 600px;
    }

    .jstree-search {
        color : #5F87B2 !important;
    }

    .leyenda {
        background    : #ddd;
        border        : solid 1px #aaa;
        padding-left  : 5px;
        padding-right : 5px;
    }

    .infoCambioEstado {
        font-size   : larger;
        font-weight : bold;
    }

    .entrada {
        color : #83C483;
    }

    .salida {
        color : #7676E2;
    }
    </style>

</head>

<body>
    <g:set var="iconActivar" value="fa-power-off text-success"/>
    <g:set var="iconDesactivar" value="fa-power-off text-danger"/>
    <g:set var="iconDanger" value="fa-exclamation-triangle text-danger"/>

    <div id="list-cuenta" style="width: 900px; display: inline">

        <!-- botones -->
        <div class="btn-toolbar toolbar">

            <div class="btn-group col-md-2" style="margin-top: 4px;">
                <div class="input-group">
                    <g:textField name="search" class="form-control input-sm"/>
                    <span class="input-group-btn">
                        <a href="#" id="btnSearch" class="btn btn-sm btn-info" type="button">
                            <i class="fa fa-search"></i>&nbsp;
                        </a>
                    </span>
                </div>
            </div><!-- /input-group -->
            <div class="btn-group col-md-1" style="margin-top: 4px; width: 100px">

            </div>

            <div class="btn-group ui-corner-all leyenda fa-2x">
                <i class="fa fa-copyright text-info"></i> Categoría&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <i class="fa fa-images text-success"></i> Subcategoría<br/>
            </div>
        </div>

        <div id="loading" class="text-center">
            <p>
                Cargando las categorías...
            </p>
            <p>
                <asset:image src="apli/spinner32.gif" style="padding: 40px;"/>
            </p>
            <p>
                Por favor espere
            </p>
        </div>

        <div id="tree" class="hide">

        </div>
    </div>

    <script type="text/javascript">

        // var index = 0;
        //
        // var $btnCloseModal = $('<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>');
        // var $btnSave = $('<button type="button" class="btn btn-success"><i class="fa fa-save"></i> Guardar</button>');

        function submitFormCategoria() {
            var $form = $("#frmCategoria");
            var $btn = $("#dlgCreateEdit").find("#btnSave");
            if ($form.valid()) {
                var cl2 = cargarLoader("Guardando...");
                $btn.replaceWith(spinner);
                $.ajax({
                    type    : "POST",
                    url     : $form.attr("action"),
                    data    : $form.serialize(),
                    success : function (msg) {
                        cl2.modal("hide");
                        if(msg == 'ok'){
                            log("Categoría guardada correctamente","success");
                            setTimeout(function () {
                                location.reload(true)
                            }, 1000);
                        }else{
                            log("Error al guardar la categoría","error")
                        }
                    }
                });
            } else {
                return false;
            } //else
        }

        function createEditCategoria(id) {
            var c =  cargarLoader("Cargando...");
            $.ajax({
                type    : "POST",
                url     : "${createLink(controller: 'categoria', action:'form_ajax')}",
                data    : {
                    id: id
                },
                success : function (msg) {
                    c.modal('hide');
                    var b = bootbox.dialog({
                        id      : "dlgCreateEdit",
                        title   : "Categoría",
                        message : msg,
                        buttons : {
                            cancelar : {
                                label     : "Cancelar",
                                className : "btn-primary",
                                callback  : function () {
                                }
                            },
                            guardar  : {
                                id        : "btnSave",
                                label     : "<i class='fa fa-save'></i> Guardar",
                                className : "btn-success",
                                callback  : function () {
                                    return submitFormCategoria();
                                } //callback
                            } //guardar
                        } //buttons
                    }); //dialog
                } //success
            }); //ajax
        } //createEdit

        function submitFormSubcategoria() {
            var $form = $("#frmSubcategoria");
            var $btn = $("#dlgCreateEditS").find("#btnSave");
            if ($form.valid()) {
                var cl2 = cargarLoader("Guardando...");
                $btn.replaceWith(spinner);
                $.ajax({
                    type    : "POST",
                    url     : $form.attr("action"),
                    data    : $form.serialize(),
                    success : function (msg) {
                        cl2.modal("hide");
                        if(msg == 'ok'){
                            log("Subcategoría guardada correctamente","success");
                            setTimeout(function () {
                                location.reload(true)
                                // $('#tree').jstree(true).search($.trim(''));
                            }, 1000);
                        }else{
                            log("Error al guardar la Subcategoría","error")
                        }
                    }
                });
            } else {
                return false;
            } //else
        }


        function createEditSubcategoria(id, categoria) {
            var c =  cargarLoader("Cargando...");
            $.ajax({
                type    : "POST",
                url     : "${createLink(controller: 'subcategoria', action:'form_ajax')}",
                data    : {
                    id: id,
                    categoria: categoria
                },
                success : function (msg) {
                    c.modal('hide');
                    var b = bootbox.dialog({
                        id      : "dlgCreateEditS",
                        title   : "Subcategoría",
                        message : msg,
                        buttons : {
                            cancelar : {
                                label     : "Cancelar",
                                className : "btn-primary",
                                callback  : function () {
                                }
                            },
                            guardar  : {
                                id        : "btnSave",
                                label     : "<i class='fa fa-save'></i> Guardar",
                                className : "btn-success",
                                callback  : function () {
                                    return submitFormSubcategoria();
                                } //callback
                            } //guardar
                        } //buttons
                    }); //dialog
                } //success
            }); //ajax
        } //createEdit

        function submitFormAtributo() {
            var $form = $("#frmAtributo");
            var $btn = $("#dlgCreateEditA").find("#btnSave");
            if ($form.valid()) {
                var cl2 = cargarLoader("Guardando...");
                $btn.replaceWith(spinner);
                $.ajax({
                    type    : "POST",
                    url     : $form.attr("action"),
                    data    : $form.serialize(),
                    success : function (msg) {
                        cl2.modal("hide");
                        if(msg == 'ok'){
                            log("Atributo guardado correctamente","success");
                            setTimeout(function () {
                                location.reload(true)
                            }, 1000);
                        }else{
                            log("Error al guardar el atributo","error")
                        }
                    }
                });
            } else {
                return false;
            } //else
        }

        function createEditAtributo(id) {
            var c =  cargarLoader("Cargando...");
            $.ajax({
                type    : "POST",
                url     : "${createLink(controller: 'atributoCategoria', action:'form_ajax')}",
                data    : {
                    subcategoria: id
                },
                success : function (msg) {
                    c.modal('hide');
                    var b = bootbox.dialog({
                        id      : "dlgCreateEditA",
                        title   : "Atributo",
                        message : msg,
                        buttons : {
                            cancelar : {
                                label     : "Cancelar",
                                className : "btn-primary",
                                callback  : function () {
                                }
                            },
                            guardar  : {
                                id        : "btnSave",
                                label     : "<i class='fa fa-save'></i> Guardar",
                                className : "btn-success",
                                callback  : function () {
                                    return submitFormAtributo();
                                } //callback
                            } //guardar
                        } //buttons
                    }); //dialog
                } //success
            }); //ajax
        } //createEdit

        function eliminarCategoria(id){
            bootbox.confirm("<i class='fa fa-exclamation-triangle'></i> Está seguro que desea eliminar la categoría seleccionada?", function (res) {
                if (res) {
                        $.ajax({
                            type: 'POST',
                            url: '${createLink(controller: 'categoria', action: 'delete_ajax')}',
                            data:{
                                id:id
                            },
                            success: function (msg) {
                                var parts = msg.split("_");
                                if(parts[0] == 'ok'){
                                    log("Categoría borrada correctamente","success")
                                }else{
                                    bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i>" + parts[1])
                                }
                            }
                        })
                }
            });
        }

        function eliminarAtributo(id){
            bootbox.confirm("<i class='fa fa-exclamation-triangle'></i> Está seguro que desea eliminar el atributo seleccionado?", function (res) {
                if (res) {
                    $.ajax({
                        type: 'POST',
                        url: '${createLink(controller: 'atributoCategoria', action: 'delete_ajax')}',
                        data:{
                            id:id
                        },
                        success: function (msg) {

                            if(msg == 'ok'){
                                log("Atributo borrado correctamente","success")
                            }else{
                               log("Error al borrar el atributo" ,"error")
                            }
                        }
                    })
                }
            });
        }

        function createContextMenu(node) {
            var nodeStrId = node.id;
            var $node = $("#" + nodeStrId);
            var nodeId = nodeStrId.split("_")[1];
            var nodeType = $node.data("jstree").type;

            if (nodeType == "root") {
                var items = {
                    crear    : {
                        label  : "Nueva categoría",
                        icon   : "fa fa-plus-circle text-info",
                        action : function (obj) {
                            createEditCategoria(nodeId);
                        }
                    }
                };
            }else if(nodeType.contains('catego')){
                items = {
                    crearSub: {
                        // separator_before : true,
                        label: "Nueva subcategoría",
                        icon: "fa fa-plus-circle text-success",
                        action: function (obj) {
                            createEditSubcategoria(null, nodeId);
                        }
                    },
                    editar: {
                        label: "Editar categoría",
                        icon: "fa fa-edit text-info",
                        action: function (obj) {
                            createEditCategoria(nodeId);
                        }
                    },
                    eliminarSub: {
                        // separator_before : true,
                        label: "Eliminar categoría",
                        icon: "fa fa-trash text-danger",
                        action: function (obj) {
                            eliminarCategoria(nodeId);
                        }
                    }
                }
            }
            else if(nodeType.contains('sub')){
                items = {
                    crearAt: {
                        label: "Nuevo atributo",
                        icon: "fa fa-plus-circle text-warning",
                        action: function (obj) {
                            createEditAtributo(nodeId);
                        }
                    },
                    editar: {
                        label: "Editar subcategoría",
                        icon: "fa fa-edit text-info",
                        action: function (obj) {
                            createEditSubcategoria(nodeId,null);
                        }
                    },
                    eliminarSub: {
                        // separator_before : true,
                        label: "Eliminar subcategoría",
                        icon: "fa fa-trash text-danger",
                        action: function (obj) {
                            createEditRow(nodeId, "Editar");
                        }
                    }
                }
            }
            else if(nodeType.contains('atributo')){
                items = {
                    eliminarAt: {
                        // separator_before : true,
                        label: "Eliminar atributo",
                        icon: "fa fa-trash text-danger",
                        action: function (obj) {
                            eliminarAtributo(nodeId);
                        }
                    }
                }
            }

            return items;
        }

        $(function () {

            $(".btnCopiar").click(function () {
                openLoader("Copiando");
            });

            $("#btnCreate").click(function () {
                createEditRow(null, "Crear");
            });

            $('#tree').on("loaded.jstree", function () {
                $("#loading").hide();
                $("#tree").removeClass("hide").show();
            }).on("select_node.jstree", function (node, selected, event) {
            }).jstree({
                plugins     : ["types", "contextmenu", "wholerow", "search"],
                core        : {
                    multiple       : false,
                    check_callback : true,
                    themes         : {
                        variant : "small",
                        dots    : true,
                        stripes : true
                    },
                    data           : {
                        async : false,
                        url   : '${createLink(controller: 'categoria', action:"loadTreePart")}',
                        data  : function (node) {
                            return {
                                id    : node.id,
                                sort  : "${params.sort?:'apellido'}",
                                order : "${params.order?:'asc'}",
                                actv  : $("#activos").is(':checked')
                            };
                        }
                    }
                },
                contextmenu : {
                    show_at_node : false,
                    items        : createContextMenu
                },
                search      : {
                    fuzzy             : false,
                    show_only_matches : true,
                    ajax              : {
                        url     : "${createLink(action:'arbolSearch_ajax')}",
                        success : function (msg) {
                            var json = $.parseJSON(msg);
                            $.each(json, function (i, obj) {
                                $('#tree').jstree("open_node", obj);
                            });
                        }
                    }
                },
                types       : {
                    root                      : {
                        icon : "fa fa-folder-plus text-warning"
                    },
                    catego               : {
                        icon : "fas fa-copyright text-info"
                    },
                    sub           : {
                        icon : "fas fa-images text-success"
                    },
                    atributo           : {
                        icon : "fas fa-broom text-warning"
                    }
                }
            });

            $('#btnSearch').click(function () {
                $('#tree').jstree(true).search($.trim($("#search").val()));
                return false;
            });
            $("#search").keypress(function (ev) {
                if (ev.keyCode == 13) {
                    $('#tree').jstree(true).search($.trim($("#search").val()));
                    return false;
                }
            });

        });
    </script>

</body>
</html>
