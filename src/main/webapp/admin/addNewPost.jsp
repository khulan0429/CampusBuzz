<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="project.ConnectionProviderClass" %>
<%@ page import="java.sql.*" %>

<html>
<head>

  <title>Add New Post</title>
  <%@ include file="adminHeader.jsp" %>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

    .form-page {
      font-family: 'Montserrat', sans-serif;
      background-color: #f0f0f0;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      margin: 0; /* Ensure no default margin */
    }

    .form-container {
      background-color: #fff;
      padding: 1px; /* Increased padding */
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
      margin-bottom: 10px; /* Increased margin */
      font-size: 20; /* Increased font size */
      color: #333;
    }

    .alert {
      color: #d9534f;
      text-align: center;
      margin-bottom: 20px;
      font-size: 1rem; /* Increased font size */
    }

    .input-style, .input-style[type="file"], select {
      width: 100%;
      padding: 10px; /* Increased padding */
      margin: 10px 0; /* Increased margin */
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 1rem; /* Increased font size */
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
      padding: 10px 20px; /* Increased padding */
      border-radius: 5px;
      cursor: pointer;
      display: inline-block;
      font-size: 1rem; /* Increased font size */
      transition: background-color 0.3s;
    }

    .file-label:hover {
      background-color: #4682B4;
    }

    textarea.input-style {
      height: 200px; /* Increased height */
      resize: none;
    }

    .button {
      background-color: #1E90FF;
      color: #fff;
      padding: 10px 20px; /* Increased padding */
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1rem; /* Increased font size */
      transition: background-color 0.3s, transform 0.3s;
    }

    .button:hover {
      background-color: #4682B4;
      transform: translateY(-2px);
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
  </style>
</head>
<body>

<%
String msg = request.getParameter("msg");
if ("done".equals(msg)) {
%>
  <h3 class="alert">Post Added Successfully!</h3>
<% } %>
<%
if ("wrong".equals(msg)) {
%>
  <h3 class="alert">Something went wrong! Try Again!</h3>
<% } %>
<%
int id = 1;
try {
  Connection con = ConnectionProviderClass.getCon();
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("select max(post_id) from posts");
  if (rs.next()) {
    id = rs.getInt(1) + 1;
  }
} catch (Exception e) {
  e.printStackTrace(); // Handle this more appropriately in production
}
%>

<div class="form-page">
  <div class="form-container">
    <form action="addNewPostAction.jsp" method="post" enctype="multipart/form-data">
      <h3 class="blue-text">Post ID: <%= id %> </h3>
      <input type="hidden" name="post_id" value="<%= id %>">

      <div class="middle-div">
        <h3>Enter Category</h3>
        <select class="input-style" name="category" required>
          <option value="Announcements">Announcements</option>
          <optgroup label="Campus Life">
            <option value="Location of Study Rooms">Location of Study Rooms</option>
            <option value="Housing Options">Housing Options</option>
            <option value="Campus Facilities">Campus Facilities</option>
            <option value="Dining Services">Dining Services</option>
            <option value="Cultural Events">Cultural Events</option>
          </optgroup>
          <optgroup label="Education">
            <option value="Scholarships">Scholarships</option>
            <option value="Korean Language Course">Korean Language Course</option>
            <option value="School Clubs">School Clubs</option>
          </optgroup>
          <optgroup label="Career Quest">
            <option value="Part-time Jobs">Part-time Jobs</option>
            <option value="Internships">Internships</option>
            <option value="Permission from Immigration">Permission from Immigration</option>
            <option value="Resume Workshops">Resume Workshops</option>
          </optgroup>
          <optgroup label="Alumni Adventures">
            <option value="Seniors' Stories">Seniors' Stories</option>
          </optgroup>
          <optgroup label="Health">
            <option value="Hospitals Near Uni">Hospitals Near Uni</option>
            <option value="About Health Insurance">About Health Insurance</option>
          </optgroup>
          <optgroup label="Free time">
            <option value="Free Time">Free Time</option>
          </optgroup>
          <optgroup label="FAQ">
            <option value="FAQ">FAQ</option>
          </optgroup>
        </select>
        <hr>
      </div><br>

      <div class="middle-div">
        <h3>Enter Image</h3>
        <label for="image" class="file-label">Choose File</label>
        <input class="input-style" type="file" id="image" name="image" required>
      </div><br>

      <div class="middle-div">
        <h3>Enter Title</h3>
        <input class="input-style" type="text" name="title" placeholder="Enter Title" required>
        <hr>
      </div><br>

      <div class="middle-div">
        <h3>Enter Content</h3>
        <textarea class="input-style" name="content" placeholder="Enter Content" required></textarea>
        <hr>
      </div><br>

      <input type="hidden" name="user_email" value="admin@gmail.com">

      <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
    </form>
  </div>
</div>

</body>
<br><br><br>
</html>
