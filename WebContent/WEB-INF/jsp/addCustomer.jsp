<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<!-- <link href="resources/css/animate.css" rel="stylesheet" type="text/css"> -->

<title>register</title>
<script>
function validateform(){  


var passWord=document.registerform.passWord.value;  
  
var confirmPassword=document.registerform.confirmPassword.value; 

  


if(passWord==confirmPassword){  
return true;  
}  
else{  
alert("password must be same!");  
return false;  
}
}  

</script>
</head>


<body 
style="background-image: url('resources/images/pi1.jpg'); background-size: cover; color: #efd6e7;">


<fieldset id="registerfield">

<form:form action="register" name="registerform"
onsubmit="return validateform()">

<table border='0' width='480px' cellpadding='0' cellspacing='0'
align='center'>
<tr>
<td><h1>Registration Form</h1></td>
</tr>
<table border='0' width='480px' cellpadding='0' cellspacing='0'
align='left'>
<tr>

<td><label for="customerName"><strong>Name</strong></label></td>
<td><form:input path="customerName"  pattern="[a-zA-Z ].{3,20}"  
title="4 to 20 characters" required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><label for="phoneNumber"><strong>Phone
Number</strong></label></td>
<td><form:input path="phoneNumber" pattern="[0-9]{10}"
title="Enter a vaild mobile number" name="phoneNumber"
required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><label for="userName"><strong>User Name</strong></label></td>
<td><form:input path="userName" pattern="[a-zA-Z ].{3,10}"
title="4 to 20 characters" name="userName"
required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><label for="passWord"><strong>Password</strong></label></td>
<td><form:input path="passWord" type="password"
pattern=".{6,}" title="Six or more characters" name="passWord"
required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><label for="confirmPassWord"><strong>Confirm
Password</strong></label></td>
<td><input type="passWord" name="confirmPassword"
required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><label for="addressLine1"><strong>AddressLine1</strong></label></td>
<td><form:input path="address.addressLine1"
name="addressLine1" required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>


<td><label for="addressLine2"><strong>AddressLine2</strong></label></td>
<td><form:input path="address.addressLine2"
name="addressLine2" /></td>

</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><label for="city"><strong>City</strong></label></td>
<td><form:input path="address.city" name="city"
required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td><label for="pinCode"><strong>PinCode</strong></label></td>
<td><form:input path="address.pinCode" pattern="[0-9]{6}"
title="Enter a vaild pincode" name="pinCode" required="required" /></td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td align='right'><input type="submit" value="Register"
style="color: brown; background-color: transperant; font-weight: bold;" /></td>
</tr>
</table>
</table>

</form:form>
</fieldset>

<div>
<h5>${errorMessage}</h5>
</div>

<%-- <%@include file="footer.html"%> --%>
</body>
</html>

