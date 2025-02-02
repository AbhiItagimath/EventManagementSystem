<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>

    <!--swiper css-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"
    />

    <!--font awesome-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />

    <!--css file-->
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <%@include file="navbar.jsp" %>
      <br><br><br>
    
    <!-- price section starts  -->
    <section class="price" id="price">
        <h1 class="heading">Event <span>Categories</span></h1>
  
        <div class="box-container">
          <div class="box">
            <h3 class="title">Basic</h3>
            <h3 class="amount">$399.00</h3>
            <ul>
              <li><i class="fas fa-xmark"></i>full services</li>
              <li><i class="fas fa-check"></i> decorations</li>
              <li><i class="fas fa-xmark"></i> music and photos</li>
              <li><i class="fas fa-xmark"></i> food and drinks</li>
              <li><i class="fas fa-xmark"></i> invitation card</li>
            </ul>
            <a href="booking.jsp?plan=basic&cost=399.00" class="btn">check out</a>
          </div>
  
          <div class="box">
            <h3 class="title">Prime</h3>
            <h3 class="amount">$599.00</h3>
            <ul>
              <li><i class="fas fa-xmark"></i>full services</li>
              <li><i class="fas fa-check"></i> decorations</li>
              <li><i class="fas fa-check"></i> music and photos</li>
              <li><i class="fas fa-xmark"></i> food and drinks</li>
              <li><i class="fas fa-xmark"></i> invitation card</li>
            </ul>
            <a href="booking.jsp?plan=prime&cost=599.00" class="btn">check out</a>
          </div>
  
          <div class="box">
            <h3 class="title">Luxury</h3>
            <h3 class="amount">$799.00</h3>
            <ul>
              <li><i class="fas fa-xmark"></i>full services</li>
              <li><i class="fas fa-check"></i> decorations</li>
              <li><i class="fas fa-check"></i> music and photos</li>
              <li><i class="fas fa-check"></i> food and drinks</li>
              <li><i class="fas fa-xmark"></i> invitation card</li>
            </ul>
            <a href="booking.jsp?plan=luxury&cost=799.00" class="btn">check out</a>
          </div>
  
          <div class="box">
            <h3 class="title">Ultra</h3>
            <h3 class="amount">$999.00</h3>
            <ul>
              <li><i class="fas fa-check"></i>full services</li>
              <li><i class="fas fa-check"></i> decorations</li>
              <li><i class="fas fa-check"></i> music and photos</li>
              <li><i class="fas fa-check"></i> food and drinks</li>
              <li><i class="fas fa-check"></i> invitation card</li>
            </ul>
            <a href="booking.jsp?plan=ultra&cost=999.00" class="btn">check out</a>
          </div>
        </div>
      </section>

      <%@include file="footer.jsp" %>
      
      <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="app.js"></script>
</body>
</html>