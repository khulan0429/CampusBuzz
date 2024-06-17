
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProviderClass" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Card and Alumni Adventures</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@400;500&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Epilogue:wght@400;700&display=swap" />
    <link rel="stylesheet" href="middle.css" />
    <style>
        .breadcrumb {
            margin: 20px 0;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 5px;
            display: flex;
            align-items: center;
            font-family: 'Source Code Pro', monospace;
        }
        .breadcrumb a {
            text-decoration: none;
            color: #007bff;
            margin: 0 5px;
        }
        .breadcrumb a:hover {
            text-decoration: underline;
        }
        .breadcrumb span {
            margin: 0 5px;
        }
        .design-content {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }
        .design-item {
            width: 30%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.2s;
        }
        .design-item:hover {
            transform: translateY(-10px);
        }
        .design-img img {
            width: 100%;
            height: 300px; /* Adjusted height */
            object-fit: cover;
            border-bottom: 2px solid #ddd;
        }
        .design-title {
            text-align: center;
            padding: 10px;
            background-color: #f9f9f9;
        }
        .design-title a {
            text-decoration: none;
            font-size: 1.5rem;
            font-family: 'Epilogue', sans-serif;
            color: #333;
            font-weight: bold;
            display: block;
            padding: 5px 0;
        }
        .design-title a:hover {
            color: #007bff;
        }
        h2 {
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 20px;
            font-family: 'Epilogue', sans-serif;
        }
        p {
            text-align: center;
            font-family: 'Source Code Pro', monospace;
            font-size: 1.2rem;
            color: blue;
        }
    </style>
</head>
<body>
  <%@ include file="navbar.jsp" %>

  <!-- Breadcrumb Navigation -->
  <div class="breadcrumb">
    <a href="lol.jsp">Home</a>
    <span>/</span>
    <a href="lol.jsp">Free Time</a>
    <span>/</span>
    <span></span>
  </div>

  <section class="design" id="design">
    <div class="container">
      <h2>Free Time</h2>
      <p>Let's have fun</p>
    </div>
    <div class="design-content">
      <%
        try {
          Connection con = ConnectionProviderClass.getCon();
          String query = "SELECT * FROM posts WHERE category='Free Time'";
          PreparedStatement ps = con.prepareStatement(query);
          ResultSet rs = ps.executeQuery();
          while (rs.next()) {
      %>
      <!-- item -->
      <div class="design-item">
        <div class="design-img">
          <img src="<%= rs.getString("post_image") %>" alt="<%= rs.getString("title") %>">
          <span><i class="far fa-heart"></i> <%= rs.getInt("likes") %></span>
          <span><%= rs.getString("category") %></span>
        </div>
        <div class="design-title">
          <a href="postDetail.jsp?id=<%= rs.getInt("post_id") %>"><%= rs.getString("title") %></a>
        </div>
      </div>
      <!-- end of item -->
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
  </section>
  
</body>
</html>
