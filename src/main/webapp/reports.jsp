<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Reportes | Tienda</title>


    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Dosis:300,400,500,,600,700,700i|Lato:300,300i,400,400i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div
			class="container d-flex align-items-center justify-content-between">

			<h1 class="logo">
				<a href="./main.jsp">Tienda</a>
			</h1>
			<jsp:include page="./jsp/menu.jsp"></jsp:include>
		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<section id="services" class="services section-bg">
			<div class="container">
				<div class="section-title">
					<h2>Reportes</h2>
				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
				  <a href="./reporteUsuarios.jsp" class="btn btn-success mt-3 mb-3" type="button">Listado de Usuarios</a>
				  <a href="./reporteClientes.jsp" class="btn btn-warning mt-3 mb-3" type="button">Listado de Clientes</a>
				  <a href="./reporteVentas.jsp" class="btn btn-info mt-3 mb-3" type="button">Ventas por Cliente</a>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<jsp:include page="./jsp/footer.jsp"></jsp:include>

</body>

</html>