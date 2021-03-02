<!DOCTYPE html>
<html lang="en">

<head>
	<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
	%{--	<meta charset="utf-8">--}%
	%{--	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--}%
	%{--	<meta name="description" content="">--}%
	%{--	<meta name="author" content="">--}%

	%{--	<meta name="layout" content="main">--}%

	<title>Ventas</title>

	<!-- Bootstrap core CSS -->
	<asset:stylesheet src="/merc/bootstrap.min.css"/>

	<!-- Custom styles for this template -->
	<asset:stylesheet src="/apli/shop-homepage.css"/>
	<asset:javascript src="/merc/jquery.min.js"/>
	<asset:javascript src="/merc/bootstrap.bundle.js"/>
	<asset:javascript src="/apli/bootbox.js"/>
	<asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.min.js"/>
	<asset:javascript src="/jquery-validation-1.11.1/js/jquery.validate.js"/>
	<asset:javascript src="/jquery-validation-1.11.1/localization/messages_es.js"/>
	<asset:javascript src="/apli/functions.js"/>
	<asset:javascript src="/apli/loader.js"/>
	<asset:javascript src="/apli/fontawesome.all.min.js"/>

	<style type="text/css">
	.lista-item {
		position: relative;
		display: block;
		padding: .5rem 1.0rem;
		background-color: #fff;
		border: 1px solid rgba(0,0,0,.125);
		border-top-width: 1px;
	}
	.consulta{
		font-size: small;
		background-color: #fdfffd;
	}
	</style>
</head>

<body>

<mn:menuHg activo="${activo}"/>
<!-- Navigation -->
%{--
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#">Hg</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">About</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Services</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${createLink(controller: 'login', action: 'login')}">Admin</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
--}%



<!-- Page Content -->
<div class="container">

	<div class="row">

		<div class="col-lg-3">


			<g:if test="${usuario}">
				<label style="margin-top: 10px">Usuario del sistema: ${usuario.nombre}</label>
			</g:if>


			<div class="btn-group" style="margin-top: 20px">
				<g:if test="${usuario}">
					<a href="${createLink(controller: 'login', action: 'logout')}" class="btn btn-warning" style="text-decoration: none"><i class="fa fa-user-times"></i> Salir</a>
				</g:if>
				<g:else>
					<a href="#" id="ingresar" class="btn btn-success" style="text-decoration: none"><i class="fa fa-user-check"></i> Ingresar</a>
				</g:else>

				<a href="#" id="registro" class="btn btn-info" style="text-decoration: none"><i class="fa fa-cog"></i> Crear usuario</a>
			</div>

			<div class="btn-group" style="margin-top: 5px">
				<g:if test="${usuario}">
					<a href="${createLink(controller: 'producto', action: 'list', id: usuario?.id)}" class="btn btn-success" style="text-decoration: none"><i class="fa fa-plus-circle"></i> Vender </a>
				</g:if>
			</div>

			<h2 class="my-2">Categorías</h2>
			<div class="list-group">
				<g:each in="${categorias}" var="ct">
					<a href="#${ct?.id}" class="lista-item">${ct.descripcion}</a>
				</g:each>
			</div>


			%{--			<h2 class="my-4 text-info">Consultas</h2>--}%
			%{--			<div class="list-group">--}%
			%{--				<g:each in="${consultas}" var="cs">--}%
			%{--					<a href="${cs?.link}" class="lista-item consulta text-info" title="${cs.texto}" target="_blank">--}%
			%{--						<img src="${request.contextPath}/principal/getImage?ruta=${cs.logo}" style='float:left; height:30px'>--}%
			%{--						${cs.titulo}</a>--}%
			%{--				</g:each>--}%
			%{--			</div>--}%

		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<div style="margin-top: 10px">
				<elm:flashMessage tipo="${flash.tipo}" icon="${flash.icon}" clase="${flash.clase}">${flash.message}</elm:flashMessage>
			</div>

			<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">

%{--					<g:each in="${imagenes}" var="file" status="i">--}%
%{--						<div class="carousel-item active">--}%
%{--                  		<img class="d-block img-fluid" alt="First slide" src="${createLink(controller: 'producto', action: 'getImage', params: [id: file.file, pro: 2] )}"/>--}%
%{--						</div>--}%
%{--					</g:each>--}%


					<div class="carousel-item active">
						<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#">
