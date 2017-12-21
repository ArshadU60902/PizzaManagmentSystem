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
<title>Insert title here</title>
</head>
<body style="margin-left: 25px; margin-right: 25px; margin-top: 10px">
	<div class="w3-container w3-teal">
		<h1>AL-PIZZA</h1>
	</div>
	<ul>
		<li><a class="active" href="reserve">Reserve Seats</a></li>
		<li><a href="viewReserve">View All Reserved Seats</a></li>
		<li><a href="proceedToCheckOut">Proceed To CheckOut</a></li>
		<li><a href="showOrders">View Order</a></li>
		<li style="float: right"><a href="logout">Log Out</a></li>
	</ul>




	<div class="row" style="padding-left: 15px; padding-right: 15px;">
		<div style="background-image: url('resources/images/p2.jpg');">


			<c:forEach items="${sessionScope.pizzas}" var="pizza">
				<div class="col-lg-6"
					style="float: left; padding-left: 5px; padding-top: 10px">


					<form:form action="addToCart" method="post">

						<form:hidden path="pizzaId" value="${pizza.pizzaId}" />
						<c:out value="${ pizza.pizzaName}"></c:out>
						<br> Price:Rs.
				<c:out value="${ pizza.price}/- "></c:out>
						<br>


						<div class="row">
							<div class="col-sm-2">
								small <br>
								<form:radiobutton path="size" value="0"></form:radiobutton>
								<br> + Rs.0/-
							</div>
							<div class="col-sm-2">
								Medium <br>
								<form:radiobutton path="size" value="25"></form:radiobutton>
								<br> + Rs.25/-
							</div>
							<div class="col-sm-2">
								Large <br>
								<form:radiobutton path="size" value="50"></form:radiobutton>
								<br> + Rs.50/-
							</div>
						</div>


						<c:forEach items="${sessionScope.toppings}" var="topping">
							<br>${topping.toppingName}:
				<form:checkbox value="${topping.toppingId}" path="toppings" />${topping.price}
				
			</c:forEach>
						<div style="float: right;">
							Qty:
							<form:input path="quantity" type="number" value="1" min="1"
								max="100" />
							<input type="submit" value="AddToCart">
						</div>

					</form:form>



				</div>
			</c:forEach>
		</div>
	</div>
	<div class="w3-container w3-teal">
		<h5 style="text-align: center">Al-Pizza Internationals</h5>
		<p style="text-align: center">order@AlpizzaInternationals.com</p>
	</div>

</body>
</html>