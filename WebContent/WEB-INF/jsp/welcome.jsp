<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/welcome.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<table id="customers">

		<tr>
			<th>Image</th>
			<th>Pizza Name</th>
			<th>Pizza Type</th>
			<th>Price</th>
		</tr>
		<c:forEach items="${sessionScope.pizzas}" var="pizza">
			<tr>
				<td><img alt="pizza1" src="${pizza.pizzaImage}" height="200px"
					width="220"></td>
				<td><c:out value="${pizza.pizzaName}"></c:out></td>
				<td><c:out value="${ pizza.type}"></c:out></td>

				<td><c:out value="${ pizza.price}"></c:out></td>

			</tr>

		</c:forEach>
	</table>
	<table id="customers">
		<tr>
			<th>Topping Name</th>
			<th>Topping Price</th>
		</tr>
		<c:forEach items="${sessionScope.toppings}" var="topping">
			<tr>
				<td><c:out value="${topping.toppingName}"></c:out></td>
				<td><c:out value="${topping.price}"></c:out></td>
			</tr>
		</c:forEach>


	</table>



</body>
</html>