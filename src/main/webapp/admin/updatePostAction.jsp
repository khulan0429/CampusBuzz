<%@page import="project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%
String postIdStr = request.getParameter("post_id");
String title = request.getParameter("title");
String content = request.getParameter("content");
String category = request.getParameter("category");

String logFilePath = getServletContext().getRealPath("/logs/error.log");

if (postIdStr == null || title == null || content == null || category == null) {
    try (PrintWriter log = new PrintWriter(new FileWriter(logFilePath, true))) {
        log.println("Null parameter received: postIdStr=" + postIdStr + ", title=" + title + ", content=" + content + ", category=" + category);
    } catch (IOException ioException) {
        ioException.printStackTrace();
    }
    response.sendRedirect("allPostsEditPosts.jsp?msg=wrong");
    return;
}

int postId = -1;

try {
    postId = Integer.parseInt(postIdStr);
} catch (NumberFormatException e) {
    e.printStackTrace();
    try (PrintWriter log = new PrintWriter(new FileWriter(logFilePath, true))) {
        log.println("NumberFormatException: " + e.getMessage());
    } catch (IOException ioException) {
        ioException.printStackTrace();
    }
    response.sendRedirect("allPostsEditPosts.jsp?msg=wrong");
    return;
}

try {
    Connection con = ConnectionProviderClass.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE posts SET title = ?, post_content = ?, category = ? WHERE post_id = ?");
    ps.setString(1, title);
    ps.setString(2, content);
    ps.setString(3, category);
    ps.setInt(4, postId);

    int row = ps.executeUpdate();
    if (row > 0) {
        response.sendRedirect("allPostsEditPosts.jsp?msg=done");
    } else {
        try (PrintWriter log = new PrintWriter(new FileWriter(logFilePath, true))) {
            log.println("No rows updated for postId=" + postId);
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
        response.sendRedirect("allPostsEditPosts.jsp?msg=wrong");
    }
} catch (Exception e) {
    e.printStackTrace();
    try (PrintWriter log = new PrintWriter(new FileWriter(logFilePath, true))) {
        log.println("Exception: " + e.getMessage());
        e.printStackTrace(log);
    } catch (IOException ioException) {
        ioException.printStackTrace();
    }
    response.sendRedirect("allPostsEditPosts.jsp?msg=wrong");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Post</title>
</head>
<body>
</body>
</html>
