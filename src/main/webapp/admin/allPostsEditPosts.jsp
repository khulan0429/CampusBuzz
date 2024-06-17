<%@page import="project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All Posts & Edit Posts</title>
  <style>
    h3 {
      color: yellow;
      text-align: center;
    }

    table {
      background-color: rgba(200, 200, 200, 0.8);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
    }

    .center-text {
      text-align: center;
      font-size: 30px;
      color: white;
    }
  </style>
</head>
<body style='background: url("../assets/MainImg/jewel2.jpeg") no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;'>
  <div class="center-text">All Posts & Edit Posts <i class='fab fa-elementor'></i></div>
  <% 
  String msg = request.getParameter("msg");
  if ("done".equals(msg)) {
  %>
  <h3 class="alert">Post Successfully Updated!</h3>
  <% } %>
  <% 
  if ("wrong".equals(msg)) {
  %>
  <h3 class="alert">Something went wrong! Try again!</h3>
  <% } %>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Category</th>
        <th>Content</th>
        <th>User Email</th>
        <th>Edit <i class='fas fa-pen-fancy'></i></th>
      </tr>
    </thead>
    <tbody>
      <% 
      try {
        Connection con = ConnectionProviderClass.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM posts");
        while (rs.next()) {
      %>
      <tr>
        <td><%=rs.getInt("post_id") %></td>
        <td><%=rs.getString("title") %></td>
        <td><%=rs.getString("category") %></td>
        <td><%=rs.getString("post_content") %></td>
        <td><%=rs.getString("user_email") %></td>
        <td><a href="editPost.jsp?id=<%=rs.getInt("post_id") %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
      </tr>
      <%
        }
      } catch (Exception e) {
        e.printStackTrace();
      }
      %>
    </tbody>
  </table>
  <br>
  <br>
  <br>
</body>
</html>
