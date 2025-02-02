<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery Page</title>

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
  
      <!-- gallery section starts  -->
      <br><br><br>
      <section class="gallery" id="gallery">
        <h1 class="heading">our <span>gallery</span></h1>
  
        <div class="box-container">
          <div class="box">
            <img src="images/gallery1.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery2.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery3.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery4.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery5.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery6.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery7.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery8.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
            </div>
          </div>
  
          <div class="box">
            <img src="images/gallery9.jpg" alt="" />
            <h3 class="title">best events</h3>
            <div class="icons">
              <a href="#" class="fas fa-heart"></a>
              <a href="#" class="fas fa-share"></a>
              <a href="#" class="fas fa-eye"></a>
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