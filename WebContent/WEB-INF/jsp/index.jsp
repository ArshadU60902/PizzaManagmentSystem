<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/style.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<div class="w3-container w3-teal">
		<header>
			<h1>AL-PIZZA</h1>
		</header>
	</div>



	<h1>${fromJsp.userName}</h1>
	<div>
		<form action="login" method="post">
			<label for="">UserName</label><br> <input type="text"
				name="userName" /><br> <label for="">PassWord</label><br>
			<input type="password" name="passWord" /><br>
			<br> <input type="submit" value="Login" />
		</form>
	</div>
	${error}
	<br>
	<a href="register">Register Here</a>
</body>
</html>