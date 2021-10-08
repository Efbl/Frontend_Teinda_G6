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
					<h2>Ventas por Cliente</h2>
				</div>
				<div class="row mt-3">
					<div class="col-md-8 mx auto mb-2"></div>
					<div class="table-responsive-sm">
						<table
							class="table table-dark table-borderless table-striped text-center">
							<thead class="table-dark">
								<tr>
									<th scope="col">Cédula</th>
									<th scope="col">Nombre</th>
									<th scope="col">Valor Total Ventas</th>
								</tr>
							</thead>
							<tbody id="myTableBody"></tbody>
						</table>
					</div>
				</div>
				<div class="row mt-3 mb-3 mt-3">
					<div class="col-md-6">
				      <!--<input type="number" class="form-control" id="cedulaUsuario2">-->
				    </div>
					<label for="total" class="col-md-2 col-form-label">Total Ventas $</label>
				    <div class="col-md-2 text-end">
				      <input type="number" class="form-control" id="total" readonly>
				    </div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

    <script type="text/javascript">
	   	total = document.getElementById("total");
	   	var sum = 0;
	   	var usuarios = $.ajax({
		   		type: "GET",
		   		url: "http://localhost:8082/listarVentasCliente",
		   		success: function(data){
		   			$.each(data, function(i, item) {
		   				lista = document.getElementById("myTableBody");
		   				var tr = document.createElement("tr");
		   				var columna1 = document.createElement("td");
		   				columna1.innerHTML = item.cedulaCliente;
		   				var columna2 = document.createElement("td");
		   				columna2.innerHTML = item.nombreCliente;	
		   				var columna3 = document.createElement("td");
		   				columna3.innerHTML = "$ " + item.totalVentasCliente;
		   				sum = sum + Number(item.totalVentasCliente);
		   				lista.appendChild(tr);
		   				tr.appendChild(columna1);
		   				tr.appendChild(columna2);
		   				tr.appendChild(columna3);
		   			});
		   			total.value = sum;
		   		}
	   		});
    </script>
	<jsp:include page="./jsp/footer.jsp"></jsp:include>

</body>

</html>