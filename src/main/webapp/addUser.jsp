<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Usuarios | Tienda</title>


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
    
    <script>
    function register() {
	    const emailUsuario = document.getElementById("emailUsuario").value;
	    const nombreUsuario = document.getElementById("nombreUsuario").value;
	    const cedulaUsuario = document.getElementById("cedulaUsuario").value;
	    const usuario = document.getElementById("usuario").value;
		const password = document.getElementById("password").value;
		
		console.log(emailUsuario, nombreUsuario, cedulaUsuario, usuario, password);
		
		var login = $.ajax({
			type: "POST",
			url: "http://localhost:8082/registrarUsuario",
			data: JSON.stringify({"cedulaUsuario": cedulaUsuario, "emailUsuario": emailUsuario, "nombreUsuario": nombreUsuario, "usuario": usuario, "password": password}),
			datatype: "json",
			contentType: "application/json",
			success: function(res) {
				console.log(res);
				if (res == true){
					location.replace("./users.jsp");
				} else {
					window.alert("Error Agregando Usuarios");
				}
			}
		});
    }
    </script>
      
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
					<h2>Agregar Usuario</h2>
				</div>
				<div class="row mt-3">
					<div class="col-md-10 mx-auto mb-5">
						<form method="post" action="">
							<input type="email" class="form-control mb-3" name="emailUsuario" id="emailUsuario"
								placeholder="Correo Electrónico" required> <input type="text"
								class="form-control mb-3" name="nombreUsuario" id="nombreUsuario"
								placeholder="Nombre Completo" required> <input type="number"
								class="form-control mb-3" name="cedulaUsuario" id="cedulaUsuario"
								placeholder="Número de Cédula" required> <input type="password"
								class="form-control mb-3" name="password" id="password"
								placeholder="Contraseña" required> <input type="text"
								class="form-control mb-3" name="usuario" id="usuario" placeholder="Usuario" required>
							<p class="text-center">
								<input type="button" class="btn btn-primary btn-block"
									value="Agregar Usuario" onclick=register()>
							</p>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	
	<jsp:include page="./jsp/footer.jsp"></jsp:include>
	

</body>
</html>