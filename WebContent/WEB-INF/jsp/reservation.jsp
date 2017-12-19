<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/myCss.css" type="text/css" />
<title> Reservation</title>
</head>
<body>
<div class="table-title">
<h3>Reserve Your Seats</h3>
</div>
<table  class="table-fill">
<form:form action="reserve" method="post" >
<tr>
<tbody class="table-hover">
<td class="text-left">Number Of Seats:</td>
<td class="text-left"><form:select path="numberOfSeats" items="${numberOfSeats}"/></td><br>
<td class="text-left"> Date: </td>
<td class="text-left"><form:input path="date" type="date"/><br></td>

<td class="text-left"><input type="submit" value="BookSeat"
style="color: brown; background-color: transperant; font-weight: bold;" /></td>

</tr>
</tbody>
</form:form>
</table>
${errorReservation}



</body>
</html>