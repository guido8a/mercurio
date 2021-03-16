<%--
  Created by IntelliJ IDEA.
  User: guido
  Date: 12/03/21
  Time: 10:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src="/merc/bootstrap.min.css"/>

    <!-- Custom styles for this template -->
    <asset:javascript src="/merc/jquery.min.js"/>
    <asset:javascript src="/merc/bootstrap.bundle.js"/>
    <asset:javascript src="/apli/bootbox.js"/>

%{--    <meta name="layout" content="main">--}%
    <title></title>


    <style type="text/css">
    body {
        /*background: black;*/
    }

    .carousel-indicators {
        position: static;
    }
    .carousel-indicators .item.active {
        background: transparent;
        color: #0a193b;
        opacity: 0.8;
    }

    .fotos-guia .inactiva {
        /*background: transparent;*/
        /*color: #0a193b;*/
        opacity: 0.5;
        /*border-style: solid;*/
        /*border-color: #fbffe3;*/
        /*border-width: 1px;*/
        /*border-left: #fbffe3;*/
        /*border-right: #fbffe3;*/
    }

    .fotos-guia .activa {
        opacity: 1;
    }

    .cs900 {
        /*width: 950px;*/
        /*height: 500px;*/
        align-content: center;
        background-color: #dfdfdf;
    }
    .carousel-inner { text-align: center; }
    .carousel .item > img { display: inline-block;}
    .imag-item { height: 400px; width: auto; max-height: 400px; margin: 0; max-width: 800px}

    </style>


</head>

<body>

<div class="btn-group">
    <g:if test="${tipo == '1'}">
        <a href="#" class="btn btn-primary" id="btnAnterior" ><i class="fa fa-arrow-left"></i> Regresar al Anuncio para <strong>Publicar</strong></a>
    </g:if>

</div>


<h3 style="margin-top: 20px; text-align: center">
    ${producto.titulo}
</h3>
<h5 style="text-align: center">
    ${producto.subtitulo}
</h5>


<div class="col-lg-9" style="float: left; background-color: #dfdfdf">
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 100%">
    <div class="carousel-inner cs900">

        <g:each in="${carrusel}" var="carr" status="i">
            <div class="carousel-item ${i==0? 'active': ''}">
                <img class="img-fluid imag-item" alt="First slide"
                     src="${request.contextPath}/principal/getImgnCarrusel?ruta=${carr.ruta}"/>
            </div>
        </g:each>

%{--
        <div style="margin-top: 420px; background-color: #cdcdcd">
            ${producto.titulo}
        </div>
        <div>
            ${producto.subtitulo}
        </div>

        <div>
            ${producto.texto}
        </div>
--}%

%{--
    <table class="table-bordered table-striped table-hover" style="width: 100%" >
        <g:each in="${atributos}" var="at" status="i">
                <tr>
                <td>
                    ${at.atributoCategoria.atributo.descripcion}
                </td>
                <td>
                    ${at.valor}
                </td>
                </tr>
        </g:each>
    </table>
--}%
        %{--

                <div class="carousel-item active">
                    <img class="d-block w-50"
                         src="https://images.pexels.com/photos/954599/pexels-photo-954599.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=450&w=640" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-50" src="https://images.pexels.com/photos/1166643/pexels-photo-1166643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=450&w=640" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-50" src="https://images.pexels.com/photos/551611/pexels-photo-551611.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=450&w=640" alt="Third slide">
                </div>
        --}%

        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>

%{--
    <div class="container pt-4 pb-5 col-md-4">
        <div class="row carousel-indicators">
            <div class="col-md-4 item">
                <img src="https://pbs.twimg.com/profile_images/905183271046193153/q_P1KBUJ_400x400.jpg" class="img-fluid" data-target="#carouselExampleIndicators" data-slide-to="0"/>
            </div>
            <div class="col-md-4 item">
                <img src="https://pbs.twimg.com/profile_images/905183271046193153/q_P1KBUJ_400x400.jpg" class="img-fluid" data-target="#carouselExampleIndicators" data-slide-to="1"/>
            </div>
            <div class="col-md-4 item">
                <img src="https://pbs.twimg.com/profile_images/905183271046193153/q_P1KBUJ_400x400.jpg" class="img-fluid" data-target="#carouselExampleIndicators" data-slide-to="2"/>
            </div>
        </div>
    </div>
--}%

</div>
</div>
%{--<div class="col-lg-4" style="float: left; background-color: #efef48" id="fotos">--}%
<div  id="fotos" class="col-lg-3 fotos-guia" style="float: left; background-color: #dfdfdf; margin-left: 0">
%{--        <div class="carousel-indicators" style="display: block">--}%

    <g:each in="${carrusel}" var="carr" status="i">
        <div id="imagen${i}" class="guia inactiva" style="float: left;">
            <img src="${request.contextPath}/principal/getImgnCarrusel?ruta=${carr.ruta}"
                 data-target="#carouselExampleIndicators" data-slide-to="${i}" style="height: 100px;"/>
        </div>
    </g:each>
%{--
<h3 style="text-align: center">Características</h3>
<h5 style="text-align: center"> ${producto.titulo}</h5>
    <table class="table-bordered table-striped table-hover table-active" style="width: 100%" >
        <g:each in="${atributos}" var="at" status="i">
            <tr>
                <td>
                    ${at.atributoCategoria.atributo.descripcion}
                </td>
                <td>
                    ${at.valor}
                </td>
            </tr>
        </g:each>
    </table>
--}%


</div>

<div  id="textos">
<h3 style="text-align: center">Características</h3>
<h5 style="text-align: center"> ${producto.titulo}</h5>
    <div>
        <g:applyCodec encodeAs="none">
            ${producto.texto}
        </g:applyCodec>
    </div>
    <table class="table-bordered table-striped table-hover table-active" style="width: 100%" >
        <g:each in="${atributos}" var="at" status="i">
            <tr>
                <td>
                    ${at.atributoCategoria.atributo.descripcion}
                </td>
                <td>
                    ${at.valor}
                </td>
            </tr>
        </g:each>
    </table>
</div>

<script type="text/javascript">


    $(document).ready(function(){

        $('#btnAnterior').click(function () {
            location.href="${createLink(controller: 'producto', action: 'wizardContacto')}?id=" + '${producto?.id}' + "&persona=" + '${persona?.id}'
        });


        $('.carousel').each(function(){
            // $(this).find('.carousel-indicators .item').eq(0).addClass('active');
            $('#fotos').find('.guia').eq(0).addClass('activa');
        });


        /*

            $("#carouselExampleIndicators").on('slide.bs.carousel',function(e){
                if(window.event){
                    $("body").append("<p>Sliding Manually</p>");
                } else {
                    $("body").append("<p>Sliding Automatically</p>");
                })
*/
        });

    $(function(){
        $('#carouselExampleIndicators').bind('slide.bs.carousel', function (e) {
            console.log('slide event!');
            $('#fotos').find('.guia').removeClass('activa');
            $('#fotos').find('.guia').addClass('inactiva');
        });

        $("#carouselExampleIndicators").on('slid.bs.carousel', function () {
            $("#carouselExampleIndicators").carousel();
            currentIndex = $('div.active').index();
            console.log('activo...', currentIndex);
            $('#imagen'+currentIndex).addClass('activa');
        });

    });
</script>
</body>
</html>