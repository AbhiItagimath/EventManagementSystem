<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Page</title>

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
      
     <!-- about section starts  -->
     <br><br><br>
     <section class="about" id="about">
        <h1 class="heading"><span>about</span> us</h1>
  
        <div class="row">
          <div class="image">
            <img src="images/about.jpg" alt="" />
          </div>
  
          <div class="content">
            <h3>your occasion deserves our careful planning</h3>
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam
              labore fugiat ut esse perferendis perspiciatis provident dolores
              fuga in facilis culpa possimus, quia praesentium itaque, sapiente
              quasi harum rem asperiores.
            </p>
            <p>
              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Fugiat
              vero expedita incidunt provident quibusdam aut odit, numquam
              nesciunt similique nisi.
            </p>
            <a href="contact.jsp" class="btn">reach us</a>
          </div>
        </div>
      </section>
      
       <!-- service section starts  -->
     <section class="service" id="service">
        <h1 class="heading">our <span>services</span></h1>
  
        <div class="box-container">
          <div class="box">
            <i class="fas fa-envelope"></i>
            <h3>invitation card design</h3>
            <p>
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro,
              suscipit.
            </p>
          </div>
  
          <div class="box">
            <i class="fas fa-photo-video"></i>
            <h3>photos and videos</h3>
            <p>
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro,
              suscipit.
            </p>
          </div>
  
          <div class="box">
            <i class="fas fa-music"></i>
            <h3>entertainment</h3>
            <p>
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro,
              suscipit.
            </p>
          </div>
  
          <div class="box">
            <i class="fas fa-car"></i>
            <h3>enent vehicles</h3>
            <p>
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro,
              suscipit.
            </p>
          </div>
  
          <div class="box">
            <i class="fas fa-map-marker-alt"></i>
            <h3>venue selection</h3>
            <p>
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro,
              suscipit.
            </p>
          </div>
  
          <div class="box">
            <i class="fas fa-birthday-cake"></i>
            <h3>food catering</h3>
            <p>
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Porro,
              suscipit.
            </p>
          </div>
        </div>
      </section>
  
   

      <%@include file="footer.jsp" %>
      
      <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="app.js"></script>
</body>
</html>