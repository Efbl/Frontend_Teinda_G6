const usuario = localStorage.getItem("username");
var user = $.ajax({
    		type:"GET",
    		url: "http://localhost:8082/consultarUsuarioUsername?username=" + usuario,
    		success: function(data) {
    			//console.log(data);
    			if(data.length > 0){ 
    				$.each(data, function(j, item) {
        				cedulaUsuario = item.cedulaUsuario;	
        			});
    			} else {
					window.alert("Usuario no ha iniciado sesión");	
				}
    		},
			error: function() {
				window.alert("Error");
			}
    	});


function consultarCliente () {
	cedulaCliente = document.getElementById("cedulaCliente").value;
	nombreCliente = document.getElementById("nombreCliente");
	
	var searchCustomer = $.ajax({
    		type:"GET",
    		url: "http://localhost:8082/consultarCliente?cedula=" + cedulaCliente,
    		success: function(data) {
    			console.log(data);
    			if(data.length > 0){ 
    				$.each(data, function(i, item) {
        				nombreCliente.value = item.nombreCliente;	
        			});
    			} else {
					alert("El cliente no existe");	
				}
    		},
			error: function() {
				alert("Error");
			}
    	});
}

function consultarProducto(i) {
	codigoProducto = document.getElementById("codigoProducto"+i).value;
	nombreProducto = document.getElementById("nombreProducto"+i);
	
	var searchProduct = $.ajax({
    		type:"GET",
    		url: "http://localhost:8082/consultarProducto?code=" + codigoProducto,
    		success: function(data) {
    			//console.log(data);
    			if(data.length > 0){ 
    				$.each(data, function(j, item) {
        				nombreProducto.value = item.nombreProducto;	
        			});
    			} else {
					alert("El producto no existe");	
				}
    		},
			error: function() {
				alert("Error");
			}
    	});
}

function valorProducto(i) {
	codigoProducto = document.getElementById("codigoProducto"+i).value;
	cantidadProducto = document.getElementById("cantidadProducto"+i).value;
	valorTotalProducto = document.getElementById("valorTotalProducto"+i);
	totalVenta = document.getElementById("totalVenta");
	ivaVenta = document.getElementById("ivaVenta");
	valorVenta = document.getElementById("valorVenta");
	
	let total = 0;
	
	totalVenta.value = total;
	
	var searchProduct = $.ajax({
    		type:"GET",
    		url: "http://localhost:8082/consultarProducto?code=" + codigoProducto,
    		success: function(data) {
    			//console.log(data);
    			if(data.length > 0){ 
    				$.each(data, function(k, item) {
        				valorTotalProducto.value = item.precioCompra * cantidadProducto;	
        		});
				for(j = 1; j<=3; j++) {
					total = total + Number(document.getElementById("valorTotalProducto"+j).value);
				}
				totalVenta.value = total;
				ivaVenta.value = Number(total) * 0.19;
				valorVenta.value = Number(totalVenta.value) + Number(ivaVenta.value);
    			} else {
					alert("Elige un Producto");	
				}
    		},
			error: function() {
				alert("Error");
			}
    	});
}

function guardarVenta() {
	const cedulaCliente = document.getElementById("cedulaCliente").value;
    const ivaVenta = document.getElementById("ivaVenta").value;
    const totalVenta = document.getElementById("totalVenta").value;
    const valorVenta = document.getElementById("valorVenta").value;


     $.ajax({
			type: "POST",
			url: "http://localhost:8082/registrarVenta",
			data: JSON.stringify({"cedula_cliente": Number(cedulaCliente), "cedula_usuario": Number(cedulaUsuario), "iva_venta": Number(ivaVenta), "total_venta": Number(totalVenta), "valor_venta": Number(valorVenta)}),
			processData: false,
			cache: false,
			contentType: "application/json",
			success: function(res) {
				console.log(res);
				if (res!=0){
					// window.alert("Venta Registrada");
					crear_detalle_venta(res);
					//location.replace("./users.jsp");
				} else {
					window.alert("Error Agregando Venta");
				}
			},
			error: function() {
				window.alert("Error Agregando Venta");
			}
		});
}

function crear_detalle_venta (res) {
	const codigoVenta = res;
	var i = 0;
	
	for(i=1; i <=3;i++) {
		if(document.getElementById("nombreProducto"+i).value != "" && document.getElementById("cantidadProducto"+i).value != ""){
			var cantidadProducto = document.getElementById("cantidadProducto"+i).value;
			var codigoProducto = document.getElementById("codigoProducto"+i).value;
			var valorTotal = document.getElementById("valorTotalProducto"+i).value;
			var valorIva = Number(valorTotal) * 0.19;
			var valorVenta = Number(valorTotal) + Number(valorIva);
			
			$.ajax({
				type: "POST",
				url: "http://localhost:8082/registrarDetalleVenta",
				data: JSON.stringify({"cantidadProducto": Number(cantidadProducto), "codigoProducto": Number(codigoProducto), "codigoVenta": Number(codigoVenta), "valorTotal": Number(valorTotal), "valorVenta": Number(valorVenta), "valorIva": Number(valorIva)}),
				processData: false,
				cache: false,
				contentType: "application/json",
				success: function(res) {
					console.log(res);
					if (res!=0){
						window.alert("Venta Registrada");
						//location.replace("./users.jsp");
					} else {
						window.alert("Error Agregando Venta");
					}
				},
				error: function() {
					window.alert("Error Agregando Venta");
				}
			});
			
		}
		
	}
}