<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String ID = request.getParameter("ID");
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");

try{
	Connection con = ConnectionProviderClass.getCon();
	PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?)");
	ps.setString(1, ID);
	ps.setString(2, name);
	ps.setString(3, email);
	ps.setString(4, mobileNumber);
	ps.setString(5, password);
	ps.executeUpdate();
	response.sendRedirect("registration.jsp?msg=valid");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("registration.jsp?msg=invalid");
}
%>

</body>
</html>