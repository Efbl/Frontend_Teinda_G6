<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	const user = "<%= request.getParameter("user")%>";
	const password = "<%= request.getParameter("password")%>";
	
	var login = $.ajax({
		type: "POST",
		url: "http://localhost:8082/login",
		data: JSON.stringify({"usuario": user, "password": password}),
		datatype: "json",
		contentType: "application/json",
		success: function(res) {
			if (res == true){
				if(typeof(Storage)!= "undefined"){
					localStorage.setItem("username", user);					
				}
				location.replace("./main.jsp");
			} else {
				window.alert("Usuario o Contraseña Incorrectos");
				location.replace("./index.html");
			}
		}
	});

</script>
</head>
<body>
</body>
</html>