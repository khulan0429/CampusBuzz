<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProviderClass" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CampusBuzz</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font awesome icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <link rel="stylesheet" href="middle.css">
    <link rel="stylesheet" href="navbar.css">
    <style>
      .design-item, .blog-item {
        width: 100%; /* Adjust the width as needed */
        margin-bottom: 20px; /* Space between items */
      }
      .design-img img, .blog-img img {
        width: 100%;
        height: 200px; /* Fixed height for images */
        object-fit: cover; /* Ensures the image covers the area without distortion */
        border-radius: 5px; /* Optional: adds rounded corners to the images */
      }
      .design-title a, .blog-text a {
        display: block;
        text-align: center;
        margin-top: 10px;
        font-family: 'Inter', sans-serif;
        font-size: 1.2rem;
        color: #333;
        text-decoration: none;
      }
      .design-title a:hover, .blog-text a:hover {
        color: #007bff;
      }
    </style>
  </head>
  <body>
    <%
      // Calculate the start and end dates of the current week
      Calendar calendar = Calendar.getInstance();
      calendar.set(Calendar.DAY_OF_WEEK, calendar.getFirstDayOfWeek());
      java.util.Date startDate = calendar.getTime();
      calendar.add(Calendar.DAY_OF_WEEK, 6);
      java.util.Date endDate = calendar.getTime();
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
      String startDateStr = sdf.format(startDate);
      String endDateStr = sdf.format(endDate);
    %>
    <!-- design -->
    <section class="design" id="design">
      <div class="container">
        <div class="title">
          <h2>This Week's School Announcement</h2>
          <p><%= startDateStr %>--<%= endDateStr %></p>
        </div>
        <div class="design-content">
          <!-- Fetch and display announcements -->
          <%
            try {
              Connection con = ConnectionProviderClass.getCon();
              String query = "SELECT * FROM posts WHERE category='Announcements' ORDER BY post_time DESC LIMIT 3";
              PreparedStatement ps = con.prepareStatement(query);
              ResultSet rs = ps.executeQuery();
              while (rs.next()) {
          %>
          <div class="design-item">
            <div class="design-img">
              <img src="<%= rs.getString("post_image") %>" alt="" style="max-width: 100%; height: auto;">
              <span><i class="far fa-heart"></i> <%= rs.getInt("likes") %></span>
              <span>Announcements</span>
            </div>
            <div class="design-title">
              <a href="postDetail.jsp?id=<%= rs.getInt("post_id") %>"><%= rs.getString("title") %></a>
            </div>
          </div>
          <%
              }
              rs.close();
              ps.close();
              con.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
        </div>
      </div>
    </section>
    <!-- end of design -->

    <!-- blog -->
    <section class="blog" id="blog">
      <div class="container">
        <div class="title">
          <h2>Latest Blog</h2>
          <p>All about our university</p>
        </div>
        <div class="blog-content">
          <!-- Fetch and display latest blogs -->
          <%
            try {
              Connection con = ConnectionProviderClass.getCon();
              String query = "SELECT * FROM posts ORDER BY post_time DESC LIMIT 3";
              PreparedStatement ps = con.prepareStatement(query);
              ResultSet rs = ps.executeQuery();
              while (rs.next()) {
          %>
          <div class="blog-item">
            <div class="blog-img">
              <img src="<%= rs.getString("post_image") %>" alt="" style="max-width: 100%; height: auto;">
              <span><i class="far fa-heart"></i> <%= rs.getInt("likes") %></span>
            </div>
            <div class="blog-text">
              <span><%= new java.text.SimpleDateFormat("dd MMM, yyyy").format(rs.getTimestamp("post_time")) %></span>
              <h2><%= rs.getString("title") %></h2>
              <p><%= rs.getString("post_content").substring(0, Math.min(rs.getString("post_content").length(), 150)) %>...</p>
              <a href="postDetail.jsp?id=<%= rs.getInt("post_id") %>">Read More</a>
            </div>
          </div>
          <%
              }
              rs.close();
              ps.close();
              con.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
        </div>
      </div>
    </section>
    <!-- end of blog -->

    <!-- about -->
    <section class="about" id="about">
      <div class="container">
        <div class="about-content">
          <div>
            <img src="images/Seniors.jpg" alt="">
          </div>
          <div class="about-text">
            <div class="title">
              <h2>From Your Seniors</h2>
              <p>Inha Technical College</p>
            </div>
            <p>Dear Juniors,</p>
            <p>
              Welcome to our international student community! I'm thrilled to extend a warm greeting as you begin your journey studying abroad.
              As a senior member, I want you to know that you're among friends here. While adjusting to a new environment can be daunting, we're here to support you every step of the way.
              Embrace the opportunities that come your way, explore the culture, and don't hesitate to ask for help. Together, let's create unforgettable memories and a welcoming community.
              Here's to a rewarding and enriching experience ahead!
            </p>
            <p>Warm regards,</p>
            <p>[from your seniors]</p>
          </div>
        </div>
      </div>
    </section>
    <!-- end of about -->

    <!-- footer -->
    <footer>
      <div class="social-links">
        <a href="https://www.facebook.com/happyinhatc/"><i class="fab fa-facebook-f"></i></a>
        <a href="https://www.instagram.com/ipsi.inhatc.ac.kr/"><i class="fab fa-instagram"></i></a>
        <a href="https://portal.inhatc.ac.kr/"><i class="fab fa-pinterest"></i></a>
      </div>
      <span>CampusBuzz</span>
    </footer>
    <!-- end of footer -->
  </body>
</html>