%{--							<img class="card-img-top" src="http://placehold.it/700x400" alt="">--}%
							<img class="card-img-top" src="${createLink(controller: 'producto', action: 'getImage', params: [id: 'ai.jpeg', pro: '1'] )}"/>

						</a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Anuncio Uno</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						%{--						<div class="card-footer">--}%
						%{--							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>--}%
						%{--						</div>--}%
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Anuncio Dos</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
						</div>
						%{--						<div class="card-footer">--}%
						%{--							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>--}%
						%{--						</div>--}%
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Anuncio Tres</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						%{--						<div class="card-footer">--}%
						%{--							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>--}%
						%{--						</div>--}%
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Four</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						%{--						<div class="card-footer">--}%
						%{--							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>--}%
						%{--						</div>--}%
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Five</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
						</div>
						%{--						<div class="card-footer">--}%
						%{--							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>--}%
						%{--						</div>--}%
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Six</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						%{--						<div class="card-footer">--}%
						%{--							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>--}%
						%{--						</div>--}%
					</div>
				</div>

			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

</div>
<!-- /.container -->







<!-- Footer -->
<footer class="py-5 bg-dark">
	<div class="container">
		<div style="text-align: center">
			<span class="text-white">Copyright &copy; Tedein S.A. 2021
			%{--				<a href="${createLink(controller: 'login', action: 'login')}" style="text-decoration: none">Admin</a>--}%
			</span>
		</div>
	</div>

	<!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--}%

<script type="text/javascript">

	// var $frm = $("#frmLogin");
	// var recargar = true;

	// function timedRefresh(timeoutPeriod) {
	// 	if(recargar) {
	// 		setTimeout("location.reload(true);",timeoutPeriod);
	// 	}
	// 	recargar = false
	// }

	// function doLogin() {
	// 	if ($frm.valid()) {
	// 		// $("#cargando").removeClass('hidden');
	// 		cargarLoader("Cargando...");
	// 		$(".btn-login").replaceWith($("#cargando"));
	// 		$("#frmLogin").submit();
	// 	}
	// }
	//
	// function doPass() {
	// 	if ($("#frmPass").valid()) {
	// 		$("#btn-pass").replaceWith(spinner);
	// 		$("#frmPass").submit();
	// 	}
	// }

	$(function () {

		// $("#ingresar").click(function () {
		// 	var initModalHeight = $('#modal-ingreso').outerHeight();
		// 	//alto de la ventana de login: 270
		// 	// console.log("ventana")
		// 	$("#modalBody").css({'margin-top': ($(document).height() / 2 - 135)}, {'margin-left': $(window).width() / 2});
		// 	// console.log("antes modeal")
		// 	$("#modal-ingreso").modal('show');
		// 	// console.log("luego modeal")
		// 	setTimeout(function () {
		// 		$("#login").focus();
		// 	}, 500);
		//
		// });

		// $("#btnOlvidoPass").click(function () {
		// 	$("#recuperarPass-dialog").modal("show");
		// 	$("#modal-ingreso").modal("hide");
		// });
		//
		// $("#btn-login").click(function () {
		// 	doLogin();
		// });
		//
		// $("#btn-pass").click(function () {
		// 	doPass();
		// });
		//
		// $("input").keyup(function (ev) {
		// 	if (ev.keyCode == 13) {
		// 		doLogin();
		// 	}
		// })

	});

	$("#ingresar").click(function () {
		cargarIngreso();
	});

	function cargarIngreso(){
		$.ajax({
			type    : "POST",
			url     : "${createLink(controller: 'principal', action: 'login_ajax')}",
			data    : {},
			success : function (msg) {
				var b = bootbox.dialog({
					id      : "dlgCreateEditIngreso",
					message : msg,
					buttons : {
						cancelar : {
							label     : "Cancelar",
							className : "btn-primary",
							callback  : function () {
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

	function cargarRegistro(){
		// console.log("cargar")
		$.ajax({
			type    : "POST",
			url     : "${createLink(controller: 'persona', action: 'registro_ajax')}",
			data    : {},
			success : function (msg) {
				var b = bootbox.dialog({
					id      : "dlgCreateEditRegistro",
					// class   : "long",
					// title   : "Registro de usuarios",
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
			openLoader("Guardando...");
			var d = cargarLoader("Guardando...");
			$.ajax({
				type    : "POST",
				url     : '${createLink(controller: 'persona', action:'saveRegistro_ajax')}',
				data    : $form.serialize(),
				success : function (msg) {
					// closeLoader();
					d.modal('hide');
					if(msg == 'ok'){
						bootbox.alert("Un mail de verificación ha sido enviado a su correo")
					}else{
						bootbox.alert("Error al crear el usuario")
					}
				}
			});
		} else {
			return false;
		} //else
	}

</script>

</body>

</html>