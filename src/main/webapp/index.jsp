<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Organisers</title>

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
     <!-- header section starts  -->
    <header class="header">
        <a href="#" class="logo"><span>K</span>anasu</a>
  
        <nav class="navbar">
          <a href="index.jsp">Home</a>
          <a href="about.jsp">About</a>
          <a href="gallery.jsp">Gallery</a>
          <a href="book.jsp">Book</a>
          <a href="reviews.jsp">Review</a>
          <a href="contact.jsp">Contact</a>
          <% if (session.getAttribute("uname") == null) { %> 
          <a href="login.jsp">Login</a> 
          <% } %> 
          <% if (session.getAttribute("uname") != null) { %> 
           <form id="logoutForm" action="register" method="POST" style="display: inline;"> 
          <input type="hidden" name="logout" value="true"/> 
          <a href="#" onclick="document.getElementById('logoutForm').submit();" class="nav-link">Logout</a> 
          </form>
          <% } %>
        </nav>
  		<% 
  		if (session.getAttribute("uname") != null) { %> 
  		<div class="profile"> <img src="images/profile.png" alt="Profile Image"> 
  		<span><%= session.getAttribute("uname") %></span> 
  		</div> <% 
  		} 
  		%>
        <div id="menu-bars" class="fas fa-bars"></div>
      </header>

    <!-- home section starts  -->
    <section class="home" id="home">
      <div class="content">
        <h3>
          where your ideas take off
          <span> kanasu events </span>
        </h3>
       
      </div>

      <div class="swiper-container home-slider">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="images/home1.jpg" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="images/home2.jpg" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="images/home3.jpg" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="images/home4.jpg" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="images/home5.jpg" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="images/home6.jpg" alt="" />
          </div>
        </div>
      </div>
    </section>
    
	<%@include file="footer.jsp" %>
   

    

    
  

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

    <!--JS file-->
    <script src="app.js"></script>
  </body>
</html>
    