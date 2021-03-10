<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 09/03/21
  Time: 15:10
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <ckeditor:resources/>
    <meta name="layout" content="main">
    <title>Producto</title>
    <asset:stylesheet src="/apli/wizard.css"/>
</head>

<style>

html {
    font-size:10px;
}

.outer-container {
    font-family: "Roboto";
    font-size: 1.6rem;
}

.outer-container {
    padding:60px;
}


.step-content {
    padding:40px 0;
}

</style>

<body>

%{--<elm:wizardAvales paso="1" proceso="${proceso}"/>--}%

<div class="outer-container">
    <g:hiddenField name="id" value="${producto?.id}" />
    <g:hiddenField name="persona" value="${persona?.id}" />

    <div id="wizard" class="aiia-wizard" style="display: none;">

        <div class="aiia-wizard-step">
            <h1>Categoría</h1>
            <div class="step-content">

                <div class="col-md-12" style="margin-bottom: 10px">
                    <h3> Seleccione una categoría para su producto</h3>
                    <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
                        <span class="grupo">
                            <label for="categoria" class="col-md-2 control-label text-info">
                                Categoría
                            </label>
                            <div class="col-md-6">
                                <g:select name="categoria" from="${ventas.Categoria.list().sort{it.descripcion}}" class="form-control"
                                          optionKey="id" optionValue="descripcion" value="${producto?.subcategoria?.categoria?.id}"/>
                            </div>
                        </span>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group ${hasErrors(bean: 'producto', field: 'subcategoria', 'error')}">
                        <span class="grupo">
                            <label class="col-md-2 control-label text-info">
                                Subcategoría
                            </label>
                            <div class="col-md-6" id="divSubcategoria">
                            </div>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="aiia-wizard-step">
            <h1>Información</h1>
            <div class="step-content">

                <div class="col-md-12" style="margin-bottom: 10px">
                    <h3> Ingrese la información principal de su producto</h3>

                    <div class="form-group ${hasErrors(bean: 'producto', field: 'titulo', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Anuncio (Título)
                            </label>
                            <div class="col-md-7">
                                <g:textField name="titulo" maxlength="255" class="form-control" title="Texto principal del anuncio"
                                             value="${producto?.titulo}" style="background-color: #ffffef"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <div class="form-group ${hasErrors(bean: 'producto', field: 'subtitulo', 'error')}">
                        <span class="grupo">
                            <label class="col-md-3 control-label text-info">
                                Descripción resuminda
                            </label>
                            <div class="col-md-7">
                                <g:textField name="subtitulo" maxlength="255" class="form-control" title="Segunda línea del anuncio"
                                             value="${producto?.subtitulo}"/>
                            </div>
                        </span>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom: 10px">
                    <label class="col-md-3 control-label text-info">
                        Detalles o Especificaciones
                    </label>
                    <div class="col-md-8 form-group ${hasErrors(bean: 'producto', field: 'texto', 'error')}">
                        <textarea id="texto" class="editor">${producto?.texto}</textarea>
                    </div>
                </div>

            </div>
        </div>

        <div class="aiia-wizard-step">
            <h1>Características</h1>
            <div class="step-content">
                You can also compare this plugin to a carousel, but then again it is not a carousel. Well, maybe I'll update the plugin so that it will have different modes (tabs, slider, carousel...). But right now it serves for one purpose only and that is creating a Wizard with steps, plain and simple. The aiiaPlugin may as well be a hybrid between the Tabs Twitter Bootstrap and the carousel plugin if you like.
            </div>
        </div>

        <div class="aiia-wizard-step">
            <h1>Imágenes</h1>
            <div class="step-content">
                This plugin allows you to interract with it or to retrieve some information from. The following methods are available:
                <ul>
                    <li>isFinalElementShown,</li>
                    <li>previous,</li>
                    <li>next,</li>
                    <li>first,</li>
                    <li>getActiveStep</li>
                </ul>
            </div>
        </div>

        <div class="aiia-wizard-step">
            <h1>Finalizar</h1>
            <div class="step-content">
                This plugin allows you to interract with it or to retrieve some information from. The following methods are available:
                <ul>
                    <li>isFinalElementShown,</li>
                    <li>previous,</li>
                    <li>next,</li>
                    <li>first,</li>
                    <li>getActiveStep</li>
                </ul>
            </div>
        </div>

        %{--        <div class="aiia-wizard-step">--}%
        %{--            <h1>Callbacks</h1>--}%
        %{--            <div class="step-content">--}%
        %{--                As any good plugin, this one allows you to run your code when the plugin does something. This is a list of currently available  callbacks:--}%


        %{--                <pre>--}%
        %{--                    $("#wizard").aiiaWizard({--}%
        %{--                    onInitSuccess: function () {--}%
        %{--                    //alert("init success");--}%
        %{--                    },--}%
        %{--                    onSlideLeftLimitReached: function () {--}%
        %{--                    //alert("onSlideLeftLimitReached success");--}%
        %{--                    },--}%
        %{--                    onSlideLeftFinished: function () {--}%
        %{--                    //alert("onSlideLeftFinished success");--}%
        %{--                    },--}%
        %{--                    onSlideRightLimitReached: function () {--}%
        %{--                    //alert("onSlideRightLimitReached success");--}%
        %{--                    },--}%
        %{--                    onSlideRightFinished: function () {--}%
        %{--                    //alert("onSlideRightFinished success");--}%
        %{--                    },--}%
        %{--                    onButtonPreviousClick: function () {--}%
        %{--                    // Instead of just sliding to the previous step when clicking the "previous" button, you can override this functionality instead.--}%
        %{--                    // By doing that you must then explixitly call the "previous" plugin method as shown below if you want to slide to the previous step.--}%
        %{--                    alert("onButtonPreviousClick");--}%
        %{--                    $("#wizard").aiiaWizard('previous');--}%
        %{--                    },--}%
        %{--                    onButtonNextClick: function () {--}%
        %{--                    // Instead of just sliding to the next step when clicking the "next" button, you can override this functionality instead.--}%
        %{--                    // By doing that you must then explixitly call the "next" plugin method as shown below if you want to slide to the next step.--}%
        %{--                    alert("onButtonNextClick");--}%
        %{--                    $("#wizard").aiiaWizard('next');--}%
        %{--                    }--}%
        %{--                    });--}%
        %{--                </pre>--}%
        %{--            </div>--}%
        %{--        </div>--}%

    </div>
</div>

<script type="text/javascript">

    $(function () {

        CKEDITOR.replace( 'texto', {
            height: "100px",
            width: "100%",
            toolbar                 : [
                ['Scayt', '-', 'Cut', 'Copy', 'Paste', 'PasteFromWord', '-', 'Bold', 'Italic', 'Underline'],
                ['NumberedList', 'BulletedList', '-']
            ]
        });

        CKEDITOR.on('instanceReady', function (ev) {
            // Prevent drag-and-drop.
            ev.editor.document.on('drop', function (ev) {
                ev.data.preventDefault(true);
            });
        });
    });


    $("#categoria").change(function () {
        var id = $(this).val();
        cargarSubcategoria(id)
    });

    cargarSubcategoria($("#categoria").val());

    function cargarSubcategoria(id){
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'subcategoria', action: 'subcategoria_ajax')}',
            data:{
                id: id,
                producto: $("#id").val()
            },
            success: function (msg) {
                $("#divSubcategoria").html(msg)
            }
        });
    }


    $(document).ready(function () {
        $("#wizard").aiiaWizard();
    });

    ;(function ($, window, document, undefined) {

        var settings;

        ////////////////////////////////////////// Public methods

        var pub = {

            init: function (options) {

                return this.each(function () {

                    var $this = $(this),
                        data = $this.data('aiiaWizard'),
                        aiiaWizard = $('<div />', {
                            text: $this.attr('title')
                        });

                    //#region If the plugin hasn't been initialized yet
                    if (!data) {

                        $(this).data('aiiaWizard', {});

                        $this.hide();

                        ///////////////////////// Main configurable options object

                        settings = $.extend(true, $.fn.aiiaWizard.defaults, options);
                        var globalMinHeight = settings.aiiaWizard.minHeight;
                        var buttonFinishText = settings.aiiaWizard.localization.buttons.finish;
                        var buttonLoadingText = settings.aiiaWizard.localization.buttons.loading;
                        var activeStep = settings.aiiaWizard.activeStep;

                        $(this).data('aiiaWizard').settings = settings;

                        ///////////////////////// Prepare Wizard components

                        var $stepsWrapper = getStepsWrapperTemplate(globalMinHeight);
                        var $buttons = getButtonsTemplate(settings);
                        var $steps = $this.find(".aiia-wizard-step");

                        $buttonNext = $buttons.find(".aiia-wizard-button-next");
                        $buttonPrevious = $buttons.find(".aiia-wizard-button-previous");

                        ///////////////////////// Place Wizard component

                        $stepsWrapper.append($steps);       // Place steps in the steps wrapper
                        $this.append($stepsWrapper);        // Place the steps wrapper that now contains all the steps in the original container
                        $this.append($buttons);             // Place Buttons right after the steps wrapper

                        ///////////////////////// Shape Step elements

                        $steps.css({
                            'position': 'absolute',
                            'min-height': globalMinHeight + 'px',
                            'width': '100%'
                        });

                        ////////////////////////// Mark each step element with its current position to
                        ////////////////////////// easily keep track of the order (starting with 1)

                        $.each($steps, function (i, step) {
                            $(step).attr('data-position', i + 1);
                            //markStepAsCompleted(i - 1, $this, settings);
                        })

                        var $progressButtonsTemplate = getProgressButtonsTemplate($steps, settings);
                        $this.prepend($progressButtonsTemplate);

                        /////////////////////////// Find the active step or set the first step active as default

                        if (!$(".active").length) {
                            $steps.eq(activeStep - 1).addClass("active");
                            highlightActiveElement($this);
                        }

                        var $activeStep = $stepsWrapper.find(".active");
                        var activeElementPosition = parseInt($activeStep.data('position'), 10);

                        $.each($steps, function (i, step) {

                            var $step = $(step);
                            var $newStepTitleTemplate = getStepTitleTemplate(i, $step, settings);
                            $step.prepend($newStepTitleTemplate);

                            if ((i + 1) < activeElementPosition) {
                                moveStepLeft($step);
                                markStepAsCompleted(i + 1, $this, settings);
                            } else if ((i + 1) > activeElementPosition) {
                                moveStepRight($step);
                            } else {
                                showStep($step); // Only one element should satisfy this condition
                                highlightActiveElement($this);
                                markStepAsCompleted(i + 1, $this, settings);
                            }

                        });

                        var $progressButtonsBorderBottom = getProgressButtonsBorderBottomTemplate(settings);
                        $progressButtonsTemplate.after($progressButtonsBorderBottom);

                        /////////////////////////// We can now show the plugin component
                        $this.show();

                        /////////////////////////// Activate buttons accordingly to which step is active

                        // If final step is shown
                        if (activeElementPosition === $steps.length) {
                            setFinishButton($this);
                        }

                        // If first step is shown
                        if (activeElementPosition === 1) {
                            $this.find('.aiia-wizard-button-previous').hide();
                        }

                        /////////////////////////// Register event handlers

                        $this.find('.aiia-wizard-button-previous').click(function (e) {
                            e.preventDefault();
                            var $elementToSlide = $this.find(".aiia-wizard-steps-wrapper .active");
                            $this.trigger("onButtonPreviousClick.aiiaWizard", this);

                            if ($.isFunction(settings.onButtonPreviousClick)) {
                                // Trigger the override callback it the callback is set at the plugin initialization...
                                settings.onButtonPreviousClick.call(this);
                            } else {
                                // ...slide right imediatelly otherwise.
                                slideRight($elementToSlide, settings, $this);
                            }
                        });

                        $this.on("slideRightSuccess.aiiaWizard", function () {
                            resizeWizardStepsWrapper($this);
                        });

                        $this.on("slideLeftSuccess.aiiaWizard", function () {
                            resizeWizardStepsWrapper($this);
                        });

                        $this.find('.aiia-wizard-button-next').click(function (e) {
                            e.preventDefault();
                            var $elementToSlide = $this.find(".aiia-wizard-steps-wrapper .active");

                            if ($.isFunction(settings.onButtonNextClick)) {
                                // Trigger the override callback it the callback is set at the plugin initialization...
                                settings.onButtonNextClick.call(this);
                            } else {

                                var activeElementPosition = highlightActiveElement($this);
                                console.log("click " + activeElementPosition)

                                if(activeElementPosition == '2'){
                                    submitFormProducto($elementToSlide, settings, $this);
                                }

                                // ...slide left imediatelly otherwise.
                                slideLeft($elementToSlide, settings, $this);
                            }

                        });

                        /////////////////////////// Testing Success Icon

                        var $progressButtonsPlaceholder = $progressButtonsTemplate.find(".aiia-wizard-progress-buttons-placeholder");
                        var $progressButtons = $progressButtonsPlaceholder.children();

                        /////////////////////////// Store plugin data

                        $this.data('aiiaWizard').target = $this;
                        $this.data('aiiaWizard').aiiaWizard = aiiaWizard;
                        $this.data('aiiaWizard').settings = settings;

                        resizeWizardStepsWrapper($this);

                        $.isFunction(settings.onInitSuccess) && settings.onInitSuccess.call(this);
                        $this.trigger("initSuccess.aiiaWizard", this);
                    }
                    //#endregion
                });
            },
            isFinalElementShown: function (a, b) {
                var activeElementPosition = getActiveElementPosition($(this));
                if (activeElementPosition === countElements($(this))) {
                    return true;
                } else {
                    return false;
                }
            },
            hideButtonNext: function () {
                // TODO: implement
            },
            hideButtonPrevious: function () {
                // TODO: implement
            },
            previous: function () {
                previous($plugin);
            },
            next: function () {
                $plugin = $(this);
                var settings = $plugin.data('aiiaWizard').settings;
                var $elementToSlide = $plugin.find(".aiia-wizard-steps-wrapper .active");
                slideLeft($elementToSlide, settings, $plugin);

            },
            first: function (a) {
                previous(a, true);
                $plugin.on("slideRightSuccess.aiiaWizard", function (event, goToFirst) {
                    if (goToFirst == true)
                        previous(a, true);
                });

            },
            final: function () {
                // TODO: implement
            },
            // disables the "previous" button for the provided step
            disablePreviousButton: function (stepNumber) {
                // TODO: implement
                console.log("aqui")
            },

            // enables the "previous" button for the provided step
            enablePreviousButton: function (stepNumber) {
                // TODO: implement
            },
            getActiveStep: function () {
                console.log("aqui as")
                $plugin = $(this);
                return parseInt($plugin.find(".aiia-wizard-steps-wrapper .active").attr("data-position"), 10);
            }
        };

        ////////////////////////////////////////// Private functions

        function resizeWizardStepsWrapper($this) {
            var $wizardStepsWrapper = $this.find(".aiia-wizard-steps-wrapper");
            var $activeStep = $wizardStepsWrapper.find(".active");

            $wizardStepsWrapper.clearQueue().animate({
                "height": $activeStep.height() + "px"
            });
        }


        function submitFormProducto($elementToSlide, settings, $plugin) {

            var texto = CKEDITOR.instances.texto.getData();

            // var $form = $("#frmProducto");
            // var $btn = $("#dlgCreateEdit").find("#btnSave");
            // if ($form.valid()) {
            //     $btn.replaceWith(spinner);
            var l = cargarLoader("Grabando...");
            $.ajax({
                type    : "POST",
                url     : '${createLink(action:'saveProducto')}',
                data    : {
                    id: $("#id").val(),
                    persona: $("#persona").val(),
                    subcategoria: $("#subcategoria").val(),
                    titulo: $("#titulo").val(),
                    subtitulo: $("#subtitulo").val(),
                    texto: texto
                },
                success : function (msg) {
                    l.modal("hide");
                    var parts = msg.split("_");
                    if (parts[0] == "ok") {
                        log("Producto guardado correctamente","success");
                        if($("#id").val()){

                        }else{
                            setTimeout(function () {
                                location.href="${createLink(controller: 'producto', action: 'wizardProducto')}?id=" + parts[1] + "&persona=" + '${persona?.id}';
                                // slideLeft($elementToSlide, settings, $plugin)
                            }, 1000);
                        }
                    } else {
                        log("Error al guardar el producto","error");
                    }
                }
            });
            // } else {
            //     return false;
            // } //else
        }

        function slideLeft($elementToSlide, settings, $plugin, slideSuccessCallback) {


            if ($elementToSlide.next().length) {

                $elementToSlide.clearQueue().animate({
                    'margin-left': '-100%'
                });

                var $next = $elementToSlide.next();

                $next.clearQueue().animate({
                    'margin-left': 0
                }, function () {

                    $(".aiia-wizard-step").removeClass("active");
                    $next.addClass("active");

                    var activeElementPosition = highlightActiveElement($plugin);
                    var stepsCount = $plugin.find(".aiia-wizard-step").length;

                    markStepAsCompleted(activeElementPosition, $plugin, settings);

                    console.log(activeElementPosition);

                    if (activeElementPosition === stepsCount) {
                        setFinishButton($plugin);
                        $.isFunction(settings.onSlideLeftLimitReached) && settings.onSlideLeftLimitReached.call($plugin);
                        $plugin.trigger("slideLeftLimitReached.aiiaWizard", this);
                    } else {
                        $plugin.find('.aiia-wizard-button-previous').show();
                    }

                    var $progressButtons = $plugin.find(".aiia-wizard-progress-buttons-placeholder").children();

                    $.isFunction(settings.onSlideLeftFinished) && settings.onSlideLeftFinished.call($plugin);
                    $plugin.trigger("slideLeftSuccess.aiiaWizard", this);
                });

            }

        }

        function slideRight($elementToSlide, settings, $plugin, goToFirst) {

            if ($elementToSlide.prev().length) {

                // Move the target element to the right first (out of the visual field)...
                $elementToSlide.clearQueue().animate({
                    'margin-left': '100%'
                });

                // ...find the previous step element and move it into the visual field, thus making it the new active element.
                var $prev = $elementToSlide.prev();

                $prev.clearQueue().animate({
                    'margin-left': 0
                }, function () {

                    $plugin.find(".aiia-wizard-step").removeClass("active");

                    $prev.addClass("active");

                    var activeElementPosition = highlightActiveElement($plugin);
                    unmarkStepAsCompleted(activeElementPosition, $plugin);

                    if (activeElementPosition === 1) {
                        $plugin.find('.aiia-wizard-button-previous').hide();

                        $.isFunction(settings.onSlideRightLimitReached) && settings.onSlideRightLimitReached.call($plugin);
                        $plugin.trigger("slideRightLimitReached.aiiaWizard", this);
                    } else {
                        if ($plugin.find('.aiia-wizard-button-next').hasClass('btn-success')) {
                            unsetFinishButton($plugin, settings);
                        }
                    }

                    $.isFunction(settings.onSlideRightFinished) && settings.onSlideRightFinished.call($plugin);
                    $plugin.trigger("slideRightSuccess.aiiaWizard", goToFirst);

                });

            }
        }

        function getButtonsTemplate(settings) {
            var $buttons = $("" +
                "<div class='aiia-wizard-buttons-wrapper row'>" +
                "<div class='col-md-12'>" +
                "<button class='btn btn-primary pull-left aiia-wizard-button-previous'></button>" +
                "<button class='btn btn-primary pull-right aiia-wizard-button-next' data-loading-text='" + settings.aiiaWizard.localization.buttons.loading + "'></button>" +
                "</div>" +
                "</div>" +
                "").css({
                'display': 'block'
            });

            var $iconPrevious = $("<span class='glyphicon glyphicon-chevron-left pull-left'></span>");
            var $iconPreviousText = $("<span>" + settings.aiiaWizard.localization.buttons.previous + "</span>");
            $iconPrevious.css(settings.aiiaWizard.buttons.previous.icon.css);
            $iconPreviousText.css(settings.aiiaWizard.buttons.previous.text.css);

            var $iconNext = $("<span class='glyphicon glyphicon-chevron-right pull-right'></span>");
            var $iconNextText = $("<span>" + settings.aiiaWizard.localization.buttons.next + "</span>");
            $iconNext.css(settings.aiiaWizard.buttons.next.icon.css);
            $iconNextText.css(settings.aiiaWizard.buttons.next.text.css);

            $buttons.find(".btn").css(settings.aiiaWizard.buttons.css);

            $buttons.find(".aiia-wizard-button-previous")
            //.append($iconPrevious)
                .append($iconPreviousText);

            $buttons.find(".aiia-wizard-button-next")
            //.append($iconNext)
                .append($iconNextText);

            return $buttons;
        }

        function highlightActiveElement($plugin) {

            // find the active element position
            var $stepsWrapper = $plugin.find(".aiia-wizard-steps-wrapper");
            var $activeElement = $stepsWrapper.find(".active");
            var activeElementPosition = parseInt($activeElement.data('position'), 10);

            var $progressButtons = $plugin.find(".aiia-wizard-progress-buttons-placeholder");
            $progressButtons.find(".active").removeClass("active");
            $progressButtons.find("li[data-position='" + activeElementPosition + "']").addClass("active");

            return activeElementPosition;
        }

        function getStepsWrapperTemplate(globalMinHeight) {
            var result = $("<div class='aiia-wizard-steps-wrapper'></div>")
                .css({
                    'position': 'relative',
                    'overflow': 'hidden',
                    'width': '100%',
                    'min-height': globalMinHeight + 'px'
                });
            return result;
        }

        function getProgressButtonsTemplate($steps, settings) {

            var $progessButtonsWrapper = $("" +
                "<div class='aiia-wizard-progress-buttons-wrapper row'>" +
                "<div class='col-md-12'>" +
                "<ul class='nav nav-pills nav-justified aiia-wizard-progress-buttons-placeholder'>" +
                "</ul>" +
                "</div>" +
                "</div>" +
                "").css({
                'display': 'block'
            });

            $.each($steps, function (i, step) {
                var $step = $(step);
                var cls = "";
                var pos = parseInt($step.data('position'), 10);

                var $progressButton = $("" +
                    "<li data-position='" + $step.attr('data-position') + "'><a href='#' style='width: 100px'><h1>" + $step.data('position') + ". </h1>" + $step.find('h1').html() + "</a></li>" +
                    "");

                if ($step.hasClass("active") && settings.aiiaWizard.progressButtons.markActive) {
                    $progressButton.removeClass('default');
                    $progressButton.addClass('active');
                }

                $progressButton.css(settings.aiiaWizard.progressButtons.css);

                $progessButtonsWrapper.find(".aiia-wizard-progress-buttons-placeholder").append($progressButton);

            });

            return $progessButtonsWrapper
        }

        function getProgressButtonsBorderBottomTemplate(settings) {

            var $hr = $("<hr/>");

            $hr.css(settings.aiiaWizard.progressButtons.borderBottom.css);

            return $hr;

        }

        function getStepTitleTemplate(i, $step, settings) {

            var stepNumber = i + 1;
            var $stepTitle = $step.find("h1");
            var stepTitleText = $stepTitle.html();

            var $stepNumber = $("<h1 class='pull-left'>" + stepNumber + "</h1>");
            var $stepText = $("<span>" + stepTitleText + "</span>")
            $stepTitle.remove();

            var $newStepTitle = $("" +
                "<div class='row aiia-wizard-step-title'>" +
                "<div class='col-md-12'>" +
                "<span class='aiia-wizard-step-title-number'>" + stepNumber + "</span>" +
                "<span class='aiia-wizard-step-title-text'>" + stepTitleText + "</span>" +
                "</div>" +
                "</div>" +
                "" +
                "");

            $newStepTitle.find(".aiia-wizard-step-title-number").css(settings.aiiaWizard.steps.title.number.css);
            $newStepTitle.find(".aiia-wizard-step-title-text").css(settings.aiiaWizard.steps.title.text.css);

            return $newStepTitle;
        }

        function moveStepLeft($s) {
            $s.css({
                'margin-left': '-100%'  // move all lower steps to the left
            });
        }

        function moveStepRight($s) {
            $s.css({
                'margin-left': '100%'  // move all lower steps to the left
            });
        }

        function showStep($s) {
            $s.css({
                'margin-left': 0
            });
        }

        function getActiveElementPosition($pluginElement) {
            var stringResult = $pluginElement
                .find(".aiia-wizard-steps-wrapper")
                .find(".active").data('position');

            return parseInt(stringResult, 10);
        }

        function countElements($pluginElement) {
            return $pluginElement.find(".aiia-wizard-step").length;
        }

        function setFinishButton($pluginElement, text) {

            console.log($pluginElement)

            var $finishButton = $pluginElement.find(".aiia-wizard-button-next");

            var txt = $pluginElement.data('aiiaWizard').settings.aiiaWizard.localization.buttons.finish;
            if (text)
                txt = text;

            $finishButton.css(settings.aiiaWizard.buttons.finish.text.css);

            $finishButton
                .removeClass('btn-primary')
                .addClass('btn-success')
                .html(txt);
        }

        function unsetFinishButton($pluginElement, settings) {
            var $finishButton = $pluginElement.find(".aiia-wizard-button-next");
            var txt = $pluginElement.data('aiiaWizard').settings.aiiaWizard.localization.buttons.next;
            var $iconNext = $("<span class='glyphicon glyphicon-chevron-right pull-right'></span>");
            var $iconNextText = $("<span>" + settings.aiiaWizard.localization.buttons.next + "</span>");
            $iconNext.css(settings.aiiaWizard.buttons.next.icon.css);

            $iconNextText.css(settings.aiiaWizard.buttons.next.text.css);

            $finishButton
                .removeClass('btn-success')
                .addClass('btn-primary')
                .html("")
                .append($iconNextText)
            //.append($iconNext)
        }

        function markStepAsCompleted(activeElementPosition, $plugin, settings) {

            $plugin.find("[data-position='" + (activeElementPosition - 1) + "']").addClass("completed");


            // find the target progressButton to mark as completed
            var $progressButton = $plugin.find(".aiia-wizard-progress-buttons-placeholder").find("[data-position='" + (activeElementPosition - 1) + "']");

            // create a new success icon to place it on the progress button
            var $successIcon = $("<span class='" + settings.aiiaWizard.progressButtons.completed.icon.cssClass + " aiia-wizard-icon-step-completed'></span>")
                .css(settings.aiiaWizard.progressButtons.completed.icon.css);

            var $a = $progressButton.find("a");
            // When the step is completed, the progress button must show it with a new style (gray by default)...
            $a.css(settings.aiiaWizard.progressButtons.completed.css);
            // ...and with a success icon appended.
            $a.append($successIcon);
        }

        function unmarkStepAsCompleted(activeElementPosition, $plugin) {

            var $progressButton = $plugin.find(".aiia-wizard-progress-buttons-placeholder").find("[data-position='" + activeElementPosition + "']");
            // $progressButton.find(".aiia-wizard-icon-step-completed").remove();
            var $a = $progressButton.find("a");
            // $a.removeAttr("style");
        }

        function previous($plugin, goToFirst) {
            var settings = $plugin.data('aiiaWizard').settings;
            var $elementToSlide = $plugin.find(".aiia-wizard-steps-wrapper .active");
            var activeStep = parseInt($plugin.find(".aiia-wizard-steps-wrapper .active").attr("data-position"), 10);
            if (activeStep > 0) {
                slideRight($elementToSlide, settings, $plugin, goToFirst);
            }
        }


        ////////////////////////////////////////// Plugin definition

        $.fn.aiiaWizard = function (method) {

            if (pub[method]) {
                return pub[method].apply(this, Array.prototype.slice.call(arguments, 1));
            } else if (typeof method === 'object' || !method) {
                return pub.init.apply(this, arguments);
            } else {
                $.error('Method ' + method + ' does not exist on jQuery.aiiaWizard');
            }

        };

        ////////////////////////////////////////// Plugin Options

        $.fn.aiiaWizard.defaults = {
            aiiaWizard: {
                minHeight: 400,
                activeStep: 1,
                localization: {
                    buttons: {
                        next: 'Siguiente',
                        previous: 'Anterior',
                        finish: 'Finalizado',
                        loading: 'Loading...'
                    }
                },
                progressButtons: {
                    borderBottom: {
                        css: {
                            'border-width': '4px',
                            'border-color': '#E6E6E6'
                        }
                    },
                    css: {
                        'padding': '0 73px'

                    },
                    markActive: false,
                    completed: {
                        css: {
                            // 'background-color': '#E6E6E6',
                            // 'border-width': '1px',
                            // 'border-color': 'red',
                            'color' : 'green',
                        },
                        icon: {
                            cssClass: 'glyphicon glyphicon-ok-sign',
                            css: {
                                'position': 'absolute',
                                'top': '-20px',
                                'right': '-17px',
                                'font-size': '4em',
                                'color': 'green'
                            }
                        }
                    }

                },
                steps: {
                    title: {
                        number: {
                            css: {
                                'background-color': '#E6E6E6',
                                '-webkit-border-radius': '300px',
                                '-moz-border-radius': '300px',
                                'border-radius': '300px',
                                'color': '#158CBA',
                                'float': 'left',
                                'font-size': '36px',
                                'height': '70px',
                                'margin-right': '10px',
                                'text-align': 'center',
                                'width': '70px',
                                'font-weight': 'bold',
                                'padding-top': '8px'
                            }
                        },
                        text: {
                            css: {
                                'color': '#158CBA',
                                'font-size': '36px',
                                'float': 'left',
                                'font-size': '36px',
                                'margin-top': '8px'
                            }
                        }
                    },
                    content: {

                    }
                },
                buttons: {
                    previous: {
                        text: {
                            css: {
                                //'float': 'right',
                                //'font-size': '14px',
                                //'margin-top': '2px',
                                //'margin-left': '7px'
                            }
                        },
                        icon: {
                            css: {
                                //'font-size': '24px'
                            }
                        }

                    },
                    next: {
                        text: {
                            css: {
                                //'float': 'left',
                                //'font-size': '14px',
                                //'margin-top': '2px',
                                //'margin-right': '7px'
                            }
                        },
                        icon: {
                            css: {
                                //'font-size': '14px'
                            }
                        }
                    },
                    'css': {
                        //'padding-bottom': '10px'
                    },
                    finish: {
                        text: {
                            css: {
                                //'font-size': '20px',
                                //'float': 'left',
                                //'font-size': '20px',
                                //'margin-top': '2px',
                                //'margin-right': '7px'
                            }
                        }
                    },
                    'css': {
                        //'padding-bottom': '10px'
                    }

                }
            }
        };

    })( jQuery, window, document );




</script>

</body>
</html>