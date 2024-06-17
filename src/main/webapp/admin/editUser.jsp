<%@page import="project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit User</title>

</head>
<body>
<%
String userEmail = request.getParameter("userEmail");
String id = "";
String name = "";
String mobileNumber = "";
String password = "";

try {
  Connection con = ConnectionProviderClass.getCon();
  PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email = ?");
  ps.setString(1, userEmail);
  ResultSet rs = ps.executeQuery();
  if (rs.next()) {
    id = rs.getString("ID");
    name = rs.getString("name");
    mobileNumber = rs.getString("mobileNumber");
    password = rs.getString("password");
  }
} catch (Exception e) {
  e.printStackTrace();
}
%>

<form action="updateUserAction.jsp" method="post">
  <input type="hidden" name="userEmail" value="<%= userEmail %>">

  <div class="middle-div">
    <h3>Edit User ID</h3>
    <input class="input-style" type="text" name="id" value="<%= id %>" required>
    <hr>
  </div><br>

  <div class="middle-div">
    <h3>Edit Name</h3>
    <input class="input-style" type="text" name="name" value="<%= name %>" required>
    <hr>
  </div><br>

  <div class="middle-div">
    <h3>Edit Mobile Number</h3>
    <input class="input-style" type="text" name="mobileNumber" value="<%= mobileNumber %>" required>
    <hr>
  </div><br>

  <div class="middle-div">
    <h3>Edit Password</h3>
    <input class="input-style" type="password" name="password" value="<%= password %>" required>
    <hr>
  </div><br>

  <button class="button">Update <i class='far fa-arrow-alt-circle-right'></i></button>
</form>

</body>
</html>
