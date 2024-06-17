<%@page import="project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>All Users & Edit Users</title>
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
  <div class="center-text">All Users & Edit Users <i class='fab fa-elementor'></i></div>
  <% 
  String msg = request.getParameter("msg");
  if ("done".equals(msg)) {
  %>
  <h3 class="alert">User Successfully Updated!</h3>
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
        <th>Name</th>
        <th>Email</th>
        <th>Mobile Number</th>
        <th>Password</th>
        <th>Edit <i class='fas fa-pen-fancy'></i></th>
      </tr>
    </thead>
    <tbody>
      <% 
      try {
        Connection con = ConnectionProviderClass.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM users");
        while (rs.next()) {
      %>
      <tr>
        <td><%=rs.getString("ID") %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("email") %></td>
        <td><%=rs.getLong("mobileNumber") %></td>
        <td><%=rs.getString("password") %></td>
        <td><a href="editUser.jsp?userEmail=<%=rs.getString("email") %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
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
