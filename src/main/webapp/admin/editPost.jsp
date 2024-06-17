<%@ page import="project.ConnectionProviderClass" %>
<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Post</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

    .form-page {
      font-family: 'Montserrat', sans-serif;
      background-color: #f0f0f0;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      margin: 0;
    }

    .form-container {
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      width: 80%;
      max-width: 800px;
      animation: fadeIn 1s ease-in-out;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    h3 {
      margin-bottom: 10px;
      font-size: 1.8rem;
      color: #333;
    }

    .alert {
      color: #d9534f;
      text-align: center;
      margin-bottom: 20px;
      font-size: 1.2rem;
    }

    .input-style, .input-style[type="file"], select {
      width: 100%;
      padding: 12px;
      margin: 12px 0;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 1rem;
      transition: border 0.3s;
    }

    .input-style:focus, .input-style[type="file"]:focus, select:focus {
      border-color: #1E90FF;
    }

    .input-style[type="file"] {
      display: none;
    }

    .file-label {
      background-color: #1E90FF;
      color: #fff;
      padding: 12px 25px;
      border-radius: 5px;
      cursor: pointer;
      display: inline-block;
      font-size: 1rem;
      transition: background-color 0.3s;
    }

    .file-label:hover {
      background-color: #4682B4;
    }

    textarea.input-style {
      height: 250px;
      resize: none;
    }

    .button, .delete-button {
      background-color: #1E90FF;
      color: #fff;
      padding: 12px 25px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1rem;
      transition: background-color 0.3s, transform 0.3s;
      margin: 10px;
    }

    .button:hover, .delete-button:hover {
      background-color: #4682B4;
      transform: translateY(-2px);
    }

    .delete-button {
      background-color: #d9534f;
    }

    .delete-button:hover {
      background-color: #c9302c;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .blue-text {
      color: blue;
    }

    .button-container {
      display: flex;
      justify-content: space-between;
      width: 100%;
    }

    .middle-div {
      width: 100%;
    }
  </style>
</head>
<body>

<%
int postId = Integer.parseInt(request.getParameter("id"));
String title = "";
String content = "";
String category = "";
String userEmail = "";

try {
  Connection con = ConnectionProviderClass.getCon();
  PreparedStatement ps = con.prepareStatement("SELECT * FROM posts WHERE post_id = ?");
  ps.setInt(1, postId);
  ResultSet rs = ps.executeQuery();
  if (rs.next()) {
    title = rs.getString("title");
    content = rs.getString("post_content");
    category = rs.getString("category");
    userEmail = rs.getString("user_email");
  }
} catch (Exception e) {
  e.printStackTrace();
}
%>

<div class="form-page">
  <div class="form-container">
    <form action="updatePostAction.jsp" method="post" enctype="multipart/form-data">
      <h3 class="blue-text">Post ID: <%= postId %> </h3>
      <input type="hidden" name="post_id" value="<%= postId %>">

      <div class="middle-div">
        <h3>Edit Title</h3>
        <input class="input-style" type="text" name="title" value="<%= title %>" required>
        <hr>
      </div><br>

      <div class="middle-div">
        <h3>Edit Content</h3>
        <textarea class="input-style" name="content" required><%= content %></textarea>
        <hr>
      </div><br>

      <div class="middle-div">
        <h3>Edit Category</h3>
        <select class="input-style" name="category" required>
          <optgroup label="Campus Life">
            <option value="Location of Study Rooms" <%= category.equals("Location of Study Rooms") ? "selected" : "" %>>Location of Study Rooms</option>
            <option value="Housing Options" <%= category.equals("Housing Options") ? "selected" : "" %>>Housing Options</option>
            <option value="Campus Facilities" <%= category.equals("Campus Facilities") ? "selected" : "" %>>Campus Facilities</option>
            <option value="Dining Services" <%= category.equals("Dining Services") ? "selected" : "" %>>Dining Services</option>
            <option value="Cultural Events" <%= category.equals("Cultural Events") ? "selected" : "" %>>Cultural Events</option>
          </optgroup>
          <optgroup label="Education">
            <option value="Scholarships" <%= category.equals("Scholarships") ? "selected" : "" %>>Scholarships</option>
            <option value="Korean Language Course" <%= category.equals("Korean Language Course") ? "selected" : "" %>>Korean Language Course</option>
            <option value="School Clubs" <%= category.equals("School Clubs") ? "selected" : "" %>>School Clubs</option>
          </optgroup>
          <optgroup label="Career Quest">
            <option value="Part-time Jobs" <%= category.equals("Part-time Jobs") ? "selected" : "" %>>Part-time Jobs</option>
            <option value="Internships" <%= category.equals("Internships") ? "selected" : "" %>>Internships</option>
            <option value="Permission from Immigration" <%= category.equals("Permission from Immigration") ? "selected" : "" %>>Permission from Immigration</option>
            <option value="Resume Workshops" <%= category.equals("Resume Workshops") ? "selected" : "" %>>Resume Workshops</option>
          </optgroup>
          <optgroup label="Alumni Adventures">
            <option value="Seniors' Stories" <%= category.equals("Seniors' Stories") ? "selected" : "" %>>Seniors' Stories</option>
          </optgroup>
          <optgroup label="Health">
            <option value="Hospitals Near Uni" <%= category.equals("Hospitals Near Uni") ? "selected" : "" %>>Hospitals Near Uni</option>
            <option value="About Health Insurance" <%= category.equals("About Health Insurance") ? "selected" : "" %>>About Health Insurance</option>
          </optgroup>
        </select>
        <hr>
      </div><br>

      <div class="button-container">
        <button class="button">Update <i class='far fa-arrow-alt-circle-right'></i></button>
        <form action="deletePostAction.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete this post?');">
          <input type="hidden" name="post_id" value="<%= postId %>">
          <button type="submit" class="delete-button">Delete <i class='far fa-trash-alt'></i></button>
        </form>
      </div>
    </form>
  </div>
</div>

</body>
</html>
