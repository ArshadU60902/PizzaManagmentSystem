<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/style.css" type="text/css" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>
<div class="w3-top">
  <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
    <a href="#home" class="w3-bar-item w3-button">Al-Pizza Delivery System</a>
    <!-- Right-sided navbar links. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="viewMenu" class="w3-bar-item w3-button">Menu</a>
      <a href="#menu" class="w3-bar-item w3-button">Login</a>
       <a href="#menu" class="w3-bar-item w3-button">Reservation</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a>
    </div>
  </div>
</div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1600px;min-width:500px" id="home">
  <img class="w3-image" src="resources/images/pizza6.jpg" alt="AlPizza" width="1600" height="800">
  <div class="w3-display-bottomleft w3-padding-large w3-opacity">
    <h1 class="w3-xxlarge">Al-PIZZA</h1>
  </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px">

  <!-- About Section -->

  
  <hr>
  
  <!-- Menu Section -->
  <div class="w3-row w3-padding-64" id="menu">
    <div class="w3-col l6 w3-padding-large">
     
     <div class="my">
     <h3>Sign In</h3>
  <form action="login" method="post" >
    <label for="fname">UserName</label>
    <input type="text" id="fname" name="userName" placeholder="Username">

    <label for="password">PassWord</label>
    <input type="password" id="lname" name="passWord" placeholder="password">
     
      <input type="submit" value="Login">
  </form>
  <form action="register">
   <input type="submit" value="SignUp">
   ${error}
  </form>
</div>
     
     
  
      
    </div>
    
    <div class="w3-col l6 w3-padding-large">
      <img src="resources/images/pizza5.jpg" class="w3-round w3-image w3-opacity-min" alt="PizzaPic" style="width:100%">
    </div>
  </div>

  <hr>

  <!-- Contact Section -->
  <div class="w3-container w3-padding-64" id="contact">
    <h1>Contact</h1><br>
    <p>We offer full-service of Pizza Delivary for any event, large or small. We understand your needs and we will deliver the food to satisfy the biggerst criteria of them all, both look and taste. Do not hesitate to contact us.</p>
    <p class="w3-text-blue-grey w3-large"><b>Al-Pizza Internationals,Near TechnoPark,Trivandrum</b></p>
    <p>You can also contact us by phone 9995111222 or email orderpizza@al-pizza.com</p>
   
  </div>
  
<!-- End page content -->
</div>

<!-- Footer -->
<footer class="w3-center w3-light-grey w3-padding-32">
  <p>Powered by Al-Pizza Internationals</p>
</footer>

</body>
</html>