<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>

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
  
     <!-- contact section starts  -->
      <br><br><br>
    <section class="contact" id="contact">
    <h1 class="heading"><span>contact</span> us</h1>

    <form action="register" method="POST">
        <div class="inputBox">
            <input type="text" placeholder="name" name="name" required/>
            <input type="email" placeholder="email" name="mail" required/>
        </div>
        <div class="inputBox">
            <input type="tel" placeholder="number" name="tel" required/>
            <input type="text" placeholder="subject" name="sub" required/>
        </div>
        <textarea name="msg" placeholder="message" cols="30" rows="10" required></textarea>
        <input type="submit" value="send message" class="btn" name="enquiry"/>
    </form>
</section>


       <%@include file="footer.jsp" %>

       <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
      <script src="app.js"></script>
</body>
</html>