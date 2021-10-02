<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Clientes | Tienda</title>


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
					<h2>Actualizar Cliente</h2>
				</div>
				<div class="row mt-3">
					<div class="col-md-10 mx-auto mb-5">
						<form method="post" action="" onsubmit=register() >
							<input type="number" class="form-control mb-3" name="cedulaCliente" id="cedulaCliente" placeholder="Número de Cédula" title="Número de Cédula" required> 
							<input type="email" class="form-control mb-3" name="emailCliente" id="emailCliente" placeholder="Correo Electrónico" title="Correo Electrónico" required> 
							<input type="text" class="form-control mb-3" name="nombreCliente" id="nombreCliente" placeholder="Nombre Completo" title="Nombre Completo" required> 
							<input type="text" class="form-control mb-3" name="direccionCliente" id="direccionCliente" placeholder="Dirección" title="Dirección" required> 
							<input type="text" class="form-control mb-3" name="telefonoCliente" id="telefonoCliente" placeholder="Teléfono" title="Teléfono" required>
							<p class="text-center">
								<input type="submit" class="btn btn-primary btn-block"
									value="Actualizar Cliente" >
							</p>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	
	<script>
    
    const cedula = "<%= request.getParameter("cedula") %>";
    document.getElementById("cedulaCliente").value = cedula;
    
    var searchUser = $.ajax({
		type:"GET",
		url: "http://localhost:8082/consultarCliente?cedula=" + cedula,
		success: function(data) {
			$.each(data, function(i, item) {
				document.getElementById("emailCliente").value = item.emailCliente;
				document.getElementById("nombreCliente").value = item.nombreCliente;
				document.getElementById("direccionCliente").value = item.direccionCliente;
				document.getElementById("telefonoCliente").value = item.telefonoCliente;
			})
		}
    });
    
    
    function register() {
	    const emailCliente = document.getElementById("emailCliente").value;
	    const nombreCliente = document.getElementById("nombreCliente").value;
	    const cedulaCliente = document.getElementById("cedulaCliente").value;
	    const direccionCliente = document.getElementById("direccionCliente").value;
		const telefonoCliente = document.getElementById("telefonoCliente").value;
		
		var login = $.ajax({
			type: "POST",
			url: "http://localhost:8082/actualizarCliente",
			data: JSON.stringify({"cedulaCliente": cedulaCliente, "direccionCliente": direccionCliente, "emailCliente": emailCliente, "nombreCliente": nombreCliente, "telefonoCliente": telefonoCliente}),
			datatype: "json",
			contentType: "application/json",
			success: function(res) {
				console.log(res);
				if (res == true){
					location.replace("./customers.jsp");
				} 
				window.alert("Error Agregando Cliente");
			}
		});
    }
    </script>
	
	<jsp:include page="./jsp/footer.jsp"></jsp:include>
	

</body>
</html>