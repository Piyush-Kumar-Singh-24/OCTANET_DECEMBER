<%@page import="gen2gen.dbcon.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gen 2 Gen | Login</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	String email=request.getParameter("email"); 
	String password=request.getParameter("pass"); 
	String name="";
	out.println(email+" "+password);
	try
	{
		Connection con=DBConnection.getCon();
		PreparedStatement ps=con.prepareStatement("select name from geninfo where email=? and password=?");
		ps.setString(1,email);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{	
			response.sendRedirect("homepage.html");
		}	
		else
			out.println("Record not found.");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
</body>
</html>