<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="resources/css/news.css" type="text/css" />
<title>Insert title here</title>
</head>

<body>
	<div class="w3-container w3-teal">
		<h1>AL-PIZZA</h1>
	</div>
	<ul>
		<li><a class="active" href="reserve">Reserve Seats</a></li>
		<li><a href="viewReserve">View All Reserved Seats</a></li>
		<li><a href="proceedToCheckOut">Proceed To CheckOut</a></li>

		<li style="float: right"><a href="logout">Log Out</a></li>
	</ul>

	<br>
	<br>
	<br>
	<br>
	<h1>Your Order</h1>
	<table>
		<c:forEach items="${orderList}" var="order">
			<tr>
				<td><h5>Order ID:</h5></td>
				<th>Image</th>
				<th>Pizza name</th>
				<th>Total</th>
				<th>Quantity</th>
			</tr>
			<tr>
				<td><h5></h5> <c:out value="${order.orderId}"></c:out></</td>
				<td><img alt="image" src="${order.pizza.pizzaImage}"
					height="100px" width="100px"></td>
				<td><c:out value="${order.pizza.pizzaName}"></c:out></td>
				<td style="text-align: center;"><c:out
						value="${order.grandTotal}"></c:out></td>
				<td style="text-align: center;"><c:out
						value="${order.quantity}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
	<h5>
		Grand total: Rs.
		<c:out value="${totalAmount}"></c:out>
	</h5>
	<form action="cancel" method="post">
		<input name="getId" type="number" min=1 />
		<button type="submit">Cancel Order</button>
	</form>

</body>
</html>
