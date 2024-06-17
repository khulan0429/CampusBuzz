<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProviderClass" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
String postId = request.getParameter("postId");
String userEmail = request.getParameter("userEmail");
String commentText = request.getParameter("commentText");
String replyTo = request.getParameter("replyTo");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
PrintWriter responseWriter = response.getWriter();

try {
    con = ConnectionProviderClass.getCon();
    String query = "INSERT INTO comments (post_id, user_email, comment_text, reply_to, comment_time) VALUES (?, ?, ?, ?, NOW())";
    ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
    ps.setInt(1, Integer.parseInt(postId));
    ps.setString(2, userEmail);
    ps.setString(3, commentText);
    if (replyTo != null && !replyTo.isEmpty()) {
        ps.setInt(4, Integer.parseInt(replyTo));
    } else {
        ps.setNull(4, java.sql.Types.INTEGER);
    }
    int row = ps.executeUpdate();
    if (row > 0) {
        rs = ps.getGeneratedKeys();
        if (rs.next()) {
            int commentId = rs.getInt(1);
            responseWriter.print("{\"status\":\"success\", \"commentId\":" + commentId + "}");
        }
    } else {
        responseWriter.print("{\"status\":\"error\"}");
    }
} catch (Exception e) {
    e.printStackTrace();
    responseWriter.print("{\"status\":\"error\"}");
} finally {
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
