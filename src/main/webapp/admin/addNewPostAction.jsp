<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="project.ConnectionProviderClass" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
String uploadPath = getServletContext().getRealPath("/uploads");
String logFilePath = getServletContext().getRealPath("/logs/error.log");

try {
    // Create upload directory if it doesn't exist
    File fileSaveDir = new File(uploadPath);
    if (!fileSaveDir.exists()) {
        fileSaveDir.mkdirs();
    }

    // Create logs directory if it doesn't exist
    File logDir = new File(getServletContext().getRealPath("/logs"));
    if (!logDir.exists()) {
        logDir.mkdirs();
    }

    MultipartRequest multi = new MultipartRequest(request, uploadPath, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

    String postId = multi.getParameter("post_id");
    String title = multi.getParameter("title");
    String content = multi.getParameter("content");
    String category = multi.getParameter("category");
    String userEmail = "admin@gmail.com"; // Default email as admin
    String image = "uploads/" + multi.getFilesystemName("image"); // Adjusted path

    // Log the received parameters
    System.out.println("Received parameters:");
    System.out.println("postId: " + postId);
    System.out.println("title: " + title);
    System.out.println("content: " + content);
    System.out.println("category: " + category);
    System.out.println("userEmail: " + userEmail);
    System.out.println("image: " + image);

    Connection con = ConnectionProviderClass.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO posts (post_id, user_email, title, post_content, post_image, category) VALUES (?, ?, ?, ?, ?, ?)");
    
    ps.setInt(1, Integer.parseInt(postId)); // Convert postId to int
    ps.setString(2, userEmail);
    ps.setString(3, title);
    ps.setString(4, content);
    ps.setString(5, image);
    ps.setString(6, category);

    int row = ps.executeUpdate();
    if (row > 0) {
        response.sendRedirect("addNewPost.jsp?msg=done");
    } else {
        response.sendRedirect("addNewPost.jsp?msg=wrong");
    }

} catch (Exception e) {
    e.printStackTrace();  // Log the exception for debugging purposes

    // Log the exception to a file for detailed logging
    try (PrintWriter log = new PrintWriter(new FileWriter(logFilePath, true))) {
        log.println("Error occurred: " + new java.util.Date());
        e.printStackTrace(log);
    } catch (IOException ioException) {
        ioException.printStackTrace();
    }

    response.sendRedirect("addNewPost.jsp?msg=wrong");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Post</title>
</head>
<body>
</body>
</html>
