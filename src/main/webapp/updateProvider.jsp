<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Proveedores | Tienda</title>


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
				<div class="section-title">
					<h2>Actualizar Proveedor</h2>
				</div>
				<div class="row mt-3">
					<div class="col-md-10 mx-auto mb-5">
						<form method="post" action="" onsubmit=register() >
							<input type="number" class="form-control mb-3" name="nitProveedor" id="nitProveedor"
								placeholder="Nit Proveedor" title="Nit Proveedor" required> <input type="text"
								class="form-control mb-3" name="nombreProveedor" id="nombreProveedor"
								placeholder="Nombre Proveedor" title="Nombre Proveedor" required> <input type="text"
								class="form-control mb-3" name="ciudadProveedor" id="ciudadProveedor"
								placeholder="Ciudad" title="Ciudad" required> <input type="text"
								class="form-control mb-3" name="direccionProveedor" id="direccionProveedor"
								placeholder="Dirección" title="Dirección" required> <input type="text"
								class="form-control mb-3" name="telefonoProveedor" id="telefonoProveedor" placeholder="Teléfono" title="Teléfono" required>
							<p class="text-center">
								<input type="submit" class="btn btn-primary btn-block"
									value="Actualizar Proveedor">
							</p>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	
	<script>
    
    const nit = "<%= request.getParameter("nit") %>";
    document.getElementById("nitProveedor").value = nit;
    
    var searchUser = $.ajax({
		type:"GET",
		url: "http://localhost:8082/consultarProveedor?nit=" + nit,
		success: function(data) {
			$.each(data, function(i, item) {
				document.getElementById("nombreProveedor").value = item.nombreProveedor;
				document.getElementById("ciudadProveedor").value = item.ciudadProveedor;
				document.getElementById("direccionProveedor").value = item.direccionProveedor;
				document.getElementById("telefonoProveedor").value = item.telefonoProveedor;
			})
		}
    });
    
    
    function register() {
	    const nitProveedor = document.getElementById("nitProveedor").value;
	    const nombreProveedor = document.getElementById("nombreProveedor").value;
	    const ciudadProveedor = document.getElementById("ciudadProveedor").value;
	    const direccionProveedor = document.getElementById("direccionProveedor").value;
		const telefonoProveedor = document.getElementById("telefonoProveedor").value;
		
		
		var update = $.ajax({
			type: "POST",
			url: "http://localhost:8082/actualizarProveedor",
			data: JSON.stringify({"nitProveedor": nitProveedor, "nombreProveedor": nombreProveedor, "ciudadProveedor": ciudadProveedor, "direccionProveedor": direccionProveedor, "telefonoProveedor": telefonoProveedor}),
			datatype: "json",
			contentType: "application/json",
			success: function(res) {
				console.log(res);
				if (res == true){
					location.replace("./providers.jsp");
				} else {
					window.alert("Error Actualizando Proveedor");
				}
			}
		});
    }
    </script>
	
	<jsp:include page="./jsp/footer.jsp"></jsp:include>
	

</body>
</html>