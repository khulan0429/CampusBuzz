<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Generated by Codia AI</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@500&display=swap" />
  <link rel="stylesheet" href="index.css" />
  <link rel="stylesheet" href="navbar.css" />
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

  <style>
    .carousel-item img {
      width: 100%;
      height: 900px; /* Set a fixed height for consistency */
      object-fit: cover; /* Ensures the image covers the area */
    }
    .carousel-caption {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
      /* Adds a dark transparent background */
      padding: 1rem; /* Adds padding */
      border-radius: 10px; /* Rounds the corners */
    }
    .carousel-caption h5 {
      font-size: 4rem; /* Larger font size for quotes */
      font-family: 'Inter', sans-serif; /* Ensures font family */
      color: white; /* White color for quotes */
      font-weight: bold; /* Bold font weight */
    }
    .carousel-caption p {
      font-size: 3.25rem; /* Larger font size for descriptions */
      color: white; /* White color for descriptions */
    }
  </style>
</head>
<body>

  <%@ include file="navbar.jsp" %>

  <div class="container-fluid p-0">
    <!-- Carousel -->
    <div id="homepageCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
      <ol class="carousel-indicators">
        <li data-target="#homepageCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#homepageCarousel" data-slide-to="1"></li>
        <li data-target="#homepageCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="assets/44444.png" class="d-block w-100" alt="First slide">
          <div class="">
        
          </div>
        </div>
        <div class="carousel-item">
          <img src="assets/777.jpg" class="d-block w-100" alt="Second slide">
          <div class="carousel-caption d-none d-md-block">
            <h5>"Student Community"</h5>
            <p></p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="images/xc.jpg" class="d-block w-100" alt="Third slide">
          <div class="carousel-caption d-none d-md-block">
            <h5>"Together Strong"</h5>
            <p></p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#homepageCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#homepageCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>

  <%@ include file="middle.jsp" %>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
