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
    
    <!--<script type="text/javascript">
    	var usuarios = $.ajax({
    		type: "GET",
    		url: "http://localhost:8082/listarUsuarios",
    		success: function(data){
    			$.each(data, function(i, item) {
    				lista = document.getElementById("myTableBody");
    				var tr = document.createElement("tr");
    				var columna1 = document.createElement("td");
    				columna1.innerHTML = item.cedulaUsuario;
    				var columna2 = document.createElement("td");
    				columna2.innerHTML = item.emailUsuario;
    				var columna3 = document.createElement("td");
    				columna3.innerHTML = item.nombreUsuario;	
    				var columna4 = document.createElement("td");
    				columna4.innerHTML = item.usuario; 
    				var columna5 = document.createElement("td");
    				columna5.innerHTML = "<a href='./updateUser.jsp?cedula="+item.cedulaUsuario+"'  class='btn btn-light' title='Editar Usuario'><i class='bx bx-edit-alt' style='color: #000;'></i></a>";
    				var columna6 = document.createElement("td");
    				columna6.innerHTML = "<a class='btn btn-light' title='Eliminar Usuario' onclick=borrar_usuario('"+item.cedulaUsuario+"')><i class='bx bx-trash-alt' style='color: #000;'></i></a>" ; 
    				
    				lista.appendChild(tr);
    				tr.appendChild(columna1);
    				tr.appendChild(columna2);
    				tr.appendChild(columna3);
    				tr.appendChild(columna4);
    				tr.appendChild(columna5);
    				tr.appendChild(columna6);
    			});
    		}
    	});
    	
    	function borrar_usuario(cedula) {
    		var borrar = $.ajax({
    			type: "DELETE",
    			url: "http://localhost:8082/eliminarUsuario?cedula=" + cedula,
    			success: function(data) {
    				location.reload();
    			}
    		});
    	}
    	
    	
    </script>-->
    
    
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
					<h2>Clientes</h2>
				</div>
				<div class="row mt-3">
					<div class="col-lg-3 col-md-4">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-clipboard" style="color: #41cf2e;"></i>
							</div>
							<h4 class="title">
								<a href="./addUser.jsp">Agregar Cliente</a>
							</h4>
						</div>
					</div>
					<div class="col-lg-3 col-md-4">
                        <div class="icon-box">
                            <div class="icon"><i class="bx bxs-id-card" style="color: #d6ff22;"></i></div>
                            <h4 class="title"><a href="./searchUser.jsp">Consultar Cliente</a></h4>
                        </div>
                    </div>
				</div>
				<div class="row mt-3">
					<div class="col-md-8 mx auto mb-2"></div>
					<div class="table-responsive-sm">
						<table
							class="table table-dark table-borderless table-striped text-center">
							<thead class="table-dark">
								<tr>
									<th scope="col">Cédula</th>
									<th scope="col">Nombre Completo</th>
									<th scope="col">Dirección</th>
									<th scope="col">Teléfono</th>
									<th scope="col">Correo Electrónico</th>
									<th scope="col" colspan="2">Acciones</th>
								</tr>
							</thead>
							<tbody id="myTableBody"></tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<jsp:include page="./jsp/footer.jsp"></jsp:include>

</body>

</html>