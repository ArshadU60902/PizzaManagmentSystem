<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/welcome.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<%-- Total:${sessionScope.gTotal}<br>
Items:${allItems} --%>

<h1>Cart Items</h1>
<table id="customers">
<tr>
<th>Pizza name </th>
<th>Toppings</th>
<th>Rate per size </th>
<th>Total </th>
<th>Quantity </th>
</tr>
<tr>
<c:forEach items="${allItems}" var="items">
<c:forEach items="${pizzas}" var="pizza">
<c:if test="${pizza.pizzaId eq items.pizzaId}">
<tr><td><c:out value="${pizza.pizzaName}"></c:out></td>
<c:forEach items="${items.toppings}" var="topping">
<c:forEach items="${toppings}" var="top">
<c:if test="${top.toppingId eq topping}">
<td><tr><td></td><td><c:out value="${top.toppingName}"></c:out></td></tr>
</c:if>
</c:forEach>
</c:forEach>
</c:if>
</c:forEach></tr>





<tr><td></td><td></td><td style="text-align:center;"><c:out value="${items.size}"></c:out></td>
<td style="text-align:center;"><c:out value="${items.total}"></c:out></td>
<td style="text-align:center;"><c:out value="${items.quantity}"></c:out></td>
</tr>
</c:forEach>
</table>
<form action="confirm" method="post">

<input type="submit"  class="button" value="Confirm">
</form>

</body>
</html>