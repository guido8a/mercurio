<%--
  Created by IntelliJ IDEA.
  User: fabricio
  Date: 08/04/21
  Time: 10:51
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Ventas</title>

    <asset:stylesheet src="/index2/bootstrap.min.css"/>
    <asset:stylesheet src="/index2/font-awesome.min.css"/>
    <asset:stylesheet src="/index2/prettyPhoto.css"/>
    <asset:stylesheet src="/index2/price-range.css"/>
    <asset:stylesheet src="/index2/animate.css"/>
    <asset:stylesheet src="/index2/main.css"/>
    <asset:stylesheet src="/index2/responsive.css"/>

    <asset:javascript src="/index2/html5shiv.js"/>
    %{--    <asset:javascript src="/index2/main.js"/>--}%
    %{--    <asset:javascript src="/index2/bootstrap.min.js"/>--}%
    %{--    <asset:javascript src="/index2/contact.js"/>--}%
    %{--    <asset:javascript src="/index2/"/>--}%

    %{--    <link href="css/bootstrap.min.css" rel="stylesheet">--}%
    %{--    <link href="css/font-awesome.min.css" rel="stylesheet">--}%
    %{--    <link href="css/prettyPhoto.css" rel="stylesheet">--}%
    %{--    <link href="css/price-range.css" rel="stylesheet">--}%
    %{--    <link href="css/animate.css" rel="stylesheet">--}%
    %{--    <link href="css/main.css" rel="stylesheet">--}%
    %{--    <link href="css/responsive.css" rel="stylesheet">--}%
    %{--    <!--[if lt IE 9]>--}%
    %{--    <script src="js/html5shiv.js"></script>--}%
    %{--    <script src="js/respond.min.js"></script>--}%
    %{--    <![endif]-->--}%


    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href=""><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                            <li><a href=""><i class="fa fa-envelope"></i> info@tedein.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                            <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-md-4 clearfix">
                    <div class="logo pull-left">
                        <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                    </div>
                    %{--                    <div class="btn-group pull-right clearfix">--}%
                    %{--                        <div class="btn-group">--}%
                    %{--                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">--}%
                    %{--                                USA--}%
                    %{--                                <span class="caret"></span>--}%
                    %{--                            </button>--}%
                    %{--                            <ul class="dropdown-menu">--}%
                    %{--                                <li><a href="">Canada</a></li>--}%
                    %{--                                <li><a href="">UK</a></li>--}%
                    %{--                            </ul>--}%
                    %{--                        </div>--}%

                    %{--                        <div class="btn-group">--}%
                    %{--                            <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">--}%
                    %{--                                DOLLAR--}%
                    %{--                                <span class="caret"></span>--}%
                    %{--                            </button>--}%
                    %{--                            <ul class="dropdown-menu">--}%
                    %{--                                <li><a href="">Canadian Dollar</a></li>--}%
                    %{--                                <li><a href="">Pound</a></li>--}%
                    %{--                            </ul>--}%
                    %{--                        </div>--}%
                    %{--                    </div>--}%
                </div>
                <div class="col-md-8 clearfix">
                    <div class="shop-menu clearfix pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#" id="registro"><i class="fa fa-user"></i> Registrarse</a></li>
                            %{--                            <li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>--}%
                            %{--                            <li><a href="#"><i class="fa fa-crosshairs"></i> Checkout</a></li>--}%
                            %{--                            <li><a href="#"><i class="fa fa-shopping-cart"></i> Cart</a></li>--}%
                            <li><a href="#" id="ingresar"><i class="fa fa-lock"></i> Ingresar</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="index.html">Inicio</a></li>
                            <li class="dropdown"><a href="#" class="active">Productos<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="shop.html" class="active">Products</a></li>
                                    <li><a href="product-details.html">Product Details</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="cart.html">Cart</a></li>
                                    <li><a href="login.html">Login</a></li>
                                </ul>
                            </li>
                            %{--                            <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>--}%
                            %{--                                <ul role="menu" class="sub-menu">--}%
                            %{--                                    <li><a href="blog.html">Blog List</a></li>--}%
                            %{--                                    <li><a href="blog-single.html">Blog Single</a></li>--}%
                            %{--                                </ul>--}%
                            %{--                            </li>--}%
                            %{--                            <li><a href="404.html">404</a></li>--}%
                            %{--                            <li><a href="contact-us.html">Contact</a></li>--}%
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="search_box pull-right">
                        <input type="text" placeholder="Search"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<section id="advertisement">
    <div class="container">
        %{--        <img src="images/shop/advertisement.jpg" alt="" />--}%


        %{--        <div id="carouselExampleIndicators" class="carousel slide my-4 cs900" data-ride="carousel">--}%
        %{--            <ol class="carousel-indicators">--}%
        %{--                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>--}%
        %{--                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>--}%
        %{--                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>--}%
        %{--                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>--}%
        %{--                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>--}%
        %{--            </ol>--}%

        %{--            <div class="carousel-inner cs900" role="listbox">--}%

        %{--                <g:each in="${carrusel}" var="carr" status="i">--}%
        %{--                    <div class="carousel-item ${i == 0 ? 'active' : ''}">--}%
        %{--                        <img class="img-fluid imag-item" alt="First slide"--}%
        %{--                             src="${request.contextPath}/principal/getImgnProd?ruta=${carr.ruta}&tp=${carr.tp}&id=${carr.prod}"/>--}%
        %{--                    </div>--}%
        %{--                </g:each>--}%
        %{--            </div>--}%
        %{--            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">--}%
        %{--                <span class="carousel-control-prev-icon" aria-hidden="true"></span>--}%
        %{--                <span class="sr-only">Previous</span>--}%
        %{--            </a>--}%
        %{--            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">--}%
        %{--                <span class="carousel-control-next-icon" aria-hidden="true"></span>--}%
        %{--                <span class="sr-only">Next</span>--}%
        %{--            </a>--}%
        %{--        </div>--}%

    </div>






</section>

<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Categorías</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->

                        <g:each in="${ventas.Categoria.list().sort{it.descripcion}}" var="categoria">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#${categoria.id}">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            ${categoria?.descripcion}
                                        </a>
                                    </h4>
                                </div>
                                <g:if test="${ventas.Subcategoria.findByCategoria(categoria)}">
                                    <div id="${categoria.id}" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <g:each in="${ventas.Subcategoria.findAllByCategoria(categoria)}" var="subcategoria">
                                                    <li><a href="#"></a>${subcategoria?.descripcion}</li>
                                                </g:each>
                                            %{--                                               <li><a href="">Nike </a></li>--}%
                                            %{--                                               <li><a href="">Under Armour </a></li>--}%
                                            %{--                                               <li><a href="">Adidas </a></li>--}%
                                            %{--                                               <li><a href="">Puma</a></li>--}%
                                            %{--                                               <li><a href="">ASICS </a></li>--}%
                                            </ul>
                                        </div>
                                    </div>
                                </g:if>
                            </div>
                        </g:each>

                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title">--}%
                    %{--                                    <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">--}%
                    %{--                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>--}%
                    %{--                                        Sportswear--}%
                    %{--                                    </a>--}%
                    %{--                                </h4>--}%
                    %{--                            </div>--}%
                    %{--                            <div id="sportswear" class="panel-collapse collapse">--}%
                    %{--                                <div class="panel-body">--}%
                    %{--                                    <ul>--}%
                    %{--                                        <li><a href="">Nike </a></li>--}%
                    %{--                                        <li><a href="">Under Armour </a></li>--}%
                    %{--                                        <li><a href="">Adidas </a></li>--}%
                    %{--                                        <li><a href="">Puma</a></li>--}%
                    %{--                                        <li><a href="">ASICS </a></li>--}%
                    %{--                                    </ul>--}%
                    %{--                                </div>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title">--}%
                    %{--                                    <a data-toggle="collapse" data-parent="#accordian" href="#mens">--}%
                    %{--                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>--}%
                    %{--                                        Mens--}%
                    %{--                                    </a>--}%
                    %{--                                </h4>--}%
                    %{--                            </div>--}%
                    %{--                            <div id="mens" class="panel-collapse collapse">--}%
                    %{--                                <div class="panel-body">--}%
                    %{--                                    <ul>--}%
                    %{--                                        <li><a href="">Fendi</a></li>--}%
                    %{--                                        <li><a href="">Guess</a></li>--}%
                    %{--                                        <li><a href="">Valentino</a></li>--}%
                    %{--                                        <li><a href="">Dior</a></li>--}%
                    %{--                                        <li><a href="">Versace</a></li>--}%
                    %{--                                        <li><a href="">Armani</a></li>--}%
                    %{--                                        <li><a href="">Prada</a></li>--}%
                    %{--                                        <li><a href="">Dolce and Gabbana</a></li>--}%
                    %{--                                        <li><a href="">Chanel</a></li>--}%
                    %{--                                        <li><a href="">Gucci</a></li>--}%
                    %{--                                    </ul>--}%
                    %{--                                </div>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%

                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title">--}%
                    %{--                                    <a data-toggle="collapse" data-parent="#accordian" href="#womens">--}%
                    %{--                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>--}%
                    %{--                                        Womens--}%
                    %{--                                    </a>--}%
                    %{--                                </h4>--}%
                    %{--                            </div>--}%
                    %{--                            <div id="womens" class="panel-collapse collapse">--}%
                    %{--                                <div class="panel-body">--}%
                    %{--                                    <ul>--}%
                    %{--                                        <li><a href="">Fendi</a></li>--}%
                    %{--                                        <li><a href="">Guess</a></li>--}%
                    %{--                                        <li><a href="">Valentino</a></li>--}%
                    %{--                                        <li><a href="">Dior</a></li>--}%
                    %{--                                        <li><a href="">Versace</a></li>--}%
                    %{--                                    </ul>--}%
                    %{--                                </div>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title"><a href="#">Kids</a></h4>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title"><a href="#">Fashion</a></h4>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title"><a href="#">Households</a></h4>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title"><a href="#">Interiors</a></h4>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title"><a href="#">Clothing</a></h4>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title"><a href="#">Bags</a></h4>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                        <div class="panel panel-default">--}%
                    %{--                            <div class="panel-heading">--}%
                    %{--                                <h4 class="panel-title"><a href="#">Shoes</a></h4>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    </div><!--/category-productsr-->

                    <div class="brands_products"><!--brands_products-->
                        <h2>Marcas</h2>
                        <div class="brands-name">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href=""> <span class="pull-right">(50)</span>Acne</a></li>
                                <li><a href=""> <span class="pull-right">(56)</span>Grüne Erde</a></li>
                                <li><a href=""> <span class="pull-right">(27)</span>Albiro</a></li>
                                <li><a href=""> <span class="pull-right">(32)</span>Ronhill</a></li>
                                <li><a href=""> <span class="pull-right">(5)</span>Oddmolly</a></li>
                                <li><a href=""> <span class="pull-right">(9)</span>Boudestijn</a></li>
                                <li><a href=""> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
                            </ul>
                        </div>
                    </div><!--/brands_products-->

                    <div class="price-range"><!--price-range-->
                        <h2>Rango de precios</h2>
                        <div class="well">
                            <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                            <b>$ 0</b> <b class="pull-right">$ 600</b>
                        </div>
                    </div><!--/price-range-->

                    <div class="shipping text-center"><!--shipping-->
                        <img src="images/home/shipping.jpg" alt="" />
                    </div><!--/shipping-->

                </div>
            </div>

            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Productos</h2>

                    <g:if test="${destacados?.size() > 0}">
                        <div style="color: #000000">Destacados</div>

                        <g:each in="${destacados}" var="prod" status="i">
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="images/shop/product12.jpg" alt="" />
                                            <h2>${prod.tt}</h2>
                                            <p>${prod.sb ?: 'Sin descripción'}</p>
                                            <img width="253px" height="auto" style="padding: 1px" src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>${prod.tt}</h2>
                                                %{--                                            <p>${prod.sb ?: 'Sin descripción'}</p>--}%
                                                %{--                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ver</a>--}%
                                                <a href="${createLink(controller: 'ver', action: 'carrusel', params: [id: prod.id, tipo: 3])}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i> Ver</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="images/shop/product12.jpg" alt="" />
                                        <h2>Su producto aquí</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ver</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>Su producto aquí</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ver</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="images/shop/product12.jpg" alt="" />
                                        <h2>Su producto aquí</h2>
                                        <p>Easy Polo Black Edition</p>
                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ver</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>Su producto aquí</h2>
                                            <p>Easy Polo Black Edition</p>
                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ver</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                        <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </g:if>


                    <g:if test="${normales?.size() > 0}">
                        <div style="color: #47b636">Normales</div>
                        <g:each in="${normales}" var="prod" status="i">
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src="images/shop/product12.jpg" alt="" />
                                            <h2>${prod.tt}</h2>
                                            <p>${prod.sb ?: 'Sin descripción'}</p>
                                            <img width="253px" height="auto" style="padding: 1px" src="${request.contextPath}/principal/getImgnProd?ruta=${prod.rt}&tp=${prod.tp}&id=${prod.p}"/>
                                        </div>
                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2>${prod.tt}</h2>
                                                %{--                                            <p>${prod.sb ?: 'Sin descripción'}</p>--}%
                                                %{--                                            <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ver</a>--}%
                                                <a href="${createLink(controller: 'ver', action: 'carrusel', params: [id: prod.id, tipo: 3])}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i> Ver</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </g:if>


                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/shop/product12.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%
                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/shop/product11.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%
                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/shop/product10.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%
                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/shop/product9.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                                <img src="images/home/new.png" class="new" alt="" />--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%
                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/shop/product8.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                                <img src="images/home/sale.png" class="new" alt="" />--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%
                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/shop/product7.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%

                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/home/product6.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%

                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/home/product5.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%

                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/home/product4.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%

                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/home/product3.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%


                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/home/product2.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%

                %{--                    <div class="col-sm-4">--}%
                %{--                        <div class="product-image-wrapper">--}%
                %{--                            <div class="single-products">--}%
                %{--                                <div class="productinfo text-center">--}%
                %{--                                    <img src="images/home/product1.jpg" alt="" />--}%
                %{--                                    <h2>$56</h2>--}%
                %{--                                    <p>Easy Polo Black Edition</p>--}%
                %{--                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                </div>--}%
                %{--                                <div class="product-overlay">--}%
                %{--                                    <div class="overlay-content">--}%
                %{--                                        <h2>$56</h2>--}%
                %{--                                        <p>Easy Polo Black Edition</p>--}%
                %{--                                        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>--}%
                %{--                                    </div>--}%
                %{--                                </div>--}%
                %{--                            </div>--}%
                %{--                            <div class="choose">--}%
                %{--                                <ul class="nav nav-pills nav-justified">--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>--}%
                %{--                                    <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>--}%
                %{--                                </ul>--}%
                %{--                            </div>--}%
                %{--                        </div>--}%
                %{--                    </div>--}%

                    <ul class="pagination" style="margin-top: 60px">
                        <li class="active"><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">&raquo;</a></li>
                    </ul>
                </div><!--features_items-->
            </div>
        </div>
    </div>
</section>

<footer id="footer"><!--Footer-->
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="companyinfo">
                        <h2><span>e</span>-shopper</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="#">
                                <div class="iframe-img">
                                    <img src="images/home/iframe1.png" alt="" />
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-play-circle-o"></i>
                                </div>
                            </a>
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="#">
                                <div class="iframe-img">
                                    <img src="images/home/iframe2.png" alt="" />
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-play-circle-o"></i>
                                </div>
                            </a>
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="#">
                                <div class="iframe-img">
                                    <img src="images/home/iframe3.png" alt="" />
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-play-circle-o"></i>
                                </div>
                            </a>
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="#">
                                <div class="iframe-img">
                                    <img src="images/home/iframe4.png" alt="" />
                                </div>
                                <div class="overlay-icon">
                                    <i class="fa fa-play-circle-o"></i>
                                </div>
                            </a>
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="address">
                        <img src="images/home/map.png" alt="" />
                        <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-widget">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>Service</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="">Online Help</a></li>
                            <li><a href="">Contact Us</a></li>
                            <li><a href="">Order Status</a></li>
                            <li><a href="">Change Location</a></li>
                            <li><a href="">FAQ’s</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>Quock Shop</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="">T-Shirt</a></li>
                            <li><a href="">Mens</a></li>
                            <li><a href="">Womens</a></li>
                            <li><a href="">Gift Cards</a></li>
                            <li><a href="">Shoes</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>Policies</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="">Terms of Use</a></li>
                            <li><a href="">Privecy Policy</a></li>
                            <li><a href="">Refund Policy</a></li>
                            <li><a href="">Billing System</a></li>
                            <li><a href="">Ticket System</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>About Shopper</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="">Company Information</a></li>
                            <li><a href="">Careers</a></li>
                            <li><a href="">Store Location</a></li>
                            <li><a href="">Affillate Program</a></li>
                            <li><a href="">Copyright</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3 col-sm-offset-1">
                    <div class="single-widget">
                        <h2>About Shopper</h2>
                        <form action="#" class="searchform">
                            <input type="text" placeholder="Your email address" />
                            <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                            <p>Get the most recent updates from <br />our site and be updated your self...</p>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <p class="pull-left">Copyright &copy; Tedein S.A. 2021 &nbsp;  Versión: ${message(code: 'version', default: '1.1.0x')}</p>
                %{--                <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>--}%
            </div>
        </div>
    </div>

</footer><!--/Footer-->

<asset:javascript src="/index2/jquery.js"/>
<asset:javascript src="/index2/price-range.js"/>
<asset:javascript src="/index2/jquery.scrollUp.min.js"/>
<asset:javascript src="/index2/bootstrap.min.js"/>
<asset:javascript src="/index2/jquery.prettyPhoto.js"/>
<asset:javascript src="/index2/main.js"/>
<asset:javascript src="/apli/bootbox.js"/>


<script type="text/javascript">


    $("#ingresar").click(function () {
        cargarIngreso();
    });

    $('#bsca').keyup(function (ev) {
        if (ev.keyCode == 13) {
            $("#btn-buscar").click();
        }
    })

    $("#btn-borrar").click(function () {
        event.preventDefault()
        $('#bsca').val('');
    });

    $("#btn-buscar").click(function () {
        var dato = $('#bsca').val()
        var ctgr = $('#categoriaBuscar').val()
        // console.log('hola', dato);
        location.href="${createLink(controller: 'principal', action: 'buscar')}?bscr=" + dato + "&ctgr=" + ctgr
    });

    function cargarIngreso() {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'principal', action: 'login_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgCreateEditIngreso",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "Cancelar",
                            className: "btn-primary",
                            callback: function () {
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    $("#registro").click(function () {
        cargarRegistro();
    });

    function cargarRegistro() {
        // console.log("cargar")
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action: 'registro_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgCreateEditRegistro",
                    // class   : "long",
                    // title   : "Registro de usuarios",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "Cancelar",
                            className: "btn-primary",
                            callback: function () {
                            }
                        },
                        guardar: {
                            id: "btnSave",
                            label: "<i class='fa fa-save'></i> Guardar",
                            className: "btn-success",
                            callback: function () {
                                return submitFormRegistro();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormRegistro() {
        var $form = $("#frmRegistro");
        if ($form.valid()) {
            var d = cargarLoader("Guardando...");
            $.ajax({
                type: "POST",
                url: '${createLink(controller: 'persona', action:'saveRegistro_ajax')}',
                data: $form.serialize(),
                success: function (msg) {
                    var parts = msg.split("_");
                    if (parts[0] == 'ok') {
                        bootbox.alert("<i class='fa fa-envelope fa-2x text-info'></i> Un mail de verificación ha sido enviado a su correo <br> <i class='fa fa-exclamation-circle fa-2x text-warning'></i> Si no ha recibido el corre, revise su bandeja de spam", function(){
                            d.modal('hide');
                        })
                    }else {
                        if(parts[0] == 'er'){
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i>" + parts[1], function(){
                                d.modal('hide');
                            })
                        }else{
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-danger'></i>" + "Error al crear el usuario", function(){
                                d.modal('hide');
                            })
                        }
                    }
                }
            });
        } else {
            return false;
        } //else
    }

</script>

%{--<script src="js/jquery.js"></script>--}%
%{--<script src="js/price-range.js"></script>--}%
%{--<script src="js/jquery.scrollUp.min.js"></script>--}%
%{--<script src="js/bootstrap.min.js"></script>--}%
%{--<script src="js/jquery.prettyPhoto.js"></script>--}%
%{--<script src="js/main.js"></script>--}%
</body>
</html>