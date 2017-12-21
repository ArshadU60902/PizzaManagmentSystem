<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link rel="stylesheet" href="resources/css/welcome.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<div class="w3-container w3-teal">
		<h1>AL-PIZZA</h1>
	</div>
	<ul>
		<li><a class="active" href="reserve">Reserve Seats</a></li>
		<li><a href="viewReserve">View All Reserved Seats</a></li>
		<li><a href="showOrders"> View Order</a></li>

		<li style="float: right"><a href="logout">Log Out</a></li>
	</ul>
	<%-- Total:${sessionScope.gTotal}<br>
Items:${allItems} --%>

	<h1>Cart Items</h1>

	<h3>${savedOrder}</h3>
	<table id="customers">
		<tr class="check">
			<th>Pizza name</th>
			<th>Toppings</th>
			<th>Extra for size</th>
			<th>Total</th>
			<th>Quantity</th>
		</tr>

		<c:forEach items="${allItems}" var="items">
			<tr>
				<c:forEach items="${pizzas}" var="pizza">
					<c:if test="${pizza.pizzaId eq items.pizzaId}">

						<td><c:out value="${pizza.pizzaName}"></c:out></td>
						<td width="40px"><c:forEach items="${items.toppings}"
								var="topping">
								<c:forEach items="${toppings}" var="top">
									<c:if test="${top.toppingId eq topping}">
*<c:out value="${top.toppingName}" />


									</c:if>

								</c:forEach>

							</c:forEach></td>


					</c:if>
				</c:forEach>

				<td><c:out value="${items.size}"></c:out></td>
				<td><c:out value="${items.total}"></c:out></td>
				<td><c:out value="${items.quantity}"></c:out></td>
			</tr>
		</c:forEach>
	</table>
	<form action="confirm" method="post">

		<input type="submit" class="button" value="Confirm">
	</form>

</body>
</html>