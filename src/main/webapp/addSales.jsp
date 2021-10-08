<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Ventas | Tienda</title>


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

			<!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
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
				<div class="row mt-3">
					<div class="col-md-10 mx-auto mb-5">
						<form class="row g-3" >
							 <div class="row mb-3">
							    <label for="cedulaCliente" class="col-md-2 col-form-label">Cédula Cliente</label>
							    <div class="col-md-2">
							      <input type="number" class="form-control" id="cedulaCliente" required>
							    </div>
							    <div class="col-md-2">
							    	<button type="button" class="btn btn-primary" onclick=consultarCliente()>Consultar</button>
							    </div>
							    <label for="nombreCliente" class="col-md-2 col-form-label">Cliente</label>
							    <div class="col-md-4">
							    	<input type="text" class="form-control" id="nombreCliente" readonly>
							    </div>
							  </div>
							  <div class="row mb-3 mt-3">
							  	<div class="col-md-2">
								    <label for="codigoProducto1" class="form-label">Cod Producto</label>
								    <input type="number" class="form-control" id="codigoProducto1">
							    </div>
							    <div class="col-md-2" style="margin-top:30px;">
							    	<button type="button" class="btn btn-primary" onclick=consultarProducto(1)>Consultar</button>
							    </div>
							    <div class="col-md-4">
								    <label for="nombreProducto1" class="form-label">Nombre Producto</label>
								    <input type="text" class="form-control" id="nombreProducto1" readonly>
							    </div>
							    <div class="col-md-1 text-center">
								    <label for="cantidadProducto1" class="form-label">Cant.</label>
								    <input type="number" class="form-control" id="cantidadProducto1" min="0" max="11" onchange=valorProducto(1)>
							    </div>
							    <div class="col-md-3 text-center">
								    <label for="valorTotalProducto1" class="form-label">Valor Total</label>
								    <input type="number" class="form-control" id="valorTotalProducto1" readonly>
							    </div>
							  </div>
							  <div class="row mb-3 mt-3">
							  	<div class="col-md-2">
								    <label for="codigoProducto2" class="form-label">Cod Producto</label>
								    <input type="number" class="form-control" id="codigoProducto2">
							    </div>
							    <div class="col-md-2" style="margin-top:30px;">
							    	<button type="button" class="btn btn-primary" onclick=consultarProducto(2)>Consultar</button>
							    </div>
							    <div class="col-md-4">
								    <label for="nombreProducto2" class="form-label">Nombre Producto</label>
								    <input type="text" class="form-control" id="nombreProducto2" readonly>
							    </div>
							    <div class="col-md-1 text-center">
								    <label for="cantidadProducto2" class="form-label">Cant.</label>
								    <input type="number" class="form-control" id="cantidadProducto2" min="0" max="11" onchange=valorProducto(2)>
							    </div>
							    <div class="col-md-3 text-center">
								    <label for="valorTotalProducto2" class="form-label">Valor Total</label>
								    <input type="number" class="form-control" id="valorTotalProducto2" readonly>
							    </div>
							  </div>
							  <div class="row mb-3 mt-3">
							  	<div class="col-md-2">
								    <label for="codigoProducto3" class="form-label">Cod Producto</label>
								    <input type="number" class="form-control" id="codigoProducto3">
							    </div>
							    <div class="col-md-2" style="margin-top:30px;">
							    	<button type="button" class="btn btn-primary" onclick=consultarProducto(3)>Consultar</button>
							    </div>
							    <div class="col-md-4">
								    <label for="nombreProducto3" class="form-label">Nombre Producto</label>
								    <input type="text" class="form-control" id="nombreProducto3" readonly>
							    </div>
							    <div class="col-md-1 text-center">
								    <label for="cantidadProducto3" class="form-label">Cant.</label>
								    <input type="number" class="form-control" id="cantidadProducto3" min="0" max="11" onchange=valorProducto(3)>
							    </div>
							    <div class="col-md-3 text-center">
								    <label for="valorTotalProducto3" class="form-label">Valor Total</label>
								    <input type="number" class="form-control" id="valorTotalProducto3" readonly>
							    </div>
							  </div>
							  <div class="row mb-3 mt-3">
							    <div class="col-md-8">
							      <!--<input type="number" class="form-control" id="cedulaUsuario2">-->
							    </div>
							    <label for="totalVenta" class="col-md-2 col-form-label">Total Venta</label>
							    <div class="col-md-2">
							      <input type="number" class="form-control" id="totalVenta" readonly>
							    </div>
							  </div>
							  <div class="row mb-3 mt-3">
							    <div class="col-md-8">
							      <!--<input type="number" class="form-control" id="cedulaUsuario2">-->
							    </div>
							    <label for="ivaVenta" class="col-md-2 col-form-label">Total Iva</label>
							    <div class="col-md-2">
							      <input type="number" class="form-control" id="ivaVenta" readonly>
							    </div>
							  </div>
							  <div class="row mb-3 mt-3">
							    <div class="col-md-8">
							      <!--<input type="number" class="form-control" id="cedulaUsuario2">-->
							    </div>
							    <label for="valorVenta" class="col-md-2 col-form-label">Total con Iva</label>
							    <div class="col-md-2">
							      <input type="number" class="form-control" id="valorVenta" readonly>
							    </div>
							  </div>
							  <div class="row mb-3 mt-3">
							  	<div class="col-md-8 text-end">
							  		<button type="button" class="btn btn-primary" onclick=guardarVenta()>Confirmar</button>
							  	</div>
							  </div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	<script type="text/javascript" src="./js/sales.js"></script>
	<jsp:include page="./jsp/footer.jsp"></jsp:include>

</body>
</html>