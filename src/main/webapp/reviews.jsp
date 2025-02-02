<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reviews</title>

  <!--swiper css-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

  <!--font awesome-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

  <!--css file-->
  <link rel="stylesheet" href="styles.css" />

  <style>
    .review-slider .swiper-wrapper {
      flex-direction: column;
      /* Arrange slides vertically */
    }

    .review-slider .swiper-slide {
      width: 100% !important;
      /* Full width for each slide */
      margin: 10px 0;
      /* Add vertical spacing */
    }
  </style>
</head>

<body>
  <%@ include file="navbar.jsp"%>


  <!-- review section starts  -->
  <section class="reivew" id="review">
    <h1 class="heading">client's <span>review</span></h1>

    <div class="review-slider swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide box">
          <i class="fas fa-quote-right"></i>
          <div class="user">
            <img src="images/img1.jpg" alt="" />
            <div class="user-info">
              <h3>nayana</h3>
              <span>happy customer</span>
            </div>
          </div>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis
            dolor dicta cum. Eos beatae eligendi, magni numquam nemo sed ut
            corrupti, ipsam iure nisi unde et assumenda perspiciatis
            voluptatibus nihil.
          </p>
        </div>

        <div class="swiper-slide box">
          <i class="fas fa-quote-right"></i>
          <div class="user">
            <img src="images/img2.jpg" alt="" />
            <div class="user-info">
              <h3>lisa</h3>
              <span>happy customer</span>
            </div>
          </div>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis
            dolor dicta cum. Eos beatae eligendi, magni numquam nemo sed ut
            corrupti, ipsam iure nisi unde et assumenda perspiciatis
            voluptatibus nihil.
          </p>
        </div>

        <div class="swiper-slide box">
          <i class="fas fa-quote-right"></i>
          <div class="user">
            <img src="images/img3.jpg" alt="" />
            <div class="user-info">
              <h3>mary</h3>
              <span>happy customer</span>
            </div>
          </div>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis
            dolor dicta cum. Eos beatae eligendi, magni numquam nemo sed ut
            corrupti, ipsam iure nisi unde et assumenda perspiciatis
            voluptatibus nihil.
          </p>
        </div>

        <div class="swiper-slide box">
          <i class="fas fa-quote-right"></i>
          <div class="user">
            <img src="images/img4.jpg" alt="" />
            <div class="user-info">
              <h3>rose</h3>
              <span>happy customer</span>
            </div>
          </div>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis
            dolor dicta cum. Eos beatae eligendi, magni numquam nemo sed ut
            corrupti, ipsam iure nisi unde et assumenda perspiciatis
            voluptatibus nihil.
          </p>
        </div>
      </div>
    </div>
  </section>

<%@ include file="footer.jsp" %>
  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="app.js"></script>
</body>

</html>