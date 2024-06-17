<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProviderClass"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Updated admin credentials
    String adminEmail = "admn@inha.com";
    String adminPassword = "123456";

    if (adminEmail.equals(email) && adminPassword.equals(password)) {
        session.setAttribute("email", email);
        response.sendRedirect("admin/adminHome.jsp");
        // Prevent further execution
    } else {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = ConnectionProviderClass.getCon();
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("email", email);
                response.sendRedirect("lol.jsp");
                // Prevent further execution if user is found
            } else {
                response.sendRedirect("login.jsp?msg=notexist");
                // Prevent further execution if user is not found
            }
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("login.jsp?msg=invalid");
            // Prevent further execution in case of an exception
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
%>
</body>
</html>
