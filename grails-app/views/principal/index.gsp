<!DOCTYPE html>
<html lang="en">

<head>
	<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Ventas</title>

	<!-- Bootstrap core CSS -->
	<asset:stylesheet src="/merc/bootstrap.min.css"/>

	<!-- Custom styles for this template -->
	<asset:stylesheet src="/apli/shop-homepage.css"/>


%{--	<asset:javascript src="/jquery/jquery-2.2.4.js"/>--}%
%{--	<asset:javascript src="/jquery/jquery-ui.js"/>--}%

	<asset:javascript src="/merc/jquery.min.js"/>
	<asset:javascript src="/apli/bootbox.js"/>
	<asset:javascript src="/merc/bootstrap.bundle.js"/>
%{--	<asset:stylesheet src="/bootstrap-3.3.2/dist/css/bootstrap.css"/>--}%
%{--	<asset:javascript src="/bootstrap-3.3.2/dist/js/bootstrap.min.js"/>--}%



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

			<h2 class="my-2">Categorías</h2>
			<div class="list-group">
				<g:each in="${categorias}" var="ct">
					<a href="#${ct?.id}" class="list-group-item">${ct.descripcion}</a>
				</g:each>
			</div>


			<h2 class="my-4 text-info">Consultas</h2>
			<div class="list-group">
				<g:each in="${consultas}" var="cs">
					<a href="${cs?.link}" class="list-group-item text-info" title="${cs.texto}" target="_blank">
						&nbsp;${cs.titulo}<img src="${cs.logo}" style='float:left; height:30px'></a>
				</g:each>
			</div>

		</div>
		<!-- /.col-lg-3 -->

		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
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
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item One</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Two</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">Item Three</a>
							</h4>
							<h5>$24.99</h5>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
						</div>
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
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
						</div>
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
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
						</div>
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
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
						</div>
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
				<a href="#" id="registro" style="text-decoration: none">Vender</a>
			</span>
		</div>
	</div>

	<!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--}%

<script type="text/javascript">

	$("#registro").click(function () {
		// $("#modalBodyRegistro").css({'margin-top': ($(document).height() / 2 - 135)}, {'margin-left': $(window).width() / 2});
		// $("#modal-registro").modal('show');
		createEditRow();
	});

	function createEditRow(){
		$.ajax({
			type    : "POST",
			url     : "${createLink(controller: 'persona', action: 'registro_ajax')}",
			data    : {},
			success : function (msg) {
				var b = bootbox.dialog({
					id      : "dlgCreateEdit",
					// class   : "long",
					title   : "Registro de usuarios",
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
								return submitForm();
							} //callback
						} //guardar
					} //buttons
				}); //dialog
			} //success
		}); //ajax
	} //createEdit
</script>

</body>

</html>