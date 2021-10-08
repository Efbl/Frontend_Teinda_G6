<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Productos | Tienda</title>


    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Dosis:300,400,500,,600,700,700i|Lato:300,300i,400,400i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="./assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="./assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="./assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="./assets/css/style.css" rel="stylesheet">
    
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
					<h2>Agregar Archivo Productos</h2>
				</div>
				<div class="row mt-3">
					<div class="col-md-10 mx-auto mb-5">
						<form method="post" action="">
							<div class="row mt-3">
								<div class="col-md-5 mx-auto mb-5">
								 <input type="file" class="form-control mb-3 btn" name="productos" id="productos" placeholder="Archivo" accept="text/csv" required> 
								</div>
							</div>
							<div class="col-md-5 mx-auto mb-5 text-center">
									<button id="confirm" type="button" onclick=test() class="btn btn-primary btn-block">Subir Archivo  <i class="bx bxs-up-arrow-circle ml-5"></i></button>
							</div>
						</form>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-8 mx auto mb-2"></div>
					<p style="color:red;" id="text">Documento Inválido</p>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	
	<script src="./assets/js/jquery-csv.js"></script>
	<script>
	text = document.getElementById("text");
	text.style.visibility = "hidden";
	confirm = document.getElementById("confirm");
	confirm.disabled = true;
	
	var fd = null;
	
	$("#productos").change(function () {
		fd = new FormData();
		fd.append('file', this.files[0]);
		if(this.files.length != 0)
			confirm.disabled = false;
		else
			confirm.disabled = true;
		text.style.visibility = "hidden";
		
	});
	
	
	function test() {
		$.ajax({
			url: "http://localhost:8082/subirProductos",
			type: 'POST',
			data: fd,
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			cache: false,
			success: function(res) {
				if(res) {
					location.replace("./main.jsp")
				} else {
					text.style.visibility = "visible";
				}
			},
			error: function(err) {
				console.log(err)
			}
		});
	}
	</script>
	
	<jsp:include page="./jsp/footer.jsp"></jsp:include>
	

</body>
</html>