<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/myCss.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>

<div class="table-title">
<h3>Reserved Seats</h3>
</div>

<table class="table-fill">
<thead>
<tr>
<th class="text-left">Reservation Id</th>
<th class="text-left">No of seats booked</th>
<th class="text-left">Date</th>

</tr>
</thead>
<tbody class="table-hover">
<c:forEach items="${customerReservation}" var="reservation">
<tr>

<td class="text-left"><c:out value="${reservation.getReservationId()}" /></td>
       
<td class="text-left"><c:out value="${reservation.getNumberOfSeats()}" /></td>
<td class="text-left"><c:out value="${reservation.getDate()}" /></td>
       

      
    
 </tr>
 </c:forEach>
 </tbody>
</table>
</body>
</html>
